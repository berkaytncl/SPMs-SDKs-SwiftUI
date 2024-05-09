//
//  SwiftfulUIBootcamp.swift
//  SPMsAndSDKs
//
//  Created by Berkay Tuncel on 9.05.2024.
//

import SwiftUI
import SwiftfulUI

struct SomeItem: Identifiable {
    let id = UUID().uuidString
    let color: Color = .red
}

struct SwiftfulUIBootcamp: View {
    
    @State private var isActive: Bool = true
    @State private var isOn: Bool = false
    @State private var selectedIndex: Int = 0
    @State private var items: [SomeItem] = [
        SomeItem(), SomeItem(), SomeItem(), SomeItem(), SomeItem()
    ]
    
    func getSomeData() async throws -> String {
        try? await Task.sleep(for: .seconds(2))
        return "Some String"
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(Color.green)
                        .overlay(
                            ZStack {
                                if #available(iOS 15.0, *) {
                                    AsyncImage(url: URL(string: "https://picsum.photos/800/800"))
                                }
                            }
    //                        Image(systemName: "heart.fill")
    //                            .resizable()
    //                            .scaledToFill()
    //                            .padding(100)
                        )
                        .asStretchyHeader(startingHeight: 300)
                }
            }
        }
        
//        CountdownViewBuilder(
//            endTime: Date().addingTimeInterval(10),
//            displayOption: .timeAs_00_00_00) { time in
//                Text(time)
//            } onTimerEnded: {
//                debugPrint("onTimerEnded")
//            }

//        AsyncButton {
//            try? await Task.sleep(for: .seconds(2))
//        } label: { isPerformingAction in
//            ZStack {
//                if isPerformingAction {
//                    ProgressView()
//                }
//                
//                Text("Hello, world")
//                    .opacity(isPerformingAction ? 0 : 1)
//            }
//        }
        
//        AsyncViewBuilder {
//            try await getSomeData()
//        } content: { phase in
//            switch phase {
//            case .loading:
//                ProgressView()
//            case .success(let newData):
//                Text(newData)
//            case .failure:
//                Text("Error")
//            }
//        }
//        .onNotificationRecieved(name: UIApplication.willEnterForegroundNotification) { notification in
//            
//        }
//        .onFirstAppear {
//            
//        }
//        .onFirstDisappear {
//            
//        }
        
//        CustomToggle(isOn: $isOn, width: 100, pinColor: isOn ? .green : .gray, backgroundColor: .black, haptic: .selection)
//        LazyZStack(allowSimultaneous: false, selection: selectedIndex, items: 0..<4, view: { (value: Int) in
//            Rectangle()
//                .fill(
//                    value == 1 ? Color.red :
//                    value == 2 ? Color.blue :
//                    value == 3 ? Color.orange :
//                    Color.yellow
//                )
//                .overlay {
//                    Text("\(value)")
//                }
//                .transition(AnyTransition.scale.animation(.easeInOut))
//        })
//        .animation(.easeIn, value: selectedIndex)
//        .onTapGesture(perform: {
//            selectedIndex += 1
//        })
        // LazyVGrid
        // Grid
//        NonLazyVGrid(columns: 3, alignment: .leading, spacing: 16, items: items) { item in
//            if let item {
//                item.color
//                    .frame(height: 50)
//                    .frame(width: item.id == items.first?.id ? 50 : 100)
//            }
//        }
//        CustomProgressBar(
//            selection: 100,
//            range: 0...100,
//            background: AnyShapeStyle(Color(.systemGray4)),
//            foreground: AnyShapeStyle(LinearGradient(colors: [.orange, .red], startPoint: .leading, endPoint: .trailing)),
//            cornerRadius: 10,
//            height: 20)
//            .padding(40)
//        Text("Hello, World!")
//            .padding()
//            .withGradientBackgroundAnimatable(
//                isActive: isActive,
//                activeGradient:
//                    LinearGradient(
//                        colors: [Color.red, .blue],
//                        startPoint: .leading,
//                        endPoint: .trailing),
//                defaultGradient:
//                    LinearGradient(
//                        colors: [Color.green, .orange],
//                        startPoint: .leading,
//                        endPoint: .trailing),
//                cornerRadius: 10
//            )
//            .asButton(scale: 0.5, opacity: 1, brightness: 0) {
//                withAnimation {
//                    isActive.toggle()
//                }
//            }
//            .withDragGesture(
//                [.horizontal, .vertical],
//                minimumDistance: 0,
//                resets: true,
////                animation: .linear,
////                rotationMultiplier: 5,
//                scaleMultiplier: -4,
//                onChanged: { dragOffset in
//                    
//                },
//                onEnded: { dragOffset in
//                    
//                }
//        )

//            .readingLocation(onChange: { location in
//                
//            })
//            .readingFrame { frame in
//                
//            }
//            .asButton(.press) {
//                withAnimation {
//                    isActive.toggle()
//                }
//            }
    }
}

#Preview {
    SwiftfulUIBootcamp()
}
