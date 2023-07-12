//
//  HomeViewModel.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import Foundation

class HomeViewModel {
    
    private var picInfo: [ImageInfo] = []
    private var position: Int = -1
    
    func fetchImages(completion: @escaping (Result<Void, Error>) -> Void) {
        let address = "https://api.unsplash.com/photos/?client_id=nqumVCQkvEWe7M_vEXHu9JQKoay4OSHbKsNDOQx6sN8&order_by=ORDER&per_page=30"
        if let url = URL(string: address) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let response = response as? HTTPURLResponse, let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let picInfo = try decoder.decode([ImageInfo].self, from: data)
                        self.picInfo.append(contentsOf: picInfo)
                        completion(.success(()))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    }
    
    func hasImages() -> Bool {
        return !picInfo.isEmpty
    }
    
    func getRandomImageInfo() -> ImageInfo {
        position = Int.random(in: 0..<picInfo.count)
        return picInfo[position]
    }
    
    func saveImage() {
        AppStatic.savedList.append(picInfo[position])
    }
    
}
