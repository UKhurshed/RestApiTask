//
//  UsersUIView.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import UIKit
import SnapKit
import JGProgressHUD

protocol UsersUIViewDelegate: AnyObject {
    func cellTapped(user: ResultOfUsers)
    func paginate(currentPage: Int)
}

class UsersUIView: UIView {
    
    private let usersTableView = UITableView()
    private let spinner = JGProgressHUD(style: .dark)
    
    private var result = [ResultOfUsers]()
    
    private var currentPage = 1
    
    weak var delegate: UsersUIViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        initTableView()
    }
    
    private func initTableView() {
        usersTableView.translatesAutoresizingMaskIntoConstraints = false
        usersTableView.dataSource = self
        usersTableView.delegate = self
        usersTableView.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersTableViewCell.identifier)
        addSubview(usersTableView)
        
        usersTableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupData(result: ViewData) {
        self.result.append(contentsOf: result.result)
        self.currentPage = result.info.page
        usersTableView.reloadData()
    }
    
    public func showLoader() {
        spinner.show(in: self)
    }
    
    public func hideLoader() {
        spinner.dismiss(animated: true)
    }
    
    public func showError() {
        spinner.dismiss(animated: true)
        self.usersTableView.isHidden = true
    }
    
    public func clearResult() {
        self.result.removeAll()
        usersTableView.reloadData()
    }
}

extension UsersUIView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell
        cell.setupData(data: self.result[indexPath.row])
        return cell
    }
}

extension UsersUIView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.cellTapped(user: self.result[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.result.count - 1 {
            print("paginated page: \(self.currentPage)")
            delegate?.paginate(currentPage: self.currentPage + 1)
        }
    }
}
