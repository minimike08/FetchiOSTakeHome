//
//  Meal.swift
//  FetchTakeHome
//
//  Created by Mike on 9/2/24.
//

import Foundation

struct MealList: Codable {
    let meals: [Meal]
    
    struct Meal: Codable, Identifiable, Hashable {
        let id: String
        let imagePath: String
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case id = "idMeal"
            case imagePath = "strMealThumb"
            case name = "strMeal"
        }
    }
}
