//
//  ProfileDesignViewController.swift
//  Todo-Code
//
//  Created by 정기현 on 2023/09/13.
//

import SnapKit
import UIKit

class ProfileDesignViewController: UIViewController {
    // 상단바
    lazy var topView: UIView = {
        let vw = UIView()
        [backButton, userName, menuButton].forEach { vw.addSubview($0) }
        view.addSubview(vw)
        return vw
    }()

    lazy var userName: UILabel = {
        let lb = UILabel()
        lb.text = "nabaecamp"
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        return lb
    }()

    lazy var menuButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Menu"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(menuClick), for: .touchUpInside)
        return btn
    }()

    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrowshape.backward"), for: .normal)
        btn.tintColor = .black
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()

    // 프로필이미지
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "setImage")
        image.layer.cornerRadius = 10
        view.addSubview(image)

        return image
    }()

    // post
    lazy var postView: UIView = {
        let vw = UIView()
        [postNum, postText].forEach { vw.addSubview($0) }
        return vw
    }()

    lazy var postNum: UILabel = {
        let lb = UILabel()
        lb.text = "0"
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.textAlignment = .center
        return lb
    }()

    lazy var postText: UILabel = {
        let lb = UILabel()
        lb.text = "post"
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        lb.textAlignment = .center
        return lb
    }()

    // follower
    lazy var followerView: UIView = {
        let vw = UIView()
        [followerNum, followerText].forEach { vw.addSubview($0) }
        return vw
    }()

    lazy var followerNum: UILabel = {
        let lb = UILabel()
        lb.text = "0"
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.textAlignment = .center
        return lb
    }()

    lazy var followerText: UILabel = {
        let lb = UILabel()
        lb.text = "follower"
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        lb.textAlignment = .center
        return lb
    }()

    // follwing
    lazy var followingView: UIView = {
        let vw = UIView()
        [followingNum, followingText].forEach { vw.addSubview($0) }
        return vw
    }()

    lazy var followingNum: UILabel = {
        let lb = UILabel()
        lb.text = "0"
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.textAlignment = .center
        return lb
    }()

    lazy var followingText: UILabel = {
        let lb = UILabel()
        lb.text = "following"
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        lb.textAlignment = .center
        return lb
    }()

    // userFollowInfo
    lazy var postStack: UIStackView = {
        let st = UIStackView(arrangedSubviews: [postView, followerView, followingView])
        st.axis = .horizontal

        st.alignment = .fill
        st.distribution = .fillEqually
        st.spacing = 7
        view.addSubview(st)
        return st
    }()

    lazy var userInfo: UIStackView = {
        let st = UIStackView(arrangedSubviews: [nickname, bio, linkBio])
        st.axis = .vertical
        st.alignment = .fill
        st.distribution = .fillEqually
        st.spacing = 2
        view.addSubview(st)
        return st
    }()

    lazy var nickname: UILabel = {
        let lb = UILabel()
        lb.text = "르탄이"
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        return lb
    }()

    lazy var bio: UILabel = {
        let lb = UILabel()
        lb.text = "iOS Developer 🍎"
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        return lb
    }()

    lazy var linkBio: UILabel = {
        let lb = UILabel()
        lb.text = "spartacodingclub.kr"
        lb.textColor = .blue
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        return lb
    }()

    lazy var fmStackview: UIStackView = {
        let st = UIStackView(arrangedSubviews: [followButton, messageButton])
        st.axis = .horizontal
        st.alignment = .fill
        st.distribution = .fillEqually
        st.spacing = 8
        view.addSubview(st)
        return st
    }()

    lazy var followButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Follow", for: .normal)
        btn.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.gray.cgColor
        return btn
    }()

    lazy var messageButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Message", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.cornerRadius = 5
        return btn
    }()

    lazy var moreButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.gray.cgColor
        view.addSubview(btn)
        return btn
    }()

    lazy var spacer: UIView = {
        let sp = UIView()
        sp.backgroundColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1)
        view.addSubview(sp)
        return sp
    }()

    lazy var grid: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Grid"), for: .normal)
        view.addSubview(btn)
        return btn
    }()

    lazy var sectionIndicator: UIView = {
        let sp = UIView()
        sp.backgroundColor = .black
        view.addSubview(sp)
        return sp
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let ct = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(ct)
        return ct
    }()

    lazy var myProfile: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "person"), for: .normal)
        btn.addTarget(self, action: #selector(myProfileClick), for: .touchUpInside)
        view.addSubview(btn)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        makeUi()
    }

    @objc func menuClick() {
        print("click")
    }

    @objc func backClick() {
        print("click")
        dismiss(animated: true, completion: nil)
    }

    @objc func myProfileClick() {
        let vc = MyPageViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}

extension ProfileDesignViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 44
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CollectionViewCell else { fatalError("Could not dequeue cell") }

        cell.backgroundColor = UIColor.blue
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let a = (view.bounds.width - 4) / 3
        return CGSize(width: a, height: a)
    }
}

extension ProfileDesignViewController: UICollectionViewDelegateFlowLayout {
    // 위 아래 간격
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 2
    }

    // 옆 간격
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 2
    }
}

extension ProfileDesignViewController {
    func makeUi() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        //        let numWSize: CGFloat = 30
        let numHSize: CGFloat = 22
        let userInfoH: CGFloat = 19
        let textHSize: CGFloat = 19
        let numtextMargin: CGFloat = 0
        topView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(50)
        }
        userName.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self.topView)
            make.height.equalTo(25)
        }
        menuButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.userName)
            make.trailing.equalTo(topView.snp.trailing).inset(10)
            make.height.equalTo(17)
        }
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.topView)
            make.leading.equalTo(topView.snp.leading).inset(10)
            make.height.equalTo(25)
        }
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).inset(-14)
            make.leading.equalTo(view.snp.leading).inset(14)
            make.height.width.equalTo(88)
        }
        postStack.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).inset(130)
            make.trailing.equalTo(view.snp.trailing).inset(28)
            make.top.equalTo(topView.snp.bottom).inset(-40)
            make.height.equalTo(41)
        }
        postNum.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(self.postView).inset(0)
            make.height.equalTo(numHSize)
        }
        postText.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.postView).inset(0)
            make.top.equalTo(postNum.snp.bottom).inset(numtextMargin)
            make.centerX.equalTo(postNum.snp.centerX)
            make.height.equalTo(textHSize)
        }
        followerNum.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(self.followerView).inset(0)
            make.height.equalTo(numHSize)
        }
        followerText.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.followerView).inset(0)
            make.top.equalTo(followerNum.snp.bottom).inset(numtextMargin)
            make.centerX.equalTo(followerView.snp.centerX)
            make.height.equalTo(textHSize)
        }
        followingNum.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(self.followingView).inset(0)
            make.height.equalTo(numHSize)
        }
        followingText.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.followingView).inset(0)
            make.top.equalTo(followingNum.snp.bottom).inset(numtextMargin)
            make.centerX.equalTo(followingView.snp.centerX)
            make.height.equalTo(textHSize)
        }
        nickname.snp.makeConstraints { make in

            make.height.equalTo(userInfoH)
        }
        userInfo.snp.makeConstraints { make in
            make.leading.trailing.equalTo(15)
            make.top.equalTo(profileImage.snp.bottom).inset(-14)
        }
        followButton.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        fmStackview.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.top.equalTo(userInfo.snp.bottom).inset(-11)
            make.height.equalTo(30)
            make.trailing.equalTo(view.snp.trailing).inset(53)
        }
        moreButton.snp.makeConstraints { make in
            make.leading.equalTo(fmStackview.snp.trailing).inset(-8)
            make.trailing.equalTo(view.snp.trailing).inset(15)
            make.top.bottom.equalTo(self.fmStackview)
        }
        spacer.snp.makeConstraints { make in
            make.top.equalTo(fmStackview.snp.bottom).inset(-15)
            make.leading.trailing.equalTo(self.view)
            make.height.equalTo(2)
        }
        grid.snp.makeConstraints { make in
            make.width.height.equalTo(22.5)
            make.leading.equalTo(self.view).inset(52)
            make.top.equalTo(spacer.snp.bottom).inset(-8)
        }
        sectionIndicator.snp.makeConstraints { make in
            make.top.equalTo(grid.snp.bottom).inset(-8)
            make.width.equalTo(124)
            make.height.equalTo(1)
            make.leading.equalTo(view.snp.leading)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(sectionIndicator.snp.bottom).inset(-1)
            make.leading.trailing.equalTo(self.view)
            make.bottom.equalTo(view.snp.bottom).inset(86)
        }
        myProfile.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(self.view)
            make.height.equalTo(85)
        }
    }
}
