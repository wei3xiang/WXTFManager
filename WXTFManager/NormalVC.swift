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

        let tempTFs = view.subviews.filter(filterGeneratorTF(WXTextField))
        
        let lastTFs = tempTFs.map { subView in
            
            return subView as! WXTextField
            
        }
        
        WXTFManagerVC.registerManageWith(self, scrollView: nil, tfs: lastTFs)
    }

    func filterGeneratorTF(tfClass: AnyClass)->(subView: UIView)->Bool{
        
        return { subView in
            
            return subView.isKindOfClass(tfClass)
            
        }
        
    }
    
}
