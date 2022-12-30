//
//  GameViewController.swift
//  Pittari
//
//  Created by 小西星七 on R 4/12/30.
//

import UIKit

//スタートを押したらストップウォッチスタートし、ストップ押したらその秒数が合計変数に追加され、次の画面へのボタンが表示される。次の画面へのボタンを押したら人数増えてまたスタートのボタンへ。

class GameViewController: UIViewController {

    //------宣言コーナー--------
    //前のページから引き継いできた人数の合計と秒数
    var totalPeople: Int = 0
    var gameIdealSecond: Float = 0.0
    
    //今の人数を表示する変数とラベル
    var peopleNumber: Int = 0
    @IBOutlet var peopleLabel: UILabel!
    
    //タイマーと今の秒数を入れる変数
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    //合計秒数を入れる変数
    var totalSecond: Float = 0.0
    
    //ボタン管理の変数
    var buttonState: Int = 0
    
    //ボタンの宣言
    @IBOutlet var allUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func allButton(){
        switch buttonState{
        case 1:
            stop()
        case 2:
            next()
        default:
            start()
        }
    }
    
    //------メソッドコーナー--------
    
    //スタートボタンを押したら時を進めるメソッドを呼ぶ
    @objc func start(){
          //タイマーが動作していなかったら時を進めるメソッドを呼ぶ
          if !timer.isValid{
              timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
          }
        //スタートのボタンをストップに変更
        buttonState = 1
        allUIButton.setTitle("STOP", for: .normal)
      }
    
    //ストップボタンを押したら時を止める
    @objc func stop(){
        //タイマーが動作していたら停止する
            if timer.isValid{
                timer.invalidate()
            }
        //合計変数に今の秒数を追加
        totalSecond += count
        //ストップのボタンを次の画面にいくボタンに変更
        buttonState = 2
        allUIButton.setTitle("NEXT", for: .normal)
        }
    
    //次の画面へのボタンをしたときに呼ぶ
    @objc func next(){
        //もし今の人数が合計人数と同じならResult画面にいく
        if totalPeople == peopleNumber{
            nextSegue()
        }
        //今の人数がまだ合計人数より小さい時に呼ぶ
        else{
        //今の秒数を0に
        count = 0
        //次の画面にいくボタンをスタート画面に変更
        buttonState = 0
        allUIButton.setTitle("START", for: .normal)
        }
    }
    

    //時を進めさせるメソッド
    @objc func up(){
            count = count + 0.01
        }
    
    //遷移
    @objc func nextSegue(){
        let nextView = storyboard?.instantiateViewController(withIdentifier: "resultViewController") as! ResultViewController
            
        //一個前から引き継いだ値と合計得点を次の画面に
        nextView.resultSeconds = totalSecond
        nextView.totalPeople = totalPeople
        nextView.idealSeconds = gameIdealSecond

          //遷移を実行
        self.present(nextView, animated: true, completion: nil)
    }
}
