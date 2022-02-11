//
//  ViewController.swift
//  firstApp
//
//  Created by MacLex on 14.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let userPhotoImegeView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let userNamelabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.font = .robotoMedium24()
        label.adjustsFontSizeToFitWidth = true                                      // уменьшаем размер текста если его много
        label.minimumScaleFactor = 0.5                                             // уменьшаеться в два раза  и все точка)
        label.numberOfLines = 2                                                    // если много текста переносит на след. строку (всего 2 строки) 0-это бесконечное кол-во строк
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addWorkOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)
        button.titleLabel?.font = .robotoMedium12()
        button.tintColor = .specialDarkGreen                                       // цвет текста или картинки внутри кнопки
        button.imageEdgeInsets = UIEdgeInsets (top: 0,
                                               left: 20,
                                               bottom: 15,
                                               right: 0)                //края картинки
        button.titleEdgeInsets = UIEdgeInsets (top: 50,
                                               left: -40,
                                               bottom: 0,
                                               right: 0)               // края текста
        button.setImage(UIImage(named: "Plus"), for: .normal)
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let workoutTodayLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout today"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none                                    //убираем линии в каждой ячейки
        tableView.bounces = false                                           // выключаем верхнюю оттяжку с ячейки
        tableView.showsVerticalScrollIndicator = false                      //убираем полосу прокрутки (с правой стороны котоорая)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true                                                                                //Скрывает таблицу (ВКЛ - ВЫКЛ)
        return tableView
    }()
    
    private let noWorkoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noWorkout")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = false                                                                             //Скрывает заставку (картинка (ВКЛ - ВЫКЛ))
        return imageView
    }()
    
//MARK: - MainVC
    private let calendarView = CalendarView()
    private let weatherInfo = WeatherView()
    
    private let idWorkoutTableViewCell = "idWorkoutTableViewCell"
    
    override func viewDidLayoutSubviews() {
        userPhotoImegeView.layer.cornerRadius = userPhotoImegeView.frame.width / 2                      // автоматом делиться для создания круга из квадрата
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstrains()
        setDelegate()
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: idWorkoutTableViewCell)    // зарегали таблицу с ячейками (переписываем WorkoutTableViewCell вместо UITableViewCell т.к. мы создали (WorkoutTableViewCell))
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupView() {
        
        view.backgroundColor = .specialBackground
        
        view.addSubview(calendarView)
        view.addSubview(userPhotoImegeView)
        view.addSubview(userNamelabel)
        view.addSubview(addWorkOutButton)
        view.addSubview(weatherInfo)
        view.addSubview(workoutTodayLabel)
        view.addSubview(noWorkoutImageView)
        view.addSubview(tableView)
    }
    
    @objc private func addWorkoutButtonTapped() {
        let newWorkoutViewController = NewWorkoutViewController()
//        newWorkoutViewController.modalPresentationStyle = .fullScreen                       // открываеться полноценное окно по нажатию кнопки
        newWorkoutViewController.modalTransitionStyle = .crossDissolve                         // разные стили открытия страници))))
        present(newWorkoutViewController, animated: true, completion: nil)                      // переходим на следующую страницу
        
    }
}
//MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: idWorkoutTableViewCell, for: indexPath) as! WorkoutTableViewCell //создали ячейку и дописываем (as! WorkoutTableViewCell)
    return cell
  }
}

//MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {              //высота каждой ячейки
        100
    }
}

//MARK: - Set Constrains
extension MainViewController {
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            userPhotoImegeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            userPhotoImegeView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            userPhotoImegeView.widthAnchor.constraint(equalToConstant: 100),
            userPhotoImegeView.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            userNamelabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor,constant: -10),
            userNamelabel.leadingAnchor.constraint(equalTo: userPhotoImegeView.trailingAnchor,constant: 5),
            userNamelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        ])
        NSLayoutConstraint.activate([
            addWorkOutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor,constant: 5),
            addWorkOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            addWorkOutButton.widthAnchor.constraint(equalToConstant: 80),
            addWorkOutButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            weatherInfo.topAnchor.constraint(equalTo: calendarView.bottomAnchor,constant: 5),
            weatherInfo.leadingAnchor.constraint(equalTo: addWorkOutButton.trailingAnchor,constant: 10),
            weatherInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            weatherInfo.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            workoutTodayLabel.topAnchor.constraint(equalTo: addWorkOutButton.bottomAnchor,constant: 10),
            workoutTodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            noWorkoutImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            noWorkoutImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            noWorkoutImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),  //multiplier это размер лого на картинке (на первом экране(вместо таблицы)и мы его растягиваем по высоте (если меньше 1 то лого меньше будеи если больше 1 то все лого не поместиться на экран(view))
            noWorkoutImageView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor,constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}










