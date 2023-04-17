//
//  UsersTableViewCell.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import UIKit
import SDWebImage

class UsersTableViewCell: UITableViewCell {
    
    static let identifier = "UsersTableViewCell"
    
    private let image = UIImageView()
    private let fio = UILabel()
    private let birthDate = UILabel()
    private let gender = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initImage()
        initFio()
        initBirthDate()
        initGender()
    }
    
    private func initImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        
        contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-7)
            make.height.width.equalTo(76)
        }
    }
    
    private func initFio() {
        fio.translatesAutoresizingMaskIntoConstraints = false
        fio.font = .systemFont(ofSize: 17, weight: .semibold)
        
        contentView.addSubview(fio)
        fio.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(image.snp.trailing).offset(20)
        }
    }
    
    private func initBirthDate() {
        birthDate.translatesAutoresizingMaskIntoConstraints = false
        birthDate.font = .systemFont(ofSize: 16, weight: .regular)
        
        contentView.addSubview(birthDate)
        birthDate.snp.makeConstraints { make in
            make.top.equalTo(fio.snp.bottom).offset(5)
            make.leading.equalTo(image.snp.trailing).offset(20)
        }
    }
    
    private func initGender() {
        gender.translatesAutoresizingMaskIntoConstraints = false
        gender.contentMode = .scaleAspectFit
        
        contentView.addSubview(gender)
        gender.snp.makeConstraints { make in
            make.top.equalTo(birthDate.snp.bottom).offset(5)
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.height.width.equalTo(18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupData(data: ResultOfUsers) {
        image.sd_setImage(with: URL(string: data.picture.large), placeholderImage: UIImage(systemName: "person.crop.circle.fill"))
        fio.text = "\(data.name.first) \(data.name.last)"
        birthDate.text = data.name.birthDate
        switch(data.gender) {
        case .female:
            gender.image = UIImage(named: "female")
            break
        case .male:
            gender.image = UIImage(named: "male")
            break
        }
    }
}
