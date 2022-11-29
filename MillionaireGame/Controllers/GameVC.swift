//
//  GameVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 28.11.2022.
//

import UIKit

class GameVC: UIViewController {
    //MARK: - Properties
    
    var gameBackgroundView = UIView()
    var answerStack = UIStackView()
    var answerButtonA = UIButton()
    var answerButtonB = UIButton()
    var answerButtonC = UIButton()
    var answerButtonD = UIButton()
    var questionLabel = UILabel()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGameBackgroundView()
        setupQuestionLabel()
        setupStackView()
    }
    //MARK: - Methods
    
    func setupGameBackgroundView() {
        gameBackgroundView = UIView(frame: self.view.bounds)
        gameBackgroundView.backgroundColor = .white
        view.addSubview(gameBackgroundView)
    }
    
    func setupQuestionLabel() {
       
        questionLabel.text = "Какие цвета есть на логотипе Coca-Cola?"
        questionLabel.font = UIFont.systemFont(ofSize: 25)
        questionLabel.textAlignment = .center
        questionLabel.textColor = .black
        questionLabel.numberOfLines = 0
        view.addSubview(questionLabel)
        
        setupQuestionLabelConstraints()
    }
    
    func setupStackView() {
        
        answerStack.axis = .vertical
        answerStack.distribution = .fillEqually
        answerStack.spacing = 20
        view.addSubview(answerStack)
        
        addButtonsToStackView()
        setupStackViewConstraints()
    }
    
    func addButtonsToStackView() {
        
        let button1 = answerButtonA
        button1.setTitle("1", for: .normal)
        button1.backgroundColor = .lightGray
        button1.layer.cornerRadius = 12
        answerStack.addArrangedSubview(button1)
        
        let button2 = answerButtonB
        button2.setTitle("2", for: .normal)
        button2.backgroundColor = .lightGray
        button2.layer.cornerRadius = 12
        answerStack.addArrangedSubview(button2)
        
        let button3 = answerButtonC
        button3.setTitle("3", for: .normal)
        button3.backgroundColor = .lightGray
        button3.layer.cornerRadius = 12
        answerStack.addArrangedSubview(button3)
        
        let button4 = answerButtonD
        button4.setTitle("4", for: .normal)
        button4.backgroundColor = .lightGray
        button4.layer.cornerRadius = 12
        answerStack.addArrangedSubview(button4)
    }
    
    func setupQuestionLabelConstraints() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
    }
    
    func setupStackViewConstraints() {
        answerStack.translatesAutoresizingMaskIntoConstraints = false
        answerStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 150).isActive = true
        answerStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        answerStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        answerStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
    }
}
