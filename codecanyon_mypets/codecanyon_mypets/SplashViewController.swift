//
//  SplashViewController.swift
//  codecanyon_mypets
//
//  Created by Gizem Duman on 18.09.2023.
//

import UIKit
import TinyConstraints

class SplashViewController: UIViewController{
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Pet"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 42)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_home")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        view.backgroundColor = UIColor(named: "app_home")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let VC = ViewController()
            let navigationController = UINavigationController(rootViewController: VC)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: false, completion: nil)
        }
    }
}

// MARK: - UILayout
extension SplashViewController {
    
    private func addSubViews() {
        addImageView()
        addTitleLabel()
    }
    
    private func addImageView() {
        view.addSubview(imageView)
        imageView.centerXToSuperview()
        imageView.bottomToSuperview(offset: -64, usingSafeArea: true)
        imageView.size(.init(width: 500, height: 500))
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToSuperview(offset: 32, usingSafeArea: true)
        titleLabel.centerXToSuperview()
    }
}
