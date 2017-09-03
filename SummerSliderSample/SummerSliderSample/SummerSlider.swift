//
//  SummerSlider.swift
//  SummerSliderSample
//
//  Created by derrick on 30/08/2017.
//  Copyright © 2017 Sensation. All rights reserved.
//

import UIKit

class SummerSlider: UISlider {

	var makrColor : UIColor!
	var markWidth : CGFloat!
	var markPositions : Array<Float>!
	
	var selectedBarColor : UIColor!
	var unselectedBarColor : UIColor!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.makrColor = UIColor.white
		self.markWidth = 2.0
		self.selectedBarColor = UIColor.white
		self.unselectedBarColor = UIColor.black
		self.markPositions = Array<Float>()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		let mainFrame = rect.insetBy(dx: 1.0, dy: 10.0)
		
		UIGraphicsBeginImageContextWithOptions(mainFrame.size ,false , 0)
		let context = UIGraphicsGetCurrentContext()!
		
		context.setLineCap(CGLineCap.round);
		context.setLineWidth(12.0)
		context.move(to: CGPoint(x: 6, y: mainFrame.height / 2))
		context.addLine(to: CGPoint(x: mainFrame.width - 10, y: mainFrame.height / 2))
		context.setStrokeColor(self.selectedBarColor.cgColor)
		context.strokePath()
		
		
		
		let selectedSide = UIGraphicsGetImageFromCurrentImageContext()
		selectedSide!.resizableImage(withCapInsets: UIEdgeInsets.zero)
		
		context.setLineCap(CGLineCap.round);
		context.setLineWidth(12.0)
		context.move(to: CGPoint(x: 6, y: mainFrame.height / 2))
		context.addLine(to: CGPoint(x: mainFrame.width - 10, y: mainFrame.height / 2))
		context.setStrokeColor(self.unselectedBarColor.cgColor)
		context.strokePath()
		
		
		
		let unSelectedSide = UIGraphicsGetImageFromCurrentImageContext()
		unSelectedSide!.resizableImage(withCapInsets: UIEdgeInsets.zero)
		
		selectedSide!.draw(at: CGPoint(x:0,y:0))
		
		
		for mark in self.markPositions {
			context.setLineWidth(self.markWidth)
			let i = CGFloat(mark)
			let postion:CGFloat! =  CGFloat((mainFrame.width  * i ) / 100.0)
			context.move(to: CGPoint(x: postion, y: mainFrame.height / 2 - 5))
			context.addLine(to: CGPoint(x: postion, y: mainFrame.height / 2 + 5))
			context.setStrokeColor(self.makrColor.cgColor)
			context.strokePath()
		}
		
		
		let selectedStripSide = UIGraphicsGetImageFromCurrentImageContext()
		selectedStripSide!.resizableImage(withCapInsets: UIEdgeInsets.zero)
		
		unSelectedSide!.draw(at: CGPoint(x:0,y:0))
		for mark in self.markPositions {
			context.setLineWidth(self.markWidth)
			let i = CGFloat(mark)
			let postion:CGFloat! =  CGFloat((mainFrame.width  * i ) / 100.0)
			context.move(to: CGPoint(x: postion, y: mainFrame.height / 2 - 5))
			context.addLine(to: CGPoint(x: postion, y: mainFrame.height / 2 + 5))
			context.setStrokeColor(self.makrColor.cgColor)
			context.strokePath()
		}
		
		
		let unselectedStripSide = UIGraphicsGetImageFromCurrentImageContext()
		unselectedStripSide!.resizableImage(withCapInsets: UIEdgeInsets.zero)
		
		UIGraphicsEndImageContext()
		
		self.setMinimumTrackImage(selectedStripSide, for: UIControlState.normal)
		self.setMaximumTrackImage(unselectedStripSide, for: UIControlState.normal)
	}

}
