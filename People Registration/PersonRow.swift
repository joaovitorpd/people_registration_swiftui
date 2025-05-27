//
//  PersonRow.swift
//  People Registration
//
//  Created by João Vitor Pires Dias on 20/05/25.
//

import Foundation
import SwiftUI

struct PersonRow: View {
    @ScaledMetric var imageWidth: CGFloat = 40
    
    let person: Person
    
    var body: some View {
        HStack {
            Label {
                VStack(alignment: .leading, spacing: 5) {
                    Text(person.name)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text(person.description)
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            } icon: {
                Image(systemName: "person.circle")
                    .padding(.trailing, 15)
            }.labelStyle(CustomLabelStyle())
        }
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonRow(person: Person.example)
    }
}
