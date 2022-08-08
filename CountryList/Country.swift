//
//  Country.swift
//  CountryListExample
//
//  Created by Juan Pablo on 9/8/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//
//  Updated by Morgan Dock on 8/16/18.
//  Copyright © 2018 Morgan Matthew Dock. All rights reserved.

import UIKit

public class Country: NSObject {
    
    public var countryCode: String
    public var phoneExtension: String
    
    public var name: String? {
        let current = Locale.current
        return current.localizedString(forRegionCode: countryCode) ?? nil
    }
    
    public var flag: String? {
        return flag(country: countryCode)
    }
    
    public init(countryCode: String, phoneExtension: String) {
        self.countryCode = countryCode
        self.phoneExtension = phoneExtension
    }
    
    private func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}


extension Country {
    static func countryFor(code: String) -> Country? {
        guard code.count == 2 else {
            assertionFailure("Country code length not of length 2 will always result in `nil`")
            return nil
        }
        
        let countries = Countries()
        let country = countries.countries.first { country in
            return country.countryCode == code
        }
        
        return country
    }
}
