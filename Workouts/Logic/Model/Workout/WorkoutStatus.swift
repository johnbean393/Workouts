//
//  WorkoutStatus.swift
//  Workouts
//
//  Created by Bean John on 17/7/2024.
//

import Foundation
import SwiftUI

enum WorkoutStatus: String, Identifiable, Codable, CaseIterable {
	
	case planned
	case inProgress
	case resting
	case completed
	
	/// Computed property proving conformance to identifiable
	var id: String {
		return self.rawValue
	}

	/// Computed property returning an icon name for each workout status
	var iconName: String {
		// Declare image name variable
		var systemName: String
		// Assign name
		switch self {
			case .planned:
				systemName = "play.circle.fill"
			case .inProgress:
				systemName = "pause.circle.fill"
			case .resting:
				systemName = "play.circle.fill"
			case .completed:
				systemName = "checkmark.circle.fill"
		}
		// Return name
		return systemName
	}
	
}
