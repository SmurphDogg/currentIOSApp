//
//  TableViewController.swift
//  Current
//
//  Created by Murphy Basil Ward on 6/29/17.
//  Copyright © 2017 Murphy Basil Ward. All rights reserved.
//

import UIKit


struct cellData{
    let cellType : Int! //1= Label 2=TextField
    let text : String!
    //let image : UIImage?
}


class CreateProfileTableViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  
    var arrayOfCells = [cellData]()
    
    //https://makeapppie.com/2016/06/28/how-to-use-uiimagepickercontroller-for-a-camera-and-photo-library-in-swift-3-0/ use this tutorial to include photopicker
    let myImagePicker = UIImagePickerController()
    let myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayOfCells = [cellData(cellType : 1, text : "Name"),
                        cellData(cellType : 2, text : "First Name"),
                        cellData(cellType : 2, text : "Middle Name"),
                        cellData(cellType : 2, text : "Last Name"),
                        cellData(cellType : 2, text : "NickName"),
                        cellData(cellType : 1, text : "Pictures"),
                        cellData(cellType : 3, text : "Profile Pic"),
                        cellData(cellType : 3, text : "Anonymous Pic")]
        
        self.tableView.separatorStyle = .none
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfCells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        

        //Headers of labels
        if arrayOfCells[indexPath.row].cellType == 1{
            let label = UILabel(frame : CGRect(x: 150.0, y: 14.0, width: 150.0, height: 30.0))
            label.font = UIFont (name: "Futura-Medium", size: 30)
            label.text = arrayOfCells[indexPath.row].text
            label.tag = indexPath.row
            cell.contentView.addSubview(label)
            return cell
        }
        
        //Text Fields
        if arrayOfCells[indexPath.row].cellType == 2{
            
            let textField = UITextField(frame : CGRect(x: 10.0, y: 14.0, width: 200.0, height: 30.0))
            textField.font = UIFont (name: "Futura-Medium", size: 15)
            textField.placeholder = arrayOfCells[indexPath.row].text
            textField.tag = indexPath.row
            cell.contentView.addSubview(textField)
            return cell
        }
      
        //Label and Button
        if arrayOfCells[indexPath.row].cellType == 3{
            //label describing button functionality
            
            /*
            let label = UILabel(frame : CGRect(x: 10.0, y: 14.0, width: 100.0, height: 30.0))
            label.font = UIFont (name: "Futura-Medium", size: 15)
            label.text = arrayOfCells[indexPath.row].text + ": "
            label.tag = indexPath.row
            cell.contentView.addSubview(label)*/
            
            //button for importing images
            let button = UIButton()
            button.frame = CGRect(x: 10, y: 0, width: 100, height: 25)
            button.backgroundColor = UIColor.lightGray
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont (name: "Futura-Medium", size: 12)
            button.setTitle(arrayOfCells[indexPath.row].text, for: .normal)
            button.addTarget(self, action: #selector(importImageButton(_:)), for: .touchUpInside)
            self.view.addSubview(button)
            
            cell.contentView.addSubview(button)
            return cell
        }

        print("You don't have a special cell")
        return cell
            /*if let cell2 = cell as? TextTableViewCell{
                print("You got a cell")
                
                cell2.myTextLabel.text = "Name"
                return cell2}
        
        
            print("basic cell")
            return cell
        */
        //}
        /*
        */
       
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
    
    @IBAction func cancelCreateProfile(_ sender: Any) {
        self.dismiss(animated: true) { 
            print("Cancel")
        }
    }
    
    //What happens if you don't pick anything
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func importImageButton(_ sender: Any) {
        
        myImagePicker.allowsEditing = false
        myImagePicker.sourceType = .photoLibrary
        present(myImagePicker, animated: true, completion: nil)
    }
}
