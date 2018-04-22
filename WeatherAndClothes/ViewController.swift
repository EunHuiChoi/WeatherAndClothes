//
//  ViewController.swift
//  Weather
//
//  Created by SWUCOMPUTER on 2018. 4. 17..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var weatherLable: UILabel!
    @IBOutlet var nowTime: UILabel!
    @IBOutlet var yourName: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var regionWeatherView: UIView!
    
    var selectedPickerIndex : Int!
    var yourNameReceivedString : String!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //다음 scene으로 넘어가고 custom picker 값과 현재 온도에 맞는 이미지를 넘겨준다.
        if segue.identifier == "toClothesViewController"{
            let deskVC = segue.destination as! ClothesViewController
            
            let ordered : Int! = selectedPickerIndex
            deskVC.regionselectedPickerIndex = ordered
            
            deskVC.weatherIndex = weatherImage.image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textfield에서 받은 사용자의 이름을 표시해준다.
        yourName.text = "\(yourNameReceivedString!)님 환영합니다!"
        
        //앞서 custompicker에서 어느 지역을 선택하냐에 따라 다른 함수가 적용된다.
        if selectedPickerIndex == 0 {
            getSeoulWeather()
            getSeoulTime()
        }
        else if selectedPickerIndex == 1 {
            getOymyakonWeather()
            getOymyakonTime()
        }
        else if selectedPickerIndex == 2 {
            getMadridWeather()
            getMadridTime()
        }
        else if selectedPickerIndex == 3 {
            getNairobiWeather()
            getNairobiTime()
        }
        else {
            getMarrakeshWeather()
            getMarrakeshTime()
        }
    }
    
    //서울의 현재온도를 표시하고 온도별로 그에 맞는 이미지를 표시해주는 함수
    func getSeoulWeather() {
        let session = URLSession.shared
        let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Seoul,KR?&units=metric&APPID=4b455e8a176aa7b2729cfb9315ab7a3b")!
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
                        if let temperature = mainDictionary.value(forKey: "temp") {
                            DispatchQueue.main.async {
                                self.weatherLable.text = "\(temperature)°"
                                let myAnyToInt = mainDictionary["temp"] as? NSNumber
                                let myLoverInt = myAnyToInt?.intValue
                                
                                let result : Int = self.weatherImageUpdate(myInt: myLoverInt!)
                                
                                switch result{
                                case 0: self.weatherImage.image = #imageLiteral(resourceName: "photo_4.JPG")
                                case 1: self.weatherImage.image = #imageLiteral(resourceName: "photo_3.JPG")
                                case 2: self.weatherImage.image = #imageLiteral(resourceName: "photo_0.JPG")
                                case 3: self.weatherImage.image = #imageLiteral(resourceName: "photo_2.JPG")
                                default: self.weatherImage.image = #imageLiteral(resourceName: "photo_1.JPG")
                                }
                            }
                        }
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //오미야콘의 현재온도를 표시하고 온도별로 그에 맞는 이미지를 표시해주는 함수
    func getOymyakonWeather() {
        let session = URLSession.shared
        let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Oymyakon,RU?&units=metric&APPID=4b455e8a176aa7b2729cfb9315ab7a3b")!
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
                        if let temperature = mainDictionary.value(forKey: "temp") {
                            DispatchQueue.main.async {
                                self.weatherLable.text = "\(temperature)°"
                                
                                let myAnyToInt = mainDictionary["temp"] as? NSNumber
                                let myLoverInt = myAnyToInt?.intValue
                                
                                let result : Int = self.weatherImageUpdate(myInt: myLoverInt!)
                                
                                switch result{
                                case 0: self.weatherImage.image = #imageLiteral(resourceName: "photo_4.JPG")
                                case 1: self.weatherImage.image = #imageLiteral(resourceName: "photo_3.JPG")
                                case 2: self.weatherImage.image = #imageLiteral(resourceName: "photo_0.JPG")
                                case 3: self.weatherImage.image = #imageLiteral(resourceName: "photo_2.JPG")
                                default: self.weatherImage.image = #imageLiteral(resourceName: "photo_1.JPG")
                                }
                            }
                        }
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //마드리드의 현재온도를 표시하고 온도별로 그에 맞는 이미지를 표시해주는 함수
    func getMadridWeather() {
        let session = URLSession.shared
        let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Madrid,ES?&units=metric&APPID=4b455e8a176aa7b2729cfb9315ab7a3b")!
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
                        if let temperature = mainDictionary.value(forKey: "temp") {
                            DispatchQueue.main.async {
                                self.weatherLable.text = "\(temperature)°"
                                
                                let myAnyToInt = mainDictionary["temp"] as? NSNumber
                                let myLoverInt = myAnyToInt?.intValue
                                
                                let result : Int = self.weatherImageUpdate(myInt: myLoverInt!)
                                
                                switch result{
                                case 0: self.weatherImage.image = #imageLiteral(resourceName: "photo_4.JPG")
                                case 1: self.weatherImage.image = #imageLiteral(resourceName: "photo_3.JPG")
                                case 2: self.weatherImage.image = #imageLiteral(resourceName: "photo_0.JPG")
                                case 3: self.weatherImage.image = #imageLiteral(resourceName: "photo_2.JPG")
                                default: self.weatherImage.image = #imageLiteral(resourceName: "photo_1.JPG")
                                }
                            }
                        }
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //나이로비의 현재온도를 표시하고 온도별로 그에 맞는 이미지를 표시해주는 함수
    func getNairobiWeather() {
        let session = URLSession.shared
        let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Nairobi,KE?&units=metric&APPID=4b455e8a176aa7b2729cfb9315ab7a3b")!
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
                        if let temperature = mainDictionary.value(forKey: "temp") {
                            DispatchQueue.main.async {
                                self.weatherLable.text = "\(temperature)°"
                                
                                let myAnyToInt = mainDictionary["temp"] as? NSNumber
                                let myLoverInt = myAnyToInt?.intValue
                                
                                let result : Int = self.weatherImageUpdate(myInt: myLoverInt!)
                                
                                switch result{
                                case 0: self.weatherImage.image = #imageLiteral(resourceName: "photo_4.JPG")
                                case 1: self.weatherImage.image = #imageLiteral(resourceName: "photo_3.JPG")
                                case 2: self.weatherImage.image = #imageLiteral(resourceName: "photo_0.JPG")
                                case 3: self.weatherImage.image = #imageLiteral(resourceName: "photo_2.JPG")
                                default: self.weatherImage.image = #imageLiteral(resourceName: "photo_1.JPG")
                                }
                            }
                        }
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //마라케시의 현재온도를 표시하고 온도별로 그에 맞는 이미지를 표시해주는 함수
    func getMarrakeshWeather() {
        let session = URLSession.shared
        let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Marrakesh,MA?&units=metric&APPID=4b455e8a176aa7b2729cfb9315ab7a3b")!
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
                        if let temperature = mainDictionary.value(forKey: "temp") {
                            DispatchQueue.main.async {
                                self.weatherLable.text = "\(temperature)°"
                                
                                let myAnyToInt = mainDictionary["temp"] as? NSNumber
                                let myLoverInt = myAnyToInt?.intValue
                                
                                let result : Int = self.weatherImageUpdate(myInt: myLoverInt!)
                                
                                switch result{
                                case 0: self.weatherImage.image = #imageLiteral(resourceName: "photo_4.JPG")
                                case 1: self.weatherImage.image = #imageLiteral(resourceName: "photo_3.JPG")
                                case 2: self.weatherImage.image = #imageLiteral(resourceName: "photo_0.JPG")
                                case 3: self.weatherImage.image = #imageLiteral(resourceName: "photo_2.JPG")
                                default: self.weatherImage.image = #imageLiteral(resourceName: "photo_1.JPG")
                                }
                            }
                        }
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //서울의 현재시간
    func getSeoulTime() {
        NSTimeZone.default = TimeZone(abbreviation: "KST")!
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.default
        formatter.dateFormat = "HH:mm"
        nowTime.text = "\(formatter.string(from: Date())) KST"
    }
    //마드리드의 현재시간
    func getMadridTime() {
        NSTimeZone.default = TimeZone(abbreviation: "CEST")!
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.default
        formatter.dateFormat = "HH:mm"
        nowTime.text = "\(formatter.string(from: Date())) CEST"
    }
    //오미야콘의 현재시간
    func getOymyakonTime() {
        NSTimeZone.default = TimeZone(abbreviation: "GMT+10")!
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.default
        formatter.dateFormat = "HH:mm"
        nowTime.text = "\(formatter.string(from: Date())) VLAT"
    }
    //나이로비의 현재시간
    func getNairobiTime() {
        NSTimeZone.default = TimeZone(abbreviation: "EAT")!
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.default
        formatter.dateFormat = "HH:mm"
        nowTime.text = "\(formatter.string(from: Date())) EAT"
    }
    //마라케시의 현재시간
    func getMarrakeshTime() {
        NSTimeZone.default = TimeZone(abbreviation: "WEST")!
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.default
        formatter.dateFormat = "HH:mm"
        nowTime.text = "\(formatter.string(from: Date())) WEST"
    }
    
    //받아온 온도를 구간별로 나누어 주는 함수
    func weatherImageUpdate (myInt : Int) -> Int{
        if myInt >= 23 {
            return 0
        }
        else if (myInt >= 16) && (myInt < 23) {
            return 1
        }
        else if (myInt >= 9) && (myInt < 16) {
            return 2
        }
        else {
            return 3
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

