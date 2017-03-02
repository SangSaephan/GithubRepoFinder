//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Sang Saephan on 3/1/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}


class SearchSettingsViewController: UIViewController {
    
    weak var delegate: SettingsPresentingViewControllerDelegate?
    var settings = GithubRepoSearchSettings()
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var starsCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        slider.value = Float(settings.minStars)
        starsCountLabel.text = "\(Int(round(slider.value)))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.delegate?.didSaveSettings(settings: settings)
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.delegate?.didCancelSettings()
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        settings.minStars = Int(slider.value)
        starsCountLabel.text = "\(Int(round(slider.value)))"
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
