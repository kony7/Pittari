//
//  PointViewController.swift
//  Pittari
//
//  Created by 小西星七 on R 4/12/30.
//

import UIKit

//何秒につき何ポイントなのかをPullDownButtonで結果をラベルに表示
class PointViewController: UIViewController {

    //秒数とポイントを一時的に保存する変数、結果を表示する変数とラベルを宣言
    var perSeconds:Float = 0.0
    var perPoint:Int = 0
    var totalPoint: Int = 0
    @IBOutlet var totalPontLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //秒数を入れるPullDownButtonの指示
    
    //ポイントを入れるPullDownButtonの指示

    //結果のボタンを押した時に呼び出す
    @IBAction func result(){
        //計算
    }
}
