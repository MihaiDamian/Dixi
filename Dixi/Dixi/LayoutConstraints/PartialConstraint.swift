//
//  PartialConstraint.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation


struct PartialConstraint {
}


func -| (constraint: PartialConstraint, view: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}
