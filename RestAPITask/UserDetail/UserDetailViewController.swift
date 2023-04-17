//
//  UserDetailViewController.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 18.04.2023.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    private let user: ResultOfUsers
    
    init(user: ResultOfUsers) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var userDetailUIView: UserDetailUIView {
        self.view as! UserDetailUIView
    }
    
    override func loadView() {
        view = UserDetailUIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(user.name.title) \(user.name.first) \(user.name.last)"
        
        userDetailUIView.setupData(data: user)
    }
}
