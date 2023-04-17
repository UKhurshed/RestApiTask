//
//  UsersUIView.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import UIKit
import SnapKit

class UsersUIView: UIView {
    
    private let usersTableView = UITableView()
    private let indicator = UIActivityIndicatorView()
    
    private var result = [UsersResult]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        initTableView()
        initActivityIndicator()
    }
    
    private func initTableView() {
        usersTableView.translatesAutoresizingMaskIntoConstraints = false
        usersTableView.dataSource = self
        usersTableView.delegate = self
        usersTableView.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersTableViewCell.identifier)
        addSubview(usersTableView)
        
        usersTableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func initActivityIndicator() {
        addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.tintColor = .black
        indicator.stopAnimating()
        indicator.center = center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupData(result: [UsersResult]) {
        self.result = result
    }
    
    public func showLoader() {
        self.indicator.startAnimating()
        self.usersTableView.isHidden = true
    }
    
    public func hideLoader() {
        self.indicator.stopAnimating()
        self.usersTableView.isHidden = false
    }
    
    public func showError() {
        self.indicator.stopAnimating()
        self.usersTableView.isHidden = true
    }

}

extension UsersUIView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell
        return cell
    }
}

extension UsersUIView: UITableViewDelegate {
    
}
