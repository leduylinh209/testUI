//
//  PopularCourseCollectionViewCell.swift
//  StretchTableView
//
//  Created by Linh Leduy on 11/05/2021.
//  Copyright © 2021 Linh Leduy. All rights reserved.
//

import UIKit

class PopularCourseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numLessonsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeUI()
    }
    
    private func makeUI() {
        background.layer.cornerRadius = 20
        courseImage.clipsToBounds = true
        courseImage.layer.cornerRadius = 20
    }
}
