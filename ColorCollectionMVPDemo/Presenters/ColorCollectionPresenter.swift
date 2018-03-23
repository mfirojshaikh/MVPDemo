//
//  ColorCollectionPresenter.swift
//  ColorCollectionMVPDemo
//
//  Created by Firoj Shaikh on 22/03/18.
//  Copyright © 2018 Firoj Shaikh. All rights reserved.
//

import Foundation
import UIKit

class ColorCollectionPresenter: NSObject{
    
    var model = ColorModel()
    let cellIdentifier = "cell"
    
    let backgroundColor: UIColor = .white
    private var colors: [UIColor] {
        return model.colors
    }
    
    //MARK:- Custom methods
    public func updateColor(completion: @escaping (()->())){
    
        self.model.updateColors {
            completion()
        }
    }
    
    func color(for index: Int)-> UIColor? {
        guard index < model.colors.count else { return nil }
        return model.colors[index]
    }
 
}

//MARK:- Collection view Delegate methods

extension ColorCollectionPresenter: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.contentView.backgroundColor = colors[indexPath.row]
        cell.contentView.layer.cornerRadius = 20
        return cell
        
    }
}
