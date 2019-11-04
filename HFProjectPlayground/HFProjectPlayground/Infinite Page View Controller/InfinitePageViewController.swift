//
//  HomeViewController.swift
//  HFProjectPlayground
//
//  Created by Heference on 2019/11/04.
//  Copyright © 2019 sfp. All rights reserved.
//

import UIKit

class InfinitePageViewController: UIViewController {
    
    let infiniteSize = 1000000
    var pageIndexPath = IndexPath(row: 0, section: 0)
    
    let pages: [UIViewController] = [
        FirstViewController(),
        SecondViewController(),
        ThirdViewController(),
        FourthViewController()
    ]
    
    let tabbarCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        
        view.register(TabbarCollectionViewCell.self, forCellWithReuseIdentifier: "TabbarCollectionViewCell")
        view.isPagingEnabled = true
        return view
    }()
    
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        tabbarCollectionView.delegate = self
        tabbarCollectionView.dataSource = self
        
        layout()
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
    }
    
    func layout() {
        self.view.addSubview(tabbarCollectionView)
        tabbarCollectionView.leadingAnchor(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        tabbarCollectionView.trailingAnchor(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        tabbarCollectionView.bottomAnchor(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        tabbarCollectionView.heightAnchor(equalToConstant: 60)
        
        guard let pageView = pageViewController.view else { return }
        pageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(pageView)
        pageView.topAnchor(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        pageView.leadingAnchor(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        pageView.trailingAnchor(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        pageView.bottomAnchor(equalTo: tabbarCollectionView.topAnchor)
    }
}

extension InfinitePageViewController: UICollectionViewDelegate {
    
}

extension InfinitePageViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infiniteSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabbarCollectionViewCell", for: indexPath) as! TabbarCollectionViewCell
        cell.title.text = "\(indexPath.row % 4)"
        return cell
    }
}

extension InfinitePageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width/4, height: 50)
    }
}

extension InfinitePageViewController: UIPageViewControllerDelegate {
    
}

extension InfinitePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        guard var index = pages.firstIndex(of: viewController) else { return nil }
        let first = pages.startIndex
        self.tabbarCollectionView.scrollToItem(at: pageIndexPath, at: .centeredHorizontally, animated: true)
        
        index -= 1
        pageIndexPath.row -= 1
        
        if index == first {
            return pages[first]
        } else if index > first {
            return pages[index]
        } else {
            return pages.last
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard var index = pages.firstIndex(of: viewController) else { return nil }
        let last = pages.endIndex-1
        self.tabbarCollectionView.scrollToItem(at: pageIndexPath, at: .centeredHorizontally, animated: true)
        
        index += 1
        pageIndexPath.row += 1
        
        if index == last{
            return pages[last]
        } else if index > last {
            return pages.first
        } else {
            return pages[index]
        }
    }
    
    
}

class TabbarCollectionViewCell: UICollectionViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.green
//        self.clipsToBounds = true
        
        self.addSubview(title)
        title.centerXAnchor(equalTo: self.centerXAnchor)
        title.centerYAnchor(equalTo: self.centerYAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/*
 TODO 미구현사항
 1. Page Swipe 시 Collection View Index Sync 조정
 2. Collection View Swipe 시 Page Index Sync 조정
 3. Collection Tabbar Page 스크롤링 구현
 4. Collection View didSelect Row 기능 구현
 5. Collection View Infinite 좌측 스크롤 구현 (InfiniteSize / 2)
 
*/

