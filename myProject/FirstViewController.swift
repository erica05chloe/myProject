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
    var selectImageList = [""]

    // plistから取得する変数
    var rI = [""]
    var rIname = [""]
    var rI2 = [""]
    var rI2name = [""]
    var rI3 = [""]
    var rI3name = [""]
    var rI4 = [""]
    var rI4name = [""]
    var rI5 = [""]
    var rI5name = [""]
    var rI6 = [""]
    var rI6name = [""]
    var rI7 = [""]
    var rI7name = [""]
    var rIdic = NSDictionary()
    
    var selectedImage: UIImage?
    var selectedRest = ""
    var sectionIndex:[String] = ["居酒屋","Cafe","島料理","Bar","中華","和食","洋食"]

    override func viewDidLoad() {
        super.viewDidLoad()

    let filePath = Bundle.main.path(forResource: "genreList", ofType: "plist")
    let dic = NSDictionary(contentsOfFile: filePath!)
        
        rIdic = dic!["居酒屋"] as! NSDictionary
        rI = []
        rIname = []
        for(key,data) in rIdic{
            let name = key as! String
            let datacontents:NSDictionary = data as! NSDictionary
            rIname.append(name )
            rI.append(datacontents["image"] as! String)
        }
       rIdic = dic!["カフェ"] as! NSDictionary
       rI2 = []
       rI2name = []
       for(key,data) in rIdic{
        let name = key as! String
        let datacontents:NSDictionary = data as! NSDictionary
        rI2name.append(name )
         rI2.append(datacontents["image"] as! String)
        }
        rIdic = dic!["島料理"] as! NSDictionary
        rI3 = []
        rI3name = []
        for(key,data) in rIdic{
            let name = key as! String
            let datacontents:NSDictionary = data as! NSDictionary
            rI3name.append(name )
            rI3.append(datacontents["image"] as! String)
        }
        rIdic = dic!["バー"] as! NSDictionary
        rI4 = []
        rI4name = []
        for(key,data) in rIdic{
            let name = key as! String
            let datacontents:NSDictionary = data as! NSDictionary
            rI4name.append(name )
            rI4.append(datacontents["image"] as! String)
        }
        rIdic = dic!["中華"] as! NSDictionary
        rI5 = []
        rI5name = []
        for(key,data) in rIdic{
            let name = key as! String
            let datacontents:NSDictionary = data as! NSDictionary
            rI5name.append(name )
            rI5.append(datacontents["image"] as! String)
        }
        rIdic = dic!["和食"] as! NSDictionary
        rI6 = []
        rI6name = []
        for(key,data) in rIdic{
            let name = key as! String
            let datacontents:NSDictionary = data as! NSDictionary
            rI6name.append(name )
            rI6.append(datacontents["image"] as! String)
        }
        rIdic = dic!["洋食"] as! NSDictionary
        rI7 = []
        rI7name = []
        for(key,data) in rIdic{
            let name = key as! String
            let datacontents:NSDictionary = data as! NSDictionary
            rI7name.append(name )
            rI7.append(datacontents["image"] as! String)
        }
    }

    //セルの取得
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
         let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let label = cell.contentView.viewWithTag(1) as! UILabel
        let imageView = cell.contentView.viewWithTag(2) as! UIImageView

        switch (indexPath.section){
        case 0:
            label.text = rIname[indexPath.row]
            imageView.image = UIImage(named: rI[indexPath.row])
            
        case 1:
            label.text = rI2name[indexPath.row]
            imageView.image = UIImage(named: rI2[indexPath.row])

        case 2:
            label.text = rI3name[indexPath.row]
            imageView.image = UIImage(named: rI3[indexPath.row])

        case 3:
            label.text = rI4name[indexPath.row]
            imageView.image = UIImage(named: rI4[indexPath.row])

        case 4:
            label.text = rI5name[indexPath.row]
            imageView.image = UIImage(named: rI5[indexPath.row])

        case 5:
            label.text = rI6name[indexPath.row]
            imageView.image = UIImage(named: rI6[indexPath.row])

        case 6:
            label.text = rI7name[indexPath.row]
            imageView.image = UIImage(named: rI7[indexPath.row])

        default:
             print("error")
        }
        
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
        switch(indexPath.section){
        case 0:
            selectedRest = rIname[indexPath.row]
            performSegue(withIdentifier: "showEatDetail", sender: nil)
        case 1:
            selectedRest = rI2name[indexPath.row]
            performSegue(withIdentifier: "showEatDetail", sender: nil)
        case 2:
            selectedRest = rI3name[indexPath.row]
            performSegue(withIdentifier: "showEatDetail", sender: nil)
        case 3:
            selectedRest = rI4name[indexPath.row]
            performSegue(withIdentifier: "showEatDetail", sender: nil)
        case 4:
            selectedRest = rI5name[indexPath.row]
            performSegue(withIdentifier: "showEatDetail", sender: nil)
        case 5:
            selectedRest = rI6name[indexPath.row]
            performSegue(withIdentifier: "showEatDetail", sender: nil)
        case 6:
            selectedRest = rI7name[indexPath.row]
            performSegue(withIdentifier: "showEatDetail", sender: nil)
    
            
        default:
            print("error")
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "showEatDetail" {
            let dv = (segue.destination as? DetailViewController)!
            dv.scSelectedRest = selectedRest
       }
    }

    //modalviewにとぶ
    @IBAction func tapRec(_ sender: UIButton) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}

