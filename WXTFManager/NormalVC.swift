//
//  NormalVC.swift
//  WXTFManager
//
//  Created by 魏翔 on 16/2/23.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class NormalVC: UIViewController {
    
    var tfs = [WXTextField]()

    override func viewDidLoad() {

        super.viewDidLoad()
        
        navigationItem.title = "Normal"
        
        for subView in view.subviews{
            
            if subView.isKindOfClass(WXTextField){
                
                let tf = subView as! WXTextField
                
                tfs.append(tf)
                
            }
            
        }
        
        WXTFManagerVC.registerManageWith(self, scrollView: nil, tfs: tfs)

    }
    
}
