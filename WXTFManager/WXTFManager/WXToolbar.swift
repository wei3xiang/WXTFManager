//
//  WXToolbar.swift
//  LoginDemo
//
//  Created by 魏翔 on 16/2/21.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class WXToolbar: UIToolbar {
    
    var toolbarActionClosure: (ToolbarActionEnum->Void)!

    override init(frame: CGRect) {super.init(frame: frame); viewprepare()}
    
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder); viewprepare()}
    
    class var sharedInstance : WXToolbar {
        
        struct Static {
            
            static let instance : WXToolbar = WXToolbar()
        }
        
        return Static.instance
    }
    
    func viewprepare(){
        
        let nextBtn = UIBarButtonItem(title: "下一个", style: UIBarButtonItemStyle.Plain, target: self, action: "didClickTheNext")
        
        let previousBtn = UIBarButtonItem(title: "上一个", style: UIBarButtonItemStyle.Plain, target: self, action: "didClickPrevious")
        
        let flexBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let completionBtn = UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.Plain, target: self, action: "didClickCompletion")
        
        self.items = [previousBtn,nextBtn,flexBtn,completionBtn]
        
        self.frame = CGRectMake(0, 0, 320, 44)
    }

    func didClickTheNext(){toolbarActionClosure?(.NextOne)}
    
    func didClickPrevious(){toolbarActionClosure?(.PreviousOne)}
    
    func didClickCompletion(){toolbarActionClosure?(.Completion)}
}
