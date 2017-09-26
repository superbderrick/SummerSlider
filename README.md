# SummerSlider
![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)
[![CI Status](http://img.shields.io/travis/superbderrick/SummerSlider.svg?style=flat)](https://travis-ci.org/superbderrick/SummerSlider)
[![Version](https://img.shields.io/cocoapods/v/SummerSlider.svg?style=flat)](http://cocoapods.org/pods/SummerSlider)
[![License](https://img.shields.io/cocoapods/l/SummerSlider.svg?style=flat)](http://cocoapods.org/pods/SummerSlider)
[![Platform](https://img.shields.io/cocoapods/p/SummerSlider.svg?style=flat)](http://cocoapods.org/pods/SummerSlider)

## SummerSlider.

The SummerSlider is iOS Custom Slider library.(Swift 3.0)
It is available in a variety of ways (Typically when using a slider and When creating video-related apps).

Besides I will introuce various usecases to use SummerSlider.

- Like a Youtube Player UI  
The Summer Slide shows parts  which the advertisement appears in the entire video duration.

- IMA SDK (VAST) with AVPLYAER.

if you use Google's IMA SDK and AVPLAYER , Summer Slider is useful and suitable.
It is possible to display on the slider where the advertisement such as midrole and prerole is displayed.

## How to install.
------------
SummerSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SummerSlider"
```


#### Classic and ancient way
Copy into your project the following files:
`SummerSlider.swift` , `Constants.swift`,
`HorizontalSlider.swift`,`Slider.swift`,`SliderDrawingProtocol.swift`,`SliderFactory.swift`,
`SummerSliderTypes.swift`,`VerticalSlider.swift`,


How to use it? 
------------
#### First way (User Interface):

Add an UISlider outlet to your view using the User Interface and set `SummerSlider` as the custom class. Mostly the exposed properties are marked with **@IBInspectable**, so you can customize them in storyboard's attributes inspector and preview it directly. 


Link it with the outlet property if you want to access its properties:

@IBOutlet weak var sampleSlider: SummerSlider!

Simply customize it! (take a look at -Customization- section)
```
var sampleArray = Array<Float>()
sampleArray = [0,12,23,34,45,56,77,99]
sampleSlider.selectedBarColor = UIColor.white
sampleSlider.unselectedBarColor = UIColor.black
sampleSlider.markColor = UIColor.orange
sampleSlider.markWidth = 2.0
sampleSlider.markPositions = sampleArray
```


Second way (Using code) -  **Preferred** 


It is really easy to set it! Firstly, import SummerSlider.

	import SummerSlider




Instantiate and customize it (again, take a look at -Customization- section). Finally add it to the desired view as usual:
```

let testRect1 = CGRect(x:30 ,y:70 , width:300 ,height:30)
var secondArray = Array<Float>()
marksArray1 = [0,10,20,30,40,50,60,70,80,90,100]
secondSlider = SummerSlider(frame: testRect1)
secondSlider.selectedBarColor = UIColor.blue
secondSlider.unselectedBarColor = UIColor.red
secondSlider.markColor = UIColor.yellow
secondSlider.markWidth = 2.0
secondSlider.markPositions = secondArray
self.view.addSubview(secondSlider)
```

## Author

SuperbDerrick, kang.derrick@gmail.com

## License

SummerSlider is available under the MIT license. See the LICENSE file for more info.
