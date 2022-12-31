//
//  ViewController.swift
//  Pittari
//
//  Created by 小西星七 on R 4/12/30.
//

import UIKit

//このゲームのホーム画面。人数と秒数を指定する。

class homeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    //------宣言コーナー--------
    //テキストフィールド
    @IBOutlet var peopleNumberTextField: UITextField!
    //@IBOutlet var secondNumberTextField:UITextField!
    
    //選択肢を保存しとく配列
    var countries: [String] = ["1","2","3","4","5","6","7","8","9","10"]
    
    //PickerView
    var peoplePickerView: UIPickerView?
 //   var secondPickerView: UIPickerView?
    
    //人数と秒数を入れる変数
    var totalPeopleNumber: Int = 0
//    var idealSeconds: Float = 0.0


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //PickerViewとデリゲートの設定
        let pv = UIPickerView()
        pv.delegate = self
        pv.dataSource = self
    
        peopleNumberTextField.delegate = self
        peopleNumberTextField.inputAssistantItem.leadingBarButtonGroups = []
        peopleNumberTextField.inputView = pv
        
//        secondNumberTextField.delegate = self
//        secondNumberTextField.inputAssistantItem.leadingBarButtonGroups = []
//        secondNumberTextField.inputView = pv
        
        self.peoplePickerView = pv
//        self.secondPickerView = pv
        
        //テキストフィードじゃないとこ選択したらUIPickerViewが閉じる
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:          #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)

        
    }
    
    //PickerViewに表示するコンポーネントの数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    //PickerViewに表示するセルの数をcountriesの中に入っている値の数で指定
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return countries.count
        }
    //PickerViewに表示するセルの内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return countries[row]
        }
    //PickerView押した時の指示
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //押されたときにPickerViewによって指示を変更
     //   if pickerView == peoplePickerView{
            peopleNumberTextField.text = countries[row]
            totalPeopleNumber = row
    //    }else if pickerView == secondPickerView{
    //        secondNumberTextField.text = countries[row]
     //       idealSeconds = Float(row)
     //   }
        }
    
    //スタートボタンを押したときに呼び出す
    @IBAction func startButton(_ sender: Any){
        
    //次のビューを指定して遷移
    let nextView = storyboard?.instantiateViewController(withIdentifier: "gameViewController") as! GameViewController
        
        //GameViewControllerの中にあるtotalPeople変数にこの画面のtotakNumberを、idealSecondsをgameIdealSeconds引き渡す
        nextView.totalPeople = totalPeopleNumber
//        nextView.gameIdealSecond = idealSeconds

          //遷移を実行
          self.present(nextView, animated: true, completion: nil)
    }
    
    //------メソッドコーナー--------
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

