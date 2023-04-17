//
//  FetchUsers.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import Foundation

protocol FetcthUsers: AnyObject {
    func fetchPartsOfUsers() async throws -> ViewData
}

protocol UsersService {
    func fetchUsers() async throws -> ViewData
}


class FetcthUsersImpl: FetcthUsers {
    
    let service: UsersService
    
    init(service: UsersService) {
        self.service = service
    }
    func fetchPartsOfUsers() async throws -> ViewData {
        let serviceResult = try await service.fetchUsers()
        return serviceResult
    }
}
