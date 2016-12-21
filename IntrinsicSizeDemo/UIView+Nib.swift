//
//  UIView+Nib.swift
//  IntrinsicSizeDemo
//
//  Created by Gaurav Keshre on 02/12/16.
//

import Foundation
import UIKit

public extension UIView {
	public class func fromNib(nibNameOrNil: String? = nil) -> Self {
		return fromNib(nibNameOrNil: nibNameOrNil, type: self)
	}

	public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
		let v: T? = fromNib(nibNameOrNil: nibNameOrNil, type: type)
		return v!
	}

	public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
		var view: T?
		let name: String
		if let nibName = nibNameOrNil {
			name = nibName
		} else {
			// Most nibs are demangled by practice, if not, just declare string explicitly
			name = nibName
		}
		guard let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil) else{
			return nil
		}
		for v in nibViews{
			if let tog = v as? T {
				view = tog
			}
		}
		return view
	}

	public class var nibName: String {
		let name = "\(self)".components(separatedBy: ".").first ?? ""
		return name
	}
	public class var nib: UINib? {
		if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
			return UINib(nibName: nibName, bundle: nil)
		} else {
			return nil
		}
	}
    
    
    @objc func addFullViewConstraints(_ superView:UIView) {
        let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superView, attribute: .leading, multiplier: 1, constant: 0)
        superview!.addConstraint(leading)
        let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superView, attribute: .trailing, multiplier: 1, constant: 0)
        superView.addConstraint(trailing)
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1, constant: 0)
        superView.addConstraint(top)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1, constant: 0)
        superView.addConstraint(bottom)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
