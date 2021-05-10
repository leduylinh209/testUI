//
//  CourseCollectionViewData.swift
//  StretchTableView
//
//  Created by Linh Leduy on 11/05/2021.
//  Copyright © 2021 Linh Leduy. All rights reserved.
//

import Foundation
import UIKit

protocol CourseCollectionDelegate {
    func didSelectCourse(_ course: Course)
}

class CourseCollectionViewData: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var courses: [Course] = [
        Course(title: "User Interface Design", rating: "4.3", image: #imageLiteral(resourceName: "interFace1")),
        Course(title: "User Interface Design", rating: "4.3", image: #imageLiteral(resourceName: "interFace2")),
        Course(title: "User Interface Design", rating: "4.3", image: #imageLiteral(resourceName: "interFace1"))
    ]
    
    var delegate: CourseCollectionDelegate?
    
    override init() {
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCollectionViewCell", for: indexPath) as! CourseCollectionViewCell
        cell.titleLabel.text = courses[indexPath.item].title
        cell.ratingLabel.text = courses[indexPath.item].rating
        cell.courseImage.image = courses[indexPath.item].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCourse(courses[indexPath.row])
    }
}
