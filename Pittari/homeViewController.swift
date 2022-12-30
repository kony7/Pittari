//
//  ViewController.swift
//  Pittari
//
//  Created by 小西星七 on R 4/12/30.
//

import UIKit

//このゲームのホーム画面。人数と秒数を指定する。

class homeViewController: UIViewController {
    
    
    //人数と秒数を入れる変数を宣言
    var totalPeopleNumber: Int = 0
    var idealSeconds: Float = 0.0
    
//    // メニュー表示項目
//        enum MenuType: String {
//            case 0 = "0"
//            case 1 = "1"
//            case 2 = "2"
//            case 3 = "3"
//        }
//        // メニュー選択ボタン
//        @IBOutlet weak var menuButton: UIButton!
//
//        // 選択されたMenuType
//        var selectedMenuType = MenuType.0


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //人数を入れるPullDownButtonの指示
    

    //秒数を入れるPullDownButtonの指示
    
    //スタートボタンを押したときに呼び出す
    @IBAction func startButton(_ sender: Any){
        
    //次のビューを指定して遷移
    let nextView = storyboard?.instantiateViewController(withIdentifier: "gameViewController") as! GameViewController
        
        //GameViewControllerの中にあるtotalPeople変数にこの画面のtotakNumberを、idealSecondsをgameIdealSeconds引き渡す
        nextView.totalPeople = totalPeopleNumber
        nextView.gameIdealSecond = idealSeconds

          //遷移を実行
          self.present(nextView, animated: true, completion: nil)
    }
}

