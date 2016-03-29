//
//  MapFlipViewController.swift
//  Flip Views
//
//  Created by mitchell hudson on 3/28/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit
import MapKit

class MapFlipViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var flipped = false
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var mapContainerView: UIView!
    @IBOutlet var tableViewContainerView: UIView!
    
    
    @IBAction func buttonTapped(sender: UIButton) {
        if flipped {
            
            UIView.transitionFromView(tableViewContainerView, toView: mapContainerView, duration: 1, options: [.TransitionFlipFromLeft, .ShowHideTransitionViews], completion: { (completed: Bool) -> Void in
                // self.mapView.reloadInputViews()
            })
        } else {
            UIView.transitionFromView(mapContainerView, toView: tableViewContainerView, duration: 1, options: [.TransitionFlipFromRight, .ShowHideTransitionViews], completion: { (completed: Bool) -> Void in
                // self.tableView.reloadData()
            })
        }
        
        flipped = !flipped
    }
    
    

    
    // MARK: TableView Stuff
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .SpellOutStyle
        cell.textLabel?.text = formatter.stringFromNumber(indexPath.row)
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewContainerView.hidden = true
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
