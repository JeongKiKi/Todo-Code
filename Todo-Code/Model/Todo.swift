//
//  File.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/08/26.
//

import UIKit

class Todo: Codable {
    var title: String
    var isComplete: Bool

    init(title: String, isComplete: Bool) {
        self.title = title
        self.isComplete = isComplete
    }
}
