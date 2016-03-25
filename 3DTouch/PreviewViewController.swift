//
//  PreviewViewController.swift
//  3DTouch
//
//  Created by Ketul Patani on 25/03/16.
//  Copyright © 2016 Ketul Patani. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var previewActions : [UIPreviewActionItem] {
        var previewActionsOne : UIPreviewAction = UIPreviewAction(title: "First Action", style: UIPreviewActionStyle.Default) { (previewAction: UIPreviewAction,viewController :UIViewController) -> Void in
        }
    
        var previewActionsTwo : UIPreviewAction = UIPreviewAction(title: "Second Action", style: UIPreviewActionStyle.Destructive) { (previewAction: UIPreviewAction,viewController :UIViewController) -> Void in
            
        }
        
        var previewActionsThree : UIPreviewAction = UIPreviewAction(title: "Third Action", style: UIPreviewActionStyle.Selected) { (previewAction: UIPreviewAction,viewController :UIViewController) -> Void in
        }
        return [previewActionsOne, previewActionsTwo, previewActionsThree]
        
    }
    
    var input : String?

    override func viewDidLoad() {
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.label.text = input
    }
    
}
