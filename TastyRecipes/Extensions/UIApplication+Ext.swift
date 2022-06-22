//
//  UIApplication+Ext.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 20/06/2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}
