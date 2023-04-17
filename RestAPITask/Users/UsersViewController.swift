//
//  UsersViewController.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import UIKit

class UsersViewController: UIViewController {
    
    var presenterInput: UsersViewInput!
    
    private var usersUIView: UsersUIView {
        self.view as! UsersUIView
    }
    
    override func loadView() {
        view = UsersUIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Random Users API"
        
        usersUIView.delegate = self
        
        navBarConfigure()
        presenterInput.fetchPartOfUsers(page: 1)
    }
    
    private func navBarConfigure() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
    }
    
    @objc private func refresh() {
        DispatchQueue.main.async {
            self.usersUIView.clearResult()
            self.presenterInput.fetchPartOfUsers(page: 1)
        }
        
    }

}

extension UsersViewController: UsersUIViewDelegate {
    func cellTapped(user: ResultOfUsers) {
        let vc = UserDetailViewController(user: user)
        self.navigationController?.customPush(vc, animated: true)
    }
    
    func paginate(currentPage: Int) {
        presenterInput.fetchPartOfUsers(page: currentPage)
    }
}

extension UsersViewController: DisplayLogic {
    func showWeather(viewData: ViewData) {
        DispatchQueue.main.async {
            self.usersUIView.setupData(result: viewData)
        }
    }
    
    func showLoader() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = false
            self.usersUIView.showLoader()
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            self.usersUIView.hideLoader()
        }
    }
    
    func presentAlertError(message: String) {
        print("error message: \(message)")
        DispatchQueue.main.async {
            self.usersUIView.showError()
            let alert  = UIAlertController(title: R.string.localizable.titleErrorLabel(), message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: R.string.localizable.alertDismiss(), style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: R.string.localizable.tryAgain(), style: .default, handler: { [weak self] action in
                self?.presenterInput.fetchPartOfUsers(page: 1)
            }))
            self.present(alert, animated: true)
        }
    }
    
    
}
