//
//  ViewController.swift
//  Line-Chart
//
//  Created by mallikarjun on 26/07/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit
import Charts


class ViewController: UIViewController {

    
    var dataEntries: [ChartDataEntry] = []
   // var chartDataBeanArray = [ChartDataBean]()
  
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    let unitsSold = [24.0,43.0,56.0,23.0,56.0,68.0,48.0,120.0,41.0,34.0,55.9,12.0,34.0]
    
    @IBOutlet weak var chartViewOutlet: LineChartView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setChart(dataPoints: months, values: unitsSold)
        
    }

 
     func setChart(dataPoints: [String], values: [Double]) {

        for i in 0 ..< dataPoints.count {
            dataEntries.append(ChartDataEntry(x: Double(i), y: values[i]))
        }
        
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Units Consumed")
        lineChartDataSet.axisDependency = .left
        lineChartDataSet.setColor(UIColor.black)
        lineChartDataSet.setCircleColor(UIColor.black) // our circle will be dark red
        lineChartDataSet.lineWidth = 1.0
        lineChartDataSet.circleRadius = 3.0 // the radius of the node circle
        lineChartDataSet.fillAlpha = 1
        lineChartDataSet.fillColor = UIColor.black
        lineChartDataSet.highlightColor = UIColor.white
        lineChartDataSet.drawCircleHoleEnabled = true
        
        var dataSets = [LineChartDataSet]()
        dataSets.append(lineChartDataSet)
        
        
        let lineChartData = LineChartData(dataSets: dataSets)
        chartViewOutlet.data = lineChartData
        chartViewOutlet.rightAxis.enabled = false
        chartViewOutlet.xAxis.drawGridLinesEnabled = false
        chartViewOutlet.xAxis.labelPosition = .bottom
        chartViewOutlet.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        chartViewOutlet.legend.enabled = true
    }

    

}

