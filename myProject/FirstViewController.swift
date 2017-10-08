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
    var selectList:[String] = []
    var selectImageList = [""]
    var restImage = ["party","fam","level","les","typhoon","buera","free","gusto","saigou","ouchi","terumani","abashi","akuru","thiza","pure","seriyosa","rai","katuo","tougura","haisai","sasagawa","kaikou","furusato","zen","rihu","sky","kiyoi","nana","kagura","sou","ikki","dou","sama","shunkou","shou","kaihou","shiosai","taiko","en","hoo","kasa"]
    
    var selectedImage: UIImage?
    var selectedRest = ""
    var sectionIndex:[String] = ["居酒屋","カフェ","島料理","バー","中華料理","和食","洋食"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //セルの取得
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
         let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = selectList[indexPath.row]
        let imageView = cell.contentView.viewWithTag(2) as! UIImageView
        imageView.image = UIImage(named:selectImageList[indexPath.row])

//        label.text = restList[indexPath.row]
//        imageView.image = UIImage(named: restImage[indexPath.row])

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
//        }else if segue.identifier == "moreRest" {
//                let dv = (segue.destination as? RestView)!
//                dv.scSelectedGenre = selectedGenre
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

