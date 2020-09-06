//
//  OfflineViewController.swift
//  sngltyTask
//
//  Created by kashee kushwaha on 25/05/20.
//  Copyright © 2020 kashee kushwaha. All rights reserved.
//

import UIKit
import Network

class OfflineViewController: UIViewController {
    
//    let network = NetworkManager.sharedInstance
    let monitor = NWPathMonitor()

    override func viewDidLoad() {
        super.viewDidLoad()

        let queue = DispatchQueue(label: "Monitor")
               monitor.start(queue: queue)
              monitor.pathUpdateHandler = { path in
                  if path.status == .satisfied {
                      print("We're connected!")
                     self.showMainController()
                  } else {
                      print("No connection.")
                  }

                  print(path.isExpensive)
              }
//        network.reachability.whenReachable = { reachability in
//            self.showMainController()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func showMainController() -> Void {
        DispatchQueue.main.async {
//            self.performSegue(withIdentifier: "MainController", sender: self)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
