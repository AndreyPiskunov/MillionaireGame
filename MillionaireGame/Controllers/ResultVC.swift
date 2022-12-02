//
//  ResultVC.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 28.11.2022.
//

import UIKit

final class ResultVC: UIViewController {
    //MARK: - Properties
    
    var resultBackgroundView = UIView()
    var resultTableView = UITableView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(resultTableView)
        resultTableView.delegate = self
        resultTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultTableView.frame = view.bounds
    }
}

extension ResultVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let record = Game.shared.results[indexPath.row]
        cell.textLabel?.text = "Верных ответов: \(record.counterCorrectAnswers) из \(record.counterAllQuestions) вопросов"
        cell.detailTextLabel?.text = "\(record.persentCorrectAnswers) %"
        return cell
    }
}
