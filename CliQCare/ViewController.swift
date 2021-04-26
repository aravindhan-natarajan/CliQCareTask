//
//  ViewController.swift
//  CliQCare
//
//  Created by Aravindhan Natarajan on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    var datasource: CliqCare? = nil
    
    let apiURL = "https://www.tatacliq.com/marketplacewebservices/v2/mpl/cms/defaultpage?pageId=shopping-faq"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        triggerAPI { (dictmodel, model) in
            self.datasource = model
            print(dictmodel)
        }
    }


    fileprivate func triggerAPI(onCompletion handler: (([[String: String]] , CliqCare) -> Void)? = nil) {
        if let apiLink = URL(string: self.apiURL) {
            
            let task = URLSession.shared.dataTask(with: apiLink) { data , response, errorblock in
                
                guard let jsondata = data , let model = try? JSONDecoder().decode(CliqCare.self, from: jsondata) else {return}
                
                if let dict = model.items?[1].cmsTextComponent?.content?.data(using: .utf8) {
                    if let datamodel = try? JSONSerialization.jsonObject(with: dict, options: .allowFragments) as? [[String: String]] {
                        handler?(datamodel ,model)
                    }
                }
                
            }
            
            task.resume()
        }
    }
}

