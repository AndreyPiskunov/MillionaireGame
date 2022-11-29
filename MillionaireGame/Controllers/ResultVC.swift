//
//  ResultVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 28.11.2022.
//

import UIKit

class ResultVC: UIViewController {
    //MARK: - Properties
    
    var resultBackgroundView = UIView()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    //MARK: - Methods
    
    func setupView() {
        resultBackgroundView = UIView(frame: self.view.bounds)
        resultBackgroundView.backgroundColor = .white
        view.addSubview(resultBackgroundView)
    }
}
