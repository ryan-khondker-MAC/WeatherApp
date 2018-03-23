//
//  SetupPageViewController.swift
//  WeatherApp
//
//  Created by Mac on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SetupPageViewController: UIPageViewController {
    lazy var views: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "WelcomeViewController"),
            self.getViewController(withIdentifier: "ScaleSelectionViewController"),
            self.getViewController(withIdentifier: "GetLocationViewController"),
            self.getViewController(withIdentifier: "CurrentLocationViewController"),
            self.getViewController(withIdentifier: "SetupDoneViewController")
        ]
    }()
    
    private func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Setup", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = self
        self.delegate = self
        guard let firstVC = views.first else {
            fatalError("No view controllers exist in page view controller")
        }
        setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension SetupPageViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = views.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard views.count > previousIndex else {
            return nil
        }
        return views[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = views.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < views.count else {
            return nil
        }
        return views[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return views.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
