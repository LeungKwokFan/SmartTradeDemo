//
//  LoginViewController.swift
//  SmartTradeDemo
//
//  Created by Frank Leung on 30/4/2024.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var reutrnButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        
        //do not show the warning
        warningLabel.alpha = 0
        
        
        
        Utilities.styleTextField(emailTextField)
        
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(loginButton)
        
        Utilities.styleHollowButton(reutrnButton)
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func checkTextField() -> String?{
        
        if
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""
        {
            return "All the fields should be filled!"
            
        }
        
        
        
        return nil
            
    }
    
    func showWarning(_ message: String){
        warningLabel.text = message
        warningLabel.alpha = 1
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let warning = checkTextField()
        
        if warning != nil{
            showWarning(warning!)
            
        }
        else{

            guard let email = emailTextField.text else {return}
            guard let password = passwordTextField.text else {return}
            
            Auth.auth().signIn(withEmail: email, password: password){(Result,err) in
                if err == nil{
                    self.performSegue(withIdentifier: "jumpToHome", sender: self)
                }
                else{
                    self.showWarning("Error when login.")

                }}
        }
    }
    

}
