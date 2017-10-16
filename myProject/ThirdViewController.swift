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
    var selectedFav = ""
//    var myImage: UIImage!
//    var myImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        myTableView.register(MyCell.self, forCellReuseIdentifier: NSStringFromClass(MyCell.self))
//        self.view.addSubview(myTableView)
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
            cell.cellImage.frame = CGRect(x:0, y:0, width:60, height:40)
            cell.textLabel?.text = favArr[indexPath.row]
            
            //image表示する？
            let filePath = Bundle.main.path(forResource: "restaurantList", ofType: "plist")
            let dic = NSDictionary(contentsOfFile:filePath!)
            
            for(key,data) in dic!{
                let dicForData:NSDictionary = data as! NSDictionary
                if((key as! NSString) as String == favArr[indexPath.row]){
//                    myImage = UIImage(named: dicForData["image"] as! String)
//                    myImageView = UIImageView(image: myImage)
//                    myTableView.addSubview(myImageView)
            
                cell.imageView?.image = UIImage(named:dicForData["image"] as! String)

                }else{
                    let filePath = Bundle.main.path(forResource: "actList", ofType: "plist")
                    let dic = NSDictionary(contentsOfFile:filePath!)
                    
                    for(key,data) in dic!{
                        let dicForData:NSDictionary = data as! NSDictionary
                        if((key as! NSString) as String == favArr[indexPath.row]){
                cell.imageView?.image = UIImage(named:dicForData["image"] as! String)

//                            myImage = UIImage(named: dicForData["image"] as! String)
//                            myImageView = UIImageView(image: myImage)
//                            myTableView.addSubview(myImageView)
                            

                }
              }
             }
                
//                myTableView.frame.width ==  -60
//            cell.myImageView.frame = CGRect(x:0, y:0, width:60, height:40)
        }
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
    
    //選択したらdetailviewへ
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFav = favArr[indexPath.row]
        performSegue(withIdentifier: "showFavDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){
        if segue.identifier == "showFavDetail" {
            let dv = (segue.destination as? DetailViewController)!
            dv.scSelectedRest = selectedFav
   
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//class MyCell: UITableViewCell {
//    var myLabel: UILabel!
//    var myImage: UIImage!
//    var myImageView: UIImageView!
//    var favArr:[String] = []
//
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//    }

//    func tableViewCell(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        let filePath = Bundle.main.path(forResource: "restaurantList", ofType: "plist")
//        let dic = NSDictionary(contentsOfFile:filePath!)
//
//        for(key,data) in dic!{
//            let dicForData:NSDictionary = data as! NSDictionary
//            if((key as! NSString) as String == favArr[indexPath.row]){
//                myImage = UIImage(named: dicForData["image"] as! String)
//                myImageView = UIImageView(image: myImage)
//                contentView.addSubview(myImageView)
//
//            }else{
//                let filePath = Bundle.main.path(forResource: "actList", ofType: "plist")
//                let dic = NSDictionary(contentsOfFile:filePath!)
//
//                for(key,data) in dic!{
//                    let dicForData:NSDictionary = data as! NSDictionary
//                    if((key as! NSString) as String == favArr[indexPath.row]){
//                        myImage = UIImage(named: dicForData["image"] as! String)
//                        myImageView = UIImageView(image: myImage)
//                        contentView.addSubview(myImageView)
//                    }
//                }
//            }
//        }
//        return cell
//    }
    
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder: ) has not been implemented")
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        myImageView.frame = CGRect(x: 0, y: 0, width: 60, height: frame.height)
//    }
    
//}



