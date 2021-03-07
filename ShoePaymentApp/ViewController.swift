//
//  ViewController.swift
//  ShoePaymentApp
//
//  Created by Page Kallop on 3/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    struct Shoes {
        var name: String
        var price: Double 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //displays an alert 
    func displayDefaultAlert(title: String?, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }


}

