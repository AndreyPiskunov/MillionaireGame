//
//  MainMenuVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 28.11.2022.
//

import UIKit

class StartMenuVC: UIViewController {
    //MARK: - Properties
    
    var backgroundView = UIView()
    var playButton = UIButton()
    var resultButton = UIButton()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundView()
        setupButtons()
    }
    //MARK: - Methods
    
    func setupBackgroundView() {
        backgroundView = UIView(frame: self.view.bounds)
        backgroundView.backgroundColor = .white
        view.addSubview(backgroundView)
    }
    
    func setupButtons() {
        
        playButton.layer.cornerRadius = 10
        playButton.frame = CGRect(x: 50, y: 650, width: 150, height: 70)
        playButton.backgroundColor = .lightGray
        playButton.setTitle("Играть", for: .normal)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        playButton.tintColor = .black
        playButton.addTarget(self, action: #selector(tapPlayButton), for: .touchUpInside)
        view.addSubview(playButton)
        
        resultButton.layer.cornerRadius = 10
        resultButton.frame = CGRect(x: 220, y: 650, width: 150, height: 70)
        resultButton.backgroundColor = .lightGray
        resultButton.setTitle("Результаты", for: .normal)
        resultButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        resultButton.tintColor = .black
        resultButton.addTarget(self, action: #selector(tapResultButton), for: .touchUpInside)
        view.addSubview(resultButton)
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

