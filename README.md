# StanwoodGroupChain

[![Swift Version](https://img.shields.io/badge/Swift-5.0-orange.svg)]()
[![Build Status](https://travis-ci.org/stanwood/StanwoodGroupChain.svg?branch=master)](https://travis-ci.org/stanwood/StanwoodGroupChain)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

```ruby
pod "StanwoodGroupChain"
```

## Usage

### Add handlers

```swift
import StanwoodGroupChain

class ExampleHandler: AbstractHandler {
    
    override func execute(_ element: ChainElement) {
        
        /// Make a networking call, load from file, run animation and return a result
        
        /// Access the target
        let target = element.target
        
        /// Use custom userInfo
        let userInfo = element.userInfo
        
        /// Return a response if reqruied on success
        let someItem = ModelItem()
        let response = ChainResponse(object: someItem)
        let successResult: ChainResult = .success(response)
        element.resultComplition?(successResult)
        
        /// Return an error if requried
        let error: ChainError = ChainError(message: "Something went wrong...")
        let failureResult: ChainResult = .failure(error)
        element.resultComplition?(failureResult)
    }
}
```

### Declare a chain

```swift

var chain: Chain?

let handlers = [ExampleHandler(), HandlerOne(), HandlerTwo(), HandlerThree(), HandlerFour(), HandlerFive(), HandlerSix()]
chain = Chain(handlers: handlers)  
```

### Instantiate handler element and handle

```swift
let handlerFour = ChainElement(type: .type(ExampleHandler.self), target: self) { (result) in
            
   switch result {
      case .failure(let error): print("Handle error, \(error.description)")
      case .success(let item): print("Handle item, \(item)")
                
         /// Call the next handler
      }
  }
        
let handlerOne = ChainElement(type: .type(HandlerSix.self), target: self) { [weak self, handlerFour = handlerFour] (result) in
            
    guard let `self` = self else { return }
            
    switch result {
      case .failure(let error): print("Handle error, \(error.description)")
      case .success(let item): print("Handle item, \(item)")
                
         /// Call the next handler
                
         self.chain?.handel(handlerFour)
      }
 }
        
chain?.handel(handlerOne)
```


## License

StanwoodCore is under MIT licence. See the LICENSE file for more info.
