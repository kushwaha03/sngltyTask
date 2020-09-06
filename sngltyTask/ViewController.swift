//
//  ViewController.swift
//  sngltyTask
//
//  Created by kashee kushwaha on 25/05/20.
//  Copyright © 2020 kashee kushwaha. All rights reserved.
//

import UIKit
import Network

import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
let monitor = NWPathMonitor()
//    let network = NetworkManager.sharedInstance
    let InterNetalert = UIAlertController(title: "Internet Error", message: " Please check Internet Connectivity and try again.", preferredStyle: .actionSheet)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
       monitor.pathUpdateHandler = { path in
           if path.status == .satisfied {
               print("We're connected!")
            self.fatchAPIResponse()
           } else {
               print("No connection.")
            self.showOfflinePage()
           }

           print(path.isExpensive)
       }
    }
    func fatchAPIResponse() {

//                let headers: HTTPHeaders = [
//                    "Token": token
//                ]
        
          let url = "https://api.snglty.com/v1/test/roomsList/"
//              Alamofire.request(url, method: .get, parameters:["timestamp": "158746745"]).responseJSON { (response) in
//                if response.result.isSuccess {
//
//                } else {
//
//                        print("error")
//
//                    }
//                }
        let request = AF.request(url, method: .get, parameters:["timestamp": 158746745])
        // 2
        request.responseJSON { (response) in
            print(response.value)
        }
        
    }

        private func showOfflinePage() -> Void {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "NetworkUnavailable", sender: self)
                
            }
        }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell =  tableView.dequeueReusableCell(withIdentifier: "cell")
     
       return cell!
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("yes")
    }
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 80
   }
   
}
