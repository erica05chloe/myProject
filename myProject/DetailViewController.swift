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
    
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myInform: UITextView!
    @IBOutlet weak var myDesc: UITextView!
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if scSelectedRest == "" {
            
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
            }else if scSelectedRest == nil{
                
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
    
    @IBAction func returnToFirst(segue: UIStoryboardSegue) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
