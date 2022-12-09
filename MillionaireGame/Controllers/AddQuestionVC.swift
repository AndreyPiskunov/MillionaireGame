//
//  QuestionVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 05.12.2022.
//

import UIKit

final class AddQuestionVC: UIViewController {
    //MARK: - Properties
    
    private lazy var questionBackgroundView = UIView()
    private lazy var questionTextField = UITextField()
    private lazy var answerStackView = UIStackView()
    private lazy var items = ["A","B","C","D"]
    private lazy var truthControl = UISegmentedControl(items: items)
    private lazy var addButton = UIButton()
    private lazy var answerA = UITextField()
    private lazy var answerB = UITextField()
    private lazy var answerC = UITextField()
    private lazy var answerD = UITextField()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 200)
    }
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(questionBackgroundView)
        questionBackgroundView.addSubview(answerStackView)
        
        setupQuestionBackgroundView()
        setupAddAnswerStackView()
        setupSegmentedControl()
        setupAddButton()
        setupTruthControllConstrains()
        
        questionTextField.delegate = self
        answerA.delegate = self
        answerB.delegate = self
        answerC.delegate = self
        answerD.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
    }
    
    //MARK: - Methods
    
    func setupQuestionBackgroundView() {
        
        questionBackgroundView.frame.size = contentSize
        questionBackgroundView.backgroundColor = .lightGray
    }
    
    func setupAddButton() {
        
        addButton.backgroundColor = AppColors.buttonsMenu
        addButton.setTitle("Добавить", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        addButton.layer.cornerRadius = 12
        addButton.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
        view.addSubview(addButton)
        
        setupAddButtonConstrains()
    }
    
    func setupSegmentedControl() {
        
        truthControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        questionBackgroundView.addSubview(truthControl)
    }
    
    @objc func indexChanged(_ truthControl: UISegmentedControl) {
    }
    
    func setupAddAnswerStackView() {
        answerStackView.axis = .vertical
        answerStackView.distribution = .fillProportionally
        answerStackView.spacing = 20
        
        setupAnswerStackViewConstrains()
        addTextFieldsToStackView()
    }
    
    func addTextFieldsToStackView() {
        
        let textFieldQuestion = questionTextField
        textFieldQuestion.placeholder = " Введите новый вопрос"
        textFieldQuestion.textAlignment = .left
        textFieldQuestion.contentVerticalAlignment = .top
        textFieldQuestion.clearButtonMode = .unlessEditing
        textFieldQuestion.backgroundColor = .white
        textFieldQuestion.layer.cornerRadius = 10
        textFieldQuestion.heightAnchor.constraint(equalToConstant: 100).isActive = true
        answerStackView.addArrangedSubview(textFieldQuestion)
        
        let arrayTextFields = [answerA, answerB, answerC, answerD]
        for textField in arrayTextFields {
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 10
            textField.clearButtonMode = .unlessEditing
            textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            answerA.placeholder = " Введите вариант - А"
            answerB.placeholder = " Введите вариант - B"
            answerC.placeholder = " Введите вариант - C"
            answerD.placeholder = " Введите вариант - D"
            answerStackView.addArrangedSubview(textField)
        }
    }
    
    func addNewQuestion() {
        var flag: Bool
        var answers = [Answer(answerA.text ?? ""),
                       Answer(answerB.text ?? ""),
                       Answer(answerC.text ?? ""),
                       Answer(answerD.text ?? "")]
        
        flag = questionTextField.text!.isEmpty ? false : true
        answers.forEach { flag = $0.text.isEmpty ? false : true }
        guard flag else { return }
        
        answers[truthControl.selectedSegmentIndex].truth = true
        
        Game.shared.saveQuestions(Question(question: questionTextField.text ?? "", answers: answers))
        
        testQuestions.append(Question(question: questionTextField.text ?? "", answers: answers))
    }
    
    func setupAddButtonConstrains() {
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        addButton.topAnchor.constraint(equalTo: truthControl.bottomAnchor, constant: 40).isActive = true
    }
    
    func setupTruthControllConstrains() {
        
        truthControl.translatesAutoresizingMaskIntoConstraints = false
        truthControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        truthControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        truthControl.topAnchor.constraint(equalTo: answerStackView.bottomAnchor, constant: 40).isActive = true
    }
    
    func setupAnswerStackViewConstrains() {
        
        answerStackView.translatesAutoresizingMaskIntoConstraints = false
        answerStackView.topAnchor.constraint(equalTo: questionBackgroundView.topAnchor, constant: 30).isActive = true
        answerStackView.leadingAnchor.constraint(equalTo: questionBackgroundView.leadingAnchor, constant: 40).isActive = true
        answerStackView.trailingAnchor.constraint(equalTo: questionBackgroundView.trailingAnchor, constant: -40).isActive = true
    }
    
    @objc func tapAddButton(sender: UIButton!) {
        addNewQuestion()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func keyboardWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        _ = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
    }
}

extension AddQuestionVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == questionTextField {
            answerA.becomeFirstResponder()
        } else {
            if textField == answerA {
                answerB.becomeFirstResponder()
            } else {
                if textField == answerB {
                    answerC.becomeFirstResponder()
                } else {
                    if textField == answerC {
                        answerD.becomeFirstResponder()
                    }
                }
            }
        }
        return true
    }
}
