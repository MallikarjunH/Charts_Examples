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
  
    var months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    var unitsSold = [24.0,43.0,56.0,23.0,56.0,68.0,48.0,120.0,41.0,34.0,55.9,12.0,34.0]
    
    @IBOutlet weak var chartViewOutlet: LineChartView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setChart(dataPoints: months, values: unitsSold)
        
    }

     func setChart(dataPoints: [String], values: [Double]) {
        
        if  dataPoints.count == 0{
            
             chartViewOutlet.noDataText = "No data available!"
        }
        else{
            
            for i in 0 ..< dataPoints.count {
                print("chart point : \(values[i])")
                let dataEntry = ChartDataEntry(x: Double(i), y: values[i]) // here we set the X and Y status in a data chart entry
                dataEntries.append(dataEntry) // here we add it to the data set
                //dataEntries.append(ChartDataEntry(x: Double(i), y: values[i]))
            }
            
            
            let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Units Consumed")
            
            // to show points (circle)
            /*  lineChartDataSet.axisDependency = .left
             lineChartDataSet.setColor(UIColor.black)
             lineChartDataSet.setCircleColor(UIColor.black) // our circle will be dark red
             lineChartDataSet.lineWidth = 1.0
             lineChartDataSet.circleRadius = 3.0 // the radius of the node circle
             lineChartDataSet.fillAlpha = 1
             lineChartDataSet.fillColor = UIColor.black
             lineChartDataSet.highlightColor = UIColor.white
             lineChartDataSet.drawCircleHoleEnabled = true */
            
            /*
             1. lineChartDataSet.setCircleColor(UIColor.clear) == the circle will be clear color with
             2. If we we comment following line, by defaukt it will take blue color for that points (circle)
             */
            lineChartDataSet.setCircleColor(UIColor.clear) // hide the outer circle color
            
            /*
             1. lineChartDataSet.circleRadius = 3.0 == it is the radius of the node circle
             2. If we we comment following line, by default it will take following
             lineChartDataSet.circleRadius = 3.0
             3. If you wans to hide this also (cubic circle) then write following line
             lineChartDataSet.circleRadius = 0.0
             */
            lineChartDataSet.circleRadius = 0.0 // hide - the radius of the node circle
            
            /* Increasing/decresing the width of a line - curver line
             by default its width will be 1.0 i.e
             lineChartDataSet.lineWidth = 1.0
             
             If you wants to increse then just change like 2.0, 3.0 ...etc
             */
            lineChartDataSet.lineWidth = 2.0 //1.0
            
            /*
             -  show or hide values on the graph - in the lines - i.e points values by following line
             - if you wants to show the values then just hide the below line - change or add custome color according to your requirement
             */
            lineChartDataSet.valueTextColor = UIColor.clear //hide the values on the curve line
            
            
            // to show line (curve line)
            lineChartDataSet.colors = [NSUIColor.blue] //Sets the line colour to blue
            lineChartDataSet.mode = .cubicBezier
            lineChartDataSet.cubicIntensity = 0.2
            
            //NoteL: If you need show/add gradient color then enable following code
            
            /*   let gradient = getGradientFilling()
             lineChartDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
             lineChartDataSet.drawFilledEnabled = false //hide filled color */
            
            
            var dataSets = [LineChartDataSet]() //This is the object that will be added to the chart
            dataSets.append(lineChartDataSet)  //Adds the line to the dataSet
            
            
            
            let lineChartData = LineChartData(dataSets: dataSets)
            chartViewOutlet.data = lineChartData //finally - it adds the chart data to the chart and causes an update
            
            //cell.chartViewOutlet.chartDescription?.text = "" //hide descriptionn label //3.0 version required
            
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
            
            //right and left axis - optional/not required
            // chartViewOutlet.leftAxis.drawAxisLineEnabled = true //show lines of left x axis
            chartViewOutlet.leftAxis.drawGridLinesEnabled = true //hide/show x axis grid lines - horizontal lines ( X axis - from Y)
            //  chartViewOutlet.rightAxis.drawAxisLineEnabled = false
            // chartViewOutlet.rightAxis.drawGridLinesEnabled = false
            
            chartViewOutlet.legend.enabled = false //show.hide legend - below graph
            
            
            // Showing Limits and Showing dashed lines
            
            // x-axis limit line
            let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
            llXAxis.lineWidth = 1.5
            llXAxis.lineDashLengths = [10, 10, 0]
            llXAxis.labelPosition = .bottomRight
            llXAxis.valueFont = .systemFont(ofSize: 10)
            
            chartViewOutlet.xAxis.gridLineDashLengths = [4, 4] // verticle line - dash lines
            chartViewOutlet.xAxis.gridLineDashPhase = 0
            
            let ll1 = ChartLimitLine(limit: 110, label: "Upper Limit") // limit the upper line
            ll1.lineWidth = 1.5
            ll1.lineColor = UIColor.red
            ll1.lineDashLengths = [4, 4]
            ll1.labelPosition = .topRight
            ll1.valueFont = .systemFont(ofSize: 10)
            
            let ll2 = ChartLimitLine(limit: 50, label: "Lower Limit") // limit the lower line
            ll2.lineWidth = 1.5
            ll2.lineColor = UIColor.green
            ll2.lineDashLengths = [4,4]
            ll2.labelPosition = .bottomRight
            ll2.valueFont = .systemFont(ofSize: 10)
            
            let leftAxis = chartViewOutlet.leftAxis
            leftAxis.removeAllLimitLines()
            leftAxis.addLimitLine(ll1)
            leftAxis.addLimitLine(ll2)
            leftAxis.axisMaximum = 200 //highest values to show grph - y axis
            leftAxis.axisMinimum = 0 // lowest values where graph has to start
            
            leftAxis.gridLineDashLengths = [5, 5] //horizontal line - dash lines
            leftAxis.drawLimitLinesBehindDataEnabled = true
            
            chartViewOutlet.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints) //enable/show months label at x axis
            
            
            
        }
        
   
    }

    /// Creating gradient for filling space under the line chart
 /*  private func getGradientFilling() -> CGGradient {
        // Setting fill gradient color
        let coloTop = UIColor(red: 141/255, green: 133/255, blue: 220/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 230/255, green: 155/255, blue: 210/255, alpha: 1).cgColor
        // Colors of the gradient
        let gradientColors = [coloTop, colorBottom] as CFArray
        // Positioning of the gradient
        let colorLocations: [CGFloat] = [0.7, 0.0]
        // Gradient Object
        return CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)!
    } */
    

}

