//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ivan Kopych on 23.11.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    var result = "0.0"
    var splitValue = 0
    var tipValue = 0.0

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        settingLabel.text = "Split between \(splitValue) people, with \(Int(tipValue * 100))% tip."
    }
    
    @IBAction func rexalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
