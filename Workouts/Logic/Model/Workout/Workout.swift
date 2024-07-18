//
//  Workout.swift
//  Workouts
//
//  Created by Bean John on 17/7/2024.
//

import Foundation

struct Workout: Identifiable, Codable, Hashable {
	
	/// Property to conform to Identifiable
	var id: UUID = UUID()
	
	/// Property storing the workout's name
	var name: String = "New Workout \(Date.now.ISO8601Format().prefix(10))"
	
	/// Property storing the workout's exercise
	var exercise: Exercise = ExercisesData.default.exercises.first!
	
	/// Property storing the workout's current status
	var status: WorkoutStatus = .planned
	
	/// Property storing the workout's start time
	var startTime: Date?
	/// Computed poperty returning whether workout has started
	var didStart: Bool {
		return self.startTime != nil
	}
	/// Computed poperty returning the time elaped since the workout started
	var timeElapsedSecs: Double? {
		guard let startTime = self.startTime else {
			return nil
		}
		return Date.now.timeIntervalSince(startTime)
	}

	/// Property storing the workout's pause times
	var pauseTimes: [Date] = []
	/// Property storing the workout's resume times
	var resumeTimes: [Date] = []
	/// Computed poperty returning whether workout has been resumed
	var didResume: Bool {
		return self.pauseTimes.count == self.resumeTimes.count
	}
	/// Computed poperty returning the total rest time taken during the workout
	var totalRestTime: Double {
		// Define total variable
		var total: Double = 0
		// For each pause
		for index in pauseTimes.indices {
			// Get start and end times
			let pauseTime: Date = self.pauseTimes[index]
			var resumeTime: Date
			if (self.resumeTimes.count - 1) < index {
				resumeTime = Date.now
			} else {
				resumeTime = self.resumeTimes[index]
			}
			// Calculate pause length and aggregate
			let restInterval: Double = resumeTime.timeIntervalSince(pauseTime)
			total += restInterval
		}
		return total
	}
	
	/// Property storing the workout's end time
	var endTime: Date?
	/// Computed poperty returning whether workout is complete
	var didEnd: Bool {
		return self.endTime != nil
	}
	/// Computed poperty returning the total time working out (total time  - rest time)
	var totalTimeSecs: Double? {
		guard let startTime = self.startTime, let endTime = self.endTime else {
			return nil
		}
		return endTime.timeIntervalSince(startTime) - self.totalRestTime
	}
	
	/// Function to check if the workout is ready to be started
	public func ready() -> Bool {
		return !(self.name.isEmpty)
	}
	
	/// Function to start the workout
	public mutating func start() -> (success: Bool, msg: String?) {
		// If the workout can be started
		if self.ready() {
			self.status = .inProgress
			self.startTime = Date.now
			return (true, nil)
		}
		// Else, return error
		return (false, "Please select an exercise.")
	}
	
	/// Function to pause the workout
	public mutating func pause() {
		self.pauseTimes.append(Date.now)
		self.status = .resting
	}
	
	/// Function to resume the workout
	public mutating func resume() {
		self.resumeTimes.append(Date.now)
		self.status = .inProgress
	}
	
	/// Function to finish the workout
	public mutating func finish() {
		self.endTime = Date.now
		self.status = .completed
	}
	
	/// Function to check the workout
	public func check() -> Bool {
		let nameIsBlank: Bool = self.name.isEmpty
		return !(nameIsBlank)
	}
	
}
