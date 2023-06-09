//
//  UsersService.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import Foundation
import SwiftyJSON


class UsersServiceImpl: UsersService {
    
    func fetchUsers(page: Int) async throws -> ViewData {

        let api = APIManager(path: "api/?page=\(page)&results=10&seed=abc", httpMethod: .get)
            
        let data: Data = try await api.callAPI()
        
        let viewData = try mappingData(data: data)
        
        return viewData
    }
    
    private func mappingData(data: Data) throws -> ViewData {
        let data: JSON = JSON(parseJSON: String(data: data, encoding: .utf8) ?? "")
        if data.isEmpty {
            throw NSError(domain: "UserServiceError", code: -2, userInfo: [NSLocalizedDescriptionKey: "JSON decode error"])
        } else {
            let userInfo = Info(
                seed: data["info"]["seed"].stringValue,
                results: data["info"]["results"].intValue,
                page: data["info"]["page"].intValue,
                version: data["info"]["version"].stringValue)
            
            var resultOfUsers = [ResultOfUsers]()
            for item in data["results"].arrayValue {
                let formattedBirthDate = item["dob"]["date"].stringValue.formattedDateFromString()
                let userName = UserInfo(
                    title: item["name"]["title"].stringValue,
                    first: item["name"]["first"].stringValue,
                    last: item["name"]["last"].stringValue,
                    birthDate: formattedBirthDate ?? "",
                    age: item["dob"]["age"].intValue)
                
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
                    gender: mappingOfGender(gender: item["gender"].stringValue),
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
    
    private func mappingOfGender(gender: String) -> Gender{
        if gender.contains("female") {
            return .female
        } else {
            return .male
        }
    }
}
