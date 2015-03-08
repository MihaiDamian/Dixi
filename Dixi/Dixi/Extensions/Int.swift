//
//  Int.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#else
    import AppKit
#endif


extension Int: CGFloatConvertible {
    
    public func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }
}
