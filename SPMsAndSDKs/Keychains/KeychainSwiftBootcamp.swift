//
//  KeychainSwiftBootcamp.swift
//  SPMsAndSDKs
//
//  Created by Berkay Tuncel on 8.05.2024.
//

import SwiftUI
import KeychainSwift

// Keychain is similar to UserDefaults or AppStorage
// Keychain is encrypted
// Keychain is good for: passwords, ssn, credit card info, sensitive data
// Keychain persists between installs and across devices

final class KeychainManager {
    
    private let keychain: KeychainSwift
    
    init() {
        let keychain = KeychainSwift()
        keychain.synchronizable = true
        self.keychain = keychain
    }
    
    func set(_ value: String, key: String) {
        keychain.set(value, forKey: key)
    }
    
    func get(key: String) -> String? {
        keychain.get(key)
    }
}
struct KeychainManagerKey: EnvironmentKey {
    static let defaultValue: KeychainManager = KeychainManager()
}

extension EnvironmentValues {
    var keychain: KeychainManager {
        get { self[KeychainManagerKey.self] }
        set { self[KeychainManagerKey.self] = newValue }
    }
}

@propertyWrapper
struct KeychainStorage: DynamicProperty {
    @State private var newValue: String
    private let key: String
    private let keychain: KeychainManager
    
    var wrappedValue: String {
        get {
            newValue
        }
        nonmutating set {
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<String> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
        })
    }
    
    init(wrappedValue: String, _ key: String) {
        self.key = key
        let keychain = KeychainManager()

        self.keychain = keychain
        newValue = keychain.get(key: key) ?? ""
        debugPrint("SUCCESS READ")
    }
    
    func save(newValue: String) {
        keychain.set(newValue, key: key)
        self.newValue = newValue
        debugPrint("SUCCESS SAVED")
    }
}

struct KeychainSwiftBootcamp: View {
    
//    @Environment(\.keychain) var keychain
    //let keychainManager = KeychainManager()
//    @State private var userPassword: String = ""
    @KeychainStorage("user_password") var userPassword: String = ""
    
    var body: some View {
        Button(userPassword.isEmpty ? "No password" : userPassword) {
            let newPassword = "123asd"
            userPassword = newPassword
//            keychain.set(newPassword, key: "user_password")
//            keychain.keychain.set(newPassword, forKey: ) // , withAccess: .accessibleWhenUnlockedThisDeviceOnly
//            userPassword = newPassword
            
//            keychain.delete("my key")
//            keychain.clear()

        }
//        .onAppear {
//            userPassword = keychain.get(key: "user_password") ?? ""
//        }
    }
}

#Preview {
    KeychainSwiftBootcamp()
}
