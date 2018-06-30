//
//  Coordinate.swift
//  coordinate_transformation
//
//  Created by leoqyang(杨琼) on 2018/4/7.
//  Copyright © 2018年 leoqyang(杨琼). All rights reserved.
//

import Foundation

struct Coordinate {
    var startPointX = 0.0
    var startPointY = 0.0
    var distance    = 0.0
    var degree      = 0.0
    var minute     = 0.0
    var second      = 0.0
    var endPointX   = 0.0
    var endPointY   = 0.0
    
    var degreeDouble = 0.0
    
    mutating func calulateEndPoint() {
        endPointX = cos((degree + minute / 60.0 + second / 3600.0) * Double.pi / 180.0) * distance + startPointX
        endPointY = sin((degree + minute / 60.0 + second / 3600.0) * Double.pi / 180.0) * distance + startPointY
    }
    
    mutating func calulateDistance() {
        distance = (pow(endPointX - startPointX, 2) + pow(endPointY - startPointY, 2)).squareRoot()
    }
    
    mutating func calulateDegree() {
        var tempDegree =  atan2(endPointY - startPointY, endPointX - startPointX) * 180 / Double.pi
        if (tempDegree < 0) {
            tempDegree += 360
        }
        
        degreeDouble = tempDegree
        degree = floor(tempDegree)
        
        tempDegree = (tempDegree - degree) * 60
        minute = floor(tempDegree)
        
        second = (tempDegree - minute) * 60
        
    }
}
