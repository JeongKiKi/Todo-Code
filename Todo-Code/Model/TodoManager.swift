//
//  File.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/08/26.
//

import UIKit

class TodoManager {
    static let shared = TodoManager()
    private init() {}
    var todos: [Todo] = [
        Todo(title: "안녕", isComplete: true),
        Todo(title: "Sample Todo 1", isComplete: false),
        Todo(title: "Sample Todo 2", isComplete: true)
    ]
    let sections: [String] = ["오늘할일", "내일할일"]

    var daytodos: [Todo] = [Todo(title: "잠자기", isComplete: false),
                            Todo(title: "TIL작성", isComplete: false)]

    func saveTodosToUserDefaults() {
        let data = try? JSONEncoder().encode(todos)
        UserDefaults.standard.set(data, forKey: "todos")
    }

    // UserDefaults에서 데이터를 불러오는 메서드
    func loadTodosFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: "todos"),
           let savedTodos = try? JSONDecoder().decode([Todo].self, from: data)
        {
            todos = savedTodos
        }
    }
    func saveDayTodosToUserDefaults() {
        let data = try? JSONEncoder().encode(daytodos)
        UserDefaults.standard.set(data, forKey: "daytodos")
    }

    // UserDefaults에서 데이터를 불러오는 메서드
    func loadDayTodosFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: "daytodos"),
           let savedTodos = try? JSONDecoder().decode([Todo].self, from: data)
        {
            daytodos = savedTodos
        }
    }
}
