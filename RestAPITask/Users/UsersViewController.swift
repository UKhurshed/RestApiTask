//
//  UsersViewController.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import UIKit

class UsersViewController: UIViewController {
    
    private var usersUIView: UsersUIView {
        self.view as! UsersUIView
    }
    
    override func loadView() {
        view = UsersUIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
