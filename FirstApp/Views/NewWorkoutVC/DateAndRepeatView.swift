//
//  DateAndRepeatView.swift
//  firstApp
//
//  Created by MacLex on 30.01.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat every 7 days"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = .specialGreen
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    var dateStackView = UIStackView()
    var repeatStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        //        addShadowOnView()
        translatesAutoresizingMaskIntoConstraints = false
        
        dateStackView = UIStackView(arrangedSubviews: [dateLabel,  // расстанавливаем на одной линии(по горизонтали) выводим (дата и календарь) с помощью UIStackView + Exntension
                                                       datePicker],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(dateStackView)                                       // добавляем в addSubview
        
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel, repeatSwitch],    //тоже самое как и с (dateStackView = UIStackView(arrangedSubviews:) 65 стр
                                      axis: .horizontal,
                                      spacing: 10)
        addSubview(repeatStackView)                                     // добавляем в addSubview
    }
    
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}

