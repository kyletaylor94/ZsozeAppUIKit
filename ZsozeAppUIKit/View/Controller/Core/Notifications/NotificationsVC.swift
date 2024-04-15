//
//  NotificationsVC.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 14/04/2024.
//

import Foundation
import UIKit
import SwiftLayoutKit

class NotificationsVC: UIViewController {
    //MARK: - Properties
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Értesítések"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = UIColor.white
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleDismissButton), for: .touchUpInside)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "arrow.left.circle.fill", withConfiguration: config )?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let tableView = UITableView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = UIColor(named: "backGround")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "notificationCell")
        tableView.rowHeight = 120
        tableView.backgroundColor = view.backgroundColor
        tableView.separatorStyle = .none
        
        
        let stack = UIStackView(arrangedSubviews: [backButton, topLabel])
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .equalSpacing
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 5, paddingLeft: 15)
        
        view.addSubview(tableView)
        tableView.anchor(top: topLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 10)
        
    }
    
    //MARK: - Action
    @objc func handleDismissButton(){
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationTableViewCell
        return cell
    }
    
    
}
