//
//  People.swift
//  People Registration
//
//  Created by João Vitor Pires Dias on 12/05/25.
//

import Foundation

struct Person: Identifiable, Hashable, Codable {
    var id = UUID()
    var name = ""
    var email = ""
    var description = ""
    
    static var example = Person(
    name: "Example Name",
    email: "example@example.com",
    description: "Describing descriptions"
    )
    
}
