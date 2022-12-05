//
//  GameVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 28.11.2022.
//

import UIKit

final class GameVC: UIViewController {
    //MARK: - Properties
    
    private lazy var gameBackgroundView = UIView()
    private lazy var answerStack = UIStackView()
    private lazy var answerButtonA = UIButton()
    private lazy var answerButtonB = UIButton()
    private lazy var answerButtonC = UIButton()
    private lazy var answerButtonD = UIButton()
    private lazy var questionLabel = UILabel()
    private lazy var progressLabel = UILabel()
    
    let session = GameSession()
    let questions = Questions.testQuestions
    var truth = ""
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session.numberQuestion.addObserver(self,
                                           options: [.new, .initial],
                                           closure: { [weak self] (numberQuestion, _) in
            var percent: Float = 0
            if self?.session.percentProgress.isNaN == false {
                percent = (self?.session.percentProgress)!
                
            }
            self?.progressLabel.text = "Прогресс: \(numberQuestion) (\(percent)%)" }
        )
        
        session.gameVCDelegate = self
        Game.shared.session = session
        
        setAllQuestionsCount(questions.count)
        
        setupGameBackgroundView()
        setupProgressLabel()
        setupQuestionLabel()
        setupAnswerStackView()
        
        setActionForButtons()
        setTextQuestion(session.numberQuestion.value)
        setTextButtons(session.numberQuestion.value)
        setTruth(session.numberQuestion.value)
    }
    //MARK: - Methods
    
    func setupGameBackgroundView() {
        
        gameBackgroundView = UIView(frame: self.view.bounds)
        gameBackgroundView.backgroundColor = AppColors.backgroundGame
        view.addSubview(gameBackgroundView)
    }
    
    func setupProgressLabel() {
        progressLabel.font = UIFont.systemFont(ofSize: 20)
        progressLabel.textAlignment = .center
        progressLabel.textColor = .systemGreen
        progressLabel.numberOfLines = 0
        view.addSubview(progressLabel)
        
        setupProgressLabelConstraints()
    }
    
    func setupQuestionLabel() {
        
        questionLabel.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        questionLabel.textAlignment = .center
        questionLabel.textColor = .systemYellow
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
            arrayButton.backgroundColor = AppColors.buttonsGame
            arrayButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            arrayButton.layer.cornerRadius = 12
            answerStack.addArrangedSubview(arrayButton)
        }
    }
    
    func setupProgressLabelConstraints() {
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        progressLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        progressLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
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
            scorePoints()
            nextQuestions()
        } else {
            endGame()
        }
    }
    
    private func nextQuestions() {
        session.numberQuestion.value += 1
        guard session.numberQuestion.value < questions.count else { endGame(); return }
        setTextQuestion(session.numberQuestion.value)
        setTextButtons(session.numberQuestion.value)
        setTruth(session.numberQuestion.value)
    }
    
    private func endGame() {
        let result = Result(counterCorrectAnswers: session.numberQuestion.value,
                            counterAllQuestions: session.allQuestionsCount)
        Game.shared.saveResult(result)
        Game.shared.session = nil
        self.dismiss(animated: true, completion: nil)
    }
}

extension GameVC: GameVCDelegate {
    func scorePoints(_ points: Int = 1) {
        session.points += points
    }
    
    func setAllQuestionsCount(_ count: Int) {
        session.allQuestionsCount = count
    }
}
