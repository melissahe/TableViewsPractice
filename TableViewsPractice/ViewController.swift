//
//  ViewController.swift
//  TableViewsPractice
//
//  Created by C4Q on 10/30/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //model has been changed to [[English], [Chinese]]
    
    //model for table view
    var daysOfWeek = [["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"], ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"], ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]]
    
    var colorOne = UIColor.white
    var colorTwo = UIColor.gray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //delegate methods - all are optional
    
    //what happens when you CLICK on a row - the table view takes in the touch input, and reaches out to this delegate method to see what it should do
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        let selectedSection = indexPath.section
        daysOfWeek[selectedSection][selectedRow] = "I clicked on this!"
        tableView.reloadData() //if you don't do this, the data won't be reloaded instantly by clicking on it, it will only change if you scroll up and down (which forces a reload)
//        print(selectedRow) //prints selected row
        //however, you need to set up how many rows it has, and what to put inside each row
        
        //how long is it - # of rows
        //data source - what info to put in each row
            //the table view asks the data source these questions
            //so we need to set up the data source, by using the two data source methods below
    }
    
    //Data Source Methods (REQUIRED) - you NEED these two methods in order to set up the data source - stuff that happens before user interacts with the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if you use sections, make sure you're returning the count of rows (total elements per section - daysOfWeek[section].count), not the count of sections (daysOfWeek.count)
        return daysOfWeek[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //returns the cell of the table view
            //will go through every cell(row) and return all of them after setting the properties of the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Day Cell")!
        let sectionToSetUp = indexPath.section
        let rowToSetUp = indexPath.row
        let daysOfWeekSection = daysOfWeek[sectionToSetUp]
        let dayAtRow = daysOfWeekSection[rowToSetUp]
        
        //cells are subviews of the entire table (on top of the table)
        
        //Set up properties of the cell
            //there are three main properties we'll be manipulating atm
        cell.textLabel?.text = dayAtRow
        //activity - alternating the colors of each of the rows
            //you can do if/else statements to set up the cells differently under different conditions
        //for alternating colors
//        cell.backgroundColor = (rowToSetUp % 2 == 0) ? UIColor.white : UIColor.gray
        //for random colors
//        cell.backgroundColor = UIColor.init(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: CGFloat(drand48()))
        //however, it's probably not a good idea to set up these things inside the method - you should do them outside of the method, in the view controller(?), instead of cramm ing everything inside
//        setUpColors()
        cell.backgroundColor = (rowToSetUp % 2 == 0) ? colorOne : colorTwo
        //detailed text label of the cell, the small details of the cell
            //The code below, however, won't work if you don't set up the detailed views
            //you need to set up the prototype cells
        cell.detailTextLabel?.text = "\(rowToSetUp)"
        
        switch sectionToSetUp {
        case 0:
            cell.backgroundColor = colorOne
        case 1:
            cell.backgroundColor = colorTwo
        default:
            break
        }
        
        return cell
    }
    
//    func randomColor() -> UIColor {
//        return UIColor(displayP3Red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: CGFloat(drand48()))
//    }
//
//    func setUpColors() {
//        self.colorOne = randomColor()
//        self.colorTwo = randomColor()
//    }
    
    
    //Data Source Methods (Optionals) - optional because it doesn't affect how you interact with it or how the delegate method grabs data, it just changes the view
    
    //set the number of sections here
    func numberOfSections(in tableView: UITableView) -> Int {
        return daysOfWeek.count
    }
    
    //set up what header you want for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "English"
        case 1:
            return "Chinese"
        case 2:
            return "Korean"
        case 3:
            return "Spanish"
        default:
            return nil
        }
    }
}

