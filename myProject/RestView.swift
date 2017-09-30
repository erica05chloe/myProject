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

    var moreRest:[String] = []
    var moreRestImage = [""]
    
    //セルの取得
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreRest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = moreRest[indexPath.row]
        
        let imageView = cell.contentView.viewWithTag(2) as! UIImageView
        imageView.image = UIImage(named: moreRestImage[indexPath.row])
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ファイルパスを取得
        let filePath = Bundle.main.path(forResource: "genreList", ofType: "plist")
        
        //型に格納
        let dic = NSDictionary(contentsOfFile:filePath!)
        
        for(key,data) in dic! {
            print(key)
            moreRest.append(key as! String)
        }
        moreRest.sort(by: {$0 < $1})
        print(moreRest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
