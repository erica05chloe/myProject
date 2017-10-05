//
//  FirstViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/09/17.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource{
    
    private var myUIPicker: UIPickerView!
    private let genre = ["洋食","和食","中華","島料理","カフェ","居酒屋","バー"]

    @IBOutlet weak var foodCollection: UICollectionView!
    
    var restList:[String] = []
    var restImage = ["party","fam","level","les","typhoon","buera","free","gusto","saigou","ouchi","terumani","abashi","akuru","thiza","pure","seriyosa","rai","katuo","tougura","haisai","sasagawa","kaikou","furusato","zen","rihu","sky","kiyoi","nana","kagura","sou","ikki","dou","sama","shunkou","shou","kaihou","shiosai","taiko","en","hoo","kasa"]
    var restImage2 = [["nana","kagura","sou","ikki","taiko","en"],["typhoon","terumani","ouchi","akura","thiza","shiosai","kasa"],["saigou","abashi","haisai","sasagawa","furusato","dou","sama","shunkou","shou","kaihou","hoo"],["level","les","free","sky"],["rai"],["pure","katuo","tougura","kaikou","zen","kiyoi"],["party","fam","buera","gusto","seriyosa","rihu"]]
    
    var selectedImage: UIImage?
    var selectedRest = ""
    var selectedGenre = ""
    var sectionIndex:[String] = ["洋食","和食","中華","島料理","カフェ","居酒屋","バー"]

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

//       セル（データ）の個数
       return restImage2[section].count
//        return restList.count
    }
    
//       せくしょん？？
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionIndex.count
    }


//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
//    {
//        let testSection = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TestSection", for: indexPath) as! TestCollectionReusableView
//        testSection.testLabel.text = sectionIndex[indexPath.section]
//
//        return testSection
//    }
//
    
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
        restList.sort(by: {$0 < $1})
        print(restList)
        
        //pickerviewの設定
        myUIPicker = UIPickerView()
        myUIPicker.frame = CGRect(x: 0, y: 0, width: 250.0, height: 120.0)
        myUIPicker.delegate = self
        myUIPicker.dataSource = self
        self.view.addSubview(myUIPicker)

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row] as? String
    }
    //pickerviewで選択された時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGenre = genre[row]
        performSegue(withIdentifier: "moreRest", sender: nil)
    }

    //選択されたセル
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRest = restList[indexPath.row]
        performSegue(withIdentifier: "showEatDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "showEatDetail" {
            let dv = (segue.destination as? DetailViewController)!
            dv.scSelectedRest = selectedRest
        }else if segue.identifier == "moreRest" {
                let dv = (segue.destination as? RestView)!
                dv.scSelectedGenre = selectedGenre
       }
    }

    //オススメボタンが押された時
    @IBAction func tapRec(_ sender: UIButton) {

    let ranRes = Int(arc4random()) % restImage.count
    
    let alert = UIAlertController(title: "迷ったら...", message:"", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    //アラートにimageを表示
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width:100, height:100))
        imageView.image = UIImage(named: restImage[ranRes])
            alert.view.addSubview(imageView)

    present(alert,animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}
