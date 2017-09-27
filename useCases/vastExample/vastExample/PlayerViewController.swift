//
//  PlaerViewController.swift
//  vastExample
//
//  Created by Kang Jinyeoung on 27/09/2017.
//  Copyright © 2017 SuperbDerrick. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleInteractiveMediaAds

class PlayerViewController: UIViewController {
  
  
  // Player handles
  var contentPlayer: AVPlayer?
  var contentPlayerLayer: AVPlayerLayer?
  
  // IMA SDK handles.
  var contentPlayhead: IMAAVPlayerContentPlayhead?
  var adsLoader: IMAAdsLoader!
  var adsManager: IMAAdsManager?
  var companionSlot: IMACompanionAdSlot?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
