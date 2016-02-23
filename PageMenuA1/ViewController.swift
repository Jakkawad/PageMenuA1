//
//  ViewController.swift
//  PageMenuA1
//
//  Created by admin on 2/23/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import PageMenu

class ViewController: UIViewController, CAPSPageMenuDelegate {

    var pageMenu:CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PAGE MENU"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()

        // Array to keep track of controller in page menu
        var controllerArray:[UIViewController] = []
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        // Menu1ViewController.swift
        var controller1 = mainStoryboard.instantiateViewControllerWithIdentifier("Menu1ViewController") as! Menu1ViewController
        controller1.parentNavigationController = self.navigationController
        controller1.title = "MENU1"
        controllerArray.append(controller1)
        print(controller1)
        
        var controller2 = mainStoryboard.instantiateViewControllerWithIdentifier("Menu2ViewController") as! Menu2ViewController
        controller2.parentNavigationController = self.navigationController
        controller2.title = "MENU2"
        controllerArray.append(controller2)
        print(controller2)
        
        var parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(4.3),
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .ViewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
            .BottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .SelectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .MenuMargin(20.0),
            .MenuHeight(40.0),
            .SelectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .UnselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorRoundEdges(true),
            .SelectionIndicatorHeight(2.0),
            .MenuItemSeparatorPercentageHeight(0.1)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        // Optional delegate
        pageMenu!.delegate = self
        
        self.view.addSubview(pageMenu!.view)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

