//
//  TodoAllViewController.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/08/26.
//

import UIKit

class TodoAllViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "todo"
        tableView.register(TodoAllTableViewCell.self, forCellReuseIdentifier: "TodoCell") // 셀 클래스 등록
        makeUI()
        TodoManager.shared.loadTodosFromUserDefaults()
        TodoManager.shared.loadDayTodosFromUserDefaults()
        tableView.reloadData()
    }

    lazy var tableView: UITableView = {
        let table = UITableView()
        view.addSubview(table)

        return table
    }()

    func navigationButton() {
        let right = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightButtonPress))
        navigationItem.rightBarButtonItem = right
    }

    @objc func rightButtonPress() {
        let todoAllVC = NewTodoAddViewController()
        navigationController?.pushViewController(todoAllVC, animated: false)
    }

    func makeUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        navigationButton()
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),

        ])
    }
}

extension TodoAllViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return TodoManager.shared.todos.count
        } else if section == 1 {
            return TodoManager.shared.daytodos.count

        } else { return 0 }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoAllTableViewCell else { fatalError("Could not dequeue cell") }
        cell.onClickSwitch()
        cell.sectionBy = indexPath.section
        cell.cellIndexPath = indexPath
        if indexPath.section == 0 {
            let todo = TodoManager.shared.todos[indexPath.row]

            cell.todoLabel.text = todo.title
            cell.completeSwitch.isOn = todo.isComplete
            //        cell.configure(with: todo)
            if cell.completeSwitch.isOn {
                cell.todoLabel.textColor = .red
                cell.todoLabel.strikethrough(from: cell.todoLabel.text, at: cell.todoLabel.text)

            } else {
                cell.todoLabel.textColor = .black
                cell.todoLabel.strikethrough(from: nil, at: nil)
            }
        } else if indexPath.section == 1 {
            let todoTo = TodoManager.shared.daytodos[indexPath.row]

            cell.todoLabel.text = todoTo.title
            cell.completeSwitch.isOn = todoTo.isComplete
            //        cell.configure(with: todo)
            if cell.completeSwitch.isOn {
                cell.todoLabel.textColor = .red
                cell.todoLabel.strikethrough(from: cell.todoLabel.text, at: cell.todoLabel.text)

            } else {
                cell.todoLabel.textColor = .black
                cell.todoLabel.strikethrough(from: nil, at: nil)
            }
        }
//        tableView.reloadData()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 해당 indexPath에 대한 행 높이를 반환
        return 50
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        TodoManager.shared.sections[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return TodoManager.shared.sections.count
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                TodoManager.shared.todos.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                TodoManager.shared.saveTodosToUserDefaults()
            } else if indexPath.section == 1 {
                TodoManager.shared.daytodos.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                TodoManager.shared.saveDayTodosToUserDefaults()
            }
        }
    }
}

extension TodoAllViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let todo = TodoManager.shared.todos[indexPath.row]
//        print(todo.title)
    }
}

extension UILabel {
    func strikethrough(from text: String?, at range: String?) {
        guard let text = text,
              let range = range else { return }

        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue], range: NSString(string: text).range(of: range))
        attributedText = attributedString
    }
}
