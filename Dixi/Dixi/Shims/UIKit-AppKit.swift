//
//  UIKit-AppKit.swift
//  Dixi
//
//  Created by Mihai Damian on 08/03/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation


// Shims used for keeping the library agnostic of differences between UIKit and AppKit.

#if os(iOS)
    import UIKit
    public typealias View = UIView
    public typealias LayoutPriority = UILayoutPriority
#else
    import AppKit
    public typealias View = NSView
    public typealias LayoutPriority = NSLayoutPriority
#endif
