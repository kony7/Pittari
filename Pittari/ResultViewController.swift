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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //理想の結果を人数かける秒数で求めて代入しラベルに表示
        
        //前の画面の合計秒数を表示
    }


}
