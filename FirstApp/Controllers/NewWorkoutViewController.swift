//
//  NewWorkoutViewController.swift
//  firstApp
//
//  Created by MacLex on 28.01.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {

    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "NEW WORKOUT"
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
    //    private let nameLabel: UILabel = {
    //       let label = UILabel()
    //        label.text = "Name"
    //        label.font = .robotoMedium14()
    //        label.textColor = .specialLightBrown
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        return label
    //    }()
    private let nameLabel = UILabel(text: "Name")           // заменили одной строко вместо 7 строк через UIKit -> UILabel + Extension (ВЫШЕ private let nameLabel: UILabel)

    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBrown
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .robotoBold20()
//        textField.borderStyle = .none                                                             // нет границы
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))       //отступ текста от края (textField)
        textField.leftViewMode = .always                                                          //всегда отображаем эту view
        textField.clearButtonMode = .always              // когда написали текст, появляеться удалитель что написали
        textField.returnKeyType = .done                                          // появляется кнопка на клаве (done,continue, и т.д.)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let dateAndRepeatLabel: UILabel = {
       let label = UILabel()
        label.text = "Date and repeat"
        label.font = .robotoMedium14()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateAndRepeatView = DateAndRepeatView()

    private let repsOrTimerLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps or timer"
        label.font = .robotoMedium14()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsOrTimerView = RepsOrTimerView()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
        setDelegates()
        addTaps()

        nameTextField.becomeFirstResponder()                    //автоматом появляется мигающая строка


    }

    private func setupView() {

        view.backgroundColor = .specialBackground

        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(dateAndRepeatLabel)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsOrTimerLabel)
        view.addSubview(repsOrTimerView)
        view.addSubview(saveButton)

    }
    private func setDelegates() {
        nameTextField.delegate = self
    }

    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)            //закрывает по нажатию кнопки и выгружает из памяти
    }

    @objc func saveButtonTapped() {
        print("saveButtonTapped")
    }
    private func addTaps() {                        //по нажатию или свайпу по экрану изчезает клава (код      ДО      @objc private func swipeHideKeyboard)
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)

        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeHideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }

    @objc private func swipeHideKeyboard() {
        view.endEditing(true)
    }
}
extension NewWorkoutViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {          //когда зашли на вторую страницу в UITextField при нажатии на кнопку DONE клава проподает
            nameTextField.resignFirstResponder()
        }
    }
//MARK: - Set Constrains
    extension NewWorkoutViewController {

    private func setConstraints() {

        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)

        ])
        NSLayoutConstraint.activate([
            dateAndRepeatView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 3),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 95)                              //(equalTo: view.widthAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 3),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 320)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])

    }
}

