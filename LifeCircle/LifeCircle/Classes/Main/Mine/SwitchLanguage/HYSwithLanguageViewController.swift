//
//  HYSwithLanguageController.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/27.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

/// 重用标示符
private let cellReuseIdentifier =
    "HYSwitchLanguageCellReuseIdentifier"

class HYSwithLanguageViewController: UITableViewController {
    
    /// 支持语言
    private lazy var languages = [
        "English",
        "简体中文",
        "عربي",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title =
            HYLanguageTools.adaptationText(
                key: "Multilingual",
                comment: "多语言切换标题"
        )
        
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: cellReuseIdentifier
        )
        
        tableView.backgroundColor = UIColor.random()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        cell.accessoryType = .checkmark
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        cell.accessoryType = .none
    }

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return languages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell.selectionStyle = .none
        cell.textLabel?.text = languages[indexPath.row]
        
        
        return cell
    }
 
}
