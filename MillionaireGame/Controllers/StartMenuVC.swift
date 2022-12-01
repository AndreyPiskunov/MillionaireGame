//
//  MainMenuVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 28.11.2022.
//

import UIKit

final class StartMenuVC: UIViewController {
    //MARK: - Properties
    
    private lazy var backgroundView = UIView()
    private lazy var playButton = UIButton()
    private lazy var resultButton = UIButton()
    private lazy var buttonStack = UIStackView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundView()
        setupButtonStackView()
        setupButtons()
        addMenuButtonToStackView()
    }
    //MARK: - Methods
    
    func setupBackgroundView() {
        
        backgroundView = UIView(frame: self.view.bounds)
        backgroundView.backgroundColor = AppColors.backgroundGame
        view.addSubview(backgroundView)
    }

    func setupButtons() {
        playButton.setTitle("Играть", for: .normal)
        playButton.addTarget(self, action: #selector(tapPlayButton), for: .touchUpInside)
        view.addSubview(playButton)

        resultButton.setTitle("Результаты", for: .normal)
        resultButton.addTarget(self, action: #selector(tapResultButton), for: .touchUpInside)
        view.addSubview(resultButton)
    }
    
    func setupButtonStackView() {
        
        buttonStack.axis = .vertical
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 20
        view.addSubview(buttonStack)
        
        addMenuButtonToStackView()
        setupButtonStackConstraints()
    }
    
    func addMenuButtonToStackView() {
        
        let arrayMenuButtons = [playButton, resultButton]
        for arrayMenuButton in arrayMenuButtons {
            arrayMenuButton.backgroundColor = AppColors.buttonsMenu
            arrayMenuButton.tintColor = .black
            arrayMenuButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
            arrayMenuButton.layer.cornerRadius = 12
            buttonStack.addArrangedSubview(arrayMenuButton)
        }
    }
    
    func setupButtonStackConstraints() {
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300).isActive = true
    }
    
    @objc func tapPlayButton() {
        let gameViewController = GameVC()
        gameViewController.modalPresentationStyle = .fullScreen
        present(gameViewController, animated: true)
    }
    
    @objc func tapResultButton() {
        let resultViewController = ResultVC()
        present(resultViewController, animated: true)
    }
}

