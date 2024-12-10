//
//  Entry.swift
//  CodingJournal
//
//  Created by Ismail Larbi Pacha on 10/12/24.
//

import Foundation
import SwiftData

@Model
class Entry {
    var title: String
    var subtitle: String
    var date: Date
    var details: String
    
    init(title: String, subtitle: String, date: Date, details: String) {
        self.title = title
        self.subtitle = subtitle
        self.date = date
        self.details = details
    }
}
