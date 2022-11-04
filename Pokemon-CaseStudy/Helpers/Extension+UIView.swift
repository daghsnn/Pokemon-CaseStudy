//
//  Extension+UIView.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 3.11.2022.
//

import UIKit
extension UIView {
    
    static var WIDTH: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var HEIGHT: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func makeShadow(color: UIColor, offSet:CGSize, radius:CGFloat, opacity:Float){
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
}
