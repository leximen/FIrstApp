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
        //        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let nextSetsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "NEXT SET"), for: .normal)
        button.tintColor = .specialGray
        button.titleLabel?.font = .robotoBold16()
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
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
        
//        repsStackView.distribution = .equalSpacing
        addSubview(repsStackView)
        addSubview(repsLineView)
        
        addSubview(editingButton)
        addSubview(nextSetsButton)
        
    }
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            //            workoutNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            //            workoutNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 10),
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
    }
    
}

