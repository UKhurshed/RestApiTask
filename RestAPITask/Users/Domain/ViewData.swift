//
//  ViewData.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import Foundation

struct ViewData {
    let result: [ResultOfUsers]
    let info: UserInfo
}

struct ResultOfUsers {
    let gender: String
    let name: UserName
    let location: UserLocation
    let email: String
    let phone: String
    let nationality: String
    let picture: UserPicture
}

struct UserName {
    let title: String
    let first: String
    let last: String
}

struct UserLocation {
    let streetNumber: Int
    let streetName: String
    let city: String
    let state: String
    let country: String
    let latitude: String
    let longitude: String
}

struct UserPicture {
    let medium: String
    let large: String
    let thumbnail: String
}

struct UserInfo {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
