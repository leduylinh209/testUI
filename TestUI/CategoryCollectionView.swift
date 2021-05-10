//
//  CategoryCollectionView.swift
//  StretchTableView
//
//  Created by Linh Leduy on 11/05/2021.
//  Copyright © 2021 Linh Leduy. All rights reserved.
//

import Foundation
import UIKit

class CategoryCollectionView: UIView {
    
    var categories: [String] = ["UI/UX", "Coding", "Basic UI"]
    
    var title: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Category"
        lbl.font = UIFont(name: "WorkSans-Medium", size: 20)
        return lbl
    }()
    
    var categoryCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: .init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
        configCollectionView()
    }
    
    private func makeUI() {
        addSubview(title)
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: leftAnchor),
            title.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        addSubview(categoryCollectionView)
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
            categoryCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            categoryCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.backgroundColor = .clear
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.title.text = categories[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
