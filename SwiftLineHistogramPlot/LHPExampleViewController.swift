//
//  ViewController.swift
//  SwiftLineHistogramPlot
//
//  Created by Bektur Ryskeldiev on 1/30/15.
//
//

import UIKit


class ViewController: UIViewController {
    var lineChart: LineChart
    
// MARK: Init methods
    required init(coder aDecoder: NSCoder) {
        lineChart = LineChart(coder: aDecoder)
        super.init(coder: aDecoder)
    }
    
// MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let graphLine1: GraphLine = GraphLine(name: "line1", color: UIColor.blueColor(), width: 2.0, points: [CGPointMake(0.0, 0.0), CGPointMake(1.0, 1.0), CGPointMake(4.0, 4.0), CGPointMake(8.0, 8.0)])
        
        lineChart = LineChart(frame: CGRectMake(0, 0, 300, 300), minimalX: 0, maximalX: 10, minimalY: 0, maximalY: 10, graphLines: [graphLine1], isDrawingAverage: false)
        lineChart.backgroundColor = UIColor.whiteColor();
 
        view.addSubview(lineChart)
        lineChart.reloadGraph()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

