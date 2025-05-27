//
//  People.swift
//  People Registration
//
//  Created by João Vitor Pires Dias on 20/05/25.
//

import Foundation
import SwiftUI
class PeopleData: ObservableObject {
    @Published var people: [Person] = [
    Person(
        name: "João Vitor",
        email: "joaovitorpd@gmail.com",
        description: "Mobile Developer"
    ),
    Person(
        name: "Igor Moreira",
        email: "igor@live.ie",
        description: "Software Architect"
    )
    ]
    
    func add(_ person: Person) {
        people.append(person)
    }
    
    func remove(_ person: Person){
        people.removeAll{$0.id == person.id}
    }
    
    func getBindingToPerson(_ person: Person) -> Binding<Person>? {
        Binding<Person>(
            get: {
                guard let index = self.people.firstIndex(where: { $0.id == person.id}) else {return Person.example}
                return self.people[index]
            },
            set: { person in
                guard let index = self.people.firstIndex(where: { $0.id == person.id }) else {return}
                self.people[index] = person
                
            }
        )
    }
    
    private static func getPeopleFileURL() throws -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("people.data")
    }
    
    func load() {
        do {
            let fileURL = try PeopleData.getPeopleFileURL()
            let data = try Data(contentsOf: fileURL)
            people = try JSONDecoder().decode([Person].self, from: data)
            print("People loaded: \(people.count)")
        } catch {
            print("Failed to load from file. Backup data used")
        }
    }
    
    func save() {
        do {
            let fileURL = try PeopleData.getPeopleFileURL()
            let data = try JSONEncoder().encode(people)
            try data.write(to: fileURL, options: [.atomic, .completeFileProtection])
            print("People saved")
        }catch {
            print("Unable to save")
        }
    }
}
