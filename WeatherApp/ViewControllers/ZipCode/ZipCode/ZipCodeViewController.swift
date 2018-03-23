//
//  ZipCodeViewController.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ZipCodeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var zipCodeField: UITextField!
    
    var viewModel = ZipCodeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel?.text = viewModel.title
        locationLabel?.text = "Location: \(viewModel.location.value ?? "Unknown")"
        self.setBindings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBindings() {
        viewModel.location.bind {
            [unowned self] (location) in
            self.locationLabel?.text = "Location: \(location)"
        }
    }
    
    @IBAction func verifyZipCodePressed(_ sender: UIButton) {
        viewModel.verifyZipCode(zipCodeField?.text)
    }
    
    @IBAction func viewWeatherPressed(_ sender: UIButton) {
        let weatherStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let firstVC = weatherStoryboard.instantiateInitialViewController() else {
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
