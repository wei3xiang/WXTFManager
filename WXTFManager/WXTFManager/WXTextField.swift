//
//  WXTextField.swift
//  LoginDemo
//
//  Created by 魏翔 on 16/2/21.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class WXTextField: UITextField {

    override init(frame: CGRect) {super.init(frame: frame); viewprepare()}
    
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder); viewprepare()}
    
    lazy var toolbar = WXToolbar.sharedInstance
    
    func viewprepare(){
    
        self.inputAccessoryView = toolbar
        
    }

}
