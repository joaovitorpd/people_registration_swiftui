//
//  People_RegistrationApp.swift
//  People Registration
//
//  Created by João Vitor Pires Dias on 12/05/25.
//

import SwiftUI

@main
struct People_RegistrationApp: App {
    @StateObject var people = PeopleData()
    var body: some Scene {
        WindowGroup {
            PeopleList(people: people)
                .task {
                    people.load()
                }
                .onChange(of: people.people, people.save)
        }
    }
}
