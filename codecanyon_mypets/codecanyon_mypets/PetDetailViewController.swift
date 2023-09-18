//
//  PetDetailViewController.swift
//  codecanyon_mypets
//
//  Created by Gizem Duman on 18.09.2023.
//

import UIKit
import TinyConstraints

class PetDetailViewController: UIViewController {
    
    let imageNames = ["img_dog", "img_cat", "img_rodent", "img_turtle", "img_fish", "img_other"]
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What animal do you have?"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 36)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let petCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collectionView.register(PetCell.self, forCellWithReuseIdentifier: PetCell.cellId)
        collectionView.bounces = false
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        view.backgroundColor = UIColor(named: "app_cell")
        addTargets()
    }
}

// MARK: - UILayout
extension PetDetailViewController {
    
    private func addSubViews() {
        addTitleLabel()
        addPetCollectionView()
        addStackView()
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToSuperview(offset: 16, usingSafeArea: true)
        titleLabel.horizontalToSuperview(insets: .horizontal(32))
    }
    
    private func addPetCollectionView() {
        view.addSubview(petCollectionView)
        petCollectionView.topToBottom(of: titleLabel, offset: 32)
        petCollectionView.horizontalToSuperview(insets: .horizontal(16))
        petCollectionView.height(UIScreen.main.bounds.height * 0.6)
    }
    
    private func addStackView() {
        view.addSubview(stackView)
        stackView.horizontalToSuperview(insets: .horizontal(16))
        stackView.bottomToSuperview(offset: -32, usingSafeArea: true)
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(nextButton)
        backButton.height(50)
        nextButton.height(50)
    }
}

// MARK: - ConfigureContents
extension PetDetailViewController {
    
    private func configureContents() {
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        petCollectionView.delegate = self
        petCollectionView.dataSource = self
    }
}

// MARK: - AddTargets
extension PetDetailViewController {
    
    private func addTargets() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension PetDetailViewController {
    
    @objc
    private func backButtonTapped() {
        navigationController?.dismiss(animated: false, completion: nil)
    }
}

// MARK: - UICollectionViewDelegate
extension PetDetailViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension PetDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = petCollectionView.dequeueReusableCell(withReuseIdentifier: PetCell.cellId, for: indexPath) as! PetCell
        let imageName = imageNames[indexPath.item]
        if let image = UIImage(named: imageName) {
            cell.imageView.image = image
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PetDetailViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 80, height: 80)
    }
}

