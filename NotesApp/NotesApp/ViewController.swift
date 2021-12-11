//
//  ViewController.swift
//  NotesApp
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let GetStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("GetStarted", for: .normal)
        button.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func getStarted(){
        let vc = LoginPage()
        navigationController?.pushViewController(vc, animated: true)
    }
    func assignbackground(){
        let background = UIImage(named: "notesbg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(GetStartedButton)
        assignbackground()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        GetStartedButton.frame = CGRect(x: 40, y: 500, width: view.frame.size.width - 80, height: 40)
    }

}

