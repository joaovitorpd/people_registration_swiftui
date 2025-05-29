//
//  PersonEditor.swift
//  People Registration
//
//  Created by João Vitor Pires Dias on 20/05/25.
//

import Foundation
import SwiftUI

struct PersonEditor: View {
    @Binding var person: Person
    @State var isNewPerson = false
    
    @Environment(\.dismiss) private var dismiss
    @FocusState private var emailFieldIsFocused: Bool
    
    @EnvironmentObject var peopleData: PeopleData
    
    @State private var isNameValid = false
    @State private var isEmailValid = false
    @State private var isDescriptionValid = false

    
    var body: some View {
        
        VStack(alignment:.center) {
            
                Form {
                    Section{
                        Text("User data:")
                            .font(.title2)
                            .bold()
                        TextField("Name:", text: $person.name)
                        
                            .font(.title3)
                            .onChange(of: person.name) {
                                updateNameValidation()
                            }
                        if !isNameValid {
                            Text("Nome deve conter ao menos 3 caracteres")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                        
                        TextField("Email:", text: $person.email)
                            .focused($emailFieldIsFocused)
                            .font(.title3)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .onChange(of: person.email) {
                                updateEmailValidation()
                                }
                        if !isEmailValid  {
                            Text("E-mail vazio ou sem @ .com ou .com.br")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                        TextField("Description:", text: $person.description)
                            .font(.title3)
                            .onChange(of: person.description) {
                                updateDescriptionValidation()
                            }
                        if !isDescriptionValid {
                            Text("Descrição deve conter ao menos 5 caracteres")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .padding(.top, 0)
            .onAppear {
                    updateNameValidation()
                    updateEmailValidation()
                    updateDescriptionValidation()
                    }
        
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
    private func updateNameValidation() {
        isNameValid = Person.isValidName(person.name)
        peopleData.hasValidationError = !isNameValid
    }
    
    private func updateEmailValidation() {
            isEmailValid = Person.isValidEmail(person.email)
        peopleData.hasValidationError = !isEmailValid
        }
    
    private func updateDescriptionValidation() {
        isDescriptionValid = Person.isDescriptionValid(person.description)
        peopleData.hasValidationError = !isDescriptionValid
    }
}

struct PersonEditor_Previews: PreviewProvider {
    static var previews: some View {
        PersonEditor(person: .constant(Person()), isNewPerson: true).environmentObject(PeopleData())
    }
}
