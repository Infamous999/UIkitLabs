//
//  ViewController.swift
//  Lab
//
//  Created by Dmitrii Shelema on 02.03.2024.
//

import UIKit

class ViewController: UIViewController {

    
    let titleName = UILabel()
    var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(titleName)
        
        titleName.frame = CGRect(x: 60, y: 100, width: 280, height: 300)
        titleName.text = "Choose your hero"
        titleName.textColor = UIColor.black
        titleName.textAlignment = .center
        titleName.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        icon = UIImageView(image: UIImage(named: "ic"))
        icon.frame = CGRect(x: 116, y: 30, width: 128, height: 27)
        icon.contentMode = .scaleAspectFit
        view.addSubview(icon)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                icon.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
                icon.widthAnchor.constraint(equalToConstant: 128),
                icon.heightAnchor.constraint(equalToConstant: 27)])
        
        
        if icon.image != nil {
            print("UIImageView видит изображение")
        } else {
            print("UIImageView не видит изображение")
        }

        
        
    }


}

