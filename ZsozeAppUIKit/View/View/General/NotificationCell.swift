//
//  NotificationTableViewCell.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 14/04/2024.
//

import Foundation
import UIKit
import SwiftLayoutKit

class NotificationTableViewCell: UITableViewCell {
    //MARK: Properties
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.notiCellBackground
        view.layer.cornerRadius = 110 / 8
        return view
    }()
    
    private let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage.channels4Profile
        iv.setDimensions(height: 70, width: 70)
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 70 / 4
        return iv
    }()
    
    private let postTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 2
        label.text = "Zsozeatya Vod új videót töltött fel"
        return label
    }()
    
    private let postSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.numberOfLines = 2
        label.text = "Zsozeatya vod 1 új youtube videót tett közzé"
        return label
    }()
    
    private let postDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .systemGray6
        label.text = "3 órája"
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        addSubview(container)
        container.anchor(top: safeAreaLayoutGuide.topAnchor,left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor,paddingTop: 15,paddingLeft: 15, paddingRight: 15,height: 110)
        
        container.addSubview(profileImage)
        profileImage.anchor(top: container.topAnchor,left: container.leftAnchor, paddingTop: 15, paddingLeft: 15)
        
        let stack = UIStackView(arrangedSubviews: [postTitleLabel, postSubTitleLabel, postDateLabel])
        stack.axis = .vertical
        stack.spacing = 3
        stack.alignment = .leading
        stack.distribution = .fillEqually
        
        container.addSubview(stack)
        stack.anchor(top: container.topAnchor, left: profileImage.rightAnchor, bottom: container.bottomAnchor, right: container.rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 5)
        
    }
    
}
