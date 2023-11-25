//
//  KeychainManager.swift
//  CodeClanCore
//
//  Created by Mahdi_iOS on 13/08/23.
//

import Foundation
import KeychainSwift
public struct Helper {
    
    static public func logout() {
        Tokens.accessToken = nil
//        resetUserDefaults()
        clearKeychain()
    }
}

// MARK: Device Helpers
extension Helper {
    

    static public func getAppVersion(minor: Bool) -> String {
        var appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
        appVersion = minor ? appVersion?.replacingOccurrences(of: ".", with: "") : appVersion
        return appVersion!
    }
}



// MARK: KeyChain & UserDefaults
extension Helper {
    
    // Save Data in keychain
    static public func saveKeychain(value: Data, for key: String) {
        let keychain = KeychainSwift()
        keychain.set(value, forKey: key)
    }
    static public func saveKeychain(value: String, for key: String) {
        let keychain = KeychainSwift()
        keychain.set(value, forKey: key)
    }
    static public func saveKeychain(value: Bool, for key: String) {
        let keychain = KeychainSwift()
        keychain.set(value, forKey: key)
    }
    static public func readStingKeychain(key: String) -> String? {
        let keychain = KeychainSwift()
        guard let srt = keychain.get(key) else { return nil }
        return srt
    }
    static public func readBoolKeychain(key: String) -> Bool? {
        let keychain = KeychainSwift()
        guard let bool = keychain.getBool(key) else { return nil }
        return bool
    }
    static public func readDataKeychain(key: String) -> Data? {
        let keychain = KeychainSwift()
        guard let data = keychain.getData(key) else { return nil }
        return data
    }
    static public func clearKeychain() {
        let keychain = KeychainSwift()
        keychain.clear()
        keychain.delete("token")
        keychain.delete("refreshToken")
    }
    
    static public func clearKeychainBy(key: String) {
        let keychain = KeychainSwift()
        keychain.delete(key)
    }
    
    // Clear all UserDefaults
//    static public func resetUserDefaults() {
//        
//        let userDefaults = UserDefaults.standard
//        let dict = userDefaults.dictionaryRepresentation().keys
//        for key in dict {
//            userDefaults.removeObject(forKey: key)
//        }
//        
//        Defaults.removeAll()
//        userDefaults.synchronize()
//    }
}

// MARK: ParseURL
extension Helper {
    public static func parseURL(_ string: String) -> [String: String] {
    
        let value = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string:value ?? "")!
        
        var queryStrings = [String:String]()
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        if let queryItems = components.queryItems {
            for item in queryItems {
                queryStrings[item.name] = item.value ?? ""
            }
        }
        return queryStrings
    }
}
