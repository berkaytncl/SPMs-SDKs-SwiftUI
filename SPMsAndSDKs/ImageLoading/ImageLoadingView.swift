//
//  ImageLoadingView.swift
//  SPMsAndSDKs
//
//  Created by Berkay Tuncel on 2.05.2024.
//

import SwiftUI

struct ImageLoadingView: View {
    var body: some View {
        ImageLoader(
            url: "https://picsum.photos/id/237/200/300",
            contentMode: .fill
        )
        .frame(width: 100, height: 300)
        .onAppear {
//            ImagePrefetcherSDWebImage.instance.startPrefetching(urls: <#T##[URL]#>)
//            ImagePrefetcherKingfisher.instance.startPrefetching(urls: <#T##[URL]#>)
        }
    }
}

#Preview {
    ImageLoadingView()
}
