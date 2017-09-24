//
//  HorizontalViewController.swift
//  SummerSlider
//
//  Created by Kang Jinyeoung on 24/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SummerSlider
class HorizontalViewController: UIViewController {
  
    var testSlider1:SummerSlider!
    var testSlider2:SummerSlider!
    var testSlider3:SummerSlider!
  
    let testRect1 = CGRect(x:30 ,y:70 , width:300 , height:30)
    let testRect2 = CGRect(x:30 ,y:120 , width:300 , height:30)
    let testRect3 = CGRect(x:30 ,y:170 , width:300 , height:30)
  
  
  
  @IBOutlet weak var testSlider4: SummerSlider!
  
  @IBOutlet weak var testSlider5: SummerSlider!

  @IBOutlet weak var testSlider6: SummerSlider!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      var marksArray1 = Array<Float>()
      marksArray1 = [0,10,20,30,40,50,60,70,80,90,100]
      testSlider1 = SummerSlider(frame: testRect1)
      testSlider1.selectedBarColor = UIColor.blue
      testSlider1.unselectedBarColor = UIColor.red
      testSlider1.markColor = UIColor.yellow
      testSlider1.markWidth = 2.0
      testSlider1.markPositions = marksArray1
      

      var marksArray2 = Array<Float>()
      marksArray2 = [10.0,15.0,23.0,67.0,71.0]
      testSlider2 = SummerSlider(frame: testRect2)
      testSlider2.selectedBarColor = UIColor(red:138/255.0 ,green:255/255.0 ,blue:0/255 ,alpha:1.0)
      testSlider2.unselectedBarColor = UIColor(red:108/255.0 ,green:200/255.0 ,blue:0/255.0 ,alpha:1.0)
      testSlider2.markColor = UIColor.red
      testSlider2.markWidth = 1.0
      testSlider2.markPositions = marksArray2
      
      testSlider3 = SummerSlider(frame: testRect3)
      
      var marksArray3 = Array<Float>()
      marksArray3 = [20.0,15.0,23.0,67.0, 90.0]
      testSlider3 = SummerSlider(frame: testRect3)
      testSlider3.selectedBarColor = UIColor.blue
      testSlider3.unselectedBarColor = UIColor(red:20/255.0 ,green:40/255.0 ,blue:0/255.0 ,alpha:1.0)
      testSlider3.markColor = UIColor.gray
      testSlider3.markWidth = 10.0
      testSlider3.markPositions = marksArray3
      
      self.view.addSubview(testSlider1)
      self.view.addSubview(testSlider2)
      self.view.addSubview(testSlider3)

     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

  

}
