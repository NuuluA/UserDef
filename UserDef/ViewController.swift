//
//  ViewController.swift
//  UserDef
//
//  Created by Арген on 07.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchView: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isOn = UserDefaults.standard.switchIsOn
        updateBackground(isOn: isOn)
        
        let user = User(lastName: "Nurmamat uulu", firstName: "Argen")
        UserDefaults.standard.signedId = user
        print("UserDefaults: \(UserDefaults.standard.signedId)")
    }

    @IBAction func changeSwitch(_ sender: UISwitch) {
        
        updateBackground(isOn: sender.isOn)
        UserDefaults.standard.switchIsOn = sender.isOn
        
    }
    
    private func updateBackground(isOn: Bool) {
        view.backgroundColor = isOn ? .blue : .darkGray
        switchView.isOn = isOn
    }
}

