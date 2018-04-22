//
//  ClothesViewController.swift
//  WeatherAndClothes
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ClothesViewController: UIViewController {
    @IBOutlet var clothesImageView: UIImageView!
    var weatherIndex: UIImage!
    var regionselectedPickerIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var weatherNumber = Array(0...2)
        var indexRamdom = 0
        var clothesArray = Array<Int>()
        
        //랜덤으로 숫자를 뽑는다. 뽑은 숫자는 이미지와 각각 연결된다. 즉 이미지가 랜덤으로 표시된다.
        indexRamdom = Int (arc4random_uniform(UInt32(weatherNumber.count)))
        clothesArray.append(weatherNumber[indexRamdom])
        weatherNumber.remove(at: indexRamdom)
        
        if (regionselectedPickerIndex == 0) || (regionselectedPickerIndex == 2) || (regionselectedPickerIndex == 3) || (regionselectedPickerIndex == 4) || (regionselectedPickerIndex == 1) {

            if weatherIndex == #imageLiteral(resourceName: "photo_4.JPG") {
                if clothesArray[0] == 0 {
                    clothesImageView.image = #imageLiteral(resourceName: "summer_1.JPG") //summer_1
                }
                else if clothesArray[0] == 1 {
                    clothesImageView.image = #imageLiteral(resourceName: "summer_2.JPG") //summer_2
                }
                else {
                    clothesImageView.image = #imageLiteral(resourceName: "summer_3.JPG") //summer_3
                }
            }

            if weatherIndex == #imageLiteral(resourceName: "photo_3.JPG") {
                if clothesArray[0] == 0 {
                    clothesImageView.image = #imageLiteral(resourceName: "spring_1.JPG") //spring_1
                }
                else if clothesArray[0] == 1 {
                    clothesImageView.image = #imageLiteral(resourceName: "spring_2.JPG") // spring_2
                }
                else {
                    clothesImageView.image = #imageLiteral(resourceName: "spring_3.JPG") //spring_3
                }
            }

            if weatherIndex == #imageLiteral(resourceName: "photo_0.JPG") {
                if clothesArray[0] == 0 {
                    clothesImageView.image = #imageLiteral(resourceName: "fall_1.JPG") //fall_1
                }
                else if clothesArray[0] == 1 {
                    clothesImageView.image = #imageLiteral(resourceName: "fall_2.JPG") // fall_2
                }
                else {
                    clothesImageView.image = #imageLiteral(resourceName: "fall_3.jpg") //fall_3
                }
            }

            if weatherIndex == #imageLiteral(resourceName: "photo_2.JPG") {
                if clothesArray[0] == 0 {
                    clothesImageView.image = #imageLiteral(resourceName: "winter_1.JPG") //winter_1
                }
                else if clothesArray[0] == 1 {
                    clothesImageView.image = #imageLiteral(resourceName: "winter_2.JPG") // winter_2
                }
                else {
                    clothesImageView.image = #imageLiteral(resourceName: "winter_3.JPG") //winter_3
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
