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
      /*  lineChartDataSet.axisDependency = .left
        lineChartDataSet.setColor(UIColor.black)
        lineChartDataSet.setCircleColor(UIColor.black) // our circle will be dark red
        lineChartDataSet.lineWidth = 1.0
        lineChartDataSet.circleRadius = 3.0 // the radius of the node circle
        lineChartDataSet.fillAlpha = 1
        lineChartDataSet.fillColor = UIColor.black
        lineChartDataSet.highlightColor = UIColor.white
        lineChartDataSet.drawCircleHoleEnabled = true */
       
        // to show points
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
        chartViewOutlet.rightAxis.enabled = false
        chartViewOutlet.xAxis.drawGridLinesEnabled = false
        chartViewOutlet.xAxis.labelPosition = .bottom
        chartViewOutlet.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        
        
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

