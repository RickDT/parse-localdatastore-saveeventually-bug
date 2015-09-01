//
//  StartParse.swift
//  ParseSaveTest
//
//  Created by Rick Terrill on 9/1/15.
//  Copyright (c) 2015 Big Swing. All rights reserved.
//

import Foundation

func startParse() {
    Parse.enableLocalDatastore()
    // set app id is below
    
    let appId = ""
    let clientKey = ""
    Parse.setApplicationId(appId, clientKey: clientKey)
}