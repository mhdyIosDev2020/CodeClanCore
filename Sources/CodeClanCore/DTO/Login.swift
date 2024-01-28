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
        
        enum CodingKeys: String,CodingKeys {
        case created,expiresIn,refreshToken,user
        case idToken = "jwtToken"
        }
    }


    struct UserModel: Codable{
        public var id: String?
        public var displayName: String?
        public var email: String?
        public var fullName: String?
        public var phoneNumber: String?
        public var emailVerified: Bool?
        public var federatedId: String?
        public var name: String?
        public var surname: String?
        public var role: String?
        public var localId: String?
        public var photoUrl: String?
        public var creationDate: String?
        public var isVerified: Bool?
        public var Devices: Any?
    }
}

