//
//  CurrentLocationViewController.swift
//  WeatherApp
//
//  Created by Mac on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class CurrentLocationViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var viewModel = CurrentLocationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setBindings()
        titleLabel?.text = viewModel.title
        viewModel.enableLocationServices()
        guard let zipCode = viewModel.zipCode.value,
            let location = viewModel.location.value else { return }
        zipCodeLabel?.text = "Zip Code: \(zipCode)"
        locationLabel?.text = "Location: \(location)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getMyLocationPressed() {
        viewModel.getLocation()
    }
    
    func setBindings() {
        viewModel.zipCode.bind {
            [unowned self] in
            self.zipCodeLabel?.text = "Zip Code: \($0)"
        }
        viewModel.location.bind {
            [unowned self] in
            self.locationLabel?.text = "Location: \($0)"
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
