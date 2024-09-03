//
//  ContentView.swift
//  FetchTakeHome
//
//  Created by Mike on 9/2/24.
//

import SwiftUI

struct MealListView: View {
    @StateObject var viewModel: MealListViewModel
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 175), spacing: 16)], content: {
                    ForEach(viewModel.meals) { meal in
                        NavigationLink(value: meal) {
                            MealListCell(viewModel: .init(meal: meal))
                                .padding(.bottom, 12)
                        }
                    }
                })
                .padding(.horizontal, 10)
                .navigationDestination(for: MealList.Meal.self) { meal in
                    MealDetailsView(viewModel: .init(mealId: meal.id))
                }
            }
        }
    }
}

class MealListViewModel: ObservableObject {
    let fetcher = MealFetcher()
    
    @Published var meals: [MealList.Meal] = []
    @Published var isLoading = true
    
    init() {
        Task { @MainActor in
            if let mealList = await fetcher.fetchDesserts() {
                self.meals = mealList.meals.sorted { $0.name < $1.name }
            }
            isLoading = false
        }
    }
}

#Preview {
    MealListView(viewModel: .init())
}
