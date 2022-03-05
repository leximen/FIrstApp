//
//  TableViewCell.swift
//  firstApp
//
//  Created by MacLex on 19.01.2022.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    private let backgroundCell: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialBrown
//        view.addShadowOnView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let workoutBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let logo: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "workoutTestImage")
        image.backgroundColor = .none
        image.contentMode = .scaleAspectFit                             //сохраняються размеры картинки (даже если ячейка станет большой потом)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let workoutNameLabel: UILabel = {
       let label = UILabel ()
        label.text = "Pull Ups"
        label.font = .robotoMedium22()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let workoutRepsLabel: UILabel = {
       let label = UILabel ()
        label.text = "Reps: 10"
        label.font = .robotoMedium16()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let workoutSetsLabel: UILabel = {
        let label = UILabel()
        label.text = "Set: 2"
        label.font = .robotoMedium16()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let startButton: UIButton = {
        let button = UIButton (type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .robotoMedium16()
        button.tintColor = .specialDarkGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var labelsStackView = UIStackView()                                             
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none                      // убераем выделение (не видно рамку когда навели на ячейку в таблице)
        
        addSubview(backgroundCell)
        addSubview(workoutBackgroundView)
        addSubview(logo)
        addSubview(workoutNameLabel)
        
        labelsStackView = UIStackView(arrangedSubviews: [workoutRepsLabel, workoutSetsLabel],
                                      axis: .horizontal,
                                      spacing: 10)                  //это растояние между (workoutRepsLabel и workoutSetLabel) по горизонтали
        addSubview(labelsStackView)
        contentView.addSubview(startButton)
        
    }
        @objc private func startButtonTapped() {
            print("startButtonTapped")
        }
    
    func cellConfigure(model: WorkoutModel) {
        workoutNameLabel.text = model.workoutName
 
        let (min, sec) = { (secs: Int) -> (Int, Int) in
            return (secs / 60, secs % 60)}(model.workoutTimer)

        workoutRepsLabel.text = (model.workoutTimer == 0 ? "Reps: \(model.workoutReps)" : "Timer: \(min) min \(sec) sec")
        workoutSetsLabel.text = "Sets: \(model.workoutSets)"

        guard let imageData = model.workoutImage else { return }
        guard let image = UIImage(data: imageData) else { return }
        logo.image = image
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            workoutBackgroundView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            workoutBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workoutBackgroundView.heightAnchor.constraint(equalToConstant: 70),
            workoutBackgroundView.widthAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            logo.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            logo.heightAnchor.constraint(equalToConstant: 60),
            logo.widthAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            workoutNameLabel.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            workoutNameLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 0),
            labelsStackView.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            labelsStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 5),
            startButton.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            startButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            startButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        
    }
}
