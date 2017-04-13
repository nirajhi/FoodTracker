//
//  Meal.swift
//  FoodTracker
//
//  Created by admin on 4/13/17.
//  Copyright © 2017 nirajhirachan. All rights reserved.
//

import UIKit

class Meal {

    //MARK: Properties

    var name : String
    var photo : UIImage?
    var rating : Int

    init?(name : String, photo : UIImage?, rating : Int){

        guard !name.isEmpty else{
            return nil
        }
        // Initialization should fail if there is no name or if the rating is negative.
        guard (rating >= 0) && (rating <= 5) else{
            return nil
        }

        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
