//
//  ContentViewViewController.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation

class ContentViewViewController: ObservableObject {
	
	/// Published property storing the currently selected workout
	@Published var selectedWorkout: Workout?
	/// Published property storing the currently selected workout status
	@Published var selectedStatus: WorkoutStatus = .planned
	
	/// Computed property returning whether the currently selected workout is in progress
	var selectedWorkoutInProgress: Bool {
		guard let selectedWorkout = selectedWorkout else {
			return false
		}
		return selectedWorkout.status == .inProgress
	}
	
	/// Computed property returning whether the currently selected workout has been started
	var selectedWorkoutDidStart: Bool {
		return selectedWorkout?.didStart ?? false
	}
	
}
