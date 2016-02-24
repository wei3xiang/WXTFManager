//
//  NormalVC.swift
//  WXTFManager
//
//  Created by 魏翔 on 16/2/23.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class NormalVC: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
        
        navigationItem.title = "Normal"
        
        let lastTFs = view.subviews.filter(WXTextField.filterGeneratorTF(WXTextField)).map(WXTextField.wxTextFieldWithView)
        
        WXTFManagerVC.registerManageWith(self, scrollView: nil, tfs: lastTFs)
    }
}
