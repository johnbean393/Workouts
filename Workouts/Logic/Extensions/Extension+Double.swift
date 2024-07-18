//
//  Extension+Double.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation

extension Double {
	
	/// Function to convert angles to radians
	func toRadians() -> Double {
		return self * Double.pi / 180
	}
	
	/// Function to convert a double to a CoreGraphics floating point number
	func toCGFloat() -> CGFloat {
		return CGFloat(self)
	}
	
}
