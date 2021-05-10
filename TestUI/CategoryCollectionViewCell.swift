//
//  CategoryCollectionViewCell.swift
//  StretchTableView
//
//  Created by Linh Leduy on 11/05/2021.
//  Copyright © 2021 Linh Leduy. All rights reserved.
//

import Foundation
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var title: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 0, green: 183/255, blue: 236/255, alpha: 1)
        lbl.font = UIFont(name: "WorkSans-Medium", size: 12)
        return lbl
    }()
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor(red: 0, green: 183/255, blue: 236/255, alpha: 1) : .clear
            title.textColor = isSelected ? .white : UIColor(red: 0, green: 183/255, blue: 236/255, alpha: 1)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeUI()
    }
    
    private func makeUI() {
//        backgroundColor = UIColor(red: 0, green: 183/255, blue: 236/255, alpha: 1)
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0, green: 183/255, blue: 236/255, alpha: 1).cgColor
        layer.cornerRadius = bounds.height/2
        
        addSubview(title)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
