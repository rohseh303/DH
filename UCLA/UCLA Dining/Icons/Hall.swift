//
//  HallStruct.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 10/19/22.
//

import Foundation

struct Hall {
    var name: String
    var dishes: [String : [String]]?
    var image: String
    var fixed_menu: [String]?
    var sections: Int?
    var section_names: [String]?
}
