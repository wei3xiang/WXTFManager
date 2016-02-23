//
//  ScrollViewVC.swift
//  WXTFManager
//
//  Created by 魏翔 on 16/2/23.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class ScrollViewVC: UIViewController {

    @IBOutlet weak var contetnView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var tfs = [WXTextField]()
    
    override func viewDidLoad() {

        super.viewDidLoad()

        navigationItem.title = "ScrollView"
        
        for subView in contetnView.subviews{
            
            if subView.isKindOfClass(WXTextField){
                
                let tf = subView as! WXTextField
                
                tfs.append(tf)
                
            }
            
        }
        
        WXTFManagerVC.registerManageWith(self, scrollView: scrollView, tfs: tfs)

    }

}
