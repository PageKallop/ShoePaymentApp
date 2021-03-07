//
//  ViewController.swift
//  ShoePaymentApp
//
//  Created by Page Kallop on 3/6/21.
//

import UIKit
import PassKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    struct Shoes {
        var name: String
        var price: Double 
    }
    //shoe array 
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
        
        
        shoePickerView.delegate = self
        shoePickerView.dataSource = self
    }
    
    @IBAction func buyButton(_ sender: UIButton) {
        
        let selectedShoe = shoePickerView.selectedRow(inComponent: 0)
        let shoe = shoeData[selectedShoe]
        let paymentItem = PKPaymentSummaryItem.init(label: shoe.name, amount: NSDecimalNumber(value: shoe.price))
        print(paymentItem)
        
        let paymentNetworks = [PKPaymentNetwork.amex, .discover, .masterCard, .visa]
        //checks if user can make payment with network
        if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: paymentNetworks) {
            //payment request
            let request = PKPaymentRequest()
            request.currencyCode = "USD"
            request.countryCode = "US"
            request.merchantIdentifier = "merchant.com.pranavwadhwa.Shoe-Store"
            request.merchantCapabilities = PKMerchantCapability.capability3DS
            request.supportedNetworks = paymentNetworks
            request.paymentSummaryItems = [paymentItem]
            
        }else {
            displayDefaultAlert(title: "Error", message: "Unable to make Apple Pay transaction")
        }
    }
    
 
    //displays an alert 
    func displayDefaultAlert(title: String?, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //UIPicker methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        return shoeData[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(shoeData.count)
        return shoeData.count
    }


}

