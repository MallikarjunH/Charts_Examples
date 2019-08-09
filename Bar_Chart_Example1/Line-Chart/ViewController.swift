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
        
        barChartViewOutlet.chartDescription?.text = "" //hiding description label - This is optional - and It is required for swift4 and belows lower verions

        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i]) // // here we set the X and Y status in a data chart entry
            dataEntries.append(dataEntry) // // here we add it to the data set
        }

        
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        
       //  chartDataSet.valueTextColor = UIColor.blue //change color of vlaues - defult is black
        
        //changin color of bars - default color is blue/sky-blue
          chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
        
    
        
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartViewOutlet.data = chartData //finally - it adds the chart data to the chart and causes an update
        
        //MARK: Bar chart customization
        barChartViewOutlet.xAxis.enabled = true //show x axis
        barChartViewOutlet.leftAxis.enabled = true //show/hide left axix (Y axis)
        barChartViewOutlet.rightAxis.enabled = false //show/hide right axis (Y axis)
        barChartViewOutlet.animate(xAxisDuration: 1.5) //show animation
        barChartViewOutlet.drawGridBackgroundEnabled = true //show or hide background color
        //set in storyboard = #F3F4F8 or UIColor(red: 0.243, green: 0.244, blue: 0.248, alpha: 1)
        
        barChartViewOutlet.xAxis.drawGridLinesEnabled = true //it will show/hide grid background (Verticles lines - Y - form x axix)
        barChartViewOutlet.xAxis.drawAxisLineEnabled = true //show x axis line
        barChartViewOutlet.xAxis.labelPosition = .bottom // values/labels of x axis - position
        barChartViewOutlet.xAxis.drawLabelsEnabled = true //show/hide values/labels in x axis
        
        //right and left axis - optional/not required
        // chartViewOutlet.leftAxis.drawAxisLineEnabled = true //show lines of left x axis
        barChartViewOutlet.leftAxis.drawGridLinesEnabled = true //hide/show x axis grid lines - horizontal lines ( X axis - from Y)
        //  chartViewOutlet.rightAxis.drawAxisLineEnabled = false
        // chartViewOutlet.rightAxis.drawGridLinesEnabled = false
        
        barChartViewOutlet.legend.enabled = true //show/hide legend - below graph
    
        //MARL:show animation
        barChartViewOutlet.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        
        //MARK: Set limits
        /*
          //for more details info about limits please check examples of line-charts
        */
        //limits - set limit on left x axis
        let ll = ChartLimitLine(limit: 10.0, label: "Target")
        //barChartViewOutlet.leftAxis.addLimitLine(ll)  //this is dealult line show
        //to customize limit line - write below code
        ll.lineWidth = 1.5
        ll.lineColor = UIColor.red
        ll.lineDashLengths = [4, 4]
        ll.labelPosition = .rightTop
        ll.valueFont = .systemFont(ofSize: 10)
        barChartViewOutlet.leftAxis.addLimitLine(ll)
        
      //  Optional stuff
        barChartViewOutlet.xAxis.gridLineDashLengths = [4, 4] // verticle line - dash lines
        barChartViewOutlet.xAxis.gridLineDashPhase = 0
        
        barChartViewOutlet.leftAxis.gridLineDashLengths = [4, 4] //horizontal lines - y
    }
  
}
