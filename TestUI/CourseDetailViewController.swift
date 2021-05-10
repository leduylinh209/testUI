//
//  ViewController.swift
//  StretchTableView
//
//  Created by Linh Leduy on 11/05/21.
//  Copyright © 2021 Linh Leduy. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController, UIScrollViewDelegate {
    
    
    var kTableHeaderHeight:CGFloat = 360
    
    var headerView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        strechyTableView.rowHeight = UITableView.automaticDimension
//
//        headerView = strechyTableView.tableHeaderView
//        strechyTableView.tableHeaderView = nil
//        strechyTableView.addSubview(headerView)
        scrollView.delegate = self
        scrollView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 100, right: 0)
        scrollView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        favoriteButton.addTarget(self, action: #selector(onFavoriteButtonTapped), for: .touchUpInside)
        favoriteButton.layer.cornerRadius = favoriteButton.bounds.width/2
        navigationController?.isNavigationBarHidden = true
        for view in infoStackView.arrangedSubviews {
            view.layer.cornerRadius = 10
        }
        
        titleLabel.font = UIFont(name: "WorkSans-Medium", size: 20)
        setupFooter()
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    private func setupFooter() {
        backButton.layer.cornerRadius = 10
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.systemGray.cgColor
        backButton.addTarget(self, action: #selector(didBackButtonTapped), for: .touchUpInside)
        
        joinButton.layer.cornerRadius = 10
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func updateHeaderView() {
        
//        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: strechyTableView.bounds.width, height: kTableHeaderHeight)
//        if scrollView.contentOffset.y > -kTableHeaderHeight {
//            headerRect.origin.y = strechyTableView.contentOffset.y
//            headerRect.size.height = -strechyTableView.contentOffset.y
//        }
        headerHeightConstraint.constant = max(min(kTableHeaderHeight+40, -scrollView.contentOffset.y+40), 0)
//        headerView.frame = headerRect
    }
    
    @objc func onFavoriteButtonTapped() {
        print("Favorite tapped")
    }
    
    @objc func didBackButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
