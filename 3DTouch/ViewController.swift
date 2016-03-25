//
//  ViewController.swift
//  3DTouch
//
//  Created by Ketul Patani on 22/03/16.
//  Copyright © 2016 Ketul Patani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var datasource : [String] = ["Ketul", "Ayush", "Nabeel"]
    
    var passInfo : String!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.Available {
            registerForPreviewingWithDelegate(self, sourceView: tableView)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        if let cell = tableView.dequeueReusableCellWithIdentifier("Cell") {
            cell.textLabel?.text = datasource[indexPath.row]
            return cell
        }
        else{
            return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
//        return nil
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
//        cell.textLabel?.text = datasource[indexPath.row]
//        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row no. \(indexPath.row) selected")
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            passInfo = cell.textLabel!.text
            print("\(passInfo) new Valuy*********")
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.performSegueWithIdentifier("segueForDetailView", sender: self)
        }

        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueForDetailView"
        {
            print("\(segue.identifier) segue is performed")
            let destVC : DetailViewController = segue.destinationViewController as! DetailViewController
            destVC.input =  passInfo
        }
        
    }

}