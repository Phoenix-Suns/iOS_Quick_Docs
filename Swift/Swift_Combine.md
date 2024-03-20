# Swift Combine: thread control

- [Swift Combine: thread control](#swift-combine-thread-control)
  - [Declare](#declare)
  - [Combine Operator](#combine-operator)
  - [@Pulished: listen, send value](#pulished-listen-send-value)
  - [PassthroughSubject, subscriber nhận value SAU thời điểm subscribe.](#passthroughsubject-subscriber-nhận-value-sau-thời-điểm-subscribe)
  - [CurrentValueSubject, subscriber nhận value HIỆN TẠI \& SAU thời điểm subscribe.](#currentvaluesubject-subscriber-nhận-value-hiện-tại--sau-thời-điểm-subscribe)
  - [AnyPublisher: store and convert Publisher](#anypublisher-store-and-convert-publisher)
  - [Wait for all complete](#wait-for-all-complete)
    - [Merge, CombineLatest, Zip](#merge-combinelatest-zip)


```swift
import Combine

let subscriber = Subscribers.Sink(receiveCompletion: { completion in
    print(completion)
}) { value in
    print(value)
}

"Techbase VN".publisher.subscribe(subscriber) 
subscriber.cancel()
///// OUTPUT /////
// T e c h b a s e  V N
// Techbase is Character Array, emit single character
```

## Declare

```swift
let publisher = [123].publisher // OK
let x = Just(1) as Publisher
```

## Combine Operator

```swift
prepend(), append(), switchToLatest(), merge(), combineLatest(), zip()
```

## @Pulished: listen, send value

```swift
import Combine

class User {
    @Published var name = "---" 
    @Published var age = 0
}
let user = User()


// ===== Send Name =====
let subscriber = user.$name.sink { (value) in 
    print("user.$name = \(value)")
}
user.name = "Thái Hà"   // Send "name" to print
subscriber.cancel()


// ===== Send Age =====
let subscriber1 = user.$age.sink { (value) in 
    print("user.$age = \(value)")
}
user.age = 30   // Send "age" to print
subscriber1.cancel()


///// OUTPUT ///// 
user.$name = --- 
user.$name = Thái Hà 
user.$age = 0 
user.$age = 30
```

## PassthroughSubject, subscriber nhận value SAU thời điểm subscribe.

```swift
let subject = PassthroughSubject()
subject.send(0) // Send "0"
let subscriberX = subject.sink { (value) in 
    print("X status: ", value)
} receiveValue: { (value1) in 
    print("X value: ", value1)
}

// Output not show "0"
```

## CurrentValueSubject, subscriber nhận value HIỆN TẠI & SAU thời điểm subscribe.

```swift
let subject = CurrentValueSubject(0)
subject.send(0) // Send "0"
let subscriberX = subject.sink { (value) in 
    print("X status: ", value)
} receiveValue: { (value1) in 
    print("X value: ", value1)
}

// Output show "0"
```

## AnyPublisher: store and convert Publisher

```swift
let subject = PassthroughSubject() 

// AnyPublisher to subcribe value from subject
let publisherX = subject.eraseToAnyPublisher()

// AnyPublisher to subcribe value from publisherX. value * 100
let publisherY = publisherX.map { $0 * 100 }.eraseToAnyPublisher()

// value * 1000
let subcriber1 = publisherX
    .map { 1000 + $0 }
    .sink { print("X \($0)") }
subject.send(0)

// value * 100
let subcriber2 = publisherY
    .sink { print("Y \($0)") }

subject.send(1) 
subcriber1.cancel() 
subject.send(2) 
subcriber2.cancel()

///// OUTPUT /////
X 1000 // recieve khi subject.send(0) 
Y 100 // recieve khi subject.send(1) 
X 1001 // recieve khi subject.send(1)
Y 200 // recieve khi subject.send(2)
```

## Wait for all complete

```swift
let pubs = [Just(1),Just(2),Just(3)]
let downstream = Publishers.MergeMany(pubs).collect()


// ----- OR -----
@Published private var acceptedTerms: Bool = false
@Published private var acceptedPrivacy: Bool = false
@Published private var name: String = ""

// Receive All value complete
Publishers.CombineLatest3($acceptedTerms, $acceptedPrivacy, $name)
    .map { terms, pricacy, name in
        terms && pricacy && !name.isEmpty
    }.eraseToAnyPublisher()

// Send All Value
acceptedTerms = true
acceptedPrivacy = true
name = "Test Name"
```

### Merge, CombineLatest, Zip

```swift
// merge: This operator combines two publishers of the same type into one
// combineLatest: This operator combines the latest values from multiple publishers whenever any of them emit a new value
// zip: This operator combines values from multiple publishers pair-wise, emitting a tuple of values when all publishers have emitted a value

import UIKit
import Combine

let publisherInt1 = PassthroughSubject<Int, Never>()
let publisherInt2 = PassthroughSubject<Int, Never>()
let publisherStr1 = PassthroughSubject<String, Never>()
let publisherStr2 = PassthroughSubject<String, Never>()

// Same type, sink when one publisher receive value
let merged = Publishers.MergeMany([publisherInt1, publisherInt2])
    .sink { value in
        print("MergeMany value: \(value)")
    }


// Difference Type + Same type, sink when ALL publisher receive value
// Sink value order by publisher sink (go first - out first)
let combine = Publishers.CombineLatest(publisherInt1, publisherStr1)
    .sink { value in
        print("CombineLatest value: \(value)")
    }

// Sink value order by Zip code (first code, out first)
let zip = Publishers.Zip(publisherInt1, publisherStr1)
    .sink { value in
        print("Zip value: \(value)")
    }

publisherInt1.send(1)
publisherInt2.send(2)
publisherStr1.send("Hello ")
publisherStr2.send("Word")

//MergeMany value: 1
//MergeMany value: 2
//Zip value: (1, "Hello ")
//CombineLatest value: (1, "Hello ")
```

