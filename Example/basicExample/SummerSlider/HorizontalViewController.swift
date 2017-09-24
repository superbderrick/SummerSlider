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
  
    let testRect1 = CGRect(x:30 ,y:100 , width:300 , height:30)
    let testRect2 = CGRect(x:30 ,y:150 , width:300 , height:30)
    let testRect3 = CGRect(x:30 ,y:200 , width:300 , height:30)

    override func viewDidLoad() {
        super.viewDidLoad()
      
      testSlider1 = SummerSlider(frame: testRect1)
      
      
      testSlider2 = SummerSlider(frame: testRect2)
      
      testSlider3 = SummerSlider(frame: testRect3)
      
      
      
      self.view.addSubview(testSlider1)
      self.view.addSubview(testSlider2)
      self.view.addSubview(testSlider3)

     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

  

}
