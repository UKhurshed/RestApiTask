//
//  UserDetailUIView.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 18.04.2023.
//

import UIKit

class UserDetailUIView: UIView {
    
    private let image = UIImageView()
    private let genderTitle = UILabel()
    private let genderImage = UIImageView()
    private let birthTitle = UILabel()
    private let birthDate = UILabel()
    private let emailTitle = UILabel()
    private let emailValue = UILabel()
    private let phoneTitle = UILabel()
    private let phoneValue = UILabel()
    private let countryTitle = UILabel()
    private let countryValue = UILabel()
    private let stateTitle = UILabel()
    private let stateValue = UILabel()
    private let cityTitle = UILabel()
    private let cityValue = UILabel()
//    private let
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    
        initImage()
        initGenderTitle()
        initGenderImage()
        initBirthTitle()
        initBirthDate()
        initEmailTitle()
        initEmailValue()
        initPhoneTitle()
        initPhoneValue()
        initCountryTitle()
        initCountryValue()
        initStateTitle()
        initStateValue()
        initCityTitle()
        initCityValue()
    }
    
    private func initImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        
        addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(220)
        }
    }
    
    private func initGenderTitle() {
        genderTitle.translatesAutoresizingMaskIntoConstraints = false
        genderTitle.font = .systemFont(ofSize: 22, weight: .semibold)
        genderTitle.text = "\(R.string.localizable.gender()):"
        addSubview(genderTitle)
        
        genderTitle.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func initGenderImage() {
        genderImage.translatesAutoresizingMaskIntoConstraints = false
        genderImage.contentMode = .scaleAspectFit
        
        addSubview(genderImage)
        genderImage.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(25)
            make.leading.equalTo(genderTitle.snp.trailing).offset(7)
            make.height.width.equalTo(22)
        }
    }
    
    private func initBirthTitle() {
        birthTitle.translatesAutoresizingMaskIntoConstraints = false
        birthTitle.font = .systemFont(ofSize: 22, weight: .semibold)
        birthTitle.text = "\(R.string.localizable.birthDate()):"
        addSubview(birthTitle)
        
        birthTitle.snp.makeConstraints { make in
            make.top.equalTo(genderTitle.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func initBirthDate() {
        birthDate.translatesAutoresizingMaskIntoConstraints = false
        birthDate.font = .systemFont(ofSize: 20, weight: .regular)
        
        addSubview(birthDate)
        birthDate.snp.makeConstraints { make in
            make.top.equalTo(genderTitle.snp.bottom).offset(11)
            make.leading.equalTo(birthTitle.snp.trailing).offset(7)
        }
    }
    
    private func initEmailTitle() {
        emailTitle.translatesAutoresizingMaskIntoConstraints = false
        emailTitle.font = .systemFont(ofSize: 22, weight: .semibold)
        emailTitle.text = "\(R.string.localizable.email()):"
        addSubview(emailTitle)
        
        emailTitle.snp.makeConstraints { make in
            make.top.equalTo(birthTitle.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func initEmailValue() {
        emailValue.translatesAutoresizingMaskIntoConstraints = false
        emailValue.font = .systemFont(ofSize: 20, weight: .regular)
        
        addSubview(emailValue)
        emailValue.snp.makeConstraints { make in
            make.top.equalTo(birthTitle.snp.bottom).offset(11)
            make.leading.equalTo(emailTitle.snp.trailing).offset(7)
        }
    }
    
    private func initPhoneTitle() {
        phoneTitle.translatesAutoresizingMaskIntoConstraints = false
        phoneTitle.font = .systemFont(ofSize: 22, weight: .semibold)
        phoneTitle.text = "\(R.string.localizable.phone()):"
        addSubview(phoneTitle)
        
        phoneTitle.snp.makeConstraints { make in
            make.top.equalTo(emailTitle.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func initPhoneValue() {
        phoneValue.translatesAutoresizingMaskIntoConstraints = false
        phoneValue.font = .systemFont(ofSize: 20, weight: .regular)
        
        addSubview(phoneValue)
        phoneValue.snp.makeConstraints { make in
            make.top.equalTo(emailTitle.snp.bottom).offset(11)
            make.leading.equalTo(phoneTitle.snp.trailing).offset(7)
        }
    }
    
    private func initCountryTitle() {
        countryTitle.translatesAutoresizingMaskIntoConstraints = false
        countryTitle.font = .systemFont(ofSize: 22, weight: .semibold)
        countryTitle.text = "\(R.string.localizable.country()):"
        addSubview(countryTitle)
        
        countryTitle.snp.makeConstraints { make in
            make.top.equalTo(phoneTitle.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func initCountryValue() {
        countryValue.translatesAutoresizingMaskIntoConstraints = false
        countryValue.font = .systemFont(ofSize: 20, weight: .regular)
        
        addSubview(countryValue)
        countryValue.snp.makeConstraints { make in
            make.top.equalTo(phoneTitle.snp.bottom).offset(11)
            make.leading.equalTo(countryTitle.snp.trailing).offset(7)
        }
    }
    
    private func initStateTitle() {
        stateTitle.translatesAutoresizingMaskIntoConstraints = false
        stateTitle.font = .systemFont(ofSize: 22, weight: .semibold)
        stateTitle.text = "\(R.string.localizable.state()):"
        addSubview(stateTitle)
        
        stateTitle.snp.makeConstraints { make in
            make.top.equalTo(countryTitle.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func initStateValue() {
        stateValue.translatesAutoresizingMaskIntoConstraints = false
        stateValue.font = .systemFont(ofSize: 20, weight: .regular)
        
        addSubview(stateValue)
        stateValue.snp.makeConstraints { make in
            make.top.equalTo(countryTitle.snp.bottom).offset(11)
            make.leading.equalTo(stateTitle.snp.trailing).offset(7)
        }
    }
    
    private func initCityTitle() {
        cityTitle.translatesAutoresizingMaskIntoConstraints = false
        cityTitle.font = .systemFont(ofSize: 22, weight: .semibold)
        cityTitle.text = "\(R.string.localizable.city()):"
        addSubview(cityTitle)
        
        cityTitle.snp.makeConstraints { make in
            make.top.equalTo(stateTitle.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func initCityValue() {
        cityValue.translatesAutoresizingMaskIntoConstraints = false
        cityValue.font = .systemFont(ofSize: 20, weight: .regular)
        
        addSubview(cityValue)
        cityValue.snp.makeConstraints { make in
            make.top.equalTo(stateTitle.snp.bottom).offset(11)
            make.leading.equalTo(cityTitle.snp.trailing).offset(7)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupData(data: ResultOfUsers) {
        image.sd_setImage(with: URL(string: data.picture.large), placeholderImage: UIImage(systemName: "person.crop.circle.fill"))
        switch(data.gender) {
        case .female:
            genderImage.image = UIImage(named: "female")
            break
        case .male:
            genderImage.image = UIImage(named: "male")
            break
        }
        
        birthDate.text = data.name.birthDate
        emailValue.text = data.email
        phoneValue.text = data.phone
        countryValue.text = data.location.country
        stateValue.text = data.location.state
        cityValue.text = data.location.city
    }
}
