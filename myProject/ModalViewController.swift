//
//  ModalViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/09/27.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController: UIViewController{
    
    var restList:[String] = []
    var restImage = ["party","fam","level","les","typhoon","buera","free","gusto","saigou","ouchi","terumani","abashi","akuru","thiza","pure","seriyosa","rai","katuo","tougura","haisai","sasagawa","kaikou","furusato","zen","rihu","sky","kiyoi","nana","kagura","sou","ikki","dou","sama","shunkou","shou","kaihou","shiosai","taiko","en","hoo","kasa"]

    @IBOutlet weak var recImage: UIImageView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    let ranRes = Int(arc4random()) % restImage.count
    recImage.image = UIImage(named: restImage[ranRes])


}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
}
    
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        for touch: UITouch in touches {
//            let tag = touch.view!.tag
//            print(tag)
//            if tag == 1 {
//                dismiss(animated: true, completion: nil)
//            }
//        }
//    }
    
    @IBAction func didTapClose(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

