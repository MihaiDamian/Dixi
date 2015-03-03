//
//  UIView.swift
//  Dixi
//
//  Created by Mihai Damian on 02/03/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation


extension UIView {
    
    public func addConstraint(constraint: LayoutConstraint) -> NSLayoutConstraint {
        
        let autolayoutConstraint = constraint.autolayoutConstraint
        addConstraint(autolayoutConstraint)
        return autolayoutConstraint
    }
    
    public func addConstraints(constraints: [LayoutConstraint]) -> [NSLayoutConstraint] {
        return constraints.map { self.addConstraint($0) }
    }
}
