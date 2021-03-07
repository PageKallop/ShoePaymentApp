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
    
    let shoeData = [
        Shoes(name: "Nike Air Force 1 High LV8", price: 120.00),
        Shoes(name: "adidas Super Stars", price: 135.00),
        Shoes(name: "Jordan Retro 10", price: 190.00),
        Shoes(name: "adidas Original Prophere", price: 75.00),
        Shoes(name: "New Balance 574", price: 90.00)
    ]

    @IBOutlet weak var shoePickerView: UIPickerView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buyButton(_ sender: UIButton) {
        print("pressed")
    }
    
 
    //displays an alert 
    func displayDefaultAlert(title: String?, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }


}

