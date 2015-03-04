//
//  UIView.swift
//  Dixi
//
//  Created by Mihai Damian on 04/03/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation


extension UIView {
    
    public func addConstraint(constraint: LayoutConstraint) {
        addConstraint(constraint.autolayoutConstraint)
    }
    
    public func addConstraints(constraints: [LayoutConstraint]) {
        constraints.map { self.addConstraint($0) }
    }
}
