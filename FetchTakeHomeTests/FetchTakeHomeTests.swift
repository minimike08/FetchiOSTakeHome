//
//  FetchTakeHomeTests.swift
//  FetchTakeHomeTests
//
//  Created by Mike on 9/2/24.
//

import XCTest
@testable import FetchTakeHome

final class FetchTakeHomeTests: XCTestCase {
    var bundle: Bundle { Bundle(for: FetchTakeHomeTests.self) }
    
    func testDecodeMealList() throws {
        let meals = try MealList.instanceDecodedFromJSONFile("dessertResults", inBundle: bundle)
        XCTAssertEqual(meals.meals.count, 65)
        XCTAssertEqual(meals.meals.first!.id, "53049")
        XCTAssertEqual(meals.meals.first!.imagePath, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        XCTAssertEqual(meals.meals.first!.name, "Apam balik")
    }
    
    func testDecodeMealDetailsList() throws {
        let meals = try MealDetailsList.instanceDecodedFromJSONFile("desertDetails", inBundle: bundle)
        XCTAssertEqual(meals.meals.count, 1)
        XCTAssertEqual(meals.meals.first!.id, "52891")
        XCTAssertEqual(meals.meals.first!.imagePath, "https://www.themealdb.com/images/media/meals/rpvptu1511641092.jpg")
        XCTAssertEqual(meals.meals.first!.name, "Blackberry Fool")
        XCTAssertNotNil(meals.meals.first!.instructions)
        XCTAssertEqual(meals.meals.first!.ingredient1, "Hazlenuts")
        XCTAssertEqual(meals.meals.first!.ingredient2, "Butter")
        XCTAssertEqual(meals.meals.first!.ingredient3, "Caster Sugar")
        XCTAssertEqual(meals.meals.first!.ingredient4, "Lemon")
        XCTAssertEqual(meals.meals.first!.ingredient5, "Plain Flour")
        XCTAssertEqual(meals.meals.first!.ingredient6, "Baking Powder")
        XCTAssertEqual(meals.meals.first!.ingredient7, "Blackberrys")
        XCTAssertEqual(meals.meals.first!.ingredient8, "Sugar")
        XCTAssertEqual(meals.meals.first!.ingredient9, "Caster Sugar")
        XCTAssertEqual(meals.meals.first!.ingredient10, "Lemon Juice")
        XCTAssertEqual(meals.meals.first!.ingredient11, "Double Cream")
        XCTAssertEqual(meals.meals.first!.ingredient12, "Yogurt")
        XCTAssertEqual(meals.meals.first!.ingredient13, "Mint")
        XCTAssertEqual(meals.meals.first!.ingredient14, "")
        XCTAssertEqual(meals.meals.first!.ingredient15, "")
        XCTAssertEqual(meals.meals.first!.ingredient16, "")
        XCTAssertEqual(meals.meals.first!.ingredient17, "")
        XCTAssertEqual(meals.meals.first!.ingredient18, "")
        XCTAssertEqual(meals.meals.first!.ingredient19, "")
        XCTAssertEqual(meals.meals.first!.ingredient20, "")
        XCTAssertEqual(meals.meals.first!.measurement1, "50g")
        XCTAssertEqual(meals.meals.first!.measurement2, "125g")
        XCTAssertEqual(meals.meals.first!.measurement3, "150g")
        XCTAssertEqual(meals.meals.first!.measurement4, "Grated")
        XCTAssertEqual(meals.meals.first!.measurement5, "150g")
        XCTAssertEqual(meals.meals.first!.measurement6, "\u{00bd} tsp")
        XCTAssertEqual(meals.meals.first!.measurement7, "600g")
        XCTAssertEqual(meals.meals.first!.measurement8, "75g")
        XCTAssertEqual(meals.meals.first!.measurement9, "2 tbs")
        XCTAssertEqual(meals.meals.first!.measurement10, "1 tbs")
        XCTAssertEqual(meals.meals.first!.measurement11, "300ml ")
        XCTAssertEqual(meals.meals.first!.measurement12, "100ml")
        XCTAssertEqual(meals.meals.first!.measurement13, "Garnish with")
        XCTAssertEqual(meals.meals.first!.measurement14, "")
        XCTAssertEqual(meals.meals.first!.measurement15, "")
        XCTAssertEqual(meals.meals.first!.measurement16, "")
        XCTAssertEqual(meals.meals.first!.measurement17, "")
        XCTAssertEqual(meals.meals.first!.measurement18, "")
        XCTAssertEqual(meals.meals.first!.measurement19, "")
        XCTAssertEqual(meals.meals.first!.measurement20, "")
    }
}
