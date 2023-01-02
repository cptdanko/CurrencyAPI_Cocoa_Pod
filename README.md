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

If you found this repository useful and feel you can improve it? Then please fork the repository and create a pull request, I'd be happy to look at it and merge it. Thanks!
I have also written a blogpost about how and why I built this repository, you can look at that [on medium].


# Any help?
If you have difficulty understanding anything about this repo, feel free to reach out to me through this Github account or at bhuman at mydaytodoDOTcom or bhumanDOTsoniATgmailDOTcom. 

# More great tutorials and code samples
I will be writing a detailed tutorial on how to work with this repo on my blog. Until then refer to [my blog] for other tutorials and "how-to" articles with detailed code samples.

If you like what I am doing, you can [buy me a coffee]

Click on the next link for more info on the 13+ year [software engineering career journey] of the author.

[line 16]: https://github.com/cptdanko/nodetypescriptcrudnotes/blob/main/src/db.ts#L16
[my blog]: https://mydaytodo.com/blog/
[line 17]: https://github.com/cptdanko/nodetypescriptcrudnotes/blob/main/src/db.ts#L17
[AWS docs]: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
[blogpost]: https://mydaytodo.com/blog/
[this blog]: https://mydaytodo.com/blog/
[buy me a coffee]: https://www.buymeacoffee.com/bhumansoni
[software engineering career journey]: https://mydaytodo.com/the-3-stages-of-a-software-engineering-career/
