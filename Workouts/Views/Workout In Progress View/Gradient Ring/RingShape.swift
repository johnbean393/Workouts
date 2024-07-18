//
//  RingShape.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import SwiftUI

struct RingShape: Shape {
	
	/// Helper function to convert percent values to angles in degrees
	static func percentToAngle(percent: Double, startAngle: Double) -> Double {
		(percent / 100 * 360) + startAngle
	}
	
	private var percent: Double
	private var startAngle: Double
	private let drawnClockwise: Bool
	
	// This allows animations to run smoothly for percent values
	var animatableData: Double {
		get {
			return percent
		}
		set {
			percent = newValue
		}
	}
	
	init(percent: Double = 100, startAngle: Double = -90, drawnClockwise: Bool = false) {
		self.percent = percent
		self.startAngle = startAngle
		self.drawnClockwise = drawnClockwise
	}
	
	// This draws a simple arc from the start angle to the end angle
	func path(in rect: CGRect) -> Path {
		let width = rect.width
		let height = rect.height
		let radius = min(width, height) / 2
		let center = CGPoint(x: width / 2, y: height / 2)
		let endAngle = Angle(
			degrees: RingShape.percentToAngle(
				percent: self.percent,
				startAngle: self.startAngle
			)
		)
		return Path { path in
			path.addArc(
				center: center,
				radius: radius,
				startAngle: Angle(degrees: startAngle),
				endAngle: endAngle,
				clockwise: drawnClockwise
			)
		}
	}
	
}
