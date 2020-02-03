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
    
    /// customizable from Interface Builder; first color from gradient range
    @IBInspectable var firstColor: UIColor? { // customizable from Interface Builder; first color from gradient range
        didSet {
            setup()
        }
    }
    /// customizable from Interface Builder; first color from gradient range
    @IBInspectable var secondColor: UIColor? {
        didSet {
            setup()
        }
    }
    /// default sliderHeight is set to 20.0, however, it is customizable via Interface Builder
    @IBInspectable var sliderHeight: CGFloat = 20.0 {
            didSet {
                setup()
            }
        }
    
    /// thumbImage is customizable via Interface Builder
    @IBInspectable var thumbImage: UIImage? {
            didSet {
                setup()
            }
        }
    
    /// unselectableBarColor is customizable via Interface Builder
    @IBInspectable var unselectedBarColor: UIColor? { 
        didSet {
            setup()
        }
    }
    
    /// thumbColor is customizable via Interface Builder
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
    
       public func setup() {
          let minTrackStartColor = firstColor
          let minTrackEndColor = secondColor
     
        do {
            self.setMinimumTrackImage(try self.gradientImage(
                size: self.trackRect(forBounds: self.bounds).size,
                gradientRangeColors: [(firstColor?.cgColor ?? UIColor.red.cgColor), secondColor?.cgColor ?? UIColor.blue.cgColor]),
                                      for: .normal)
            
            self.setMaximumTrackImage(try self.gradientImage(
                size: self.trackRect(forBounds: self.bounds).size,
                gradientRangeColors: [(firstColor?.cgColor ?? UIColor.red.cgColor), (secondColor?.cgColor ?? UIColor.blue.cgColor)]),
                                      for: .normal)
            self.maximumTrackTintColor = unselectedBarColor /// defaults to UIColor.lightGray, customizable from Interface Builder
            self.setThumbImage(thumbImage, for: .normal)
            self.thumbTintColor = thumbColor
        
            } catch {
                self.minimumTrackTintColor = minTrackStartColor
                self.maximumTrackTintColor = minTrackEndColor
          
            }
        }
        
      public func gradientImage(size: CGSize, gradientRangeColors: [CGColor]) throws -> UIImage? {
            let sliderGradientLayer = CAGradientLayer()
            sliderGradientLayer.frame = CGRect.init(x:0, y:0, width:size.width, height: size.height)
            sliderGradientLayer.cornerRadius = sliderGradientLayer.frame.height / 2
            sliderGradientLayer.masksToBounds = true
            sliderGradientLayer.colors = gradientRangeColors
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
