//
//  ContentViewViewController.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation

class ContentViewViewController: ObservableObject {
	
	@Published var selectedWorkout: Workout?
	@Published var selectedStatus: WorkoutStatus = .planned
	
	var selectedWorkoutInProgress: Bool {
		guard let selectedWorkout = selectedWorkout else {
			return false
		}
		return selectedWorkout.status == .inProgress
	}
	
	var selectedWorkoutDidStart: Bool {
		return selectedWorkout?.didStart ?? false
	}
	
}
