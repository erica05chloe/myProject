//
//  ModalViewController.swift
//  myProject
//
//  Created by erica chloe on 2017/09/27.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController: UIViewController{

    var restImage = ["party","fam","level","les","typhoon","buera","free","gusto","saigou","ouchi","terumani","abashi","akuru","thiza","pure","seriyosa","rai","katuo","tougura","haisai","sasagawa","kaikou","furusato","zen","rihu","sky","kiyoi","nana","kagura","sou","ikki","dou","sama","shunkou","shou","kaihou","shiosai","taiko","en","hoo","kasa"]
    var recList:[String] = []
    var selectedRec = ""

    @IBOutlet weak var recLabel: UILabel!
    @IBOutlet weak var recImage: UIImageView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        

    let r = Int(arc4random()) % restImage.count
        recImage.image = UIImage(named: restImage[r])

        if r == 0 {self.recLabel.text = "DiningBar Party"};
        if r == 1 {self.recLabel.text = "Familiar"};
        if r == 2 {self.recLabel.text = "level1"};
        if r == 3 {self.recLabel.text = "SALON BAR L'espoir"};
        if r == 4 {self.recLabel.text = "Typhoon"};
        if r == 5 {self.recLabel.text = "cafe Buera"};
        if r == 6 {self.recLabel.text = "darts&billiards FREE TRUNK"};
        if r == 7 {self.recLabel.text = "gusto"};
        if r == 8 {self.recLabel.text = "えび料理　西郷食堂"};
        if r == 9 {self.recLabel.text = "おうちcafe"};
        if r == 10 {self.recLabel.text = "てるまに珈琲"};
        if r == 11 {self.recLabel.text = "アバシ庵"};
        if r == 12 {self.recLabel.text = "カレーハウスAkuru"};
        if r == 13 {self.recLabel.text = "ティザーヌ"};
        if r == 14 {self.recLabel.text = "ピュアゴールド宮花庭"};
        if r == 15 {self.recLabel.text = "レストランせりよさ"};
        if r == 16 {self.recLabel.text = "中華料理来来"};
        if r == 17 {self.recLabel.text = "六覺燈 勝男"};
        if r == 18 {self.recLabel.text = "創作料理とうぐら"};
        if r == 19 {self.recLabel.text = "台所Haisai"};
        if r == 20 {self.recLabel.text = "味処　ささがわ"};
        if r == 21 {self.recLabel.text = "味処　海幸"};
        if r == 22 {self.recLabel.text = "味処ふるさと"};
        if r == 23 {self.recLabel.text = "和創料理　膳"};
        if r == 24 {self.recLabel.text = "喫茶リーフ"};
        if r == 25 {self.recLabel.text = "大山スカイクラブ"};
        if r == 26 {self.recLabel.text = "寿司割烹きよい"};
        if r == 27 {self.recLabel.text = "居酒屋　なな彩"};
        if r == 28 {self.recLabel.text = "居酒屋　神蔵"};
        if r == 29 {self.recLabel.text = "居酒屋　草"};
        if r == 30 {self.recLabel.text = "居酒屋だりやみ処一気"};
        if r == 31 {self.recLabel.text = "島唄　道楽"};
        if r == 32 {self.recLabel.text = "左馬"};
        if r == 33 {self.recLabel.text = "旬香"};
        if r == 34 {self.recLabel.text = "松竹"};
        if r == 35 {self.recLabel.text = "海邦丸"};
        if r == 36 {self.recLabel.text = "潮騒"};
        if r == 37 {self.recLabel.text = "炭火串焼処奄美太鼓"};
        if r == 38 {self.recLabel.text = "焼肉居酒屋えん"};
        if r == 39 {self.recLabel.text = "笑 ほお〜らしゃ"};
        if r == 40 {self.recLabel.text = "笠石ファミリーランド"};
        
        recList.append(restImage[r])
    }
    
    @IBAction func goDetail(_ sender: UIButton){
        performSegue(withIdentifier: "showRec", sender: nil)
    }
    
    func modalView(_ modalView: UIViewController,didselectedItemAt indexPath: IndexPath){
        selectedRec = recList[indexPath.row]
//        performSegue(withIdentifier: "showRec", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "showRec"{
            let dv = (segue.destination as? DetailViewController)!
            dv.scSelectedRest = selectedRec
        }
        
    }
    

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
}
    

    
    @IBAction func didTapClose(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

