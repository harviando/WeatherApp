//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager() //inisialisasi struct WeatherManager ke variable weatherManager
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        locationManager.delegate = self
        searchTextField.delegate = self // untuk mengassign delegate pada searchTextField
        weatherManager.delegate = self // untuk assign kelas ini ke delegate weatherManager
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
    //Fungsi untuk mengubah label cityLabel sesuai dengan Teks pada seacrhFieldText
    func changeCityLabel(toName: String) {
        cityLabel.text = toName
    }
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    
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
        
        if let city = searchTextField.text { // untuk opsionaly unwarp teks dari searchTextField ke city
            weatherManager.fetchWeather(cityName: city) // jalanin fungsi fetchWeather di struct weatherManager dgn ngasih city ke param
        }
        
        searchTextField.text = "" // mengosongkan teks pada searchTextField.text
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
   
    //Delegate methon from WeatherManager
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.tempratureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(lat: lat, lon: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
