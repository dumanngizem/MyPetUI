//
//  ViewController.swift
//  codecanyon_mypets
//
//  Created by Gizem Duman on 18.09.2023.
//

import UIKit

class ViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 42)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_hi")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let startedButton: UIButton = {
       let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    private let signInButton: UIButton = {
       let button = UIButton()
        button.setTitle("Sign İn", for: .normal)
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
        addTargets()
        view.backgroundColor = UIColor(named: "app_view")
    }
}

// MARK: - UILayout
extension ViewController {
    
    private func addSubViews() {
        addTitleLabel()
        addImageView()
        addStartedButton()
        addSignInButton()
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToSuperview(offset: 16, usingSafeArea: true)
        titleLabel.centerXToSuperview()
    }
    
    private func addImageView() {
        view.addSubview(imageView)
        imageView.centerInSuperview()
        imageView.size(.init(width: 300, height: 300))
    }
    
    private func addStartedButton() {
        view.addSubview(startedButton)
        startedButton.horizontalToSuperview(insets: .horizontal(32))
        startedButton.height(50)
    }
    
    private func addSignInButton() {
        view.addSubview(signInButton)
        signInButton.topToBottom(of: startedButton, offset: 16)
        signInButton.horizontalToSuperview(insets: .horizontal(32))
        signInButton.bottomToSuperview(offset: -16, usingSafeArea: true)
        signInButton.height(50)
    }
}

// MARK: - AddTargets
extension ViewController {
    
    private func addTargets() {
        startedButton.addTarget(self, action: #selector(startedButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension ViewController {
    
    @objc
    private func startedButtonTapped() {
        let VC = PetDetailViewController()
        let navigationController = UINavigationController(rootViewController: VC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: false, completion: nil)
    }
}
