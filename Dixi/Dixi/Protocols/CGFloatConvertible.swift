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


public protocol CGFloatConvertible {
    func toCGFloat() -> CGFloat
}
