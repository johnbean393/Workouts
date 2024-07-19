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
//		TabView(selection: $viewController.selectedStatus) {
//			ForEach(workoutStatuses) { status in
//				NavigationSplitView {
//					column
//				} detail: {
//					detail
//				}
//				.padding()
//				.tabItem {
//					Label(
//						status.rawValue.capitalized,
//						systemImage: status.iconName
//					)
//				}
//				.tag(status)
//			}
//		}
		TabBarView {
			#if os(iOS)
			iOSColumn
			#else
			macOSColumn
			#endif
		} detail: {
			detail
		}
		.onChange(of: viewController.selectedStatus) {
			viewController.selectedWorkout = nil
		}
	}
	
	var iOSColumn: some View {
		WorkoutNavigationColumnView()
		.navigationTitle("Workouts")
		.if(viewController.selectedStatus == .planned) { view in
			view.toolbar {
#if os(iOS)
				ToolbarItem(placement: .topBarLeading) {
					NewWorkoutButton()
				}
#endif
			}
		}
	}
	
	var macOSColumn: some View {
		VStack(spacing: 0) {
			WorkoutNavigationColumnView()
				.navigationTitle("Workouts")
			if viewController.selectedStatus == .planned {
				Divider()
				NewWorkoutButton()
					.padding(.vertical, 5)
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
