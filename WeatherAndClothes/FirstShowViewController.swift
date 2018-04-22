//
//  FirstShowViewController.swift
//  WeatherAndClothes
//
//  Created by SWUCOMPUTER on 2018. 4. 20..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class FirstShowViewController: UIViewController {

    @IBOutlet var firstView: UIImageView!
    
    //다음 scene으로 넘어가고 이름을 information으로 한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destination = segue.destination
        destination.title = "Information"
    }
    
    //첫번째 화면 배경 이미지를 보여준다.
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.image = #imageLiteral(resourceName: "first_1.JPG")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
