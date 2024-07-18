//
//  Category.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation
import SwiftUI

enum Category: String, Codable {
	
	case strength
	case plyometrics
	case stretching
	case cardio
	case strongman
	case powerlifting
	case olympicWeightlifting
	
	/// Computed property returning an icon for each level
	var label: some View {
		// Declare image name variable
		var systemName: String
		// Define image name
		switch self {
			case .strength:
				systemName = "dumbbell.fill"
			case .plyometrics:
				systemName = "figure.mixed.cardio"
			case .stretching:
				systemName = "figure.cooldown"
			case .cardio:
				systemName = "figure.run.treadmill"
			case .strongman:
				systemName = "figure.cross.training"
			case .powerlifting:
				systemName = "scalemass"
			case .olympicWeightlifting:
				systemName = "scalemass.fill"
		}
		// Return view
		return Label(self.rawValue.capitalized, systemImage: systemName)
	}
	
}
