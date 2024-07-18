//
//  Extension+Double.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation

extension Double {
	
	func toRadians() -> Double {
		return self * Double.pi / 180
	}
	func toCGFloat() -> CGFloat {
		return CGFloat(self)
	}
	
}
