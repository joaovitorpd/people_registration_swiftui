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
    
    static func isValidName(_ name: String) -> Bool {
        let nameSizeTest = name.count >= 3
        let nameIsNotEmpty = !name.isEmpty
        return nameSizeTest && nameIsNotEmpty
    }
    
    static func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.(com|com\\.br)"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email) && !email.isEmpty
        }
    
    static func isDescriptionValid(_ description: String) -> Bool {
        let descriptionSizeTest = description.count >= 5
        let descriptionNotEmpty = !description.isEmpty
        return descriptionSizeTest && descriptionNotEmpty
    }

}
