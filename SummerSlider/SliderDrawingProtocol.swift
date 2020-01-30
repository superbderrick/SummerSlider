//
//  SliderDrawingProtocol.swift
//  SummerSlider
//
//  Created by derrick on 26/09/2017.
//  Copyright © 2017 SuperbDerrick. All rights reserved.
//

import Foundation

protocol SliderDrawingProtocol {
	func getDrawingImage(rect : CGRect) -> (UIImage, UIImage)
}

protocol DrawAPIProtocol {
	func drawMarks(_ context:CGContext ,_ innerRect : CGRect , _ markColor:CGColor ,_ marks:Array<Float>! ,_ markWidth:Float) -> Void
	func drawRect(_ context:CGContext ,_ innerRect : CGRect , _ rectColr:CGColor)->Void
}
