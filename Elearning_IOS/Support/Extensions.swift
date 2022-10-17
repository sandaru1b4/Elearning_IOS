//
//  Extensions.swift
//  Elearning_IOS
//
//  Created by Achitha Sandaruwan on 2022-10-15.
//

import Foundation
import UIKit
import RappleProgressHUD

extension UIView {
    
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}


extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}


extension UIView {
    
    func addCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func addShadowButton(offSet: CGFloat = 1.0, color: UIColor = .black) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: offSet, height: offSet)
        self.layer.shadowOpacity = 0.4
        self.layer.masksToBounds = false
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addShadowWithRoundCornersHeightOffset(offSet: CGFloat = 2.0, color: UIColor = .lightGray, radious: CGFloat = 0.0, shadowRadious: CGFloat = 5.0, shadowOpacity: Float = 0.5) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize.init(width: 0, height: offSet)
        self.layer.shadowRadius = shadowRadious
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shouldRasterize = false
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radious
    }
    
    
    func addLayerEffects(with borderColor: UIColor? = nil, borderWidth: CGFloat = 0.0, cornerRadius: CGFloat = 0.0) {
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
}


extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        
    }
}


extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}

extension UIViewController {
    //MARK: -  Activity Indicator
    // Start loading
    func startLoading() {
        RappleActivityIndicatorView.startAnimating(attributes: RappleActivityIndicatorView.attribute(style: RappleStyle.apple, tintColor:  UIColor(named: "primaryClr")!, screenBG: UIColor(white: 0.0, alpha: 0.1) , progressBG: UIColor.clear))
    }
    
    // Start loading with text
    func startLoadingWithText(label: String) {
        RappleActivityIndicatorView.startAnimatingWithLabel(label)
    }
    
    // Stop loading
    func stopLoading() {
        RappleActivityIndicatorView.stopAnimation()
    }
    
    func startLoadingWithProgress(current: CGFloat, total:CGFloat) {
        RappleActivityIndicatorView.setProgress(current/total)
    }
    
}
