//
//  LoginPage.swift
//  NotesApp
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {
    
    private let myLableHead:UILabel={
        let label=UILabel()
        label.text="LOGIN"
        label.textAlignment = .center
        label.font = UIFont(name:"ArialRoundedMTBold", size: 50)
        label.textColor = .blue
        return label
    }()
    private let myUname:UITextField={
        let textField=UITextField()
        textField.placeholder = "User Name"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 16.0
        textField.backgroundColor = .white
        return textField
    }()
    
    private let myPassword:UITextField={
        let textField=UITextField()
        textField.placeholder = "Password"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 16.0
        textField.backgroundColor = .white
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 16
        return button
    }()
    func assignbackground(){
        let background = UIImage(named: "noteshomebg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    @objc private func login(){
        let uname = myUname.text
        UserDefaults.standard.setValue(uname, forKey: "username")
        self.dismiss(animated: true)
        let vc = AllNotesHome()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        assignbackground()
        view.addSubview(myLableHead)
        view.addSubview(myUname)
        view.addSubview(myPassword)
        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myLableHead.frame=CGRect(x: 20, y: 200, width: view.frame.size.width-40, height: 60)
        myUname.frame = CGRect(x: 60, y: 280, width: view.frame.size.width-100, height: 40)
        myPassword.frame=CGRect(x: 60, y: 340, width: view.frame.size.width-100, height: 40)
        loginButton.frame=CGRect(x: 110, y: 400, width: view.frame.size.width-200, height: 40)
    }
    
}
