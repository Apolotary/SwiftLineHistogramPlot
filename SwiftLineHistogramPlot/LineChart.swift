//
//  LineChart.swift
//  SwiftLineHistogramPlot
//
//  Created by Bektur Ryskeldiev on 1/30/15.
//
//

import UIKit

class LineChart: UIView {
    
// MARK: Public variables
    
    var minX: CGFloat = 0.0
    var maxX: CGFloat = 0.0
    var minY: CGFloat = 0.0
    var maxY: CGFloat = 0.0
    var graphLines: [GraphLine] = []
    var isDrawingAverage: Bool = false
    
// MARK: Private variables
    
    private var xStep: CGFloat = 0.0
    private var yStep: CGFloat = 0.0
    
// MARK: Initialization
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
    Preferred initializer that accepts necessary data
    
    :param: frame            frame of the graph view
    :param: minimalX         minimal X-axis value
    :param: maximalX         maximal X-axis value
    :param: minimalY         minimal Y-axis value
    :param: maximalY         maximal Y-axis value
    :param: graphLines       array with GraphLine objects that describes every line drawn on this graph
    :param: isDrawingAverage determines whether the graph should draw an average line
    
    :returns: LineChart instance
    */
    init(frame: CGRect, minimalX: CGFloat, maximalX: CGFloat, minimalY: CGFloat, maximalY: CGFloat, graphLines: [GraphLine], isDrawingAverage: Bool) {
        self.minX = minimalX
        self.maxX = maximalX
        self.minY = minimalY
        self.maxY = maximalY
        self.graphLines = graphLines
        self.isDrawingAverage = isDrawingAverage
        super.init(frame: frame)
    }
    
// MARK: Drawing methods
    
    private func drawGrid() {
        
    }
    
    private func drawGraphLines() {
        var context = UIGraphicsGetCurrentContext()
        
        for line in graphLines {
            for var i = 0; i < line.points.count - 1; i++ {
                var point1 = line.points[i]
                var point2 = line.points[i+1]
                CGContextMoveToPoint(context, point1.x * xStep, point1.y * yStep)
                CGContextAddLineToPoint(context, point2.x * xStep, point2.y * yStep)
            }
            
            CGContextSetLineWidth(context, line.width)
            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
            CGContextStrokePath(context)
        }
    }
    
    override func drawRect(rect: CGRect) {
        xStep = frame.size.width / abs((maxX - minX))
        yStep = frame.size.height / abs((maxY - minY))
        
        drawGrid()
        drawGraphLines()
    }
    
// MARK: Updating data
    
    func reloadGraph() {
        setNeedsDisplay()
    }

    func updateContents (minimalX: CGFloat, maximalX: CGFloat, minimalY: CGFloat, maximalY: CGFloat, graphLines: [GraphLine], isDrawingAverage: Bool) {
        self.minX = minimalX
        self.maxX = maximalX
        self.minY = minimalY
        self.maxY = maximalY
        self.graphLines = graphLines
        self.isDrawingAverage = isDrawingAverage
        setNeedsDisplay()
    }
}
