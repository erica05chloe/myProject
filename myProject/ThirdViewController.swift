//
//  ThirdViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/09/17.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var myDefault = UserDefaults.standard
    var favArr:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if myDefault.object(forKey: "favArr") != nil{
            favArr = myDefault.object(forKey: "favArr") as! [String]
        }
        print(favArr)
        
    }
        
        //行数の設定
        func tableView(_ tableView:UITableView, numberOfRowsInSection: Int) -> Int{
            return favArr.count
        }
        
        //セルに表示する文字
        func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "favArr[indexPath.row]"
            return cell
    }
        
       
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
