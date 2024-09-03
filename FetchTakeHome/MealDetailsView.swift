//
//  MealDetailsView.swift
//  FetchTakeHome
//
//  Created by Mike on 9/2/24.
//

import SwiftUI

struct MealDetailsView: View {
    @StateObject var viewModel: MealDetailsViewModel
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    CachableAsyncImage(url: viewModel.imageURL) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Image(systemName: "fork.knife")
                            .resizable()
                    }
                    .aspectRatio(contentMode: .fit)
                    
                    Text(viewModel.directions)
                        .padding(.horizontal, 8)
                    
                    ingredientList()
                        .padding(.horizontal, 8)
                }
            }
            .navigationTitle(viewModel.title)
        }
    }
    
    @ViewBuilder
    private func ingredientList() -> some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.system(size: 20, weight: .semibold))
                .padding(.vertical, 12)
            
            ForEach(viewModel.ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
    }
}

class MealDetailsViewModel: ObservableObject {
    let fetcher = MealFetcher()
    let mealId: String
    
    @Published var mealDetails: MealDetailsList.MealDetails?
    @Published var isLoading = true
    
    var imageURL: URL? { mealDetails.flatMap { URL(string: $0.imagePath) }}
    var title: String { mealDetails?.name ?? "" }
    var directions: String { mealDetails?.instructions ?? "" }
    var ingredients: [String] { createIngredientList() }
    
    init(mealId: String) {
        self.mealId = mealId
        Task { @MainActor in
            mealDetails = await fetcher.fetchDetails(for: mealId)?.meals.first
            isLoading = false
        }
    }
    
    private func createIngredientList() -> [String] {
        [
            createListItem(with: mealDetails?.ingredient1, and: mealDetails?.measurement1),
            createListItem(with: mealDetails?.ingredient2, and: mealDetails?.measurement2),
            createListItem(with: mealDetails?.ingredient3, and: mealDetails?.measurement3),
            createListItem(with: mealDetails?.ingredient4, and: mealDetails?.measurement4),
            createListItem(with: mealDetails?.ingredient5, and: mealDetails?.measurement5),
            createListItem(with: mealDetails?.ingredient6, and: mealDetails?.measurement6),
            createListItem(with: mealDetails?.ingredient7, and: mealDetails?.measurement7),
            createListItem(with: mealDetails?.ingredient8, and: mealDetails?.measurement8),
            createListItem(with: mealDetails?.ingredient9, and: mealDetails?.measurement9),
            createListItem(with: mealDetails?.ingredient10, and: mealDetails?.measurement10),
            createListItem(with: mealDetails?.ingredient11, and: mealDetails?.measurement11),
            createListItem(with: mealDetails?.ingredient12, and: mealDetails?.measurement12),
            createListItem(with: mealDetails?.ingredient13, and: mealDetails?.measurement13),
            createListItem(with: mealDetails?.ingredient14, and: mealDetails?.measurement14),
            createListItem(with: mealDetails?.ingredient15, and: mealDetails?.measurement15),
            createListItem(with: mealDetails?.ingredient16, and: mealDetails?.measurement16),
            createListItem(with: mealDetails?.ingredient17, and: mealDetails?.measurement17),
            createListItem(with: mealDetails?.ingredient18, and: mealDetails?.measurement18),
            createListItem(with: mealDetails?.ingredient19, and: mealDetails?.measurement19),
            createListItem(with: mealDetails?.ingredient20, and: mealDetails?.measurement20)
        ].compactMap { $0 }
    }
    
    private func createListItem(with ingredient: String?, and measurement: String?) -> String? {
        guard let ingredient, let measurement, !ingredient.isEmpty, !measurement.isEmpty else { return nil }
        return "• \(ingredient) - \(measurement)"
    }
}
