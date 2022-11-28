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
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundView()
    }
    //MARK: - Methods
    
    func setupBackgroundView() {
        gameBackgroundView = UIView(frame: self.view.bounds)
        gameBackgroundView.backgroundColor = .blue
        view.addSubview(gameBackgroundView)
    }
}
