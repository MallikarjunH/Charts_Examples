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

    var months: [String]!
    
    @IBOutlet weak var barChartViewOutlet: BarChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(dataPoints: months, values: unitsSold)
        
    }

    func setChart(dataPoints: [String], values: [Double]) {
       
        barChartViewOutlet.noDataText = "You need to provide data for the chart."
        
        barChartViewOutlet.chartDescription?.text = "" //hiding description label

        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartViewOutlet.data = chartData
        
    }
  
}
