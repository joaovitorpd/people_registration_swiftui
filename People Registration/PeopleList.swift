//
//  ContentView.swift
//  People Registration
//
//  Created by João Vitor Pires Dias on 12/05/25.
//

import SwiftUI

struct PeopleList: View {
    @ObservedObject var people: PeopleData
    @State private var isAddingPerson = false
    @State private var newPerson = Person()
    
    @State private var selection: Person?
    
    var disableAddButton: Bool {
        !Person.isValidName(newPerson.name) || !Person.isValidEmail(newPerson.email) ||
        !Person.isDescriptionValid(newPerson.description)
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(people.people) { person in
                    PersonRow(person: person)
                        .tag(person)
                        .swipeActions {
                            Button(role: .destructive) {
                                selection = nil
                                people.remove(person)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }.disabled(people.hasValidationError)
                        }
                }
            }
            .navigationTitle("Registered People")
            .toolbar {
                ToolbarItem {
                    Button {
                        newPerson = Person()
                        isAddingPerson = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingPerson) {
                NavigationStack {
                    PersonEditor(person: $newPerson, isNewPerson: true)
                        .environmentObject(people)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isAddingPerson = false
                                }
                            }
                            ToolbarItem {
                                Button {
                                    people.add(newPerson)
                                    isAddingPerson = false
                                } label: {
                                    Text("Add")
                                }.disabled(disableAddButton)
                            }
                        }
                }
            }
        } detail: {
            ZStack {
                if let person = selection, let personBinding = people.getBindingToPerson(person) {
                            PersonEditor(person: personBinding)
                                .environmentObject(people)
                        } else {
                            Text("Select Person")
                                .foregroundStyle(.secondary)
                        }
            }
        }
    }
}

struct PeopleList_Previews: PreviewProvider {
    static var previews: some View{
        PeopleList(people: PeopleData())
    }
}
