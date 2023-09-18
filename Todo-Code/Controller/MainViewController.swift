//
//  ViewController.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/08/26.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - 메인화면 이미지
    
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .red
        image.backgroundColor = .blue
        view.addSubview(image)
        
        return image
    }()
    
    // MARK: - 메인화면 Todo버튼
    
    lazy var todoAll: UIButton = {
        let btn = UIButton()
        btn.setTitle("Todo확인하기", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .yellow
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(todoAllButton), for: .touchUpInside)
        
        return btn
    }()
    
    // MARK: - 메인화면 완료항목 버튼
    
    lazy var todoComplete: UIButton = {
        let btn = UIButton()
        btn.setTitle("완료된 Todo확인하기", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .yellow
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(todoCompleteButton), for: .touchUpInside)
        
        return btn
    }()

    lazy var profileDesign: UIButton = {
        let btn = UIButton()
        btn.setTitle("ProfileDesignViewController", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .yellow
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(profileDesignBtn), for: .touchUpInside)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        loadImageFromURL()
    }
    
    func loadImageFromURL() {
        guard let imageURL = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg") else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error {
                print("Error loading image: \(error)")
                return
            }
            
            if let imageData = data, let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.mainImage.image = image
                }
            }
        }.resume()
    }
    
    @objc func todoAllButton() {
        print("pressdAll")
//        present(TodoAllViewController(), animated: true)
        let todoAllVC = TodoAllViewController()
        navigationController?.pushViewController(todoAllVC, animated: false)
    }
    
    @objc func todoCompleteButton() {
        print("pressdComplete")
        let completeVC = CompleteTodoViewController()
        navigationController?.pushViewController(completeVC, animated: false)
    }

    @objc func profileDesignBtn() {
        print("pressdComplete")
        let profileVC = ProfileDesignViewController()
        profileVC.modalPresentationStyle = .fullScreen
        present(profileVC, animated: true)
    }
}

extension MainViewController {
    func makeUI() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        todoAll.translatesAutoresizingMaskIntoConstraints = false
        todoComplete.translatesAutoresizingMaskIntoConstraints = false
        profileDesign.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            // 메인 화면 이미지 오토레이아웃
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 200),
            // 메인 화면 모든Todo항목버튼 오토레이아웃
            todoAll.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 30),
            todoAll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            todoAll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            todoAll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoAll.heightAnchor.constraint(equalToConstant: 30),
            // 메인 화면 완료버튼 오토레이아웃
            todoComplete.topAnchor.constraint(equalTo: todoAll.bottomAnchor, constant: 30),
            todoComplete.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            todoComplete.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            todoComplete.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoComplete.heightAnchor.constraint(equalToConstant: 30),
            
            profileDesign.topAnchor.constraint(equalTo: todoComplete.bottomAnchor, constant: 30),
            profileDesign.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            profileDesign.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            profileDesign.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileDesign.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
