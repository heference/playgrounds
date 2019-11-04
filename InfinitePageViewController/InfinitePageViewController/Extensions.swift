//
//  Extensions.swift
//  InfinitePageViewController
//
//  Created by Heference on 2019/11/04.
//  Copyright © 2019 sfp. All rights reserved.
//

import Foundation
import UIKit
// UIColor Extensions
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    
    static func rgbByAlpha(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

extension UIView {
    // For AutoLayout
    // Ex)
    // toView.topAnchor(equalTo: fromView.topAnchor, constant: 0).isActive = true 에서 isActive = true에 대한 반복코드를 제거하기 위한 Extension
    
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
    
    func subviewsRecursive() -> [UIView] {
        return subviews + subviews.flatMap { $0.subviewsRecursive() }
    }
}
