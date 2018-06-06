# STWGroupChainKit

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

class SampleHandler: AbstractHandler {
    override func execute(object: ChainElement) {
        /// Handle block and return a result
    }
}
```

### Declare a chain

```swift

var chain: Chain?

let handlers = [HandlerOne(), HandlerTwo(), HandlerThree(), HandlerFour(), HandlerFive(), HandlerSix()]
chain = Chain(handlers: handlers)
        
let handlerFour = ChainElement(type: .type(HandlerSix.self), target: self) { (result) in
            
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
