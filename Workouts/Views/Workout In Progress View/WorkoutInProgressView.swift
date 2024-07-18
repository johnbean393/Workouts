//
//  WorkoutInProgressView.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import SwiftUI
import UIKit
import ExtensionKit

struct WorkoutInProgressView: View {
	
	@EnvironmentObject private var viewController: ContentViewViewController
	@EnvironmentObject private var workoutData: WorkoutData
	
	@State private var timer: Timer?
	@State private var id: UUID = UUID()
	
	var percent: Double {
		return (viewController.selectedWorkout?.timeElapsedSecs ?? 0) / 0.6
	}
	
	var secondsSinceStart: Double {
		return viewController.selectedWorkout?.timeElapsedSecs ?? 0
	}
	
	var restSinceStart: Double {
		return viewController.selectedWorkout?.totalRestTime ?? 0
	}
	
	var timeDescription: String {
		let timeElapsed: Double = secondsSinceStart - restSinceStart
		let minsStr: String = Int(timeElapsed / 60).addLeadingZeros(target: 2)
		let secsStr: String = (Int(timeElapsed) % 60).addLeadingZeros(target: 2)
		return "\(minsStr):\(secsStr)"
	}
	
    var body: some View {
		Color.black
			.ignoresSafeArea()
			.overlay {
				overlay
					.id(id)
			}
			.onAppear {
				timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
					id = UUID()
				}
			}
			.onReceive(
				NotificationCenter.default.publisher(
					for: UIApplication.willTerminateNotification
				), perform: { output in
					// Code to run on will terminate
					pauseWorkout()
					print("Workout paused")
					return
				}
			)
    }
	
	var overlay: some View {
		HStack(spacing: 40) {
			VStack(spacing: 25) {
				GradientRing(
					ringWidth: 50,
					percent: percent,
					backgroundColor: Color.orange.opacity(0.2),
					foregroundColors: [.orange, .yellow, .green, .blue]
				)
				.aspectRatio(contentMode: .fit)
				.overlay {
					VStack {
						Text(timeDescription)
							.font(.largeTitle)
							.fontDesign(.rounded)
							.fontWeight(.heavy)
						Text(viewController.selectedWorkout?.name ?? "")
					}
					.foregroundStyle(Color.white)
				}
				.padding(12)
				buttons
			}
			if UIDevice.current.isPad {
				iPadDescription
			}
		}
		.padding()
	}
	
	var iPadDescription: some View {
		VStack(alignment: .leading, spacing: 45) {
			Text("**Exercise:**\n\(viewController.selectedWorkout?.exercise.name ?? "nil")")
			Text(
				"**Instructions:**\n\(viewController.selectedWorkout?.exercise.instructionsDescription ?? "nil")"
			)
		}
		.font(.title2)
		.foregroundStyle(Color.white)
	}
	
	var buttons: some View {
		HStack {
			Button {
				pauseWorkout()
			} label: {
				Label("Pause", systemImage: "pause.circle.fill")
			}
			Button {
				if viewController.selectedWorkout != nil {
					viewController.selectedWorkout!.finish()
					exitPrep()
				}
			} label: {
				Label("Finish", systemImage: "stop.circle.fill")
			}
		}
		.buttonStyle(BorderedProminentButtonStyle())
	}
	
	func pauseWorkout() {
		if viewController.selectedWorkout != nil {
			viewController.selectedWorkout!.pause()
			exitPrep()
		}
	}
	
	func exitPrep() {
		workoutData.update(viewController.selectedWorkout!)
		viewController.selectedWorkout = nil
	}
	
}

#Preview {
	WorkoutInProgressView()
}
