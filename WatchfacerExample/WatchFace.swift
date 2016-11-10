//
//  WatchFace.swift
//  ParkBot
//
//  Created by Oliver Toscan on 17/05/15.
//  Copyright (c) 2015 Luna Square. All rights reserved.
//

import UIKit

@IBDesignable class WatchFace: UIView {
  
  let π:CGFloat = CGFloat(M_PI)
  
  @IBInspectable var mainColor: UIColor = UIColor.white
  @IBInspectable var mainWidth: CGFloat = 4.0
  @IBInspectable var mainLength: CGFloat = 4.0
  @IBInspectable var secondaryColor: UIColor = UIColor.lightGray
  @IBInspectable var secondaryWidth: CGFloat = 1.0
  @IBInspectable var secondaryLength: CGFloat = 8.0
  @IBInspectable var number: Int = 60
  @IBInspectable var marks: Int = 5
  
  override func draw(_ rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    
    let mainPath = UIBezierPath(rect: CGRect(x: -mainWidth/2.0, y: 0.0, width: mainWidth, height: mainLength))
    let secondaryPath = UIBezierPath(rect: CGRect(x: -secondaryWidth/2.0, y: 0.0, width: secondaryWidth, height: secondaryLength))
    context?.translateBy(x: rect.width/2.0, y: rect.height/2.0)
    
    for i in 1...number {
      context?.saveGState()
      
      let angle = (2*π / CGFloat(number)) * CGFloat(i) - π/2.0
      context?.rotate(by: angle)
      
      if i%marks == 0  {
        context?.translateBy(x: 0.0, y: rect.height/2.0 - mainLength)
        mainColor.setFill()
        mainPath.fill()
      } else {
        context?.translateBy(x: 0.0, y: rect.height/2.0 - secondaryLength)
        secondaryColor.setFill()
        secondaryPath.fill()
      }
      
      context?.restoreGState()
    }
  }
}
