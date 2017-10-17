//
//  DetailViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/09/17.
//  Copyright © 2017年 erica chloe. All rights reserved.
//  

import Foundation
import UIKit
import MapKit
import FaveButton

class DetailViewController: UIViewController {
    
    var scSelectedRest = ""
    var scSelectedAct = ""
    
    
    @IBAction func tapBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {})
    }
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myInform: UITextView!
    @IBOutlet weak var myDesc: UITextView!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var favBtn: FaveButton!
    
    var myDefault = UserDefaults.standard
    var upFlag:Bool = true  //false not tap / true tapped
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if scSelectedAct == "" {
            
            //ファイルパスを取得
            let filePath = Bundle.main.path(forResource: "restaurantList", ofType: "plist")
            //ファイルの内容を読み込んでディクショナリー型に格納
            let dic = NSDictionary(contentsOfFile:filePath!)
            print(dic?[scSelectedRest])
            
            //genreplistから読み込む(理想)
            
            for(key,data) in dic!{
                let dicForData:NSDictionary = data as! NSDictionary
                let name = key as! String
                if((key as! NSString) as String == scSelectedRest){
                    navigationItem.title = scSelectedRest
                    myLabel.text = name
                    myDesc.text = dicForData["description"] as! String
                    myInform.text = dicForData["inform"] as! String
                    myImage.image = UIImage(named:dicForData["image"] as! String)
                    
                    let latitude:String = dicForData["latitude"] as! String
                    let longitude:String = dicForData["longitude"] as! String
                    
                    let coordinate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
                    let span = MKCoordinateSpanMake(0.007, 0.007)
                    let region = MKCoordinateRegionMake(coordinate, span)
                    myMap.setRegion(region, animated:true)
                    
                    //ピンを生成
                    let myPin: MKPointAnnotation = MKPointAnnotation()
                    myPin.coordinate = coordinate
                    myMap.addAnnotation(myPin)
                }
              }
            } else {
                
                //actList plistから読み込む
                //ファイルパスを取得
                let filePath = Bundle.main.path(forResource: "actList", ofType: "plist")
                //ファイルの内容を読み込んでディクショナリー型に格納
                let dic = NSDictionary(contentsOfFile:filePath!)
                
                for(key,data) in dic!{
                    let dicForData:NSDictionary = data as! NSDictionary
                    let name = key as! String
                    if((key as! NSString) as String == scSelectedAct){
                        navigationItem.title = scSelectedAct
                        myLabel.text = name
                        myDesc.text = dicForData["description"] as! String
                        myInform.text = dicForData["inform"] as! String
                        myImage.image = UIImage(named:dicForData["image"] as! String)
                        
                        let latitude:String = dicForData["latitude"] as! String
                        let longitude:String = dicForData["longitude"] as! String
                        
                        let coordinate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
                        let span = MKCoordinateSpanMake(0.007, 0.007)
                        let region = MKCoordinateRegionMake(coordinate, span)
                        myMap.setRegion(region, animated:true)
                        
                        //ピンを生成
                        let myPin: MKPointAnnotation = MKPointAnnotation()
                        myPin.coordinate = coordinate
                        myMap.addAnnotation(myPin)
                    }
            }
        }
        
        
        //星の状態を設定
        favBtn.isSelected = false
        
        //空の配列を用意
        var favArr:[String] = []
        
        if myDefault.object(forKey: "favArr") != nil{
            favArr = myDefault.object(forKey: "favArr") as! [String]
            
        }
        
        for i in favArr{
            print(i)
            
            if myLabel.text == i {
                favBtn.isSelected = true
            }
        }

    }
    
    //タップして配列に追加
    @IBAction func tappedStar(_ sender: FaveButton){
        
        //空の配列
       var favArr:[String] = []
        
        //配列に追加
        if myDefault.object(forKey: "favArr") != nil{
            favArr = myDefault.object(forKey: "favArr") as! [String]
        }
        if (scSelectedAct == ""){
            favArr.append(scSelectedRest)
            
        }else{
            favArr.append(scSelectedAct)
        }
        
        myDefault.set(favArr, forKey: "favArr")
        self.myDefault.synchronize()
        
    }
    
    
    func favBtn(_ favBtn: FaveButton,didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        var favArr:[String] = []
        
        if favBtn.isSelected == false{
            favArr.remove(at: indexPath.row)
            self.myDefault.removeObject(forKey: "favArr")
            self.myDefault.synchronize()
        }
        
        
        }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
