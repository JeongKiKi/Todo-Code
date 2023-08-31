//
//  NewTodoAddViewController.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/08/30.
//

import UIKit

class NewTodoAddViewController: UIViewController {
    lazy var todotextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "할일 입력"
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 10
        view.addSubview(tf)
        return tf
    }()
    
    lazy var todoSaveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("할일 저장하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        view.addSubview(btn)
        return btn
    }()
    
    lazy var whatTodo: UISegmentedControl = {
        let wt = UISegmentedControl(items: ["오늘할일", "내일할일"])
        wt.backgroundColor = .gray
        wt.selectedSegmentIndex = 0
        wt.addTarget(self, action: #selector(segmentSwitch), for: .valueChanged)
        view.addSubview(wt)
        return wt
    }()
    
    @objc func segmentSwitch() {
        if whatTodo.selectedSegmentIndex == 0 {
        } else if whatTodo.selectedSegmentIndex == 1 {}
    }
    
    @objc func saveButtonPressed() {
        let alert = UIAlertController(title: "Todo", message: "항목을 선택해주세요", preferredStyle: .alert)
        let cancle = UIAlertAction(title: "취소", style: .cancel) {
            _ in
        }
        alert.addAction(cancle)
        if whatTodo.selectedSegmentIndex == 0 {
            if todotextField.text != "" {
                guard let newData = todotextField.text else { return }
                let inputData = Todo(title: newData, isComplete: false)
                TodoManager.shared.todos.append(inputData)
                TodoManager.shared.saveTodosToUserDefaults()
                backView()
            }
        } else if whatTodo.selectedSegmentIndex == 1 {
            if todotextField.text != "" {
                guard let newData = todotextField.text else { return }
                let inputData = Todo(title: newData, isComplete: false)
                TodoManager.shared.daytodos.append(inputData)
                TodoManager.shared.saveDayTodosToUserDefaults()
                backView()
            } else {
                present(alert, animated: true, completion: nil)
            }
        }
    }
        
    func backView() {
        navigationController?.popViewController(animated: false)
    }
    
    func makeUI() {
        todotextField.translatesAutoresizingMaskIntoConstraints = false
        whatTodo.translatesAutoresizingMaskIntoConstraints = false
       
        todoSaveButton.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            todotextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            todotextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            todotextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            todotextField.heightAnchor.constraint(equalToConstant: 40),
                
            whatTodo.topAnchor.constraint(equalTo: todotextField.bottomAnchor, constant: 20),
            whatTodo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            whatTodo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            whatTodo.heightAnchor.constraint(equalToConstant: 40),
                
            todoSaveButton.topAnchor.constraint(equalTo: whatTodo.bottomAnchor, constant: 100),
            todoSaveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            todoSaveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            todoSaveButton.heightAnchor.constraint(equalToConstant: 40)
                
        ])
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeUI()
    }
}
