//
//  CustomView.swift
//  IntrinsicSizeDemo
//
//  Created by Gaurav Keshre on 21/12/16.
//  Copyright © 2016 GauravKeshre. All rights reserved.
//

import Foundation
import  UIKit
class  CustomView: UIView {
    @IBOutlet weak var lblMessage : UILabel!
 
    override var intrinsicContentSize: CGSize{
        var ht = lblMessage.bounds.origin.y
        ht = ht + lblMessage.intrinsicContentSize.height
        var sz = self.bounds.size
        sz.height = ht
        return sz
    }
    
    func setData(text: String){
        self.lblMessage.text = text
        self.lblMessage.setNeedsLayout()
    }

}
