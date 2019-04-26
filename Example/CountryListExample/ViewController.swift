//
//  ViewController.swift
//  CountryListExample
//
//  Created by Juan Pablo on 9/8/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import LocalizedCountryList

class ViewController: UIViewController, CountryListDelegate {

    @IBOutlet weak var selectedCountryLabel: UILabel!

    //Here, you can localize the title and the search placeholder strings if needed
    var countryList = CountryList(title: "Country List", searchPlaceholder: "Search", ignoreCountryCodes: ["AO", "AZ", "BH", "BJ", "BF", "CV", "CG", "FJ", "GW", "KG", "LA", "MG", "ML", "MU", "FM", "MN", "MZ", "NP", "NI", "NE", "PW", "PA", "PG", "PY", "SC", "SR", "TJ", "UG", "UZ"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryList.delegate = self
    }
    
    @IBAction func handleCountryList(_ sender: Any) {
        let navController = UINavigationController(rootViewController: countryList)
        self.present(navController, animated: true, completion: nil)
    }
    
    func selectedCountry(country: Country) {
        self.selectedCountryLabel.text = "\(country.flag!) \(country.name!), \(country.countryCode), \(country.phoneExtension)"
    }
}

