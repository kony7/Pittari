//
//  ResultViewController.swift
//  Pittari
//
//  Created by 小西星七 on R 4/12/30.
//

import UIKit

//結果を表示する
class ResultViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //理想の秒数を表示するラベルと変数を宣言
    @IBOutlet var idealSecondsLabel: UILabel!
    var idealSeconds: Float = 0.0
    
    //結果の秒数を表示するラベルと変数を宣言
    @IBOutlet var resultSecondsLabel: UILabel!
    var resultSeconds: Float = 0.0
    
    //差を入れるためのラベルと変数を宣言
    @IBOutlet var differenceLabel: UILabel!
    var differenceSecond: Float = 0.0
    
    //一人一人の成績の入った配列を引き継ぐ
    var secondsPerPeople: Array = [String]()
    
    //前のページから引き継いできた人数の合計と秒数
    var totalPeople: Int = 0
//    var idealSecond: Float = 0.0
    
    //テーブルビューの宣言
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //理想の結果を人数かける秒数で求めて代入しラベルに表示
        //ここ10秒じゃなくするなら変更かけるとこ
        idealSeconds = Float(totalPeople+1) * 10
        idealSecondsLabel.text = String(idealSeconds)
        
        //前の画面の合計秒数を表示
        resultSecondsLabel.text = String(resultSeconds)
        
        //差を出してラベルに表示
        differenceSecond = idealSeconds - resultSeconds
        if differenceSecond <= 0{
            differenceSecond = differenceSecond * -1
            differenceLabel.text = String(differenceSecond)
        }else{
            differenceLabel.text = String(differenceSecond)
        }
        
        //テーブルビューの設定
        table.dataSource = self
        table.delegate = self
    }
    
    //ボタンを押したら遷移
    @IBAction func nextButton(){
//        let nextView = storyboard?.instantiateViewController(withIdentifier: "pointViewController") as! PointViewController
//
//        //一個前から引き継いだ値と合計得点を次の画面に
//        //nextView.
//
//          //遷移を実行
//        self.present(nextView, animated: true, completion: nil)
        
        //トップの階層に戻る
        self.presentingViewController?.presentingViewController?.dismiss(animated: true,completion: nil)
    }
    
    //一人一人の成績を表示するテーブルビューの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondsPerPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell")
        
        print(secondsPerPeople[indexPath.row])
        cell?.textLabel?.text = secondsPerPeople[indexPath.row]
        return cell!
    }
}
