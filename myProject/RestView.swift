//
//  RestView.swift
//  myProject
//
//  Created by erica chloe on 2017/09/24.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import Foundation
import UIKit

class RestView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var scSelectedGenre = ""
    
    @IBAction func backTo(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {})
    }
    

    @IBOutlet weak var RestCollection: UICollectionView!

    var genreRest:[String] = []
    var genreRestImage = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //セルの取得
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreRest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //ファイルパスを取得
        let filePath = Bundle.main.path(forResource: "genreList", ofType: "plist")
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile:filePath!)
        print(dic?[scSelectedGenre] as Any)
        
        for(key,data) in dic!{
            let dicForData:NSDictionary = data as! NSDictionary
            if((key as! NSString) as String == scSelectedGenre){
                
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = genreRest[indexPath.row]
        
        let imageView = cell.contentView.viewWithTag(2) as! UIImageView
       imageView.image = UIImage(named: genreRestImage[indexPath.row])
        
            }
            
        }
        return cell
    }


    
        //ファイルパスを取得
//        let filePath = Bundle.main.path(forResource: "genreList", ofType: "plist")
//        //ファイルの内容を読み込んでディクショナリー型に格納
//        let dic = NSDictionary(contentsOfFile:filePath!)
//        print(dic?[scSelectedGenre] as Any)
//
//        for(key,data) in dic!{
//            let dicForData:NSDictionary = data as! NSDictionary
//            if((key as! NSString) as String == scSelectedGenre){

//                let label.text = dicForData["key"] as! String
//              let imageView;.image = UIImage(named:dicForData["image"] as! String)

//            }
//    }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
