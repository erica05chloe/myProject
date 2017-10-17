//
//  scModalViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/10/17.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import UIKit

class scModalViewController: UIViewController {

    @IBOutlet weak var beachImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    @IBAction func tapClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
