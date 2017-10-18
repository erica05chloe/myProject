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
    @IBOutlet weak var tableImage: UIImageView!
    
    var myDefault = UserDefaults.standard
    var favArr:[String] = []
    var selectedFav = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        tableImage.image = UIImage(named: "top")
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
            
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

            cell.cellText?.text = favArr[indexPath.row]
            
            //image表示する？
            let filePath = Bundle.main.path(forResource: "restaurantList", ofType: "plist")
            let dic = NSDictionary(contentsOfFile:filePath!)
            
            for(key,data) in dic!{
                let dicForData:NSDictionary = data as! NSDictionary
                if((key as! NSString) as String == favArr[indexPath.row]){
           
                cell.cellImage?.image = UIImage(named:dicForData["image"] as! String)

                }else{
                    let filePath = Bundle.main.path(forResource: "actList", ofType: "plist")
                    let dic = NSDictionary(contentsOfFile:filePath!)
                    
                    for(key,data) in dic!{
                        let dicForData:NSDictionary = data as! NSDictionary
                        if((key as! NSString) as String == favArr[indexPath.row]){
                cell.cellImage?.image = UIImage(named:dicForData["image"] as! String)
                          

                }
              }
             }
                
       }
            return cell
    }
    
    // すわいぷで消去
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "delete"){(action, index) -> Void in self.favArr.remove(at: indexPath.row)
            self.myDefault.set(self.favArr, forKey:"favArr")
        tableView.deleteRows(at: [indexPath], with: .fade)
//            self.myDefault.removeObject(forKey: "favArr")
            self.myDefault.synchronize()
    }
    return [deleteButton]
    }
    
    //選択したらdetailviewへ
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFav = favArr[indexPath.row]
        performSegue(withIdentifier: "showFavDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){
        if segue.identifier == "showFavDetail" {
            let dv = (segue.destination as? DetailViewController)!
                
                let filePath = Bundle.main.path(forResource: "restaurantList", ofType: "plist")
                let dic = NSDictionary(contentsOfFile:filePath!)
                
                dv.scSelectedRest = ""
                dv.scSelectedAct = ""
                
                for(key,data) in dic!{

                if((key as! NSString) as String == selectedFav){
        
            dv.scSelectedRest = selectedFav
                    }
        }
                    
                    if dv.scSelectedRest == "" {
                        dv.scSelectedAct = selectedFav
                    }
            }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




