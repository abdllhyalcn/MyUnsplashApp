//
//  ImageInfo.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import Foundation

struct ImageInfo: Codable {
    let urls: Urls
    let user: User?
    let alt_description: String?
}

struct Urls: Codable {
    let regular: String
    var regularURL: URL {
        return URL(string: regular)!
    }
}

struct User: Codable {
    let location: String?
}
