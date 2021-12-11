//
//  AllNotesHome.swift
//  NotesApp
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AllNotesHome: UIViewController {

    private let myTableView=UITableView()
    private var noteArray=[String]()
    
    private func fetchNotesData(){
        noteArray = FMS.getfile()
        myTableView.reloadData()
    }
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(addnotes), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 30
        return button
    }()

    @objc func addnotes(){
        let vc = NotesVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logout(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //setupTableView()
        title = "Notes"
        let item=UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(logout))
        navigationItem.setRightBarButton(item, animated: true)
        setupTableView()
        view.addSubview(myTableView)
        view.addSubview(addButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNotesData()
        myTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTableView.frame=CGRect(x: 0,
                                 y:view.safeAreaInsets.top,
                                 width: view.frame.size.width,
                                 height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        addButton.frame = CGRect(x: view.frame.size.width / 2 - 30, y: view.frame.size.height - 80, width: 60, height: 60)
    }
}
extension AllNotesHome: UITableViewDataSource,UITableViewDelegate{

    private func setupTableView(){
        myTableView.dataSource=self
        myTableView.delegate=self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "NotesCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int)->Int{
        return noteArray.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell=tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        cell.textLabel?.text = noteArray[indexPath.row]
        //cell.setupFoodCellWith(title: foodArray[indexPath.row],title1: detailArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NotesVC()
        vc.fname = noteArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.noteArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
       // var fname = noteArray[indexPath.row]
        
        let filePath = FMS.getDocDir().appendingPathComponent(noteArray[indexPath.row])
        
        do{
            try FileManager.default.removeItem(at: filePath)
        }catch{
            print(error)
        }
    }
}
