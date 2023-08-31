//
//  CompleteTodoViewController.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/08/26.
//

import UIKit

class CompleteTodoViewController: UIViewController {
    var todocomToday: [Todo] = []
    var todocomTomorrow: [Todo] = []
    lazy var tableView: UITableView = {
        let table = UITableView()
        view.addSubview(table)

        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        completeTodoUpdate()
        makeUI()
    }

    func completeTodoUpdate() {
        for completes in TodoManager.shared.todos {
            if completes.isComplete == true {
                todocomToday.append(completes)
            }
        }
        for completes in TodoManager.shared.daytodos {
            if completes.isComplete == true {
                todocomTomorrow.append(completes)
            }
        }
    }

    func makeUI() {
        tableView.register(CompleteTableViewCell.self, forCellReuseIdentifier: "CompleteCell") // 셀 클래스 등록

        tableView.dataSource = self

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),

        ])
    }
}

extension CompleteTodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return todocomToday.count
        }
        else if section == 1 {
            return todocomTomorrow.count
        }

        else { return 0 }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CompleteCell", for: indexPath) as? CompleteTableViewCell else { fatalError("Could not dequeue cell") }
        if indexPath.section == 0 {
            let todo = todocomToday[indexPath.row]
            cell.completeLabel.text = todo.title
        }
        else if indexPath.section == 1 {
            let todo = todocomTomorrow[indexPath.row]
            cell.completeLabel.text = todo.title
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return TodoManager.shared.sections[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return TodoManager.shared.sections.count
    }
}
