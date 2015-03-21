//
//  CGFloatConvertible.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif


/**
    Types implementing this protocol may be converted to CGFloat with or without loss of precision.
*/
public protocol CGFloatConvertible {
    
    func toCGFloat() -> CGFloat
}
