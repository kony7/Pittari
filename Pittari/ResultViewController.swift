//
//  ResultViewController.swift
//  Pittari
//
//  Created by 小西星七 on R 4/12/30.
//

import UIKit

//結果を表示する
class ResultViewController: UIViewController {

    //理想と結果の秒数を表示するラベルと変数を宣言
    @IBOutlet var idealSecondsLabel: UILabel!
    @IBOutlet var resultSecondsLabel: UILabel!
    var idealSeconds: Float = 0.0
    var resultSeconds: Float = 0.0
    
    //前のページから引き継いできた人数の合計と秒数
    var totalPeople: Int = 0
//    var idealSecond: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //理想の結果を人数かける秒数で求めて代入しラベルに表示
        //ここ10秒じゃなくするなら変更かけるとこ
        idealSeconds = Float(totalPeople+1) * 10
        idealSecondsLabel.text = String(idealSeconds)
        
        //前の画面の合計秒数を表示
        resultSecondsLabel.text = String(resultSeconds)
        
    }
    
    //ボタンを押したら遷移
    @IBAction func nextButton(){
        let nextView = storyboard?.instantiateViewController(withIdentifier: "pointViewController") as! PointViewController
            
        //一個前から引き継いだ値と合計得点を次の画面に
        //nextView.

          //遷移を実行
        self.present(nextView, animated: true, completion: nil)
    }
}
