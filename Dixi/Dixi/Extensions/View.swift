//
//  UIView.swift
//  Dixi
//
//  Created by Mihai Damian on 04/03/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#else
    import AppKit
#endif


extension View {
    
    /**
        Add a Dixi constraint as a NSLayoutConstraint.
        
        - parameter constraint: The constraint to be added to the view.
    */
    public func addConstraint(constraint: LayoutConstraint) {
        addConstraint(constraint.autolayoutConstraint)
    }
    
    /**
        Add an array of Dixi constraints as NSLayoutConstraints
    
        - parameter constraints: The array of constraints to be added to the view.
    */
    public func addConstraints(constraints: [LayoutConstraint]) {
        constraints.map { self.addConstraint($0) }
    }
}
