//
//  SDWebImageBootcamp.swift
//  SPMsAndSDKs
//
//  Created by Berkay Tuncel on 2.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDWebImageLoader: View {
    
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        WebImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            Color.gray.opacity(0.3)
        }
        .onSuccess(perform: { image, data, cacheType in
            //
        })
        .onFailure(perform: { error in
            //
        })
        .indicator(.activity)
        .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    SDWebImageLoader(
        url: "https://picsum.photos/id/237/200/300",
        contentMode: .fill
    )
    .frame(width: 200, height: 200)
}
