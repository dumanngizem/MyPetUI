//
//  PetCell.swift
//  codecanyon_mypets
//
//  Created by Gizem Duman on 18.09.2023.
//

import UIKit

class PetCell: UICollectionViewCell {
    
    static let cellId = "PetCell"
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
}

// MARK: - UILayout
extension PetCell {
    
    private func addSubViews() {
        addImageView()
    }
    
    private func addImageView() {
        contentView.addSubview(imageView)
        imageView.edgesToSuperview()
    }
}
