//
//  UsersService.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import Foundation
import SwiftyJSON


class UsersServiceImpl: UsersService {
    
    func fetchUsers() async throws -> ViewData {

        let api = APIManager(path: "api/?page=1&results=10&seed=abc", httpMethod: .get)
            
        let data: Data = try await api.callAPI()
        
        let viewData = try mappingData(data: data)
        
        return viewData
        
//        do {
//            return try JSONDecoder().decode(UsersModel.self, from: data)
//        } catch {
//            print("error service: \(error.localizedDescription)")
//            return UsersModel(results: [], info: Info(seed: "", results: -1, page: 1, version: ""))
//        }
    }
    
    private func mappingData(data: Data) throws -> ViewData {
        let data: JSON = JSON(parseJSON: String(data: data, encoding: .utf8) ?? "")
        if data.isEmpty {
            throw NSError(domain: "UserServiceError", code: -2, userInfo: [NSLocalizedDescriptionKey: "JSON decode error"])
        } else {
            let userInfo = UserInfo(
                seed: data["info"]["seed"].stringValue,
                results: data["info"]["results"].intValue,
                page: data["info"]["page"].intValue,
                version: data["info"]["version"].stringValue)
            
            var resultOfUsers = [ResultOfUsers]()
            for item in data["results"].arrayValue {
                let userName = UserName(
                    title: item["name"]["title"].stringValue,
                    first: item["name"]["first"].stringValue,
                    last: item["name"]["last"].stringValue)
                
                let userLocation = UserLocation(
                    streetNumber: item["location"]["street"]["number"].intValue,
                    streetName: item["location"]["street"]["name"].stringValue,
                    city: item["location"]["city"].stringValue,
                    state: item["location"]["state"].stringValue,
                    country: item["location"]["country"].stringValue,
                    latitude: item["location"]["coordinates"]["latitude"].stringValue,
                    longitude: item["location"]["coordinates"]["longitude"].stringValue)
                
                let userPicture = UserPicture(
                    medium: item["picture"]["medium"].stringValue,
                    large: item["picture"]["large"].stringValue,
                    thumbnail: item["picture"]["thumbnail"].stringValue)
                
                let result = ResultOfUsers(
                    gender: item["gender"].stringValue,
                    name: userName,
                    location: userLocation,
                    email: item["email"].stringValue,
                    phone: item["phone"].stringValue,
                    nationality: item["nat"].stringValue,
                    picture: userPicture)
                
                resultOfUsers.append(result)
            }
            return ViewData(result: resultOfUsers, info: userInfo)
        }
    }
}


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
