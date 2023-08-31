//
//  TodoAllTableViewCell.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/08/26.
//

import UIKit

class TodoAllTableViewCell: UITableViewCell {
    var cellIndexPath: IndexPath?
    var sectionBy: Int
    var todo: Todo? // Todo 객체를 저장할 프로퍼티 추가

    lazy var todoLabel: UILabel = {
        let label = UILabel()
        label.text = "todo"
        contentView.addSubview(label)
        return label
    }()

    lazy var completeSwitch: UISwitch = {
        let switchs = UISwitch()
        switchs.addTarget(self, action: #selector(onClickSwitch), for: .valueChanged)
        contentView.addSubview(switchs)

        return switchs
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func makeUI() {
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        completeSwitch.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            todoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            todoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            todoLabel.trailingAnchor.constraint(equalTo: completeSwitch.leadingAnchor, constant: 20),

            completeSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            completeSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            completeSwitch.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    // 코드로 cell을 만들때는 init이 필요하다.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.sectionBy = 0
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        makeUI()
    }

//    @available(*, unavailable)
//    필수생성자
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func onClickSwitch() {
        if let indexs = cellIndexPath {
            if sectionBy == 0 {
                TodoManager.shared.todos[indexs.row].isComplete = completeSwitch.isOn
                TodoManager.shared.saveTodosToUserDefaults()
            } else if sectionBy == 1 {
                TodoManager.shared.daytodos[indexs.row].isComplete = completeSwitch.isOn
                TodoManager.shared.saveDayTodosToUserDefaults()
            }
            if completeSwitch.isOn {
                todo?.isComplete = true
                todoLabel.textColor = .red
                todoLabel.strikethrough(from: todoLabel.text, at: todoLabel.text)
            } else {
                todo?.isComplete = false
                todoLabel.textColor = .black
                todoLabel.strikethrough(from: nil, at: nil)
            }
        }
    }
}
