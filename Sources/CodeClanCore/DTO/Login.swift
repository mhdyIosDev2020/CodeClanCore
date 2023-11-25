//
//  Login.swift
//  CodeClanCore
//
//  Created by Mahdi_iOS on 24/08/23.
//

import Foundation
public extension ServerModels.Response{
    struct LoginResponse: Codable {
        
        public var created: String?
        public var expiresIn: Int?
        public var idToken: String?
        public var refreshToken: String?
        public var user: UserModel?
    }


    struct UserModel: Codable{
        public var displayName: String?
        public var email: String?
        public var emailVerified: Bool?
        public var federatedId: String?
        public var firstName: String?
        public var lastName: String?
        public var localId: String?
        public var photoUrl: String?
    }
}

