//
//  ImagesViewModel.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 13.07.2023.
//

import Foundation

class ImagesViewModel {
    
    func isImagesEmpty() -> Bool {
        return AppStatic.savedList.isEmpty
    }
    
    func getImageCount() -> Int {
        return AppStatic.savedList.count
    }
    
    func getImage(row: Int) -> ImageInfo {
        return AppStatic.savedList[row]
    }
    
    func removeItems(at: Int) {
        AppStatic.savedList.remove(at: at)
    }
}
