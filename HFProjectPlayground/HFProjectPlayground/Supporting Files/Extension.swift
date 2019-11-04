//
//  Extension.swift
//  HFProjectPlayground
//
//  Created by Ikarious on 02/09/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit

extension UIView {
    // For AutoLayout
    
    func topAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Void {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func bottomAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Void {
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func leadingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Void {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func trailingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Void {
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func heightAnchor(equalToConstant height: CGFloat) -> Void {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func widthAnchor(equalToConstant height: CGFloat) -> Void {
        widthAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func centerXAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Void {
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func centerYAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Void {
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    
    static func rgbByAlpha(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

