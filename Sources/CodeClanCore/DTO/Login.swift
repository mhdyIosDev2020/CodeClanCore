//
//  Login.swift
//  CodeClanCore
//
//  Created by Mahdi_iOS on 24/08/23.
//

import Foundation
public extension ServerModels.Response{

    struct LoginResponse: Codable {
        let user: User
        let idToken, refreshToken: String
        enum CodingKeys: String,CodingKey {
            case refreshToken
            case user
            case idToken = "jwtToken"
        }
    }

    // MARK: - User
    struct User: Codable {
        let id, email, fullName, displayName: String?
        let phoneNumber, name, surname, userName: String?
        let role: String?
        let devices: String?
        let creationDate: String?
        let isVerified: Bool?

        enum CodingKeys: String, CodingKey {
            case id, email, fullName, displayName, phoneNumber, name, surname, userName, role
            case devices = "Devices"
            case creationDate, isVerified
        }
    }
}

