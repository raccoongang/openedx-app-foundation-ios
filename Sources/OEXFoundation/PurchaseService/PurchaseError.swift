//
//  PurchaseError.swift
//  OEXFoundation
//
//  Created by Ivan Stepanok on 05.09.2025.
//

import Foundation

public enum PurchaseError: Error {
    case purchaseFailed
    case productNotFound
    case userCancelled
    case networkError
}
