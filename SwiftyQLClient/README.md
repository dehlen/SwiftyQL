# SwiftyQLClient
Client written in Swift to communicate with a GraphQL Server.

## Pre Usage
```
sudo gem install cocoapods
cd SwiftyQLClient
pod install
open *.xcworkspace
```

## Run
<kbd>Cmd</kbd> + <kbd>R</kbd>

## Tests
<kbd>Cmd</kbd> + <kbd>U</kbd>

## Implementation
This client makes use of the Moya Network classes. Therefore it is very easy to write tests. Also the project makes use of RxSwift and RxCocoa in order to write code in a functional, reactive, swifty way.

You can open the Demo project to learn how to communicate to a GraphQL Server. Below some implementation details are given which should help you to make your own setup.

### NSAppTransportSecurity
The Info.plist has a entry for NSAppTransportSecurity. This is needed because the server runs on a HTTP server and plain HTTP-Requests are blocked by default. So make sure to add your exception domains when you use your server via HTTP.

### GraphQL Queries
In order to create GraphQL queries this project makes use of the [GraphQLicious](https://github.com/WeltN24/GraphQLicious) library. Because at the moment their podspec isn't updated the source files are currently added manually to the project. If they will update their podspec you can use the library by adding the pod to your Podfile. To learn how to use this project to create your GraphQL queries have a look at *GraphQLBuilder.swift*.

### Moya API Endpoint
As already stated this project uses Moya to make the actual network request to the server. The GraphQLBuilder creates a String which is then added to the POST body of the HTTP request. The API Endpoint follows the standard pattern for Moya Endpoints and should be straightforward. The implementation can be found *APIEndpoint.swift*.

### API Provider
The *APIProvider.swift* class is a wrapper class to make the request and parse the response to your actual model. To accomplish this task all of the methods use the [Moya-ModelMapper](https://github.com/sunshinejr/Moya-ModelMapper). The model class (*Object.swift*) implements the protocol Mappable which enables the possibility to automatically convert the response to this model object. The return value of the wrapper methods all return Observables to make the integration with your ViewController seamless.

### Display Data 
Ok, so we know now how to create a GraphQL query, how to run the actual request and how to parse the response to our client model class. But how can we display the Observable values now ? The answer to this question can be found in *ViewController.swift*. This ViewController implements a UITableView and displays all available objects. To use the advantage of Observables which our wrapper API Provider returns the ViewController also uses [RxSwift](https://github.com/ReactiveX/RxSwift) and binds the results to the table view.

## Feedback
Feel free to leave any feedback. I'll happily answer all your unanswered questions. Also I'd love to hear how this code could be improved.
