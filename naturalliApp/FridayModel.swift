//
//  FridayModel.swift
//  fitnessApp
//
//  Created by Ryan Raitz on 10/29/19.
//  Copyright © 2019 Ryan Raitz. All rights reserved.
//


import Foundation

protocol FridayProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class FridayModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "http://localhost/FitnessApp-2/api/getteams.php" //this will be changed to the path where service.php lives
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = [String:Any]()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
            
        } catch let error as NSError {
            print(error)
            
        }
        
        //let jsonElement = NSDictionary()
        //var idDictionary = NSDictionary()
        //var nameDictionary = NSDictionary()
        //var memberDictionary = NSDictionary()
        let exercises = jsonResult["exercises"] as! [[String:Any]]
        let locations = NSMutableArray()
        //let date = Date()
        //let formatter = DateFormatter()
        //formatter.dateFormat = "yyyy-MM-dd"
        //let todaysDate = formatter.string(from: date)
        //let todayDay = getDayOfWeek(todaysDate)
        
        for exercise in exercises {
        
            
           //idDictionary = jsonResult["id"] as! NSDictionary
            
            let location = LocationModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let exerciseID = exercise["exerciseID"] as? String,
                let muscleGroupID = exercise["muscleGroupID"] as? String,
                let goalID = exercise["goalID"] as? String,
                let exerciseName = exercise["exerciseName"] as? String,
                let repRange = exercise["repRange"] as? String,
                let videoURL = exercise["videoURL"] as? String,
                let exerciseDescription = exercise["exerciseDescription"] as? String
            {
                print(exerciseID)
                print(muscleGroupID)
                print(goalID)
                print(exerciseName)
                print(repRange)
                print(videoURL)
                print(exerciseDescription)
                location.exerciseID = exerciseID
                location.muscleGroupID = muscleGroupID
                location.goalID = goalID
                location.exerciseName = exerciseName
                location.repRange = repRange
                location.videoURL = videoURL
                location.exerciseDescription = exerciseDescription
                
            }
            
            var weekNumber = 2
            
            if(weekNumber == 2)
            {
            /*
                if(todayDay == 1)
                {
                    if(location.muscleGroupID == "1" && location.goalID == "1")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 2)
                {
                    if(location.muscleGroupID == "2" && location.goalID == "1")
                    {
                        locations.add(location)
                    }
                }
                */
                //if(todayDay == 3)
                //{
                    if(location.muscleGroupID == "6" && location.goalID == "1")
                    {
                        locations.add(location)
                    }
               // }
                /*
                if(todayDay == 4)
                {
                    if(location.muscleGroupID == "4" && location.goalID == "1")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 5)
                {
                    if(location.muscleGroupID == "6" && location.goalID == "1")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 6)
                {
                    if(location.muscleGroupID == "5" && location.goalID == "1")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 7)
                {
                    if(location.muscleGroupID == "5" && location.goalID == "1")
                    {
                        locations.add(location)
                    }
                    weekNumber = weekNumber - 1
                }
                */
            }
            /*
            if(weekNumber == 1)
            {
                
                if(todayDay == 1)
                {
                    if(location.muscleGroupID == "1" && location.goalID == "2")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 2)
                {
                    if(location.muscleGroupID == "2" && location.goalID == "2")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 3)
                {
                    if(location.muscleGroupID == "3" && location.goalID == "2")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 4)
                {
                    if(location.muscleGroupID == "4" && location.goalID == "2")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 5)
                {
                    if(location.muscleGroupID == "6" && location.goalID == "2")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 6)
                {
                    if(location.muscleGroupID == "5" && location.goalID == "2")
                    {
                        locations.add(location)
                    }
                }
                
                if(todayDay == 7)
                {
                    if(location.muscleGroupID == "7" && location.goalID == "2")
                    {
                        locations.add(location)
                    }
                    weekNumber = weekNumber + 1
                }
            }
       */ }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }
}



