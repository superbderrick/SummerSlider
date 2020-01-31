//
//  GradientSlider.swift
//  SummerSlider
//
//  Created by Alex L. on 1/18/20.
//  Copyright © 2020 SuperbDerrick. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class GradientSummerSlider: UISlider {
    
    @IBInspectable public var markColor: UIColor!
    @IBInspectable public var markPositions: Array<Float>!

    // MARK: - IBInspectable variables customizable from Interface Builder
    @IBInspectable var sliderHeight: CGFloat = 20.0 { // set as a default; can be changed from Interface Builder
            didSet {
                setup()
            }
        }
        
        // MARK: Change slider thumb image
        @IBInspectable var thumbImage: UIImage? {
            didSet {
                setup()
            }
        }
        
    @IBInspectable var unselectedBarColor: UIColor? { 
        didSet {
            setup()
        }
    }
    // MARK: - Default slider thumb tint color doesn't work so I added this for added-on customization within the Interface Builder
    @IBInspectable var thumbColor: UIColor? {
        didSet {
            setup()
        }
    }
    
        override public func trackRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(
                x: bounds.origin.x,
                y: bounds.origin.y,
                width: bounds.width,
                height: sliderHeight
            )
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setup()
    
        }
    
        // MARK: Setup/customize gradient colors here
        func setup() {
          let minTrackStartColor =  UIColor(red: 0.02, green: 0.49, blue: 0.68, alpha: 1)
          let minTrackEndColor =  UIColor(red: 0.52, green: 0.83, blue: 0.94, alpha:1)
          let maxTrackColor = unselectedBarColor
        
        do {
            self.setMinimumTrackImage(try self.gradientImage(
                size: self.trackRect(forBounds: self.bounds).size,
                colorSet: [minTrackStartColor.cgColor, minTrackEndColor.cgColor]),
                                      for: .normal)
            
            self.setMaximumTrackImage(try self.gradientImage(
                size: self.trackRect(forBounds: self.bounds).size,
                colorSet: [(maxTrackColor?.cgColor ?? UIColor.lightGray.cgColor), (maxTrackColor?.cgColor ?? UIColor.lightGray.cgColor)]),
                                      for: .normal)
            
            self.setThumbImage(thumbImage, for: .normal)
            self.thumbTintColor = thumbColor

            } catch {
                self.minimumTrackTintColor = minTrackStartColor
                self.maximumTrackTintColor = maxTrackColor
            }
        }
        
        // MARK: Slider gradient layer
        func gradientImage(size: CGSize, colorSet: [CGColor]) throws -> UIImage? {
            let sliderGradientLayer = CAGradientLayer()
            sliderGradientLayer.frame = CGRect.init(x:0, y:0, width:size.width, height: size.height)
            sliderGradientLayer.cornerRadius = sliderGradientLayer.frame.height / 2
            sliderGradientLayer.masksToBounds = true
            sliderGradientLayer.colors = colorSet
            sliderGradientLayer.startPoint = CGPoint.init(x:0.0, y:0.5)
            sliderGradientLayer.endPoint = CGPoint.init(x:1.0, y:0.5)
    
            UIGraphicsBeginImageContextWithOptions(size, sliderGradientLayer.isOpaque, 0.0)
            
            guard let context = UIGraphicsGetCurrentContext() else { return nil }
            sliderGradientLayer.render(in: context)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets:
                       UIEdgeInsets.init(top: 0, left: size.height, bottom: 0, right: size.height))
            UIGraphicsEndImageContext()
            return image!
        }
    }
