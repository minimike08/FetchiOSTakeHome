//
//  CachableAsyncImage.swift
//  FetchTakeHome
//
//  Created by Mike on 9/2/24.
//

import OSLog
import SwiftUI

struct CachableAsyncImage<ImageView: View, PlaceholderView: View>: View {
    let url: URL?
    let content: (Image) -> ImageView
    let placeholder: () -> PlaceholderView
    
    @State var image: UIImage?
    
    var body: some View {
        if let image {
            content(Image(uiImage: image))
        } else {
            placeholder()
                .onAppear {
                    Task {
                        image = await fetchImage()
                    }
                }
        }
    }
    
    private func fetchImage() async -> UIImage? {
        do {
            guard let url else { return nil }
            
            if let cachedImage = URLCache.shared.cachedResponse(for: .init(url: url)) {
                return UIImage(data: cachedImage.data)
            } else {
                let (data, response) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    URLCache.shared.storeCachedResponse(.init(response: response, data: data), for: .init(url: url))
                    return image
                } else {
                    throw ImageError.cannotCreateUIImage
                }
            }
        } catch {
            Logger.cachedImageLogger.error("Failed to retrieve image with error: \(error)")
            return nil
        }
    }
}

enum ImageError: Error {
    case cannotCreateUIImage
}

extension Logger {
    static let cachedImageLogger = Logger(subsystem: "com.fetchtakehome", category: "CachableAsyncImage")
}
