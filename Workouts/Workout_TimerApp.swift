//
//  WorkoutsApp.swift
//  Workouts
//
//  Created by Bean John on 17/7/2024.
//

import SwiftUI

@main
struct WorkoutsApp: App {
	
	@StateObject private var workoutData: WorkoutData = WorkoutData.shared
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(workoutData)
        }
    }
}
