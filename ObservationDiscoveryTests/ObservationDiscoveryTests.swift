//
//  ObservationDiscoveryTests.swift
//  ObservationDiscoveryTests
//
//  Created by ynom on 11/15/24.
//

import Testing
import Observation
@testable import ObservationDiscovery

class ObservationDiscoveryTests {

    /// When the property in the first closure of withObservationTracking changes
    /// The closure in the second block is executed
    @Test func example() async throws {
        let tiger = Animal(species:"tiger", color: "orange")
        var tigerColorChanges = 0
        
        withObservationTracking({
            print("Tiger color: \(tiger.color)")
        }, onChange: {
            tigerColorChanges += 1
        })
        
        tiger.color = "blue"
        
        #expect(tiger.color == "blue")
        #expect(tigerColorChanges == 1)
        
        /// But only once
        tiger.color = "green"
        #expect(tigerColorChanges != 2)
    }

}
