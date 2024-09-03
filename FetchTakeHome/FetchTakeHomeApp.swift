//
//  FetchTakeHomeApp.swift
//  FetchTakeHome
//
//  Created by Mike on 9/2/24.
//

import SwiftUI

@main
struct FetchTakeHomeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MealListView(viewModel: .init())
                    .navigationTitle("Desserts")
            }
        }
    }
}
