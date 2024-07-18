//
//  WorkoutEditorView.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import SwiftUI

struct WorkoutEditorView: View {
	
	@EnvironmentObject private var viewController: ContentViewViewController
	@EnvironmentObject private var workoutData: WorkoutData
	@Binding var selectedWorkout: Workout?
	
	@State private var workout: Workout = Workout()
	@State private var lastWorkoutId: UUID = UUID()
	
	@State private var showError: Bool = false
	@State private var errorMsg: String = ""
	
    var body: some View {
		Group {
			if selectedWorkout == nil {
				nilView
			} else {
				editor
			}
		}
		.onChange(of: selectedWorkout) {
			// Update only when selection changed, not when a workout is edited
			if selectedWorkout != nil {
				if selectedWorkout!.id != lastWorkoutId {
					workout = selectedWorkout!
				}
			}
		}
		.onChange(of: workout) {
			updateWorkout()
		}
		
    }
	
	var nilView: some View {
		HStack {
			Text("Select a Workout or")
			NewWorkoutButton()
		}
	}
	
	var editor: some View {
		Form {
			Section {
				name
			} header: {
				Text("Name")
			}
			Section {
				exercise
			} header: {
				Text("Exercise")
			}
			Section {
				actions
			} header: {
				Text("Actions")
			}
		}
		.formStyle(.grouped)
		.alert(errorMsg, isPresented: $showError) {
			Button("OK", role: .cancel) {}
		}
	}
	
	var name: some View {
		HStack {
			VStack(alignment: .leading) {
				Text("Name")
					.font(.title3)
					.bold()
				Text("The workout's name")
					.font(.caption)
			}
			Spacer()
			TextField("", text: $workout.name)
				.textFieldStyle(.plain)
				.multilineTextAlignment(.trailing)
		}
	}
	
	var exercise: some View {
		VStack(alignment: .leading) {
			HStack {
				VStack(alignment: .leading) {
					Text("Exercise")
						.font(.title3)
						.bold()
					Text("The exercise in the workout")
						.font(.caption)
				}
				Spacer()
				ExercisesData.ExercisePickerView(
					title: "",
					selectedExercise: $workout.exercise
				)
			}
			Divider()
			exerciseInfo
		}
	}
	
	var exerciseInfo: some View {
		VStack(alignment: .leading, spacing: 17) {
			Text(workout.exercise.name.capitalized)
				.font(.title3)
				.bold()
			VStack(alignment: .leading) {
				HStack {
					Text("**Level:**")
					workout.exercise.level.label
				}
				HStack {
					Text("**Category:**")
					workout.exercise.category.label
				}
				Text("**Equiptment:** \(workout.exercise.equipment.capitalized)")
			}
			.padding(.leading)
		}
		.padding(.vertical)
	}
	
	var actions: some View {
		Group {
			startOrResume
			HStack {
				VStack(alignment: .leading) {
					Text("Delete")
						.font(.title3)
						.bold()
					Text("Deletes the workout")
						.font(.caption)
				}
				Spacer()
				Button {
					if let selectedWorkout = selectedWorkout {
						workoutData.delete(selectedWorkout)
						self.selectedWorkout = nil
					}
				} label: {
					Label("Delete", systemImage: "trash")
						.foregroundStyle(Color.red)
				}
			}
		}
	}
	
	var startOrResume: some View {
		Group {
			if workout.status == .planned {
				HStack {
					VStack(alignment: .leading) {
						Text("Start")
							.font(.title3)
							.bold()
						Text("Start the workout")
							.font(.caption)
					}
					Spacer()
					Button {
						startWorkout()
					} label: {
						Label("Start", systemImage: workout.status.iconName)
							.foregroundStyle(Color.green)
					}
				}
			} else {
				HStack {
					VStack(alignment: .leading) {
						Text("Resume")
							.font(.title3)
							.bold()
						Text("Resume the workout")
							.font(.caption)
					}
					Spacer()
					Button {
						resumeWorkout()
					} label: {
						Label("Resume", systemImage: workout.status.iconName)
							.foregroundStyle(Color.green)
					}
				}
			}
		}
	}
	
	/// Function to start the workout
	func startWorkout() {
		let startResult = workout.start()
		errorMsg = startResult.msg ?? ""
		showError = !startResult.success
		if startResult.success {
			if selectedWorkout != nil {
				selectedWorkout! = workout
			}
		}
	}
	
	/// Function to resume the workout
	func resumeWorkout() {
		workout.resume()
		if selectedWorkout != nil {
			selectedWorkout! = workout
		}
	}
	
	/// Function to update the workout
	func updateWorkout() {
		// Check workout
		if workout.check() {
			// Update
			workoutData.update(workout)
		} else {
			// Show error
			showError = true
		}
	}
	
}

//#Preview {
//    WorkoutEditorView()
//}
