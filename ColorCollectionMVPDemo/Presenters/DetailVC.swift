//
//  DetailVC.swift
//  ColorCollectionMVPDemo
//
//  Created by Firoj Shaikh on 22/03/18.
//  Copyright © 2018 Firoj Shaikh. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var presenter: DetailVCPresenter!
    var lblColorDescription: UILabel!
    
    //MARK:- initializer
    //This is initializer with dependancy injection - presenter is injected in Current VC
    
    init(with presenter:DetailVCPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.lblColorDescription = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 63))
        self.lblColorDescription.text = self.presenter.colorDescription
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize UI control's
        self.initializeUIControlers()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    //MARK:- Custom methods
    func initializeUIControlers() {
        
        self.view.backgroundColor = self.presenter.color
        self.view.addSubview(lblColorDescription)
        self.lblColorDescription.numberOfLines = 0
        self.lblColorDescription.center = self.view.center
        
        let tapGetsture = UITapGestureRecognizer(target: self, action: #selector(onTap(sender:)))
        self.view.addGestureRecognizer(tapGetsture)
    }
    
    //MARK:- User Event's methods
    
    @objc func onTap(sender:Any){
        self.dismiss(animated: true, completion: nil)
    }

}
