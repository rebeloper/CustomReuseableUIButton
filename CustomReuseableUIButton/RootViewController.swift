//
//  RootViewController.swift
//  CustomReuseableUIButton
//
//  Created by Alex Nagy on 27/02/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit
import TinyConstraints

class RootViewController: UIViewController {
    
    lazy var button0: PurpleButton = {
        let button = PurpleButton(title: "Push Me Custom Button")
        button.addTarget(self, action: #selector(button0Tapped), for: .touchUpInside)
        return button
    }()
    
    lazy var button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.setTitle("Push Me 1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func button0Tapped() {
        print("Button 0 tapped")
    }
    
    @objc fileprivate func button1Tapped() {
        print("Button 1 tapped")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        view.addSubview(button0)
        view.addSubview(button1)
        
        button0.edgesToSuperview(excluding: .bottom, insets: .top(36) + .left(12) + .right(12), usingSafeArea: true)
        button0.height(50)
        
        button1.topToBottom(of: button0, offset: 12)
        button1.leftToSuperview(offset: 12, usingSafeArea: true)
        button1.rightToSuperview(offset: -12, usingSafeArea: true)
        button1.height(50)
        
        
    }


}

