//
//  GradientViewController.swift
//  SummerSliderDemo
//
//  Created by Alex L. on 1/18/20.
//  Copyright © 2020 SuperbDerrick. All rights reserved.
//

import UIKit
import SummerSlider

class HorizontalGradientVC: UIViewController {
    
    @IBOutlet weak var gradientSummerSlider: GradientSummerSlider! // default
    @IBOutlet weak var gradientSummerSliderWithBackgroundColor: GradientSummerSlider! // w/ backgroundColor set in Interface Builder
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}
