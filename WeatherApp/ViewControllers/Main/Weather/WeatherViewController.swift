//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var currentConditionImage: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentConditionLabel: UILabel!
    @IBOutlet weak var highestTempLabel: UILabel!
    @IBOutlet weak var lowestTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var cloudinessLabel: UILabel!
    
    var viewModel = WeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.locationNameLabel?.text = WeatherSettings.locationName
        self.setBindings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBindings() {
        viewModel.weatherDetails.bind {
            [unowned self] (weatherDetails) in
            DispatchQueue.main.async {
                let tempReachedThreshold = weatherDetails.mainWeatherData.convertedCurrentTemp >= Constants.kThresholdForColor
                self.view.backgroundColor = tempReachedThreshold ? Constants.hotColor : Constants.coldColor
                self.currentTempLabel?.text = "\(weatherDetails.mainWeatherData.convertedCurrentTemp)°\(WeatherSettings.chosenScale == .Fahrenheit ? "F" : "C")"
                self.currentConditionLabel?.text = weatherDetails.weatherConditions.first?.description
                self.highestTempLabel?.text = "Max: \(weatherDetails.mainWeatherData.convertedMaxTemp)°\(WeatherSettings.chosenScale == .Fahrenheit ? "F" : "C")"
                self.lowestTempLabel?.text = "Min: \(weatherDetails.mainWeatherData.convertedMinTemp)°\(WeatherSettings.chosenScale == .Fahrenheit ? "F" : "C")"
                self.humidityLabel?.text = "Humidity: \(weatherDetails.mainWeatherData.humidity)%"
                self.windSpeedLabel?.text = "Wind Speed: \(weatherDetails.windData.speed) m/s"
                self.windDirectionLabel?.text = "Wind Direction: \(weatherDetails.windData.direction)°"
                self.cloudinessLabel?.text = "Cloudiness: \(weatherDetails.cloudData.cloudiness)%"
                
            }
        }
        viewModel.weatherError.bind {
            (error) in
            print(error.localizedDescription)
        }
        viewModel.imageData.bind {
            [unowned self] (imageData) in
            DispatchQueue.main.async {
                self.currentConditionImage?.image = UIImage(data: imageData)
            }
        }
        viewModel.imageError.bind {
            (error) in
            print(error.localizedDescription)
        }
        viewModel.setup()
    }
    
    @IBAction func changeLocationPressed(_ sender: UIButton) {
        let zipCodeStoryboard = UIStoryboard(name: "ZipCode", bundle: nil)
        guard let firstVC = zipCodeStoryboard.instantiateInitialViewController() else {
            fatalError("No view controllers exist")
        }
        show(firstVC, sender: nil)
    }
    
    @IBAction func setupPressed(_ sender: UIButton) {
        WeatherSettings.zipCode = nil
        WeatherSettings.locationName = nil
        let setupStoryboard = UIStoryboard(name: "Setup", bundle: nil)
        guard let firstVC = setupStoryboard.instantiateInitialViewController() else {
            fatalError("No view controllers exist")
        }
        show(firstVC, sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
