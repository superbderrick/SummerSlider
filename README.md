# SummerSlider
![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)

[![CI Status](http://img.shields.io/travis/superbderrick/SummerSlider.svg?style=flat)](https://travis-ci.org/superbderrick/SummerSlider)
[![Version](https://img.shields.io/cocoapods/v/SummerSlider.svg?style=flat)](http://cocoapods.org/pods/SummerSlider)
[![License](https://img.shields.io/cocoapods/l/SummerSlider.svg?style=flat)](http://cocoapods.org/pods/SummerSlider)
[![Platform](https://img.shields.io/cocoapods/p/SummerSlider.svg?style=flat)](http://cocoapods.org/pods/SummerSlider)
[![HitCount](http://hits.dwyl.com/superbderrick/https://githubcom/superbderrick/SummerSlider.svg)](http://hits.dwyl.com/superbderrick/https://githubcom/superbderrick/SummerSlider)

![](https://github.com/superbderrick/SummerSlider/blob/master/Image/logo.jpeg)

## SummerSlider


SummerSlider is an iOS Custom Slider library
It's available with variety usecases like (typically custome ui slider and video-related apps)
Besides the repository introduces various usecase samples with SummerSlider

## UseCases
- Youtube Player UI scenario  
It s
s some parts for advertisement separator sections during entire video duration

- IMA SDK (VAST) with AVPLAYER

If you used Google IMA SDK with AVPLAYER , the summer slider is a very useful and suitable
vast sample code was intergrated and explained how to use for some vase usecases such as midrole and prerole cases

## Demo
#### Basic
![demo1](https://github.com/superbderrick/SummerSlider/blob/master/Image/demo1.gif)
#### Usecase(IMA SDK)
![demo2](https://github.com/superbderrick/SummerSlider/blob/master/Image/demo2.gif)


## Requirements
-	Swift 3,4.0,5.0
-	iOS 8.0+
-	Xcode 8

## How to install
SummerSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

Swift 3.0
```ruby
pod 'SummerSlider', '~>0.2.0'
```

Swift 4.0
```ruby
pod 'SummerSlider', '~>0.3.0'
```

Swift 5.0
```ruby
pod 'SummerSlider', '~>0.4.0'
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
var marksArray1 = Array<Float>()
marksArray1 = [0,10,20,30,40,50,60,70,80,90,100]
secondSlider = SummerSlider(frame: testRect1)
secondSlider.selectedBarColor = UIColor.blue
secondSlider.unselectedBarColor = UIColor.red
secondSlider.markColor = UIColor.yellow
secondSlider.markWidth = 2.0
secondSlider.markPositions = marksArray1
self.view.addSubview(secondSlider)
```


Setting the marks
------------
You can set the marks using a percentage system from 0 to 100 (Percent). Set all the marks in the `markPositions array` property:
```
summerSlider.markPositions = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
```

Customization
------------
Here you can see a bunch of parameters that you can change:

#### Marks
- `markColor` : UIColor  - Customize the color of the marks.
- `markWidth`: Float - Customize the width of the marks.
- `markPositions`: [Float] - Set in a percentage system from 0 to 100 where the marks should be placed.

#### Bar colors
- `selectedBarColor`: UIColor - Customize the color of the selected side of the slider.
- `unselectedBarColor`: UIColor - Customize the color of the unselected side of the slider.

## Author

SuperbDerrick, kang.derrick@gmail.com

## References
 Please Let me know pull request or  if you want to use this library in your application.

## License

SummerSlider is available under the MIT license. See the LICENSE file for more info.
