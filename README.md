# SwiftyQL
A sample implementation to talk to a GraphQL Server from Swift.

This repository contains a GraphQL Server aswell as a Swift client which communicates with this server.
To run this demo project you should start the server first.

## Server

```
cd SwiftyQLServer
npm install
npm start
```

Next you can head to [localhost](localhost:8000) on port 8000 in your browser to see the GraphIQL interface. GraphIQL is like a playground to test your server. Information on the server and the implemented demo queries are described in the README of the [SwiftyQLServer](/SwiftyQLServer) folder.

## Client

Next you need to start the Swift client. This demo project makes use of some third party dependencies.

1. [RxSwift & RxCocoa](https://github.com/ReactiveX/RxSwift)
2. [Moya](https://github.com/Moya/Moya)
3. [Moya-ModelMapper](https://github.com/sunshinejr/Moya-ModelMapper)

To install this dependencies you need to run cocoapods. If you are not familiar with this I recommend reading their [Getting Started](https://guides.cocoapods.org/using/getting-started.html) guide.

```
cd SwiftQLClient
pod install
open *.xcworkspace
```

Next you can open the *.xcworkspace* file and run the application. The demo project inserts a new object and afterwards retrieves all available objects to show them in a tableview. For detailed information on the Swift client have a look at the README of the [SwiftyQLClient](/SwiftyQLClient) folder.

## Contributions
Contributions are very welcome. Don't be shy and help to improve this project. GraphQL and Swift are both some modern technologies and in my opinion this technology stack can help many people to build better software. If you want to contact me, have ideas for improvement or want to contribute some of your work create an issue and I'll will come back at you as soon as possible.

## License
The repository contains the LICENSE file on the root level. This project makes use of the MIT license because we all love free software !
