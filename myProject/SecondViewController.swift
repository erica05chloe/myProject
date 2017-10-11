//
//  SecondViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/09/17.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,MKMapViewDelegate{
    
    @IBOutlet weak var actCollection: UICollectionView!
    var actList:[String] = []
    var actImage = ["shac","dive","gt","sup","seadream","muga","eco","okik","bashou","takachi"]
    var selectedImage: UIImage?
    var selectedAct = ""
    
    //セルの取得
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = actList[indexPath.row]
        
        let imageView = cell.contentView.viewWithTag(2) as! UIImageView
        imageView.image = UIImage(named: actImage[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actList.count
    }
   
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //map
        let coordinate = CLLocationCoordinate2DMake(27.368889, 128.566667)
        let span = MKCoordinateSpanMake(0.1,0.1)
        let region = MKCoordinateRegionMake(coordinate, span)
        myMap.setRegion(region, animated:true)
        
        let myPin1 = MKPointAnnotation()
        myPin1.coordinate = CLLocationCoordinate2DMake(27.43577, 128.71264)
        myPin1.title = "シャーシ"
        myMap.addAnnotation(myPin1)
        
        let myPin2 = MKPointAnnotation()
        myPin2.coordinate = CLLocationCoordinate2DMake(27.40898, 128.63441)
        myPin2.title = "ワンジョ"
        myMap.addAnnotation(myPin2)
        
        let myPin3 = MKPointAnnotation()
        myPin3.coordinate = CLLocationCoordinate2DMake(27.40879, 128.62817)
        myPin3.title = "イダシチ"
        myMap.addAnnotation(myPin3)
        
        let myPin4 = MKPointAnnotation()
        myPin4.coordinate = CLLocationCoordinate2DMake(27.40613, 128.62355)
        myPin4.title = "ウパマ"
        myMap.addAnnotation(myPin4)
        
        let myPin5 = MKPointAnnotation()
        myPin5.coordinate = CLLocationCoordinate2DMake(27.38701, 128.52295)
        myPin5.title = "トゥマイ"
        myMap.addAnnotation(myPin5)
        
        let myPin6 = MKPointAnnotation()
        myPin6.coordinate = CLLocationCoordinate2DMake(27.37237, 128.52038)
        myPin6.title = "シビキニャ"
        myMap.addAnnotation(myPin6)
        
        let myPin7 = MKPointAnnotation()
        myPin7.coordinate = CLLocationCoordinate2DMake(27.35612, 128.52888)
        myPin7.title = "カネク"
        myMap.addAnnotation(myPin7)
        
        let myPin8 = MKPointAnnotation()
        myPin8.coordinate = CLLocationCoordinate2DMake(27.33376, 128.54943)
        myPin8.title = "ヨンドメ"
        myMap.addAnnotation(myPin8)
        
        let myPin9 = MKPointAnnotation()
        myPin9.coordinate = CLLocationCoordinate2DMake(27.33943, 128.59564)
        myPin9.title = "イニナ"
        myMap.addAnnotation(myPin9)
        
        let myPin10 = MKPointAnnotation()
        myPin10.coordinate = CLLocationCoordinate2DMake(27.36304, 128.62468)
        myPin10.title = "与和の浜"
        myMap.addAnnotation(myPin10)
        
        let myPin11 = MKPointAnnotation()
        myPin11.coordinate = CLLocationCoordinate2DMake(27.43223, 128.70964)
        myPin11.title = "ビシ"
        myMap.addAnnotation(myPin11)
        
        let myPin12 = MKPointAnnotation()
        myPin12.coordinate = CLLocationCoordinate2DMake(27.38091, 128.64818)
        myPin12.title = "平瀬"
        myMap.addAnnotation(myPin12)
        
        let myPin13 = MKPointAnnotation()
        myPin13.coordinate = CLLocationCoordinate2DMake(27.39583, 128.5579)
        myPin13.title = "沖泊"
        myMap.addAnnotation(myPin13)
        
        
        //ファイルパスを取得
        let filePath = Bundle.main.path(forResource: "actList", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile:filePath!)
        
        for(key,_) in dic! {
            print(key)
            actList.append(key as! String)
        }
        actList.sort(by: {$0 < $1})
        print(actList)
        
    }
    
    //選択されたセル
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedAct = actList[indexPath.row]
        performSegue(withIdentifier: "showActDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "showActDetail" {
            let dv = (segue.destination as? DetailViewController)!
            dv.scSelectedAct = selectedAct
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
