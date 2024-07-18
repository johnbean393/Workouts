//
//  NewWorkoutButton.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import SwiftUI

struct NewWorkoutButton: View {
	
	@EnvironmentObject private var workoutData: WorkoutData
	
    var body: some View {
		Button {
			let newWorkout: Workout = Workout()
			workoutData.add(newWorkout)
		} label: {
			Label("Add", systemImage: "plus")
				.foregroundStyle(Color.accentColor)
		}
		.buttonStyle(PlainButtonStyle())
    }
	
}

#Preview {
    NewWorkoutButton()
}
