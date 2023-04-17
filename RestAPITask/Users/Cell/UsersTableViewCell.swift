//
//  UsersTableViewCell.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    static let identifier = "UsersTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
