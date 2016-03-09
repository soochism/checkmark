//
//  FirstViewController.swift
//  tab
//
//  Created by Shan-En Liu on 2/16/16.
//  Copyright © 2016 Shan-En Liu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView  =   UITableView()
    let sections : [String] = ["+Add Friends","Profile","Friends"]
    let addfriends : [String] = ["+Add Friends"]
    let profile : [String] = ["Tommy"]
    let friends : [String] = [("Sean"), ("Sooch"), ("Eitan"), ("Malcolm"), ("Alice"), ("Paul"), ("Mark"), ("Sara"),("Jack"), ("James")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
        var tableViewFrame = self.tableView.frame
        tableViewFrame.origin.y = 64
        self.tableView.frame = tableViewFrame

        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count;
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1
        {
            return "Profile"
        }
        else if section == 2
        {
            return "Friends"
        }
        else if section == 0
        {
            return "Add Friends"
        }
        return ""
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 1
        {
            return profile.count
        }
        else if section == 2
        {
            return friends.count
        }
        else
        {
            return addfriends.count
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        if indexPath.section == 0
        {
            cell.textLabel!.text =  addfriends[indexPath.row]
        }
        if indexPath.section == 1
        {
            cell.textLabel!.text = profile[indexPath.row]
        }
        if indexPath.section == 2
        {
            cell.textLabel!.text = friends[indexPath.row]
        }
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var friendname = "not tapped"
        var profiletapped = false
        var friendtapped = false
        var addfriendstapped = false
        if indexPath.section == 0
        {
            print("add friends tapped")
            addfriendstapped = true
        }
        if indexPath.section == 1
        {
            print(profile[indexPath.row])
            profiletapped = true
        }
        if indexPath.section == 2
        {
            print(friends[indexPath.row])
            friendname = friends[indexPath.row]
            friendtapped = true
        }
        if friendtapped == true
        {
            self.performSegueWithIdentifier("friendsdetail", sender: nil)
        }
        else if profiletapped == true
        {
            self.performSegueWithIdentifier("profile", sender: nil)
        }
        else if addfriendstapped == true
        {
            self.performSegueWithIdentifier("addfriends", sender: nil)
        }
    }

}

