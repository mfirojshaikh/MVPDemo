//
//  DetailVCPresenter.swift
//  ColorCollectionMVPDemo
//
//  Created by Firoj Shaikh on 22/03/18.
//  Copyright © 2018 Firoj Shaikh. All rights reserved.
//

import Foundation
import UIKit

class DetailVCPresenter {
    let color: UIColor!
    let colorDescription: String
    
    init(with color:UIColor) {
        self.color = color
        if let component = color.cgColor.components {
            self.colorDescription = """
            R: \(component[0])
            G: \(component[1])
            B: \(component[2])
            """
        }else {
            colorDescription = ""
        }
    }
}
