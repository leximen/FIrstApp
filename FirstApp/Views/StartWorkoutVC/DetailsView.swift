//
//  DatailView.swift
//  firstApp
//
//  Created by MacLex on 10.02.2022.
//

import UIKit

class DetailView: UIView {
    
    let workoutNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .robotoMedium22()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsLabel: UILabel = {
        let Label = UILabel()
        Label.text = "Sets"
        Label.font = .robotoMedium18()
        Label.textColor = .specialGray
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    let numberOfSetLabel: UILabel = {
        let label = UILabel()
        label.text = "1/4"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let setsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let repsLabel: UILabel = {
        let Label = UILabel()
        Label.text = "Reps"
        Label.font = .robotoMedium18()
        Label.textColor = .specialGray
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    let numberOfRepsLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "editing")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("Editing", for: .normal)
        button.tintColor = .specialLightBrown
        button.titleLabel?.font = .robotoMedium16()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let nextSetsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "NEXT SET"), for: .normal)
        button.setTitle("NEXT SET", for: .normal)
        button.tintColor = .specialGray
        button.titleLabel?.font = .robotoBold16()
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextSetsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var repsStackView = UIStackView()
    var setsStackView = UIStackView()
    
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
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(workoutNameLabel)
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel, numberOfSetLabel],
                                    axis: .horizontal,
                                    spacing: 10)
//        setsStackView.distribution = .equalSpacing
        addSubview(setsStackView)
        addSubview(setsLineView)
        
        repsStackView = UIStackView (arrangedSubviews: [repsLabel,numberOfRepsLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        
        addSubview(repsStackView)
        addSubview(repsLineView)
        
        addSubview(editingButton)
        addSubview(nextSetsButton)
        
    }
 //FIXME: -     editingButtonTapped,      nextSetsButtonTapped
    @objc func editingButtonTapped() {
//        dismiss(animated: true, completion: nil)
    }
    
    @objc func nextSetsButtonTapped() {
//        dismiss(animated: true, completion: nil)
    }
    
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            //            workoutNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            //            workoutNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 5),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            setsStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            setsLineView.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 3),
            setsLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            setsLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: setsLineView.bottomAnchor, constant: 15),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            repsLineView.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 3),
            repsLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repsLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            repsLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            editingButton.topAnchor.constraint(equalTo: repsLineView.bottomAnchor, constant: 15),
            editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            editingButton.heightAnchor.constraint(equalToConstant: 20),
            editingButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            nextSetsButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 15),
            nextSetsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextSetsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextSetsButton.heightAnchor.constraint(equalToConstant: 45),
        ])
        
    }
    
}

