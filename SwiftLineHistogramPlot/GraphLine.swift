//
//  GraphLine.swift
//  SwiftLineHistogramPlot
//
//  Created by Bektur Ryskeldiev on 1/30/15.
//
//

/**
*  This simple structure describes a single line on the line or bar graph
*/

import UIKit

struct GraphLine {
    var name: String
    var color: UIColor
    var width: CGFloat
    var points: [CGPoint]
   
    init(name: String, color: UIColor, width: CGFloat, points: [CGPoint]){
        self.name = name
        self.color = color
        self.width = width
        self.points = points
    }
}
