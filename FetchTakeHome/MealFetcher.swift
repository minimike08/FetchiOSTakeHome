//
//  MealFetcher.swift
//  FetchTakeHome
//
//  Created by Mike on 9/2/24.
//

import Foundation

class MealFetcher {
    func fetchDesserts() async -> MealList? {
        guard let dessertsListURL = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return nil }
        return await fetch(dataFrom: dessertsListURL)
    }
    
    func fetchDetails(for mealId: String) async -> MealDetailsList? {
        guard let detailsURL = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else { return nil }
        return await fetch(dataFrom: detailsURL)
    }
    
    private func fetch<T: Decodable>(dataFrom url: URL) async -> T? {
        guard let (data, _) = try? await URLSession.shared.data(for: .init(url: url)) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
