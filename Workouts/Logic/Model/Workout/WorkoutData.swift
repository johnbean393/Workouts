//
//  WorkoutData.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation
import ExtensionKit
import SwiftUI

class WorkoutData: ValueDataModel<Workout> {
	
	static let shared: WorkoutData = WorkoutData()
	
	required init(appDirName: String = Bundle.main.applicationName ?? Bundle.main.description, datastoreName: String = "workoutData") {
		super.init(appDirName: appDirName, datastoreName: datastoreName)
	}
	
}
