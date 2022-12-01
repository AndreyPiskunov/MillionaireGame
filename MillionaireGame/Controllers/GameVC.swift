//
//  GameVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 28.11.2022.
//

import UIKit

class GameVC: UIViewController {
    //MARK: - Properties
    
    private lazy var gameBackgroundView = UIView()
    private lazy var answerStack = UIStackView()
    private lazy var answerButtonA = UIButton()
    private lazy var answerButtonB = UIButton()
    private lazy var answerButtonC = UIButton()
    private lazy var answerButtonD = UIButton()
    private lazy var questionLabel = UILabel()
    
    let questions = Questions.testQuestions
    var questionNumber = 0
    var truth = ""
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGameBackgroundView()
        setupQuestionLabel()
        setupAnswerStackView()
        
        setActionForButtons()
        setTextQuestion(questionNumber)
        setTextButtons(questionNumber)
        setTruth(questionNumber)
    }
    //MARK: - Methods
    
    func setupGameBackgroundView() {
        
        gameBackgroundView = UIView(frame: self.view.bounds)
        gameBackgroundView.backgroundColor = .white
        view.addSubview(gameBackgroundView)
    }
    
    func setupQuestionLabel() {
        
        questionLabel.font = UIFont.systemFont(ofSize: 25)
        questionLabel.textAlignment = .center
        questionLabel.textColor = .black
        questionLabel.numberOfLines = 0
        view.addSubview(questionLabel)
        
        setupQuestionLabelConstraints()
    }
    
    func setupAnswerStackView() {
        
        answerStack.axis = .vertical
        answerStack.distribution = .fillEqually
        answerStack.spacing = 20
        view.addSubview(answerStack)
        
        addButtonsToStackView()
        setupStackViewConstraints()
    }
    
    func addButtonsToStackView() {
        
        let arrayAnswerButtons = [answerButtonA, answerButtonB, answerButtonC, answerButtonD]
        for arrayButton in arrayAnswerButtons {
            arrayButton.backgroundColor = .lightGray
            arrayButton.layer.cornerRadius = 12
            answerStack.addArrangedSubview(arrayButton)
        }
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
    //MARK: - Private methods
    
    private func setTextQuestion(_ questionNumber: Int) {
        let question = questions[questionNumber]
        questionLabel.text = question.question
    }
    
    private func setTextButtons(_ questionNumber: Int) {
        let question = questions[questionNumber]
        var answerNum = 0
        answerStack.subviews.forEach { button in
            guard let button = button as? UIButton else { return }
            button.setTitle(question.aunswers[answerNum].text, for: .normal)
            answerNum += 1
        }
    }
    
    private func setTruth(_ questionNumber: Int) {
        let answers = questions[questionNumber].aunswers
        answers.forEach { answer in
            if answer.truth {
                truth = answer.text
            }
        }
    }
    
    private func setActionForButtons() {
        answerStack.subviews.forEach { button in
            guard let button = button as? UIButton else { return }
            button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
        }
    }
    
    @objc private func buttonsAction(_ sender: UIButton) {
        guard let text = sender.currentTitle else { return }
        if truth == text {
            nextQuestions()
        } else {
            endGame()
        }
    }
    
    private func nextQuestions() {
        questionNumber += 1
        guard questionNumber < questions.count else { endGame(); return }
        setTextQuestion(questionNumber)
        setTextButtons(questionNumber)
        setTruth(questionNumber)
    }
    
    private func endGame() {
        self.dismiss(animated: true, completion: nil)
    }
}
