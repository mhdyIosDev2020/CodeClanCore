//
//  Login.swift
//  CodeClanCore
//
//  Created by Mahdi_iOS on 24/08/23.
//

import Foundation
public extension ServerModels.Response{

    struct LoginResponse: Codable {
        public let user: User
        public let idToken, refreshToken: String
        enum CodingKeys: String,CodingKey {
            case refreshToken
            case user
            case idToken = "jwtToken"
        }
    }

    // MARK: - User
    struct User: Codable {
        public let id, email, fullName, displayName: String?
        public let phoneNumber, name, surname, userName: String?
        public let role: String?
        public let devices: String?
        public let creationDate: String?
        public let isVerified: Bool?

        enum CodingKeys: String, CodingKey {
            case id, email, fullName, displayName, phoneNumber, name, surname, userName, role
            case devices = "Devices"
            case creationDate, isVerified
        }
    }
}

