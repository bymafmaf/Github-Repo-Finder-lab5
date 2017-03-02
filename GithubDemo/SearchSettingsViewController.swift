//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by monus on 2/28/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit
protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}

class SearchSettingsViewController: UIViewController {
    weak var delegate: SettingsPresentingViewControllerDelegate?
    var settings: GithubRepoSearchSettings?
    let step: Float = 1000.0

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        
        starNumber.text = String(format: "%g", sender.value/1000.0) + "K"
        settings?.minStars = Int(sender.value)
        print("now: ")
        print(sender.value)
    }
    @IBOutlet weak var starNumber: UILabel!
    @IBAction func cancelClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: {() -> Void in
            self.delegate?.didCancelSettings()
        })
        
    }
 
    
    @IBAction func saveClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: {() -> Void in
            if let settings = self.settings {
                self.delegate?.didSaveSettings(settings: settings)
            }
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
