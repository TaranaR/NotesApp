//
//  NotesVC.swift
//  NotesApp
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NotesVC: UIViewController {

    var fname:String?
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "File Name"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.text=""
        textView.textAlignment = .center
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 0.5
        return textView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save Notes", for: .normal)
        button.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    @objc private func saveNote(){
        let content = contentTextView.text!
        var file:String = ""
        if(fname != ""){
            file = fname!
        }
        else{
            file = fname!
        }
        let filePath = FMS.getDocDir().appendingPathComponent(file)
        
        do{
            try content.write(to: filePath, atomically: true, encoding: .utf8)
        }catch{
            print(error)
        }
        //contentTextView.text=""
        let vc = AllNotesHome()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(contentTextView)
        view.addSubview(saveButton)
        nameTextField.text = fname
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do{
            let filePath = FMS.getDocDir().appendingPathComponent(fname!)
            let fetchContent = try String(contentsOf: filePath)
            contentTextView.text = fetchContent
        }catch{
            print(error)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        nameTextField.frame = CGRect(x: 40, y: 100, width: view.frame.size.width - 80, height: 40)
        contentTextView.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.frame.size.width - 80, height: 300)
        saveButton.frame = CGRect(x: 40, y: contentTextView.bottom + 20, width: view.frame.size.width - 80, height: 40)
    }
}
