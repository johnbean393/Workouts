//
//  WorkoutListRowView.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import SwiftUI

struct WorkoutListRowView: View {
	
	@EnvironmentObject private var viewController: ContentViewViewController
	@EnvironmentObject private var workoutData: WorkoutData
	
	@Binding var workout: Workout
	
	var body: some View {
		NavigationLink(value: workout) {
			Text(workout.name)
		}
		.contextMenu {
			deleteButton
		}
	}
	
	var deleteButton: some View {
		Button {
			workoutData.delete(workout)
			viewController.selectedWorkout = nil
		} label: {
			Label("Delete", systemImage: "minus")
		}
	}
	
}

//#Preview {
//	WorkoutListRowView()
//}

