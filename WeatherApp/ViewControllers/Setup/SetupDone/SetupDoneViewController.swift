//
//  SetupDoneViewController.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SetupDoneViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    lazy var viewModel = SetupDoneViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel?.text = WeatherSettings.setupComplete ? viewModel.titleSetupComplete : viewModel.titleSetupIncomplete
        descriptionLabel?.text = WeatherSettings.setupComplete ? viewModel.descriptionSetupComplete : viewModel.descriptionSetupIncomplete
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewWeatherPressed(_ sender: UIButton) {
        if WeatherSettings.setupComplete {
            performSegue(withIdentifier: "SetupDoneVC2WeatherVC", sender: nil)
        }
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
