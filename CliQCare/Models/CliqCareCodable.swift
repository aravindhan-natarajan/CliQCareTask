//
//  CliqCareCodable.swift
//  CliQCare
//
//  Created by Aravindhan Natarajan on 26/04/21.
//

import Foundation

// MARK: - CliqCare
struct CliqCare: Codable {
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let cmsTextComponent: CMSTextComponent?
    let componentName: String?
}

// MARK: - CMSTextComponent
struct CMSTextComponent: Codable {
    let content, type: String?
}
