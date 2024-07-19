//
//  TabBarView.swift
//  Workouts
//
//  Created by Bean John on 19/7/2024.
//

import SwiftUI

struct TabBarView<Column: View, Detail: View>: View {
	
	init(
		@ViewBuilder column: @escaping () -> Column,
		@ViewBuilder detail: @escaping () -> Detail
	) {
		self.column = column
		self.detail = detail
	}
	
	@EnvironmentObject private var viewController: ContentViewViewController
	var workoutStatuses: [WorkoutStatus] = [.planned, .completed]
	
	var column: () -> Column
	var detail: () -> Detail
	
	var body: some View {
		Group {
#if os(iOS)
			iOSVariant
#else
			macOSVariant
#endif
		}
	}
	
	var iOSVariant: some View {
		TabView(selection: $viewController.selectedStatus) {
			ForEach(workoutStatuses) { status in
				NavigationSplitView {
					column()
				} detail: {
					detail()
				}
				.padding()
				.tabItem {
					Label(
						status.rawValue.capitalized,
						systemImage: status.iconName
					)
				}
				.tag(status)
			}
		}
	}
	
	var macOSVariant: some View {
		Group {
			NavigationSplitView {
				column()
			} detail: {
				detail()
			}
		}
		.toolbar {
			ToolbarItem(placement: .principal) {
				tabBarPicker
			}
		}
	}
	
	var tabBarPicker: some View {
		Picker("", selection: $viewController.selectedStatus) {
			ForEach(workoutStatuses) { status in
				Text(status.rawValue.capitalized)
					.tag(status)
			}
		}
		.pickerStyle(SegmentedPickerStyle())
	}
	
}

//#Preview {
//    TabBarView()
//}
