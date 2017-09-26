//
//  SliderFactory.swift
//  SummerSlider
//
//  Created by derrick on 26/09/2017.
//  Copyright © 2017 SuperbDerrick. All rights reserved.
//

import Foundation


struct SliderFactory{
	static func getSlider(slider: Slider)->SliderDrawingProtocol {
		switch slider.style {
		case .Horizontal:
			return HorizontalSlider(slider: slider)
		case .Vertical:
			return VerticalSlider(slider: slider)
		}
	}
}
