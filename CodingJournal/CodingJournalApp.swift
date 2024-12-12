//
//  CodingJournalApp.swift
//  CodingJournal
//
//  Created by Ismaïl on 08/12/2024.
//

import SwiftUI
import SwiftData

@main
struct CodingJournalApp: App {
    var body: some Scene {
        WindowGroup {
            CardEntriesView()
        }
        .modelContainer(for: Entry.self)
    }
}
