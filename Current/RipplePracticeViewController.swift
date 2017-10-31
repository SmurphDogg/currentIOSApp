//
//  RIpplePracticeViewController.swift
//  Current
//
//  Created by Murphy Basil Ward on 10/20/17.
//  Copyright © 2017 Murphy Basil Ward. All rights reserved.
//

import UIKit

class RipplePracticeViewController: UIViewController {
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBOutlet weak var circleImageView: UIImageView!
    var lastSize = 250.0
    var yardStrata = 100
    @IBOutlet weak var segment: UISegmentedControl!
    
    //  var users: [user]()
    // var hooks : [hook]()
    //var usersAndHooks : [user,hook]()
    /*
    @IBAction func changeRange(_ gestureRecognizer : UIPinchGestureRecognizer) {
        // Move the anchor point of the view's layer to the touch point
        // so that scaling the view and layer becomes simpler.
        self.adjustAnchorPoint(gestureRecognizer: gestureRecognizer)
        
        // Scale the view by the current scale factor.
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform =
                (gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale,
                                                            y: gestureRecognizer.scale))!
            // Set the scale factor to 1.0 to avoid exponential growth
            gestureRecognizer.scale = 1.0
        }
    */
    @IBAction func changeRange(_ gestureRecognizer : UIPinchGestureRecognizer) {
      var range = gestureRecognizer.scale
        
        if(range > 2.18){
         range = 2.18
        }
        
        
        if(range < 0.422){
            range = 0.422
        }
       
        
        circleImageView.transform = CGAffineTransform(scaleX: range, y: range)
        
      
        
        //if .422-.7736, .7737-1.1253,.1.254-1.4768,1.4769-1.8285,1.8286-2.19
        
        if(range >= 0.422 && range <= 0.7736)
        {
            yardStrata = 100
        }
        
        if(range >= 0.7737 && range <= 1.1253)
        {
            yardStrata = 200
        }
        
        if(range >= 1.1254 && range <= 1.4768)
        {
            yardStrata = 300
        }
        
        if(range >= 1.4769 && range <= 1.8285)
        {
            yardStrata = 400
        }
        
        if(range >= 1.8286 && range <= 2.18)
        {
            yardStrata = 500
        }
          rangeLabel.text = String(describing: yardStrata)
    }
    
    
    @IBAction func ripple(_ sender: Any) {
        rangeLabel.text = "You done rippled"
      //  show ripple effect
        //send yardStrata fetchUsersAndHooks
        
        switch segment.selectedSegmentIndex {
        case 0:
            /* var users =*/ fetchUsers(range: yardStrata)
            break
        case 1:
            /*var hooks = */fetchHooks(range: yardStrata)
            break
        case 2:
            /*var usersAndHooks =*/ fetchUsersAndHooks(range: yardStrata)
            break
            
        default:
            
            break
        }
      /*  fetchUsersAndHooks(yardStrata)*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 90))
        let navItem = UINavigationItem(title: "Back")
        let doneItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
        
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        // Do any additional setup after loading the view.
    }

     @objc func back(){
        let l = LaunchScreenTableViewController()
    present(l, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchUsersAndHooks(range : Int){
        //get the number of users near you
        // users.count
        let numberOfUsers = 20
        
        //hooks.count
        let numberOfHooks = 12
        rangeLabel.text = "There are " + String(numberOfUsers) + " Users and " + String(numberOfHooks) + " Hooks around you."
    }
    
    func fetchUsers(range : Int){
        let numberOfUsers = 20
    
        rangeLabel.text = "There are " + String(numberOfUsers) + " Users around you."
    }
    
    func fetchHooks(range : Int){
        //hooks.count
        let numberOfHooks = 12
        rangeLabel.text = "There are " + String(numberOfHooks) + " Hooks around you."
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
