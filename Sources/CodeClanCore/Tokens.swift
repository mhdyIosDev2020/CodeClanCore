//
//  Tokens.swift
//  CodeClanCore
//
//  Created by Mahdi_iOS on 13/08/23.
//


import Foundation

public struct Tokens {
    
    static public var accessToken : String? {
        
        get {
            return Helper.readStingKeychain(key: "token")
        }
        set {
            guard let token = newValue else { return }
            Helper.saveKeychain(value: token, for: "token")
        }
    }
    
    static public var refreshToken : String? {
        get {
            return Helper.readStingKeychain(key: "refreshToken") ?? ""
        }
        set {
            guard let refreshToken = newValue else { return }
            Helper.saveKeychain(value: refreshToken, for: "refreshToken")
        }
    }
    
    static public var loginId : String? {
        get {
            return Helper.readStingKeychain(key: "loginId")
        }
        set {
            guard let token = newValue else { return }
            Helper.saveKeychain(value: token, for: "loginId")
        }
    }
    
    static public var userProfile: ServerModels.Response.User? {
        get{
            if let storedData = Helper.readDataKeychain(key: "userProfileData") {
                let decoder = JSONDecoder()
                if let userProfile = try? decoder.decode(ServerModels.Response.User.self, from: storedData) {
                    return userProfile
                }else{
                    return nil
                }
            }else{
                return nil
            }

        }
        set{
            do {
                let encoder = JSONEncoder()
                if let encodedData = try? encoder.encode(newValue) {
                    Helper.saveKeychain(value: encodedData, for: "userProfileData")
                }
            }
            
        }
       
    }
}
