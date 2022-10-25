//
//  WebScraping.swift
//  UCLA Dining
//
//  Created by Rohan Sehgal on 10/21/22.
//

import SwiftUI

struct WebScraping: View {
    var hall: Hall
    
    var body: some View {
        Text(hall.website)
    }
}

struct WebScraping_Previews: PreviewProvider {
    static let HallPreview = Hall(
        name: "sample dining hall",
        website: "createwithswift.com",
        image: "Epicuria at Covel"
    )
    
    static var previews: some View {
        // 5. Use the right SecondView initializator
        Menu(hall: HallPreview)
    }
}
