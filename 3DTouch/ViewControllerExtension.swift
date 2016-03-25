//
//  ViewControllerExtension.swift
//  3DTouch
//
//  Created by Ketul Patani on 25/03/16.
//  Copyright © 2016 Ketul Patani. All rights reserved.
//

import UIKit

extension ViewController : UIViewControllerPreviewingDelegate {
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = self.tableView.indexPathForRowAtPoint(location),
            cell = self.tableView.cellForRowAtIndexPath(indexPath) else { return nil }
        
        guard let previewVC = storyboard?.instantiateViewControllerWithIdentifier("previewVC") as? PreviewViewController else { return nil }
        
        passInfo = cell.textLabel?.text!
        
        previewVC.input = cell.textLabel?.text!
        
        previewVC.preferredContentSize = CGSize(width:  0, height: 150)
        
        previewingContext.sourceRect = cell.frame
        
        return previewVC
        
    }
    
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        print("kya idhar")
        if let detailVC = storyboard?.instantiateViewControllerWithIdentifier("detailVC") as? DetailViewController {
            
            print("Idhar aaya tha")
            detailVC.input = passInfo
            
            showViewController(detailVC, sender: self)
             
        }
        
        
        
    }
}
