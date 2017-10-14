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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if myDefault.object(forKey: "favArr") != nil{
            favArr = myDefault.object(forKey: "favArr") as! [String]
        }
        print(favArr)
        myTableView.reloadData()
    }
        
        //行数の設定
        func tableView(_ tableView:UITableView, numberOfRowsInSection: Int) -> Int{
            return favArr.count
        }
        
        //セルに表示する文字
        func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            
            let filePath = Bundle.main.path(forResource: "restaurantList", ofType: "plist")
            let dic = NSDictionary(contentsOfFile:filePath!)
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = favArr[indexPath.row]
            

            //image表示する？
            for(key,data) in dic!{
                let dicForData:NSDictionary = data as! NSDictionary
                if((key as! NSString) as String == favArr[indexPath.row]){
                cell.imageView?.image = UIImage(named:dicForData["image"] as! String)
                }else{
                    let filePath = Bundle.main.path(forResource: "actList", ofType: "plist")
                    
                    let dic = NSDictionary(contentsOfFile:filePath!)
                    for(key,data) in dic!{
                        let dicForData:NSDictionary = data as! NSDictionary
                        if((key as! NSString) as String == favArr[indexPath.row]){
                            cell.imageView?.image = UIImage(named:dicForData["image"] as! String)
                }
              }
             }
            }
            
            cell.imageView?.contentMode = .scaleToFill
            return cell
    }
    
    // すわいぷで消去
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "delete"){(action, index) -> Void in self.favArr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
            self.myDefault.removeObject(forKey: "favArr")
            self.myDefault.synchronize()
    }
    return [deleteButton]
    }
        
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
