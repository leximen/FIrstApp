//
//  StartWorkoutViewController.swift
//  firstApp
//
//  Created by MacLex on 10.02.2022.
//

import UIKit

class StartWorkoutViewController: UIViewController {

    private let startWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "START WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    private let startWorkoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "starWorkout")
//        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.isHidden = false                                         //Скрывает заставку (картинка (ВКЛ - ВЫКЛ))
        return imageView
    }()
    
    private let detailsLabel: UILabel = {
    let label = UILabel()
     label.text = "Detail"
     label.font = .robotoMedium14()
     label.textColor = .specialLightBrown
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
 }()
    
    private let datailsView = DetailView()
    
    private let finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.setTitle("FINISH", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()


    }

    private func setupView() {

        view.backgroundColor = .specialBackground
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(startWorkoutImageView)
        view.addSubview(detailsLabel)
        view.addSubview(datailsView)
        view.addSubview(finishButton)

    
    }
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)            //закрывает по нажатию кнопки и выгружает из памяти
    }
    
    @objc func finishButtonTapped() {
//        dismiss(animated: true, completion: nil)
    }
    
        private func setConstraints() {
            
            NSLayoutConstraint.activate([
                startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
                closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                closeButton.heightAnchor.constraint(equalToConstant: 30),
                closeButton.widthAnchor.constraint(equalToConstant: 30)
            ])
            
            NSLayoutConstraint.activate([
                startWorkoutImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 15),
                startWorkoutImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                startWorkoutImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),  //multiplier это размер лого на картинке (если меньше 1 то лого меньше будеи если больше 1 то все лого не поместиться на экран(view))
            ])
            
            NSLayoutConstraint.activate([
                detailsLabel.topAnchor.constraint(equalTo: startWorkoutImageView.bottomAnchor, constant: 15),
                detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
                detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        
            NSLayoutConstraint.activate([
                datailsView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 3),
                datailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                datailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                datailsView.heightAnchor.constraint(equalToConstant: 230)                              //(equalTo: view.widthAnchor, multiplier: 0.2)
            ])
            
            NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: datailsView.bottomAnchor, constant: 20),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
            
        }
    }
