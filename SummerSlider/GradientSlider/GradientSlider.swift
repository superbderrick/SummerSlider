//
//  GradientSlider.swift
//  SummerSlider
//
//  Created by Alex L. on 1/18/20.
//  Copyright © 2020 SuperbDerrick. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class GradientSlider: UISlider {
    @IBInspectable  public var markColor : UIColor!
    @IBInspectable  public var markPositions : Array<Float>!
    @IBInspectable  public var selectedBarColor: UIColor!
    @IBInspectable  public var unselectedBarColor: UIColor!
    
    public var markWidth : Float!
    public var drawingMode: DrawingMode!
    
    @IBInspectable var thickness: CGFloat = 20 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var sliderThumbImage: UIImage? {
        didSet {
            setup()
        }
    }
    
    override public func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x,
            y: bounds.origin.y,
            width: bounds.width,
            height: thickness
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
    
    func setup() {
        let minTrackStartColor =  UIColor(red: 0.02, green: 0.49, blue: 0.68, alpha: 1)
        let minTrackEndColor =  UIColor(red: 0.52, green: 0.83, blue: 0.94, alpha:1)
        let maxTrackColor = UIColor.lightGray
        
        do {
            self.setMinimumTrackImage(try self.gradientImage(
                size: self.trackRect(forBounds: self.bounds).size,
                colorSet: [minTrackStartColor.cgColor, minTrackEndColor.cgColor]),
                                      for: .normal)
            self.setMaximumTrackImage(try self.gradientImage(
                size: self.trackRect(forBounds: self.bounds).size,
                colorSet: [maxTrackColor.cgColor, maxTrackColor.cgColor]),
                                      for: .normal)
            self.setThumbImage(sliderThumbImage, for: .normal)
            
            
        } catch {
            self.minimumTrackTintColor = minTrackStartColor
            self.maximumTrackTintColor = maxTrackColor
        }
    }
    
    func gradientImage(size: CGSize, colorSet: [CGColor]) throws -> UIImage? {
        let sliderGradientLayer = CAGradientLayer()
        
        sliderGradientLayer.frame = CGRect.init(x:0, y:0, width:size.width, height: size.height)
        sliderGradientLayer.cornerRadius = sliderGradientLayer.frame.height / 2
        sliderGradientLayer.masksToBounds = false
        sliderGradientLayer.colors = colorSet
        sliderGradientLayer.startPoint = CGPoint.init(x:0.0, y:0.5)
        sliderGradientLayer.endPoint = CGPoint.init(x:1.0, y:0.5)
        
        UIGraphicsBeginImageContextWithOptions(size, sliderGradientLayer.isOpaque, 0.0)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        sliderGradientLayer.render(in: context)
        
        let image =
            UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets:
                UIEdgeInsets.init(top: 0, left: size.height, bottom: 0, right: size.height))
        UIGraphicsEndImageContext()
        return image!
    }
    
}
