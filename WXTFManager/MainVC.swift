//
//  MainVC.swift
//  WXTFManager
//
//  Created by 魏翔 on 16/2/23.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
        
    }
    
    @IBAction func didClickNormal(sender: AnyObject) {
        
        let vc = NormalVC.init(nibName: "NormalVC", bundle: nil)
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func didClickScrollView(sender: AnyObject) {
        
        let vc = ScrollViewVC.init(nibName: "ScrollViewVC", bundle: nil)
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
