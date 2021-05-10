//
//  HomeViewController.swift
//  StretchTableView
//
//  Created by Linh Leduy on 11/05/2021.
//  Copyright © 2021 Linh Leduy. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    private var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
//        sv.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        return sv
    }()
    
    private var titleLabel1: UILabel = {
        let lbl = UILabel()
        lbl.text = "Choose your"
        lbl.font = UIFont(name: "WorkSans-Regular", size: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var titleLabel2: UILabel = {
        let lbl = UILabel()
        lbl.text = "Design Course"
        lbl.font = UIFont(name: "WorkSans-Bold", size: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var avatarImage: UIImageView = {
        let imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.image = #imageLiteral(resourceName: "userImage")
        imv.contentMode = .scaleAspectFill
        return imv
    }()
    
    private var searchTextField: UITextField = {
        let tf = TextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Search for course"
        tf.rightViewMode = .always
        let rightView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        rightView.tintColor = .lightGray
        tf.rightView = rightView
        tf.backgroundColor = UIColor(red: 248/255, green: 250/255, blue: 251/255, alpha: 1)
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    private var categoryView: CategoryCollectionView = {
        let cv = CategoryCollectionView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private var courseCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: .init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private var popularCourseLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "WorkSans-Medium", size: 20)
        lbl.text = "Popular Course"
        return lbl
    }()
    
    private var popularCourseCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: .init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isScrollEnabled = false
        return cv
    }()
    
    let courseCollectionViewData = CourseCollectionViewData()
    let popularCourseCollectionViewData = PopularCourseCollectionViewData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        makeUI()
        configCourseCollectionView()
        configPopularCourseCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateScrollViewContentSize()
    }
    
    private func makeUI() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scrollView.addSubview(titleLabel1)
        scrollView.addSubview(titleLabel2)
        NSLayoutConstraint.activate([
            titleLabel1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20),
            titleLabel1.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 30),
            titleLabel2.leftAnchor.constraint(equalTo: titleLabel1.leftAnchor),
            titleLabel2.topAnchor.constraint(equalTo: titleLabel1.bottomAnchor, constant: 10)
        ])
        
        scrollView.addSubview(avatarImage)
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: titleLabel1.topAnchor),
            avatarImage.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            avatarImage.widthAnchor.constraint(equalToConstant: 38),
            avatarImage.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        scrollView.addSubview(searchTextField)
        NSLayoutConstraint.activate([
            searchTextField.leftAnchor.constraint(equalTo: titleLabel1.leftAnchor),
            searchTextField.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 25),
            searchTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -80),
            searchTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        scrollView.addSubview(categoryView)
        NSLayoutConstraint.activate([
            categoryView.leftAnchor.constraint(equalTo: titleLabel1.leftAnchor),
            categoryView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 30),
            categoryView.rightAnchor.constraint(equalTo: avatarImage.rightAnchor),
            categoryView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        scrollView.addSubview(courseCollectionView)
        NSLayoutConstraint.activate([
            courseCollectionView.leftAnchor.constraint(equalTo: titleLabel1.leftAnchor),
            courseCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            courseCollectionView.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 40),
            courseCollectionView.heightAnchor.constraint(equalToConstant: 125)
        ])
        
        scrollView.addSubview(popularCourseLabel)
        NSLayoutConstraint.activate([
            popularCourseLabel.leftAnchor.constraint(equalTo: titleLabel1.leftAnchor),
            popularCourseLabel.topAnchor.constraint(equalTo: courseCollectionView.bottomAnchor, constant: 40)
        ])
        
        scrollView.addSubview(popularCourseCollectionView)
        NSLayoutConstraint.activate([
            popularCourseCollectionView.topAnchor.constraint(equalTo: popularCourseLabel.bottomAnchor, constant: 30),
            popularCourseCollectionView.leftAnchor.constraint(equalTo: titleLabel1.leftAnchor),
            popularCourseCollectionView.rightAnchor.constraint(equalTo: avatarImage.rightAnchor),
            popularCourseCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func updateScrollViewContentSize() {
        let contentHeight = popularCourseCollectionView.frame.minY + popularCourseCollectionView.collectionViewLayout.collectionViewContentSize.height
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: contentHeight)
    }
    
    private func configCourseCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 125)
        layout.minimumInteritemSpacing = 13
        courseCollectionView.collectionViewLayout = layout
        courseCollectionView.backgroundColor = .clear
        courseCollectionView.register(UINib(nibName: "CourseCollectionViewCell", bundle: Bundle(for: CourseCollectionViewCell.self)), forCellWithReuseIdentifier: "CourseCollectionViewCell")
        courseCollectionView.delegate = courseCollectionViewData
        courseCollectionView.dataSource = courseCollectionViewData
        courseCollectionViewData.delegate = self
    }
    
    private func configPopularCourseCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = ((UIScreen.main.bounds.width - 55) / 2)
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 20
        popularCourseCollectionView.collectionViewLayout = layout
        popularCourseCollectionView.backgroundColor = .clear
        popularCourseCollectionView.register(UINib(nibName: "PopularCourseCollectionViewCell", bundle: Bundle(for: PopularCourseCollectionViewCell.self)), forCellWithReuseIdentifier: "PopularCourseCollectionViewCell")
        popularCourseCollectionView.delegate = popularCourseCollectionViewData
        popularCourseCollectionView.dataSource = popularCourseCollectionViewData
        popularCourseCollectionViewData.delegate = self
    }
    
    private func openCourseDetail() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CourseDetailViewController") as! CourseDetailViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension HomeViewController: CourseCollectionDelegate {
    func didSelectCourse(_ course: Course) {
        openCourseDetail()
    }
}
