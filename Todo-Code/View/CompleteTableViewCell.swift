//
//  CompleteTableViewCell.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/08/26.
//

import UIKit

class CompleteTableViewCell: UITableViewCell {
    lazy var completeLabel: UILabel = {
        let label = UILabel()
        label.text = "complete"
        contentView.addSubview(label)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

        makeUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func makeUI() {
        completeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            completeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            completeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            completeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20)
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
