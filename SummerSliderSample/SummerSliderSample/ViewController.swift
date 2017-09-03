//
//  ViewController.swift
//  SummerSliderSample
//
//  Created by derrick on 30/08/2017.
//  Copyright © 2017 Sensation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var summerSlider: SummerSlider!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		var markPositionsArray = Array<Float>()
    markPositionsArray = [10,20,30,40,50,60,70,80,90,100]

		let rect = CGRect(x: 0, y: 0, width: 435, height: 31)
		
		self.summerSlider = SummerSlider(frame:rect)
		self.summerSlider.markColor = UIColor.yellow
		self.summerSlider.unselectedBarColor = UIColor.gray
		self.summerSlider.selectedBarColor = UIColor.red
		self.summerSlider.markWidth = 1.0
		self.summerSlider.markPositions = markPositionsArray
		
		self.view.addSubview(self.summerSlider)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

