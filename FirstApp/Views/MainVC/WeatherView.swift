//
//  WeatherView.swift
//  firstApp
//
//  Created by MacLex on 18.01.2022.
//

import UIKit

class WeatherView: UIView {
    
    private let ImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sun")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let Discrption: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.textColor = .specialGray
        label.font = .robotoMedium14()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let idWeatherView = "WeatherView"
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupView()
        setConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView()  {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
        
        addSubview(ImageView)
        addSubview(statusLabel)
        addSubview(Discrption)
    }
}

//MARK: - setConstrains
extension WeatherView {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            ImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            ImageView.heightAnchor.constraint(equalToConstant: 60),
            ImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: self.ImageView.leadingAnchor, constant: -10),
            statusLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            Discrption.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            Discrption.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            Discrption.trailingAnchor.constraint(equalTo: self.ImageView.leadingAnchor, constant: -10),
            Discrption.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}

