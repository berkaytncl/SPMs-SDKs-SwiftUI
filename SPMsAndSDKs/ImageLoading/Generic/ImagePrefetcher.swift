//
//  ImagePrefetcher.swift
//  SPMsAndSDKs
//
//  Created by Berkay Tuncel on 2.05.2024.
//

import Foundation

import SDWebImageSwiftUI
final class ImagePrefetcherSDWebImage {
    
    static let instance = ImagePrefetcherSDWebImage()
    private let prefetcher = SDWebImagePrefetcher()

    private init() {}
    
    func startPrefetching(urls: [URL]) {
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
}

import Kingfisher
final class ImagePrefetcherKingfisher {
    
    static let instance = ImagePrefetcherKingfisher()
    var prefetchers: [[URL]: Kingfisher.ImagePrefetcher] = [:]

    private init() {}
    
    func startPrefetching(urls: [URL]) {
        prefetchers[urls] = Kingfisher.ImagePrefetcher(urls: urls)
        prefetchers[urls]?.start()
    }
    
    func stopPrefetching(urls: [URL]) {
        prefetchers[urls]?.stop()
    }
}
