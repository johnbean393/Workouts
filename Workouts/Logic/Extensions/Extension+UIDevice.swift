//
//  Extension+UIDevice.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation
import UIKit

extension UIDevice {
	
	/// Computed property returning whether the device is an iPad
	var isPad: Bool {
		return UIDevice.current.userInterfaceIdiom == .pad
	}
	
	/// Computed property returning whether the device is an iPhone
	var isPhone: Bool {
		return UIDevice.current.userInterfaceIdiom == .phone
	}
	
}
