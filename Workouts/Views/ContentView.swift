//
//  ContentView.swift
//  Workouts
//
//  Created by Bean John on 17/7/2024.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject private var viewController: ContentViewViewController = ContentViewViewController()
	@EnvironmentObject private var workoutData: WorkoutData
	
	var body: some View {
		Group {
			if viewController.selectedWorkoutInProgress {
				WorkoutInProgressView()
			} else {
				WorkoutStatusTabView()
					.transition(.slide)
			}
		}
		.environmentObject(viewController)
	}
	
}

#Preview {
    ContentView()
}
