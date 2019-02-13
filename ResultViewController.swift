//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 高橋ひかり on 2019/02/07.
//  Copyright © 2019 高橋ひかり. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    // 受け取るためのプロパティ(変数)を宣言しておく
    
    var imageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // ↓前の画面から受け取った画像番号をもとに、画像をセットするメソッドの一連↓
        
        // 画像の名前の配列
        let imageNameArray = [
            "ゴロニャン.jpg",
            "あくび.JPG",
            "ドラえにゃん.jpeg",
            "集合.png",
            "あご.jpeg",
            "こてり.jpg"
        ]
        // 表示している画像の番号から名前を取り出す
        let name = imageNameArray[imageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        ImageView.image = image
        
        // 受け取った画像番号の確認用
        print(imageNo)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
