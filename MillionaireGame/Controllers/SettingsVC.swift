//
//  SettingsMenuVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 03.12.2022.
//

import UIKit

final class SettingsVC: UIViewController {
    //MARK: - Properties
    
    private lazy var settingsTableView = UITableView()
    private lazy var switchOnOff = UISwitch()
    private lazy var label = UILabel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(settingsTableView)
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        settingsTableView.frame = view.bounds
        settingsTableView.separatorColor = .white
        settingsTableView.rowHeight = 60
    }
}
   
extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "Случайный порядок"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        cell.accessoryView = switchOnOff
        return cell
    }
}
