//
//  Extension+UIDevice.swift
//  Workouts
//
//  Created by Bean John on 18/7/2024.
//

import Foundation
import UIKit

extension UIDevice {
	
	var isPad: Bool {
		return UIDevice.current.userInterfaceIdiom == .pad
	}
	
	var isPhone: Bool {
		return UIDevice.current.userInterfaceIdiom == .phone
	}
	
}
