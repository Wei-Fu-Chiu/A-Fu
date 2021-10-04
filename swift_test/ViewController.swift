//
//  ViewController.swift
//  swift_test
//
//  Created by 邱緯輔 on 2021/10/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let DeclaringContants = 10
        var Variables = 0
        
        print("Declaring Contants: DeclaringContants = " + String(DeclaringContants))
        print("Variables: Variables = " + String(Variables))
        
    }

    @IBAction func Button(_ sender: Any) {
    }
    
    @IBAction func DeclaringContantsText(_ sender: Any) {
        let DeclaringContants = 10
        var Variables = 0
        //UITextDirection.self("Declaring Contants: DeclaringContants = " + String(DeclaringContants))
        print("Declaring Contants: DeclaringContants = " + String(DeclaringContants))
        
        
    }
    
    
}

