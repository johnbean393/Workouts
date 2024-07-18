//
//  WorkoutNavigationColumnView.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import SwiftUI

struct WorkoutNavigationColumnView: View {
	
	@EnvironmentObject private var viewController: ContentViewViewController
	@EnvironmentObject private var workoutData: WorkoutData
	
	var filteredWorkouts: Binding<[Workout]> {
		if viewController.selectedStatus == .completed {
			return $workoutData.values.filter({ $0.status == viewController.selectedStatus })
		} else {
			return $workoutData.values.filter { workout in
				workout.status != .completed
			}
		}
	}
	
    var body: some View {
		List(
			filteredWorkouts,
			selection: $viewController.selectedWorkout
		) { workout in
			WorkoutListRowView(workout: workout)
		}
		.scrollContentBackground(.hidden)
    }
}

#Preview {
	WorkoutNavigationColumnView()
}
