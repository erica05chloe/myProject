//
//  SecondViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/09/17.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import UIKit
import WebKit

class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
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
   
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //webview
        let url = URL(string: "https://www.google.com/maps/d/embed?mid=18MI9u6nJfjb9W6jlzh3__tKlUH4&hl=en_US")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
        //ファイルパスを取得
        let filePath = Bundle.main.path(forResource: "actList", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile:filePath!)
        
        for(key,data) in dic! {
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
