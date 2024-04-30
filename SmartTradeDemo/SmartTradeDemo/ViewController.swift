//
//  ViewController.swift
//  SmartTradeDemo
//
//  Created by Frank Leung on 30/4/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }

    func setUpElements(){
        
        Utilities.styleFilledButton(signUpButton)
        
        Utilities.styleFilledButton(loginButton)
    
        
        
    }

}

