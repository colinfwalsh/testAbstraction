//
//  TestTableViewCell.swift
//  Abstraction
//
//  Created by Colin Walsh on 7/9/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

enum SetCorners {
    case top
    case bottom
    case none
}

class TestTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    var corner: SetCorners = SetCorners.none {
        didSet {
            self.layoutSubviews()
        }
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        switch corner {
        case .top:
            self.roundCorners([.topLeft, .topRight], radius: 10.0)
        case .bottom:
            self.roundCorners([.bottomLeft, .bottomRight], radius: 10.0 )
        case .none:
            print("No action needed")
        }
        
    }
}


extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
