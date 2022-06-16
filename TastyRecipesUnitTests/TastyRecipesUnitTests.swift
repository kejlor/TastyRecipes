//
//  TastyRecipesUnitTests.swift
//  TastyRecipesUnitTests
//
//  Created by Bartosz Wojtkowiak on 14/06/2022.
//

import XCTest

class when_user_get_data_successfully: XCTestCase {
    func test_should_get_one_meal_successfully() {
        let vm = MealViewModel(networkService: MockWebservice())
        vm.getMealByName(name: "test")
        XCTAssertEqual(vm.allMeals.meals.count, 1)
    }
}
