//
//  SwiftfulRoutingBootcamp.swift
//  SPMsAndSDKs
//
//  Created by Berkay Tuncel on 10.05.2024.
//

import SwiftUI
import SwiftfulRouting

struct SwiftfulRoutingBootcamp: View {
    var body: some View {
        RouterView { router in
//            Text("View1")
//                .onTapGesture {
//                    router.showScreen(.sheet) { router2 in
//                        Text("View2")
//                            .onTapGesture {
//                                router2.showScreen(.fullScreenCover) { router3 in
//                                    Text("View3")
//                                        .onTapGesture {
//                                            router3.showScreen(.push) { router4 in
//                                                Text("View4")
//                                                    .onTapGesture {
//                                                        router4.dismissScreenStack()
//                                                    }
//                                            }
//                                        }
//                                }
//                            }
//                    }
//                }
            MyHomeView(viewModel: MyHomeViewModel(router: router))
        }
    }
}

final class MyHomeViewModel: ObservableObject {
    let router: AnyRouter
    
    init(router: AnyRouter) {
        self.router = router
    }
    
    func goToNextScreen() {
//        router.showScreen(.sheet) { router in
//            MyThirdScreen(router: router)
//        }
        
//        let route1 = PushRoute { router in
//            Text("View1")
//        }
//        
//        let route2 = PushRoute { router in
//            Text("View2")
//        }
//        
//        let route3 = PushRoute { router in
//            Text("View3")
//                .onTapGesture {
//                    router.dismissScreenStack()
//                }
//        }
//        
//        router.pushScreenStack(destinations: [route1, route2, route3])
        
        let route1 = AnyRoute(.fullScreenCover, destination: { router in
            Text("View1")
                .onTapGesture {
                    try? router.showNextScreen()
                }
        })
        
        let route2 = AnyRoute(.push, destination: { router in
            Text("View2")
                .onTapGesture {
                    try? router.showNextScreen()
                }
        })
        
        let route3 = AnyRoute(.push, destination: { router in
            Text("View3")
                .onTapGesture {
//                    do {
//                        try router.showNextScreen()
//                    } catch {
//                        router.dismissEnvironment()
//                    }
                    router.showNextScreenOrDismissEnvironment()
                }
        })
        
        router.enterScreenFlow([route1, route2, route3])
    }
}

struct MyHomeView: View {
    
//    @Environment(\.router) private var router
//    let router: AnyRouter
    
//    private let route: AnyRoute = AnyRoute(.push) { router in
//        MyThirdScreen(router: router)
//    }
    
    @StateObject var viewModel: MyHomeViewModel
    
    var body: some View {
        Button("Click me", action: {
            viewModel.goToNextScreen()
//            router.showScreen(route)
//            router.showScreen(.fullScreenCover, onDismiss: {
//
//            }) { _ in
//                MyThirdScreen()
//            }
            
//            router.showScreen(route)
            
//            router.showAlert(.confirmationDialog, title: "Hi", subtitle: "asda") {
//                Button("Okey") {
//                    
//                }
//                Button("Retry") {
//                    
//                }
//            }
            
//            router.showBasicModal {
//                Text("hi")
//            }
        })
        .navigationTitle("Home")
    }
}

struct MyThirdScreen: View {
    
//    @Environment(\.router) private var router
    let router: AnyRouter
    
    var body: some View {
        Button("Dismiss Screen", action: {
            router.dismissScreen()
        })
        .navigationTitle("Screen 3")
    }
}

#Preview {
    SwiftfulRoutingBootcamp()
}
