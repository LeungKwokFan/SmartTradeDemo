//
//  SignUpViewController.swift
//  SmartTradeDemo
//
//  Created by Frank Leung on 30/4/2024.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBOutlet weak var returnButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        
        //do not show the warning
        warningLabel.alpha = 0
        
        
        Utilities.styleTextField(firstNameTextField)
    
        Utilities.styleTextField(lastNameTextField)
        
        Utilities.styleTextField(emailTextField)
        
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(signUpButton)
        
        Utilities.styleHollowButton(returnButton)
        
        
        
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
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
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
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        let warning = checkTextField()
        
        if warning != nil{
            showWarning(warning!)
            
        }
        else{

            guard let email = emailTextField.text else {return}
            guard let password = passwordTextField.text else {return}
            
            Auth.auth().createUser(withEmail: email, password: password){(Result,err) in
                if err != nil{
                    self.showWarning("Error in creating user.")
                }
                else{
                    self.showWarning("OKay now!")
                }}
        }
        
    }
    
}
