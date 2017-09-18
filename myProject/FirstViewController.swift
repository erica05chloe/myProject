//
//  FirstViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/09/17.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var foodCollection: UICollectionView!
    var restList:[String] = []
    var restImage = ["akuru","buera","dou","en","fam","furusato","gusto","haisai","hoo","ikki","kagura","kaihou","kasa","katsuo","kiyoi","les","nana","ouchi","party","pure","rai","ri-hu","saigou","sama","sasagawa","seriyosa","shiosai","sou","taiko","terumani","thiza","tougura","ryphoon","zen"]
    
    var selectedImage: UIImage?
    var selectedRest = ""
    
    //セルの取得
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
         let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = restList[indexPath.row]
        
        let imageView = cell.contentView.viewWithTag(2) as! UIImageView
        imageView.image = UIImage(named: restImage[indexPath.row])
        
        return cell
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restList.count
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ファイルパスを取得
        let filePath = Bundle.main.path(forResource: "restaurantList", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile:filePath!)
        
        for(key,data) in dic! {
            print(key)
            restList.append(key as! String)
           // selectedImage.image = UIImage(named: dicForData["image"] as! String)
        }
        print(restList)

        
    }
    
    //選択されたセル
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRest = restList[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "showDetail" {
            let dv = (segue.destination as? DetailViewController)!
            dv.scSelectedRest = selectedRest
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

