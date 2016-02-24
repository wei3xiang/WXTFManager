//
//  TextField+FilterGenerator.swift
//  WXTFManager
//
//  Created by 魏翔 on 16/2/24.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

extension WXTextField{
    
    class func filterGeneratorTF(tfClass: AnyClass)->(subView: UIView)->Bool{
        
        return { subView in
            
            return subView.isKindOfClass(tfClass)
            
        }
        
    }
    
    class func wxTextFieldWithView(view: UIView)->WXTextField{
        
        return view as! WXTextField
    
    }
    
    
}