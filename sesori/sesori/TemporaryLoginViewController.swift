//
//  TemporaryLoginViewController.swift
//  sesori
//
//  Created by 이정우 on 2021/11/14.
//

import UIKit

class TemporaryLoginViewController: UIViewController {
    
    @IBOutlet weak var studentNumberTextField : UITextField!
    @IBOutlet weak var loginButton : UIButton!
    @IBOutlet weak var loginFailedLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = UserDefaults.standard.string(forKey: "StudentNumber"){
            let view = self.storyboard?.instantiateViewController(withIdentifier: "mainVC")
            view?.modalTransitionStyle = .crossDissolve
            view?.modalPresentationStyle = .fullScreen
            self.present(view!, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchLoginButton(){
        if(studentNumberTextField.text == ""){
            loginFailedLabel.text = "학번을 입력해주세요"
            return
        }
        let pattern = "^[1-3]{1,1}0[1-9]{1,1}[0-9]{2,2}$"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: studentNumberTextField.text!, options: [], range: NSRange(location: 0, length: studentNumberTextField.text!.count)) {
            Login()
        }else{
            loginFailedLabel.text = "학번을 올바르게 입력해주세요"
        }
    }
    
    func Login(){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "mainVC")
        view?.modalTransitionStyle = .crossDissolve
        view?.modalPresentationStyle = .fullScreen
        self.present(view!, animated: true, completion: nil)
        UserDefaults.standard.set(self.studentNumberTextField.text, forKey: "studentNumber")
    }
    
}
