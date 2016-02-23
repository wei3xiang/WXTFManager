//
//  WXTFManager.swift
//  LoginDemo
//
//  Created by 魏翔 on 16/2/22.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class WXTFManagerVC: UIViewController {
    
    var superVC: UIViewController!
    
    var scrollView: UIScrollView?
    
    var tfs: [UITextField]!
    
    var currentIndext = 0
    
    class func registerManageWith(vc: UIViewController, scrollView: UIScrollView? ,tfs: [UITextField]){
        
        let managerVC = WXTFManagerVC()
        
        vc.addChildViewController(managerVC)
        
        managerVC.superVC = vc
        
        managerVC.tfs = tfs
        
        managerVC.registerKeyBoardNotification()
        
        managerVC.setCurrentIndex()
        
        managerVC.setToolbarClosures()
        
        if scrollView != nil{
            managerVC.scrollView = scrollView
        }
    }
    
    //设置toolbar的closure方法
    func setToolbarClosures(){
        
        let tf = tfs.first as? WXTextField
        
        if let toolbar = tf?.toolbar{
            
            toolbar.toolbarActionClosure = {
                toolbarActionEnum in
                switch toolbarActionEnum{
                case .PreviousOne: if self.currentIndext > 0{
                    self.currentIndext -= 1
                    self.tfs[self.currentIndext].becomeFirstResponder()
                    }
                case .NextOne: if self.currentIndext < self.tfs.count - 1{
                    self.currentIndext += 1
                    self.tfs[self.currentIndext].becomeFirstResponder()
                    }
                case .Completion: self.superVC.view.endEditing(true)
                }
            }
        }
        
    }
    
    //设置currentIndex
    func setCurrentIndex(){
        for (index,subview) in tfs.enumerate(){
            
            if index == 0{
                subview.becomeFirstResponder()
            }
            
            if subview.isFirstResponder(){
                self.currentIndext = index
            }
            
        }

    }
    
    //注册键盘变化通知
    func registerKeyBoardNotification(){
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    func keyBoardWillShow(notification: NSNotification){
        
        if let endFrame = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"]?.CGRectValue{
            
            let boardEndY = endFrame.origin.y
            
            let currentTFFrame = tfs[self.getCurrentRespondTFIndex()].frame
            
            let currentMaxY = CGRectGetMaxY(currentTFFrame)
            
            if boardEndY < currentMaxY{
                
                if scrollView != nil{
                    
                    let contentInsets = UIEdgeInsetsMake(0.0, 0.0, endFrame.height, 0.0)
                    
                    scrollView!.contentInset = contentInsets
                    
                    scrollView!.scrollIndicatorInsets = contentInsets
                    
                    scrollView!.scrollRectToVisible(currentTFFrame, animated:true)
            
                }else{
                
                    superVC.view.transform = CGAffineTransformMakeTranslation(0, boardEndY - currentMaxY)
                }
                
            }else{
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    
                    self.superVC.view.transform = CGAffineTransformIdentity
                    
                })
            }
        }
        
    }
    
    func keyBoardWillHide(notification: NSNotification){
        
        UIView.animateWithDuration(0.25) { () -> Void in
            
            self.superVC.view.transform = CGAffineTransformIdentity
            
            if self.scrollView != nil{
                
                let contentInsets = UIEdgeInsetsZero
                
                self.scrollView!.contentInset = contentInsets
                
                self.scrollView!.scrollIndicatorInsets = contentInsets
                
            }
            
        }
    }
    
    //获取当前激活状态TF的Index
    func getCurrentRespondTFIndex()->Int{
        
        for (index,tf) in tfs.enumerate(){
            
            if tf.isFirstResponder(){
                
                self.currentIndext = index
                
            }
            
        }
        return self.currentIndext
    }
    
    class func canCelManage(vc: UIViewController){
        
        vc.view.endEditing(true)
        
    }
    
}
