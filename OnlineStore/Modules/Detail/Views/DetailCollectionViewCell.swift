//
//  DetailCollectionViewCell.swift
//  OnlineStore
//
//  Created by NikitaKorniuk   on 15.04.24.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: DetailCollectionViewCell.self)
    
    private let productImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    required init?(coder: NSCoder) {
        NSCoder.fatalErrorNotImplemented()
    }
    
    private func setup() {
        addSubview(productImageView)
        
        productImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(_ image: String) {
        loadImageCollectionViewCell(url: image, imageView: productImageView)
    }
}
