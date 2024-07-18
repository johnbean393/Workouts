//
//  Extension+Array.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation

extension Array where Iterator.Element == String {
	
	func joinLines(_ textPrecedingIndex: String?) -> String {
		// Unwrap provided text
		let providedText: String = textPrecedingIndex ?? ""
		// Make copy of text
		var arr: [String] = self
		// Add index numbers
		for (index, line) in arr.enumerated() {
			arr[index] = "\(providedText) \(index + 1): \(line)"
		}
		// Return joined lines
		return arr.joined(separator: "\n")
	}
	
}
