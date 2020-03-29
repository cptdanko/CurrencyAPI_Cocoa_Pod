# CurrencyAPI (Cocoa Pod)
A simple Cocoa pod for iOS apps to get the current exchange rate information. 
### Current State
- Uses https://api.exchangerate-api.com/ to get exchange rate info
- You can either get a list of currencies along with their exchange rates
- Or get exchange rate information for a particular currency

## Installation
If you haven't already initialised cocoapods in your project
- open the terminal
- navigate to your app directory e.g. `cd xcodeproject/`
- then run the following commands on the command line
```
pod init
vim Podfile
pod 'CurrencyAPI', :git => 'https://github.com/cptdanko/CurrencyAPI.git', :tag=> '1.0.0'
```
Remember, to add the line `pod 'CurrencyAPI...` below the lines that say `target 'YourAppName' do...`
## How to use it
If you intend to use have a look at the code snippet below to see how the API is being used in the ViewController
```
//  Created by Bhuman Soni on 20/2/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import UIKit
import CurrencyAPI

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    var currenciesPickerData = [Currency]()
    var selectedCurrency: Currency?
    var lastUpdateDate: Date?
    
    let currencyAPI = APIFactory.getCurrencyAPI(type: .API_EX_RATE)!
    override func viewDidAppear(_ animated: Bool) {
        //this is just in case it takes time for the c
        currencySelectorPV.addActivityIndicator()
        currencyAPI.fetchExchangeRates(baseCur: Constants.CURRENCY_CODE.AUD) { (currencies, error, dateLastUpdated) in
           if error != nil {
               self.showErrorDialog(title: "Error!", messasge: "Trouble fetching currencies", okTxt: "OK")
           }
           if let cur = currencies {
               self.currenciesPickerData = cur
               self.reloadPickerView()
               self.lastUpdateDate = dateLastUpdated
           }
        }
    }
```
## If you want to use your own API endpoint
Sure that can work too, however you would need to make changes to the classes that implement the ExchangeRateAPI protocol i.e. have a look at the APIDotExRate file and notice the class variable
```
let EXTERNAL_API_URL: String = "https:...." 
```
Over there replace the string with your API. Note, if you use your own url, you may need to change how the fetchExchangeRates methods process the JSON data.

If you found this repository useful and feel you can improve it? Then please fork the repository and create a pull request, I'd be happy to look at it and merge it. Thanks
# While you are here
Maybe checkout some of the [apps] that I have built at [My Day To-Do] or have a read of my [blog].

[apps]: https://mydaytodo.com/apps/
[My Day To-Do]: https://mydaytodo.com/
[blog]: https://mydaytoco.com/blog
[![N|Solid](https://mydaytodo.com/wp-content/uploads/2018/08/MDTicon-1-150x150.png)](https://mydaytodo.com/)
