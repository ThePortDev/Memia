//
//  MainMenuViewModel.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import Foundation
import SwiftUI


class MainMenuViewModel: ObservableObject {
    @Published var paid = false
    var coins: Int = 0
    var iconLock = "🔒"
    
    func getPaid() {
        paid = true
    }
}
