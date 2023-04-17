//
//  ViewData.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import Foundation

struct ViewData {
    let result: [ResultOfUsers]
    let info: Info
}

struct ResultOfUsers {
    let gender: Gender
    let name: UserInfo
    let location: UserLocation
    let email: String
    let phone: String
    let nationality: String
    let picture: UserPicture
}

enum Gender: String {
    case male
    case female
}

struct UserInfo {
    let title: String
    let first: String
    let last: String
    let birthDate: String
    let age: Int
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

struct Info {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
