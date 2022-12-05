//
//  QuestionVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 05.12.2022.
//

import UIKit

final class QuestionVC: UIViewController {
    //MARK: - Properties
    
    private lazy var questionBackgroundView = UIView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestionBackgroundView()
    }
    //MARK: - Methods
    
    func setupQuestionBackgroundView() {
        
        questionBackgroundView = UIView(frame: self.view.bounds)
        questionBackgroundView.backgroundColor = AppColors.backgroundSubMenu
        view.addSubview(questionBackgroundView)
    }
}

