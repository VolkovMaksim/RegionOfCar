//
//  RegionViewController.swift
//  RegionOfCar
//
//  Created by Maksim Volkov on 23.03.2025.
//

import UIKit

class RegionViewController: UIViewController {
    
    var numberAndRegion = NumbersAndRegions()

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var defineButton: UIButton!
    @IBOutlet weak var numberOfRegion: UITextField!
    @IBOutlet weak var regionName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        mainView.addGestureRecognizer(hideKeyboardGesture)
    }

    @IBAction func defineButton(_ sender: UIButton) {
        guard numberOfRegion.text != "" else { return }
        
        if let region = numberAndRegion.numbAndReg[numberOfRegion.text!] {
            regionName.text = region
//            print(region)
        } else {
            regionName.text = "Нет такого региона"
        }
    }
}

extension RegionViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillBeHidden),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)

        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    @objc func hideKeyboard() {
        mainView.endEditing(true)

    }
    
    @objc func keyBoardWasShow(notification: Notification) {

    }
    
    @objc func keyBoardWillBeHidden(notification: Notification) {

    }
}
