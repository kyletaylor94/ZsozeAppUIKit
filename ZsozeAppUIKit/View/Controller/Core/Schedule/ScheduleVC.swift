//
//  ScheduleVC.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 14/04/2024.
//

import Foundation
import UIKit
import SwiftLayoutKit

class ScheduleVC: UIViewController {
    //MARK: - Properties
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "ESEMÉNYEK"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = UIColor.white
        return label
    }()
    
    private let actuallyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("AKTUÁLIS", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleActuallyButton), for: .touchUpInside)
        return button
    }()
    
    private let scheduleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MENETREND", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleScheduleButton), for: .touchUpInside)
        return button
    }()
    
    let animationView = LottieAnimations()
        
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "backGround")
        
        view.addSubview(topLabel)
        topLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leftAnchor, paddingLeft: 10)
        
        view.addSubview(actuallyButton)
        actuallyButton.anchor(top: topLabel.bottomAnchor,left: view.leftAnchor, paddingTop: 20, paddingLeft: 0)
        
        view.addSubview(scheduleButton)
        scheduleButton.anchor(top: topLabel.bottomAnchor, left: actuallyButton.rightAnchor,right: view.rightAnchor, paddingTop: 20)
        
        
    }
    
    //MARK: - Actions
    @objc func handleActuallyButton(){
        print("handleActuallyButton")
    }
    
    @objc func handleScheduleButton() {
        print("handleScheduleButton")
    }
}
