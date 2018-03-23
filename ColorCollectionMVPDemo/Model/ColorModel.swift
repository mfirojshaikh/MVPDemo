//
//  ColorModel.swift
//  ColorCollectionMVPDemo
//
//  Created by Firoj Shaikh on 22/03/18.
//  Copyright © 2018 Firoj Shaikh. All rights reserved.
//

import Foundation
import UIKit
import GameplayKit

struct ColorModel {

    typealias UpdateColorImp = ()->()
    var colors: [UIColor] = []
    
    mutating func updateColors(completionHandler: @escaping UpdateColorImp){
        let random = GKRandomSource.sharedRandom()
        self.colors = random.arrayByShufflingObjects(in: colorStorage) as! [UIColor]
        completionHandler()
    }
    
    private let colorStorage: [UIColor] = [
        .appleRed,
        .appleBlue,
        .appleGreen,
        .appleOrange,
        .appleTeal,
        .applePurple
    ]
    
}
