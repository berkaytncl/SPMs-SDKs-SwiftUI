//
//  LottieBootcamp.swift
//  SPMsAndSDKs
//
//  Created by Berkay Tuncel on 11.05.2024.
//

import SwiftUI
import Lottie

// .json <- Old
// .dotLottie <- New

struct LottieHelperView: View {
    
    var fileName: String = "StarAnimation.json"
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playLoopMode: LottieLoopMode = .playOnce
    var onAnimationDidFinish: (() -> ())? = nil
    
    var body: some View {
        HStack {
            LottieView(animation: .named(fileName))
                .configure({ lottieAnimationView in
                    lottieAnimationView.contentMode = contentMode
//                    lottieAnimationView.shouldRasterizeWhenIdle = true
                })
                .playbackMode(.playing(.fromProgress(0, toProgress: 1, loopMode: playLoopMode)))
                .animationDidFinish { completed in
                    onAnimationDidFinish?()
                }
        }
    }
}

#Preview {
    LottieHelperView()
}
