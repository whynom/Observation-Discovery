//
//  PlayingWithObservation.swift
//  ObservationDiscovery
//
//  Created by ynom on 11/15/24.
//

import Foundation
import Observation

@Observable
class Animal {
    init(species: String, color: String) {
        self.species = species
        self.color = color
    }
    
    var species: String
    var color: String
}
