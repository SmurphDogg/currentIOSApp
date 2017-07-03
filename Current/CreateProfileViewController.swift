//
//  CreateProfileViewController.swift
//  Current
//
//  Created by Murphy Basil Ward on 6/14/17.
//  Copyright © 2017 Murphy Basil Ward. All rights reserved.
//

import UIKit
import os.log

class CreateProfileViewController: UIViewController {

   
    
    @IBAction func cancelCreateProfile(_ sender: Any) {
        self.dismiss(animated: true) { 
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    

}
