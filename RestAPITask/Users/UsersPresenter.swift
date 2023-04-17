//
//  UsersPresenter.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import Foundation

protocol UsersViewInput: AnyObject {
    func fetchPartOfUsers()
}

protocol DisplayLogic: AnyObject {
    func showWeather(viewData: ViewData)
    func showLoader()
    func hideLoader()
    func presentAlertError(message: String)
}

class UsersPresenter: UsersViewInput {
    
    weak var viewController: DisplayLogic?
    var fetchUsers: FetcthUsers!
    
    func fetchPartOfUsers() {
        Task {
            do {
                viewController?.showLoader()
                let interactorResult = try await fetchUsers.fetchPartsOfUsers()
                viewController?.hideLoader()
                viewController?.showWeather(viewData: interactorResult)
            } catch {
                viewController?.presentAlertError(message: error.localizedDescription)
            }
        }
    }
}
