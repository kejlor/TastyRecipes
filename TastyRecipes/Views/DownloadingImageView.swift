//
//  DownloadingImageView.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 20/06/2022.
//

import SwiftUI

struct DownloadingImageView: View {
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
//                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
        }
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView(url: "https://www.themealdb.com/images/media/meals/1548772327.jpg", key: "1")
    }
}
