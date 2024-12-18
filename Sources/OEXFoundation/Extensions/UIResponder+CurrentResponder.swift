//
//  File.swift
//  OExFoundation
//
//  Created by Ivan Stepanok on 07.10.2024.
//

import Foundation
import UIKit

public extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }

    private weak static var _currentFirstResponder: UIResponder?

    @objc private func findFirstResponder(_: Any) {
        UIResponder._currentFirstResponder = self
    }

    var globalFrame: CGRect? {
        guard let view = self as? UIView else {
            return nil
        }

        return view.superview?.convert(view.frame, to: nil)
    }
}
