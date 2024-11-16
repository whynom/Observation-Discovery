# Observation Discovery

How the heck does one use Apple's `Observation` framework?  What does it do?  Well, I&rsquo;m not 100% sure, so let&rsquo;s play around with it until we do!

## Observe a property and react to it only once.

`Observation` is a package that does what you&rsquo;d expect it to do.  It gives you a way to see changes in a property or instance and react to them.  Let&rsquo;s use a basic type.

``` swift
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

```


## The tests

``` swift
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
```
