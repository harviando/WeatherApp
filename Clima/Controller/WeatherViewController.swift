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
        searchTextField.delegate = self // untuk mengassign delegate pada searchTextField
    }

    //Fungsi yang dijalankan ketika button search di tekan
    @IBAction func searchPressed(_ sender: UIButton) {
        
        changeCityLabel(toName: searchTextField.text!) // mengubah label city sesuai dengan teks di searchTextField
        
        searchTextField.endEditing(true) //Untuk mendissmiss keyboard melalui delegate
    }
    
    //Fungsi yang mendeteksi tombol "go" pada keyboard di tekan
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        changeCityLabel(toName: searchTextField.text!) // mengubah label city sesuai dengan teks di searchTextField
        
        searchTextField.endEditing(true) //Untuk mendissmiss keyboard melalui delegate
        return true // me-return nilai bool yang diminta pada fungsi
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" { //mendeteksi kalau textfield ada tulisan
            return true // me-return nilai bool yang diminta pada fungsi
        } else {
            textField.placeholder = "Type Something" //mengunci keyboard kalau textfield tidak ada tulisan
            return false // me-return nilai bool yang diminta pada fungsi
        }
    }
    
    // Mendeteksi kalau user telah selesai memasukkan input pada textfield
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        searchTextField.text = "" // mengosongkan teks pada searchTextField.text
    }
    
    //Fungsi untuk mengubah label cityLabel sesuai dengan Teks pada seacrhFieldText
    func changeCityLabel(toName: String) {
        cityLabel.text = toName
    }
}

