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
        
        chartViewOutlet.noDataText = "No data available!"
        
        for i in 0 ..< dataPoints.count {
            print("chart point : \(values[i])")
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i]) // here we set the X and Y status in a data chart entry
            dataEntries.append(dataEntry) // here we add it to the data set
            //dataEntries.append(ChartDataEntry(x: Double(i), y: values[i]))
        }
        
        
        
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "Units Consumed")
    
        lineChartDataSet.setCircleColor(UIColor.clear) // hide the outer circle color
        lineChartDataSet.circleRadius = 0.0 // hide - the radius of the node circle
        lineChartDataSet.lineWidth = 2.0 //1.0
        lineChartDataSet.valueTextColor = UIColor.clear //hide the values on the curve line
        

        // to show line (curve line)
        lineChartDataSet.colors = [NSUIColor.blue] //Sets the line colour to blue
        lineChartDataSet.mode = .cubicBezier
        lineChartDataSet.cubicIntensity = 0.2
        
        var dataSets = [LineChartDataSet]() //This is the object that will be added to the chart
        dataSets.append(lineChartDataSet)  //Adds the line to the dataSet
        
       
        
        let lineChartData = LineChartData(dataSets: dataSets)
        chartViewOutlet.data = lineChartData //finally - it adds the chart data to the chart and causes an update
        
        chartViewOutlet.chartDescription?.text = "" //hide descriptionn label //3.0 version required
        
        chartViewOutlet.xAxis.enabled = true //show x axis
        chartViewOutlet.leftAxis.enabled = true //show/hide left axix (Y axis)
        chartViewOutlet.rightAxis.enabled = false //show/hide right axis (Y axis)
        chartViewOutlet.animate(xAxisDuration: 1.5) //show animation
        chartViewOutlet.drawGridBackgroundEnabled = true //show or hide background color
        //set in storyboard = #F3F4F8 or UIColor(red: 0.243, green: 0.244, blue: 0.248, alpha: 1)

        chartViewOutlet.xAxis.drawGridLinesEnabled = true //it will show/hide grid background (Verticles lines - Y - form x axix)
        chartViewOutlet.xAxis.drawAxisLineEnabled = true //show x axis line
        chartViewOutlet.xAxis.labelPosition = .bottom // values/labels of x axis - position
        chartViewOutlet.xAxis.drawLabelsEnabled = true //show/hide values/labels in x axis
    
        chartViewOutlet.leftAxis.drawGridLinesEnabled = true //hide/show x axis grid lines - horizontal lines ( X axis - from Y)
       chartViewOutlet.legend.enabled = false //show.hide legend - below graph
        
        
        // Showing Limits and Showing dashed lines
        
        // x-axis limit line
        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
        llXAxis.lineWidth = 1.5
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .rightBottom
        llXAxis.valueFont = .systemFont(ofSize: 10)
        
        chartViewOutlet.xAxis.gridLineDashLengths = [4, 4] // verticle line - dash lines
        chartViewOutlet.xAxis.gridLineDashPhase = 0
        
        let ll1 = ChartLimitLine(limit: 110, label: "Upper Limit") // limit the upper line
        ll1.lineWidth = 1.5
        ll1.lineColor = UIColor.red
        ll1.lineDashLengths = [4, 4]
        ll1.labelPosition = .rightTop
        ll1.valueFont = .systemFont(ofSize: 10)
        
        let ll2 = ChartLimitLine(limit: 50, label: "Lower Limit") // limit the lower line
        ll2.lineWidth = 1.5
        ll2.lineColor = UIColor.green
        ll2.lineDashLengths = [4,4]
        ll2.labelPosition = .rightBottom
        ll2.valueFont = .systemFont(ofSize: 10)
        
        let leftAxis = chartViewOutlet.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.addLimitLine(ll1)
        leftAxis.addLimitLine(ll2)
        leftAxis.axisMaximum = 200 //highest values to show grph - y axis
        leftAxis.axisMinimum = 0 // lowest values where graph has to start
        
        leftAxis.gridLineDashLengths = [5, 5] //horizontal line - dash lines
        leftAxis.drawLimitLinesBehindDataEnabled = true
       
        
        // swift 4.0 and lower versions
        let customFormater = CustomFormatter()
        customFormater.labels =  months
        chartViewOutlet.xAxis.valueFormatter = customFormater
      
        // this availabele after swift 4.2 or 5.0
       // chartViewOutlet.xAxis.valueFormatter = IndexAxisValueFormatter(values: months) //enable/show months label at x axis
        
        
    }
    

}


final class CustomFormatter: IAxisValueFormatter {
    
    var labels: [String] = []
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        let count = self.labels.count
        
        guard let axis = axis, count > 0 else {
            return ""
        }
        
        let factor = axis.axisMaximum / Double(count)
        
        let index = Int((value / factor).rounded())
        
        if index >= 0 && index < count {
            return self.labels[index]
        }
        
        return ""
    }
}
