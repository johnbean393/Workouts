//
//  WorkoutStatusTabView.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import SwiftUI

struct WorkoutStatusTabView: View {
	
	var workoutStatuses: [WorkoutStatus] = [.planned, .completed]
	
	@EnvironmentObject private var viewController: ContentViewViewController
	@EnvironmentObject private var workoutData: WorkoutData
	
	var body: some View {
		TabView(selection: $viewController.selectedStatus) {
			ForEach(workoutStatuses) { status in
				NavigationSplitView {
					column
				} detail: {
					detail
				}
				.padding()
				.tabItem {
					Label(
						status.rawValue.capitalized,
						systemImage: status.iconName
					)
				}
				.tag(status)
			}
		}
		.onChange(of: viewController.selectedStatus) {
			viewController.selectedWorkout = nil
		}
	}
	
	var column: some View {
		WorkoutNavigationColumnView()
			.navigationTitle("Workouts")
			.if(viewController.selectedStatus == .planned) { view in
				view.toolbar {
					ToolbarItem(placement: .topBarLeading) {
						NewWorkoutButton()
					}
				}
			}
	}
	
	var detail: some View {
		Group {
			if viewController.selectedStatus == .planned {
				WorkoutEditorView(selectedWorkout: $viewController.selectedWorkout)
					.scrollContentBackground(.hidden)
			} else {
				FinishedWorkoutInfoView(selectedWorkout: $viewController.selectedWorkout)
			}
		}
	}
	
}

#Preview {
    WorkoutStatusTabView()
}
