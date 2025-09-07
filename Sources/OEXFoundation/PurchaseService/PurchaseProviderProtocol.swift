//
//  PurchaseProviderProtocol.swift
//  OEXFoundation
//
//  Created by Ivan Stepanok on 05.09.2025.
//

import Foundation

public protocol PurchaseProviderProtocol: Sendable {
    
    // MARK: Configure
    func configure(configuration: Any?)
    
    // MARK: CourseDetails Screen
    func purchaseCourse(courseID: String, userEmail: String?, priceTier: String) async throws -> Bool
    func getCoursePriceTier(courseID: String) async throws -> String?
    func localizedPrice(tier: String) async throws -> String
    
    // MARK: Discovery Screen
    func getLocalizedCoursesTiers(courseIDs: [String]) async throws -> [String: String]
    
    func restorePurchases() async throws -> RestorePurchasesResult
}

#if DEBUG
public class InAppPurchasesManagerMock: PurchaseProviderProtocol, @unchecked Sendable {
    
    public init() {}
    
    public func configure(configuration: Any?) {}
    
    public func getLocalizedCoursesTiers(courseIDs: [String]) async throws -> [String: String] {
        [:]
    }

    public func purchaseCourse(courseID: String, userEmail: String?, priceTier: String) async throws -> Bool {
        return true
    }
    
    public func getCoursePriceTier(courseID: String) async throws -> String? {
        return nil
    }
    
    public func localizedPrice(tier: String) async throws -> String {
        ""
    }
    
    public func restorePurchases() async throws -> RestorePurchasesResult {
        return .restored
    }
}
#endif
