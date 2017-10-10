//
//  FirstViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/09/17.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var foodCollection: UICollectionView!
    
    var restList:[String] = []
//    var selectList:[String] = []
    var selectImageList = [""]
//    var restImage = ["party","fam","level","les","typhoon","buera","free","gusto","saigou","ouchi","terumani","abashi","akuru","thiza","pure","seriyosa","rai","katuo","tougura","haisai","sasagawa","kaikou","furusato","zen","rihu","sky","kiyoi","nana","kagura","sou","ikki","dou","sama","shunkou","shou","kaihou","shiosai","taiko","en","hoo","kasa"]
    var rI = [""]
    var rI2 = ["typhoon","ouchi","terumani","akuru","thiza","shiosai","kasa"]
    var rI3 = ["saigou","abashi","haisai","sasagawa","furusato","dou","sama","shunkou","shou","kaihou","hoo"]
    var rI4 = ["level","les","free","sky"]
    var rI5 = ["rai"]
    var rI6 = ["pure","katuo","tougura","kaikou","zen","kiyoi"]
    var rI7 = ["party","fam","buera","gusto","seriyosa","rihu"]
    
    var rIdic = NSDictionary()
    
    var selectedImage: UIImage?
    var selectedRest = ""
    var sectionIndex:[String] = ["居酒屋","カフェ","島料理","バー","中華料理","和食","洋食"]

    override func viewDidLoad() {
        super.viewDidLoad()

    let filePath = Bundle.main.path(forResource: "genreList", ofType: "plist")
    let dic = NSDictionary(contentsOfFile: filePath!)
        
        rIdic = dic!["居酒屋"] as! NSDictionary
        rI = []
        for((key),data) in rIdic{
            var name:NSDictionary = key as! NSDictionary
            var datacontents:NSDictionary = data as! NSDictionary
            rI.append(name["key"] as! String)
            rI.append(datacontents["image"] as! String)
        }
//       rIdic2 = dic!["カフェ"] as! NSDictionary
//       rI2 = []
//       for(key,data) in rIdic2{
//         var name:NSDictionary = key as! NSDictionary
//         var datacontents:NSDictionary = data as! NSDictionary
//         rI2.append(name["key"] as! String)
//         rI2.append(datacontents["image"] as! String)
//        }
        
        
    }

    //セルの取得
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
         let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let label = cell.contentView.viewWithTag(1) as! UILabel
        let imageView = cell.contentView.viewWithTag(2) as! UIImageView

        switch (indexPath.section){
        case 0:
//            label.text = rI[indexPath.row]
            imageView.image = UIImage(named: rI[indexPath.row])
            
        case 1:
//            label.text = plistArr[indexPath.row]["Item 1"]
            imageView.image = UIImage(named: rI2[indexPath.row])

        case 2:
//            label.text = plistArr[indexPath.row]["Item 2"]
            imageView.image = UIImage(named: rI3[indexPath.row])

        case 3:
//            label.text = plistArr[indexPath.row]["Item 3"]
            imageView.image = UIImage(named: rI4[indexPath.row])

        case 4:
//            label.text = plistArr[indexPath.row]["Item 4"]
            imageView.image = UIImage(named: rI5[indexPath.row])

        case 5:
//            label.text = plistArr[indexPath.row]["Item 5"]
            imageView.image = UIImage(named: rI6[indexPath.row])

        case 6:
//            label.text = plistArr[indexPath.row]["Item 6"]
            imageView.image = UIImage(named: rI7[indexPath.row])

        default:
             print("error")
        }
        

        
//       let label = cell.contentView.viewWithTag(1) as! UILabel
//        label.text = plistArr[indexPath.row][""]
//        label.text = restList[indexPath.row]

        return cell
       
    }

//       せくしょん？？
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch(section){
        case 0:
            
            return 6
            
        case 1:
            return 7
            
        case 2:
            return 11
            
        case 3:
            return 4
            
        case 4:
            return 1
            
        case 5:
            return 6
            
        case 6:
            return 6
            
        default:
            print("error")
            return 0
        }
    }

//セクションの値
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

            let testSection = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TestSection", for: indexPath) as! TestCollectionReusableView
        testSection.testLabel.text = sectionIndex[indexPath.section]

            return testSection
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
       }
    }

    //modalviewにとぶ
    @IBAction func tapRec(_ sender: UIButton) {

//    let ranRes = Int(arc4random()) % restImage.count
//
//    let alert = UIAlertController(title: "迷ったら...", message:"", preferredStyle: .alert)
//
//    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//    //アラートにimageを表示
//        let imageView = UIImageView(frame: CGRect(x:0, y:0, width:100, height:100))
//        imageView.image = UIImage(named: restImage[ranRes])
//            alert.view.addSubview(imageView)
//
//    present(alert,animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}

