//
//  ExercisesData.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation
import SwiftUI

class ExercisesData {
	
	static let `default`: ExercisesData = ExercisesData()
	
	/// Define initializer
	init() {
		self.exercises = Self.loadExercises()
	}
	
	/// Property containing an array of exercises
	var exercises: [Exercise]
	
	/// Static function to load exercises
	static func loadExercises() -> [Exercise] {
		let dataUrl: URL = Bundle.main.url(
			forResource: "exercisesData",
			withExtension: "json"
		)!
		// Load data
		do {
			let data = try Data(contentsOf: dataUrl)
			// Convert raw data to array of exercises
			let decoder: JSONDecoder = JSONDecoder()
			let exercises = try decoder.decode([Exercise].self, from: data)
			return exercises
		} catch {
			// Print error
			print("Error:", error)
			// Throw error if closures fall through
			fatalError("Could not load exercises.")
		}
	}
	
	struct ExercisePickerView: View {
		
		let exercises: [Exercise] = ExercisesData.default.exercises
		
		var title: String = "Select a Workout"
		@Binding var selectedExercise: Exercise
		
		var body: some View {
			Picker(
				title,
				selection: $selectedExercise
			) {
				ForEach(exercises) { exercise in
					Text(exercise.name)
						.tag(exercise)
				}
			}
		}
		
	}
	
}
