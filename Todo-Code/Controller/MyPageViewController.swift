//
//  MyPageViewController.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/09/18.
//

import SnapKit
import UIKit
class MyPageViewController: UIViewController {
    lazy var topView: UIView = {
        let vw = UIView()
        [backButton, mainTitle].forEach { vw.addSubview($0) }
        view.addSubview(vw)
        return vw
    }()

    lazy var mainTitle: UILabel = {
        let lb = UILabel()
        lb.text = "nabaecamp"
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        return lb
    }()

    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrowshape.backward"), for: .normal)
        btn.tintColor = .black
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()

    lazy var userName: UILabel = {
        let lb = UILabel()
        lb.text = "이름"
        lb.textAlignment = .center
        lb.layer.cornerRadius = 10
        lb.layer.borderWidth = 2
        lb.layer.borderColor = UIColor.gray.cgColor
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        view.addSubview(lb)
        return lb
    }()

    lazy var userAge: UILabel = {
        let lb = UILabel()
        lb.text = "나이"
        lb.textAlignment = .center
        lb.layer.cornerRadius = 10
        lb.layer.borderWidth = 2
        lb.layer.borderColor = UIColor.gray.cgColor
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        view.addSubview(lb)
        return lb
    }()

    @objc func backClick() {
        print("click")
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeUi()
    }
}

extension MyPageViewController {
    func makeUi() {
        topView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(50)
        }
        mainTitle.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self.topView)
            make.height.equalTo(25)
        }

        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.topView)
            make.leading.equalTo(topView.snp.leading).inset(10)
            make.height.equalTo(25)
        }
        userName.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view).inset(20)
            make.centerX.centerY.equalTo(self.view)
            make.height.equalTo(30)
        }
        userAge.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).inset(-10)
            make.leading.trailing.equalTo(self.view).inset(20)
            make.centerX.equalTo(self.view)
            make.height.equalTo(30)
        }
    }
}
