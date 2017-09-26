//
//  Sliders.swift
//  SummerSlider
//
//  Created by derrick on 26/09/2017.
//  Copyright © 2017 SuperbDerrick. All rights reserved.
//

import Foundation


struct VerticalSlider: SliderDrawingProtocol{
	var slider: Slider
	
	init(slider: Slider){
		self.slider = slider
	}

	func getDrawingImage(rect: CGRect) -> (UIImage,UIImage) {
		return (UIImage(),UIImage())
	}
	
}



