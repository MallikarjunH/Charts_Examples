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

  //  func setChart(data,values: [Double]) {
     func setChart(dataPoints: [String], values: [Double]) {
        
        print(values)
        print(dataPoints)
        chartViewOutlet.noDataText = "No data available!"
      
        for i in 0..<values.count {
            print("chart point : \(values[i])")
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let line1 = LineChartDataSet(entries: dataEntries, label: "Units Consumed")
        line1.colors = [NSUIColor.blue]
        line1.mode = .cubicBezier
        line1.cubicIntensity = 0.2
        
        let gradient = getGradientFilling()
        line1.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        line1.drawFilledEnabled = true
        
        
        let data = LineChartData()
        data.addDataSet(line1)
        chartViewOutlet.data = data
        chartViewOutlet.setScaleEnabled(false)
        chartViewOutlet.animate(xAxisDuration: 1.5)
        chartViewOutlet.drawGridBackgroundEnabled = false
        chartViewOutlet.xAxis.drawAxisLineEnabled = false
        chartViewOutlet.xAxis.drawGridLinesEnabled = false
        chartViewOutlet.leftAxis.drawAxisLineEnabled = false
        chartViewOutlet.leftAxis.drawGridLinesEnabled = false
        chartViewOutlet.rightAxis.drawAxisLineEnabled = false
        chartViewOutlet.rightAxis.drawGridLinesEnabled = false
        chartViewOutlet.legend.enabled = false
        chartViewOutlet.xAxis.enabled = false
        chartViewOutlet.leftAxis.enabled = false
        chartViewOutlet.rightAxis.enabled = false
        chartViewOutlet.xAxis.drawLabelsEnabled = false
        
        
    }

    /// Creating gradient for filling space under the line chart
    private func getGradientFilling() -> CGGradient {
        // Setting fill gradient color
        let coloTop = UIColor(red: 141/255, green: 133/255, blue: 220/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 230/255, green: 155/255, blue: 210/255, alpha: 1).cgColor
        // Colors of the gradient
        let gradientColors = [coloTop, colorBottom] as CFArray
        // Positioning of the gradient
        let colorLocations: [CGFloat] = [0.7, 0.0]
        // Gradient Object
        return CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)!
    }
    

}

