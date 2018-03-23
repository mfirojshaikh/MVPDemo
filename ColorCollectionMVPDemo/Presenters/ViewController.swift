//
//  ViewController.swift
//  ColorCollectionMVPDemo
//
//  Created by Firoj Shaikh on 22/03/18.
//  Copyright © 2018 Firoj Shaikh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Stored property's
    
    var presenter: ColorCollectionPresenter!
    var collectionView: UICollectionView!
    
    //Computed property's
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let insetLeft: CGFloat = 5.0
        let insetRight: CGFloat = 5.0
        layout.sectionInset = UIEdgeInsets(top: 10, left: insetLeft, bottom: 5.0, right: insetRight)
        let itemWidth = UIScreen.main.bounds.width/2 - (insetLeft + insetRight)
        layout.itemSize = CGSize(width: itemWidth, height: 300)
        return layout
    }()
    
    let refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(ViewController.refreshColor), for: .valueChanged)
        return refresh;
    }()
    
    // This is known as Dependancy Injector
    
    init(with presenter:ColorCollectionPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK:- View Life Cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = presenter.backgroundColor
        setUpCollecionView()
        presenter.updateColor { [weak self] in
            self?.collectionView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- Custom methods
    
    func setUpCollecionView() {
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: presenter.cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.refreshControl = refreshControl
        self.view.addSubview(collectionView)
    }

    @objc func refreshColor(){
        presenter.updateColor { [weak self] in
        
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
    }
}

//MARK:- Data source methos
extension  ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let color = presenter.color(for: indexPath.row) else { return }
        let detailPresenter = DetailVCPresenter(with: color)
        let detailVC = DetailVC(with: detailPresenter)
        self.present(detailVC, animated: true, completion: nil)
    }
}

