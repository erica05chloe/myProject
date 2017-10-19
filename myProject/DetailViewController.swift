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
import CoreLocation

class DetailViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    var scSelectedRest = ""
    var scSelectedAct = ""
    
    var myLocationManager: CLLocationManager!
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //現在地をだす準備
        myLocationManager = CLLocationManager()
        myLocationManager.delegate = self
        myLocationManager.distanceFilter = 100.0
        myLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters

        //セキュリティ認証
        let status = CLLocationManager.authorizationStatus()
        
        if(status != CLAuthorizationStatus.authorizedWhenInUse) {
            
            print("not determined")
            
            myLocationManager.requestWhenInUseAuthorization()
        }

        //位置情報の更新
        myLocationManager.startUpdatingLocation()

        myMap.delegate = self

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
            
            // GPSから値を取得した際に呼び出されるメソッド.
            func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                
                print("didUpdateLocations")
                
                
                for location in locations {
                    
                    //中心座標
                    let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                    
                    //表示範囲
                    let span = MKCoordinateSpanMake(0.07, 0.07)
                    
                    //中心座標と表示範囲をmymapに登録
                    let region = MKCoordinateRegionMake(center, span)
                    myMap.setRegion(region, animated:true)
                    
                    //ピンを作成してmymapに登録
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                    myMap.addAnnotation(annotation)
                    
                }
        }

//                // 配列から現在座標を取得.
//                let myLocations: NSArray = locations as NSArray
//                let myLastLocation: CLLocation = myLocations.lastObject as! CLLocation
//                let myLocation:CLLocationCoordinate2D = myLastLocation.coordinate
//
//                print("\(myLocation.latitude), \(myLocation.longitude)")
//
//                let myLat: CLLocationDegrees = 27.366219
//                let myLon: CLLocationDegrees = 128.600533
//                let myCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLon) as CLLocationCoordinate2D
//
//
//                let myLatDist : CLLocationDistance = 100
//                let myLonDist : CLLocationDistance = 100
//
//                let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(myLocation, myLatDist, myLonDist);
//
//                myMap.setRegion(region, animated: true)
//            }
            
            // Regionが変更した時に呼び出されるメソッド.
            func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
                print("regionDidChangeAnimated")
            }
            
            // 認証が変更された時に呼び出されるメソッド.
            func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
                switch status{
                case .authorizedWhenInUse:
                    print("AuthorizedWhenInUse")
                case .authorized:
                    print("Authorized")
                case .denied:
                    print("Denied")
                case .restricted:
                    print("Restricted")
                case .notDetermined:
                    print("NotDetermined")
                case .authorizedAlways:
                    print("AuthorizedAlways")
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
        
        if favBtn.isSelected {
          if (scSelectedAct == ""){
            favArr.append(scSelectedRest)
            
          }else{
            favArr.append(scSelectedAct)
          }
     
        //配列から消去
    }else{
        if (scSelectedAct == ""){
            var i = 0
            for fav in favArr {
    
                if fav == scSelectedRest {
                    favArr.remove(at: i)
                }else{
                    i += 1
                }
         }
    
        }else{
            var i = 0
            for fav in favArr {
    
            if fav == scSelectedAct {
                favArr.remove(at: i)
            }else{
                i += 1
            }
          }
     }
    
    }
        

        myDefault.set(favArr, forKey: "favArr")
        self.myDefault.synchronize()
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
