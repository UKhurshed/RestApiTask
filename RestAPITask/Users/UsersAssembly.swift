//
//  UsersAssembly.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import UIKit

class UsersAssembly {
    static func configureModule() -> UIViewController {
        let view = UsersViewController()
        let service = UsersServiceImpl()
        let interactor = FetcthUsersImpl(service: service)
        let presenter = UsersPresenter()
        
        view.presenterInput = presenter
        presenter.fetchUsers = interactor
        presenter.viewController = view
        
        return view
    }
}
