//
//  Exercise.swift
//  Workouts
//
//  Created by Bean John on 17/7/2024.
//

import Foundation

struct Exercise: Identifiable, Codable, Hashable {
	
	/// Property to conform to identifiable
	var id: String {
		get {
			return self.name
		}
	}
	
	/// Property containing the name of the exercise
	var name: String
	
	/// Property containing equiptment needed
	var equipment: String = ""
	
	/// Property containing an array of primary muscles worked out
	var primaryMuscles: [String] = []
	var primaryMusclesDescription: String {
		return primaryMuscles.joinLines(nil)
	}
	/// Property containing an array of secondary muscles worked out
	var secondaryMuscles: [String] = []
	var secondaryMusclesDescription: String {
		return primaryMuscles.joinLines(nil)
	}
	
	/// Property containing instructions
	var instructions: [String] = []
	/// Computed property returning instructions as a string
	var instructionsDescription: String {
		return instructions.joinLines("Step")
	}

	/// Property containing the level of the workout
	var level: Level
	/// Property containing the category of the workout
	var category: Category
	
}
