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
    
    var body: some View {
        
        VStack(alignment:.center) {
            
                Form {
                    Text("User data:").font(.title2).bold()
                    TextField("Name:", text: $person.name)
                        .font(.title3)
                    TextField("Email:", text: $person.email)
                        .focused($emailFieldIsFocused)
                        .font(.title3)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    TextField("Description:", text: $person.description).font(.title3)
                }
            }
            .padding(.top, 0)
        
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        
    }
}

struct PersonEditor_Previews: PreviewProvider {
    static var previews: some View {
        PersonEditor(person: .constant(Person()), isNewPerson: true).environmentObject(PeopleData())
    }
}
