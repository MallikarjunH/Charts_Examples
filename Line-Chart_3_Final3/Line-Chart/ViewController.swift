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
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
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
        lineChartDataSet.colors = [NSUIColor.blue]
        lineChartDataSet.mode = .cubicBezier
        lineChartDataSet.cubicIntensity = 0.2
        
        //NoteL: If you need show/add gradient color then enable following code
        
       /* let gradient = getGradientFilling()
        line1.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        line1.drawFilledEnabled = false //hide filled color */
        
        
        var dataSets = [LineChartDataSet]()
        dataSets.append(lineChartDataSet)
        
        
        let lineChartData = LineChartData(dataSets: dataSets)
        chartViewOutlet.data = lineChartData
        
        chartViewOutlet.xAxis.enabled = true //show x axis
        chartViewOutlet.leftAxis.enabled = true //show/hide left axix (Y axis)
        chartViewOutlet.rightAxis.enabled = false //show/hide right axis (Y axis)
        chartViewOutlet.animate(xAxisDuration: 1.5) //show animation
        chartViewOutlet.drawGridBackgroundEnabled = false //show or hide background color
        chartViewOutlet.xAxis.drawGridLinesEnabled = true //it will show/hide grid background (Verticles lines - Y - form x axix)
        chartViewOutlet.xAxis.drawAxisLineEnabled = true //show x axis line
        chartViewOutlet.xAxis.labelPosition = .bottom // values/labels of x axis - position
        chartViewOutlet.xAxis.drawLabelsEnabled = true //show/hide values/labels in x axis
        
        //right and left axis - optional/not required
        // chartViewOutlet.leftAxis.drawAxisLineEnabled = true //show lines of left x axis
        chartViewOutlet.leftAxis.drawGridLinesEnabled = true //hide/show x axis grid lines - horizontal lines ( X axis - from Y)
        //  chartViewOutlet.rightAxis.drawAxisLineEnabled = false
        // chartViewOutlet.rightAxis.drawGridLinesEnabled = false
        
        chartViewOutlet.legend.enabled = true //show.hide legend - below graph
        
        chartViewOutlet.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints) //enable/show months label at x axis
        
        
    }

    /// Creating gradient for filling space under the line chart
 /*   private func getGradientFilling() -> CGGradient {
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

