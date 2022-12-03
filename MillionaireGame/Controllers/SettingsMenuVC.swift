//
//  SettingsMenuVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 03.12.2022.
//

import UIKit

final class SettingsMenuVC: UIViewController {
    //MARK: - Properties
    
    private lazy var settingsBackgroundView = UIView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSettingsBackgroundView()
    }
    //MARK: - Methods
    
    func setupSettingsBackgroundView() {
        
        settingsBackgroundView = UIView(frame: self.view.bounds)
        settingsBackgroundView.backgroundColor = AppColors.backgroundSubMenu
        view.addSubview(settingsBackgroundView)
    }
}
