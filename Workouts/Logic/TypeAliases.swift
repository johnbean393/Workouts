//
//  TypeAliases.swift
//  Workouts
//
//  Created by Bean John on 19/7/2024.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif

#if os(iOS)
typealias OSApplication = UIApplication
#else
typealias OSApplication = NSApplication
#endif
