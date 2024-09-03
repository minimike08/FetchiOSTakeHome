//
//  MealListCell.swift
//  FetchTakeHome
//
//  Created by Mike on 9/2/24.
//

import SwiftUI

struct MealListCell: View {
    let viewModel: MealListCellViewModel
    
    var body: some View {
        VStack {
            CachableAsyncImage(url: viewModel.imageURL) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "fork.knife")
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .frame(height: 160)
            
            Text(viewModel.nameText)
                .font(.system(size: 18))
                .tint(.black)
            
            Spacer()
        }
    }
}

struct MealListCellViewModel {
    let meal: MealList.Meal
    
    var nameText: String { meal.name }
    var imageURL: URL? { URL(string: meal.imagePath)! }
}

#Preview {
    MealListCell(viewModel: .init(meal: .init(id: "1", imagePath: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", name: "Food")))
}
