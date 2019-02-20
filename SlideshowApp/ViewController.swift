//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 高橋ひかり on 2019/02/07.
//  Copyright © 2019 高橋ひかり. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func segAction(_ sender: Any) {
    }
    
    // 二つ目の画面から戻る処理コード
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }

    @IBOutlet weak var imageView: UIImageView!
    // タイマー
    var timer: Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0

    // 表示している画像の番号
    var dispImageNo = 0
    
    // 表示している画像の番号をもとに画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "ゴロニャン.jpg",
            "あくび.JPG",
            "ドラえにゃん.jpeg",
            "集合.png",
            "あご.jpeg",
            "こてり.jpg"
        ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 5
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 5 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "ゴロニャン.jpg")
        imageView.image = image
    }
    // 画面に表示された画像の画像番号をもう一つの画面に送るメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているプロパティに値を代入して渡す
        resultViewController.imageNo = self.dispImageNo
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
        
        startreset.setTitle("再生", for: .normal) // 停止中は再生titleを表示
        nextImageButton.isEnabled = true // 停止中は進むボタンをタップ可能
        returnImageButton.isEnabled = true // 停止中は戻るボタンをタップ可能
    }
        
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 2.0, repeats: true で指定された通り、2.0秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 2.0
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を１増やす
        dispImageNo += 1
        
        // 表示している画像の番号をもとに画像を表示する
        displayImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    @IBOutlet weak var startreset: UIButton!
    
    // 再生/停止ボタン　IBAction
    @IBAction func startresetTimer(_ sender: Any) {
        
        // 再生中は停止、停止中は再生の分岐コード
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true) // タイマー始動（再生機能）
            startreset.setTitle("停止", for: .normal)// 再生中は停止titleを表示
            nextImageButton.isEnabled = false // 再生中は進むボタン操作を無効化
            returnImageButton.isEnabled = false // 再生中は戻るボタン操作を無効化
        } else {
            self.timer.invalidate()   // タイマー停止（停止機能）
            self.timer = nil // startTimer() の timer == nil で判断するために、 timer = nil としておく
            startreset.setTitle("再生", for: .normal) // 停止中は再生titleを表示
            nextImageButton.isEnabled = true
            returnImageButton.isEnabled = true
        }
        
    }
    // 進むボタン
    // 変数を扱うにはOutletが必須
    @IBOutlet weak var nextImageButton: UIButton!
    // 動作を与えるにはActionが必須
    @IBAction func nextImage(_ sender: Any) {
        if dispImageNo == 5 {
            dispImageNo = 0
        } else {
            dispImageNo += 1
        }
        displayImage() // 画像を表示するメソッド
    }
    
    // 戻るボタン
    // 戻るボタンの変数を宣言
    @IBOutlet weak var returnImageButton: UIButton!
    // 戻るボタンのActionを設定
    @IBAction func returnImage(_ sender: Any) {
        if dispImageNo == 0 {
            dispImageNo = 5
        } else {
            dispImageNo -= 1
        }
        displayImage() // 画像を表示
    }

}
