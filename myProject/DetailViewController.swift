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

class DetailViewController: UIViewController {
    
    var scSelectedRest = ""
    var scSelectedAct = ""
    
    @IBAction func tapBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {})
    }
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myInform: UITextView!
    @IBOutlet weak var myDesc: UITextView!
    @IBOutlet weak var myMap: MKMapView!
    
    //お気に入りbutton
//    @IBOutlet weak var tapStar: UIButton!
//    let image0:UIImage = UIImage(named: "fav1.png")!
//    //let image1:UIImage = UIImage(named: "fav2.png")!
    
    var myDefault = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //userdefaultでお気に入り登録
//        myDefault.set(true, forKey:"fav")
//
//        if favArr == true {
//            addFav.setBackgroundImage(image0, for: UIControlState())
//        }else{
//            addFav.setBackgroundImage(image1, for: UIControlState())
//        }

        if scSelectedAct == "" {
            
            //ファイルパスを取得
            let filePath = Bundle.main.path(forResource: "restaurantList", ofType: "plist")
            //ファイルの内容を読み込んでディクショナリー型に格納
            let dic = NSDictionary(contentsOfFile:filePath!)
            print(dic?[scSelectedRest])
            
            //restaurant plistから読み込む
            
            for(key,data) in dic!{
                let dicForData:NSDictionary = data as! NSDictionary
                if((key as! NSString) as String == scSelectedRest){
                    navigationItem.title = scSelectedRest
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
                    if((key as! NSString) as String == scSelectedAct){
                        navigationItem.title = scSelectedAct
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
    }
    
    //タップして配列に追加
    @IBAction func tapStar(_ sender: UIButton) {
        // 空の配列を用意
        var favArr:[String] = []
        
        if myDefault.object(forKey: "favArr") != nil{
            favArr = myDefault.object(forKey: "favArr") as! [String] }
        if (scSelectedAct == ""){
            
            favArr.append(scSelectedRest)

        }else{
            favArr.append(scSelectedAct)
        }
            myDefault.set(favArr, forKey: "favArr")
            myDefault.synchronize()

    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
