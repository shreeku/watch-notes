//
//  Note.swift
//  watch-notes Watch App
//
//  Created by Shree kumaar Rathinavelu sivasankaran on 12/7/23.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
