//
//  ScaleSelectionViewController.swift
//  WeatherApp
//
//  Created by Mac on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ScaleSelectionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    lazy var viewModel = ScaleSelectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel?.text = viewModel.title
        descriptionLabel?.text = viewModel.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedSelectionChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: // Fahrenheit
            WeatherSettings.chosenScale = .Fahrenheit
        case 1: // Celsius
            WeatherSettings.chosenScale = .Celsius
        default:
            WeatherSettings.chosenScale = .Default
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
