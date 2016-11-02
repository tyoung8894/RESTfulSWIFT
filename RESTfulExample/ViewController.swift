//
//  ViewController.swift
//  RESTfulExample
//
//  Created by Tyler Young on 11/2/16.
//  Copyright © 2016 Tyler Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func doRandomize(_ sender: UIButton) {
        RestApiManager.instance.getRandomUser(resultsHandler: self.myResultsHandler)
    }
    

    
    func myResultsHandler(json: JSON) {
        
        print(json)
        
        if let results = json["results"].array {
            for entry in results{
            print(entry["email"].stringValue)
            self.emailLabel.text = entry["email"].stringValue
                
            print(entry["picture"]["large"].stringValue)
                DispatchQueue.main.async {
                
                if let url = URL(string: entry["picture"]["large"].stringValue) {
                    do {
                    let data = try Data(contentsOf: url)
                    self.photoImageView.image = UIImage(data: data)
                    } catch {
                        print("no image")
                    }
                    }
        }
    }
}

}
}
