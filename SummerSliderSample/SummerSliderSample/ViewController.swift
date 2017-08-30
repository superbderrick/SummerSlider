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
		
		var testArray = Array<Float>()

		let rect = CGRect(x: 0, y: 0, width: 435, height: 31)
		
		self.summerSlider = SummerSlider(frame:rect)
		self.summerSlider.makrColor = UIColor.yellow
		self.summerSlider.selectedBarColor = UIColor.black
		self.summerSlider.unselectedBarColor = UIColor.white
		self.summerSlider.markWidth = 1.0
		testArray.append(10.0)
		self.summerSlider.markPositions = testArray
		
		self.view.addSubview(self.summerSlider)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

