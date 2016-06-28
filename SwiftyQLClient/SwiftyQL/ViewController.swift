//
//  ViewController.swift
//  SwiftyQL
//
//  Created by David Ehlen on 28.06.16.
//  Copyright © 2016 David Ehlen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Moya

class ViewController: UIViewController {
    
    var apiProvider: APIProvider!
    var provider: RxMoyaProvider<APIEndpoint>!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupProvider()
        self.fillInWithSomeTestData()
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupProvider() {
        self.provider = RxMoyaProvider<APIEndpoint>(endpointClosure: {
            (target: APIEndpoint) -> Endpoint<APIEndpoint> in
            
            let url = target.baseURL.URLByAppendingPathComponent(target.path).absoluteString
            
            return Endpoint(URL: url,
                sampleResponseClosure: {.NetworkResponse(200, target.sampleData)},
                method: target.method,
                parameters: target.parameters,
                parameterEncoding: target.parameterEncoding)
        })
        self.apiProvider = APIProvider(provider: self.provider)
    }
    
    private func fillInWithSomeTestData() {
        self.apiProvider.createObjectWithName("Modern technology stack ftw !").subscribeNext { object in
            print("Create Object with id: \(object.id) and name: \(object.name)")
        }.addDisposableTo(self.disposeBag)
    }
    
    private func setupTableView() {
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.apiProvider.allObjects()
            .bindTo(tableView.rx_itemsWithCellIdentifier("ObjectsTableViewCell",
                cellType: UITableViewCell.self)) { (row, element, cell) in
                    cell.textLabel?.text = element.name
            }
            .addDisposableTo(disposeBag)
    }
}

