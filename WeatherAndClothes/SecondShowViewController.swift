//
//  SecondShowViewController.swift
//  WeatherAndClothes
//
//  Created by SWUCOMPUTER on 2018. 4. 20..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class SecondShowViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet var fiveRegionPickerView: UIPickerView!
    @IBOutlet var yourNameInputTextField: UITextField!
    
    let fiveRegionArray : Array<String> = ["대한민국 서울","러시아 오미야콘","스페인 마드리드","케냐 나이로비","모로코 마라케시"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //다음 scene으로 custom picker의 지역 index를 넘겨준다.
        let index = fiveRegionPickerView.selectedRow(inComponent: 0)
        let deskVC = segue.destination as! ViewController
        
        //다음 scene으로 사용자가 입력한 text를 넘겨준다.
        deskVC.yourNameReceivedString = yourNameInputTextField.text
        
        //다음 scene의 이름을 custom picker의 지역 index로 지정해준다.
        if segue.identifier == "toWeatherViewController"{
            let ordered:Int! = index
            deskVC.selectedPickerIndex = ordered

            let destination = segue.destination
            if index == 0 {
                destination.title = fiveRegionArray[0]
            }
            else if index == 1 {
                destination.title = fiveRegionArray[1]
            }
            else if index == 2 {
                destination.title = fiveRegionArray[2]
            }
            else if index == 3 {
                destination.title = fiveRegionArray[3]
            }
            else {
                destination.title = fiveRegionArray[4]
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int{
        return fiveRegionArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)->String?{
        return fiveRegionArray[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
