//
//  Level.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation
import SwiftUI

enum Level: String, Codable, CaseIterable {
	
	case beginner
	case intermediate
	case expert
	
	/// Private computed property returning the index of the level in the "Level.allCases" array
	private var index: Int {
		return Level.allCases.firstIndex(of: self)!
	}
	
	/// Computed property returning an icon for each level
	var label: some View {
		// Declare image name & color variables
		let systemName: String = "\(index + 1).circle.fill"
		// Return view
		return Label(
			self.rawValue.capitalized,
			systemImage: systemName
		)
	}
	
}
