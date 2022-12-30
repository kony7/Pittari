//
//  GameViewController.swift
//  Pittari
//
//  Created by 小西星七 on R 4/12/30.
//

import UIKit

//スタートを押したらストップウォッチスタートし、ストップ押したらその秒数が合計変数に追加され、次の画面へのボタンが表示される。次の画面へのボタンを押したら人数増えてまたスタートのボタンへ。

class GameViewController: UIViewController {

    //今の人数を表示する変数とラベル、合計秒数を入れる変数、タイマー、今の秒数を入れる変数を宣言
    var peopleNumber: Int = 0
    @IBOutlet var peopleLabel: UILabel!
    var count: Float = 0.0
    var timer: Timer = Timer()
    var totalSecond: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //スタートボタンを押したら時を進めるメソッドを呼ぶ
    @IBAction func start(){
          //タイマーが動作していなかったら時を進めるメソッドを呼ぶ
          if !timer.isValid{
              timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
          }
        //スタートのボタンをストップに変更
      }
    
    //ストップボタンを押したら時を止める
    @IBAction func stop(){
        //タイマーが動作していたら停止する
            if timer.isValid{
                timer.invalidate()
            }
        //合計変数に今の秒数を追加
        //ストップのボタンを次の画面にいくボタンに変更
        }
    
    //次の画面へのボタンをしたときに呼ぶ
    @IBAction func next(){
        //もし今の人数が合計人数と同じならResult画面にいく
        //今の人数がまだ合計人数より小さい時に呼ぶ
        //今の秒数を0に
        //次の画面にいくボタンをスタート画面に変更
    }
    
    //------メソッドコーナー--------
    //時を進めさせるメソッド
    @objc func up(){
            count = count + 0.01
        }
}
