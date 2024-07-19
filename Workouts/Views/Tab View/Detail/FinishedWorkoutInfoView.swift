//
//  FinishedWorkoutInfoView.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import SwiftUI

struct FinishedWorkoutInfoView: View {
	
	@EnvironmentObject private var viewController: ContentViewViewController
	@EnvironmentObject private var workoutData: WorkoutData
	@Binding var selectedWorkout: Workout?
	
	var workTime: Double {
		return selectedWorkout?.totalTimeSecs ?? 0
	}
	
	var restTime: Double {
		return selectedWorkout?.totalRestTime ?? 0
	}
	
	var workoutDuration: String {
		let minsStr: String = Int(workTime / 60).addLeadingZeros(target: 2)
		let secsStr: String = (Int(workTime) % 60).addLeadingZeros(target: 2)
		return "\(minsStr):\(secsStr)"
	}
	
	var restDuration: String {
		let minsStr: String = Int(restTime / 60).addLeadingZeros(target: 2)
		let secsStr: String = (Int(restTime) % 60).addLeadingZeros(target: 2)
		return "\(minsStr):\(secsStr)"
	}
	
	var restPercentage: Int {
		// Avoid div 0 error
		if (workTime + restTime).isZero { return 0 }
		// Calculate & return percentage
		return Int(round(restTime / (workTime + restTime) * 100))
	}
	
    var body: some View {
		if selectedWorkout == nil {
			Text("Select a Workout")
		} else {
			workoutInfo
		}
    }
	
	var workoutInfo: some View {
		VStack(alignment: .leading, spacing: 17) {
			exerciseInfo
			Text("**Work Duration:** \(workoutDuration)")
			Text("**Rest Duration:** \(restDuration)")
			Text("**Rest Time Percentage:** \(restPercentage)%")
		}
		.font(.title2)
	}
	
	var exerciseInfo: some View {
		Group {
			Text("**Exercise:** \(selectedWorkout!.exercise.name.capitalized)")
			HStack {
				Text("**Level:**")
				selectedWorkout!.exercise.level.label
			}
			HStack {
				Text("**Category:**")
				selectedWorkout!.exercise.category.label
			}
			Text("**Equiptment:** \(selectedWorkout!.exercise.equipment.capitalized)")
		}
	}
	
}

//#Preview {
//    FinishedWorkoutInfoView()
//}
