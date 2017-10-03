import AVFoundation
import GoogleInteractiveMediaAds
import UIKit
import SummerSlider
class PlayerViewController: UIViewController, IMAAdsLoaderDelegate, IMAAdsManagerDelegate {
  
  static let kTestAppContentUrl = "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
  
  static let kTestAppAdTagUrl =
    "https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&" +
      "iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&" +
      "output=vast&unviewed_position_start=1&" +
      "cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpost&cmsid=496&vid=short_onecue&" +
		"correlator=";
  
    struct POSITION {
      static let ZERO : Float = 0.0
      static let END : Float = 100.0
    }
  
  @IBOutlet weak var videoView: UIView!
  var contentPlayer: AVPlayer?
  var playerLayer: AVPlayerLayer?
  
  var contentPlayhead: IMAAVPlayerContentPlayhead?
  var adsLoader: IMAAdsLoader!
  var adsManager: IMAAdsManager!
  
  @IBOutlet weak var summerSlider: SummerSlider!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpContentPlayer()
    setUpAdsLoader()
    requestAds()
    
    // setup For SummerSlider.
    
    setUpSummerSlider()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    playerLayer?.frame = self.videoView.layer.bounds
  }
  
  func setUpContentPlayer() {
    // Load AVPlayer with path to our content.
    guard let contentURL = URL(string: PlayerViewController.kTestAppContentUrl) else {
      print("ERROR: please use a valid URL for the content URL")
      return
    }
    contentPlayer = AVPlayer(url: contentURL)
    
    // Create a player layer for the player.
    playerLayer = AVPlayerLayer(player: contentPlayer)
    
    // Size, position, and display the AVPlayer.
    playerLayer?.frame = videoView.layer.bounds
    videoView.layer.addSublayer(playerLayer!)
    
    // Set up our content playhead and contentComplete callback.
    contentPlayhead = IMAAVPlayerContentPlayhead(avPlayer: contentPlayer)
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(PlayerViewController.contentDidFinishPlaying(_:)),
      name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
      object: contentPlayer?.currentItem);
    
  }
  
  func contentDidFinishPlaying(_ notification: Notification) {
    // Make sure we don't call contentComplete as a result of an ad completing.
    if (notification.object as! AVPlayerItem) == contentPlayer?.currentItem {
      adsLoader.contentComplete()
    }
  }
  
  func setUpAdsLoader() {
    adsLoader = IMAAdsLoader(settings: nil)
    adsLoader.delegate = self
  }
  
  func requestAds() {
    // Create ad display container for ad rendering.
    let adDisplayContainer = IMAAdDisplayContainer(adContainer: videoView, companionSlots: nil)
    // Create an ad request with our ad tag, display container, and optional user context.
    let request = IMAAdsRequest(
      adTagUrl: PlayerViewController.kTestAppAdTagUrl,
      adDisplayContainer: adDisplayContainer,
      contentPlayhead: contentPlayhead,
      userContext: nil)
    
    adsLoader.requestAds(with: request)
  }
  
  // MARK: - IMAAdsLoaderDelegate
  
  func adsLoader(_ loader: IMAAdsLoader!, adsLoadedWith adsLoadedData: IMAAdsLoadedData!) {
    // Grab the instance of the IMAAdsManager and set ourselves as the delegate.
    adsManager = adsLoadedData.adsManager
    adsManager.delegate = self
    
    // Create ads rendering settings and tell the SDK to use the in-app browser.
    let adsRenderingSettings = IMAAdsRenderingSettings()
    adsRenderingSettings.webOpenerPresentingController = self
    
    // Initialize the ads manager.
    adsManager.initialize(with: adsRenderingSettings)
    
    let duration = getDuration()
    
    var isPreroll = false
    var adMarks = Array<Float>();
    
    if self.adsManager != nil {
      if self.adsManager!.adCuePoints.count > 0 {
        for mark in self.adsManager!.adCuePoints {
          let position = mark as! Float
          if position == 0 {
            isPreroll = true
            adMarks.append(POSITION.ZERO)
          } else if position == -1 {
            adMarks.append(POSITION.END)
          } else {
            let postionTime :Float64 = Float64(position * 100)
            let pointPercent  = postionTime / duration
            adMarks.append(Float(pointPercent))
          }
        }
      } else if self.adsManager!.adCuePoints.count == 0 {
        isPreroll = true
        adMarks.append(POSITION.ZERO)
      }
    }
    
    summerSlider.markPositions = adMarks
    
  }
  
  func adsLoader(_ loader: IMAAdsLoader!, failedWith adErrorData: IMAAdLoadingErrorData!) {
    print("Error loading ads: \(adErrorData.adError.message)")
    contentPlayer?.play()
  }
  
  // MARK: - IMAAdsManagerDelegate
  
  func adsManager(_ adsManager: IMAAdsManager!, didReceive event: IMAAdEvent!) {
    if event.type == IMAAdEventType.LOADED {
      // When the SDK notifies us that ads have been loaded, play them.
      adsManager.start()
    }
  }
  
  func adsManager(_ adsManager: IMAAdsManager!, didReceive error: IMAAdError!) {
    // Something went wrong with the ads manager after ads were loaded. Log the error and play the
    // content.
    print("AdsManager error: \(error.message)")
    contentPlayer?.play()
  }
  
  func adsManagerDidRequestContentPause(_ adsManager: IMAAdsManager!) {
    // The SDK is going to play ads, so pause the content.
    contentPlayer?.pause()
  }
  
  func adsManagerDidRequestContentResume(_ adsManager: IMAAdsManager!) {
    // The SDK is done playing ads (at least for now), so resume the content.
    contentPlayer?.play()
  }
  
  // Get the duration value from the player item.
  func getPlayerItemDuration(_ item: AVPlayerItem) -> CMTime {
    var itemDuration = kCMTimeInvalid
    if (item.responds(to: #selector(getter: CAMediaTiming.duration))) {
      itemDuration = item.duration
    } else {
      if (item.asset.responds(to: #selector(getter: CAMediaTiming.duration))) {
        itemDuration = item.asset.duration
      }
    }
    return itemDuration
  }
  
  func getDuration() -> Float64 {
    var wholeTime :Float64 = 0
    if self.contentPlayer != nil {
      let controller: PlayerViewController = self
      let duration = controller.getPlayerItemDuration(self.contentPlayer!.currentItem!)
      
      wholeTime = CMTimeGetSeconds(duration)
    }
    return wholeTime
  }
  
  
  // MARK: - Regarding of SummerSlider API.
  
  func setUpSummerSlider() {
      // Other properties ​​have already been set from storyboard.
      summerSlider.markWidth = 2.0
  }
  
}

