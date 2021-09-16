//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        
        changeCityLabel(toName: searchTextField.text!)
        
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        changeCityLabel(toName: searchTextField.text!)
        
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" { //mendeteksi kalau textfield ada tulisan
            return true
        } else {
            textField.placeholder = "Type Something" //mengunchi keyboard kalau textfield gak ada tulisan
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        searchTextField.text = ""
    }
    
    func changeCityLabel(toName: String) {
        cityLabel.text = toName
    }
}

