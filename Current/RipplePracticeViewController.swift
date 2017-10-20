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
        var range = 100.0
        
        // Scale the view by the current scale factor.
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
          let myFloat = Double(gestureRecognizer.scale)
            range = range + myFloat
                    // Set the scale factor to 1.0 to avoid exponential growth
            
           // image.frame = CGRect(x: 0, y: 0, width: 50, height: screenSize.height * 0.2)
            lastSize = lastSize * range
            circleImageView.frame = CGRect(x: 0, y: 0, width: lastSize, height: lastSize)
            print(lastSize)
            gestureRecognizer.scale = 1.0
        }
        
    }
    
    @IBAction func ripple(_ sender: Any) {
        rangeLabel.text = "You done rippled"
        print(lastSize)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
