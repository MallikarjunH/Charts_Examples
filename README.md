**Line Chart, Bar Chart and Pie Charts Examples**

**Library**: https://github.com/danielgindi/Charts


**Example 1** - Line-Chart (gradient fill)

![Line-Chart](https://user-images.githubusercontent.com/27955299/62184508-13bd4b00-b37c-11e9-8983-b192504cb7ee.png)


**Example 2** - Line-Chart_2

![Line-Chart_2](https://user-images.githubusercontent.com/27955299/62184529-2899de80-b37c-11e9-90f0-d496deb185c8.png)

**Example 3** - Line-Chart_3_Final1

![Line-Chart_3_Final1](https://user-images.githubusercontent.com/27955299/62184549-3485a080-b37c-11e9-848f-020155198474.png)

**Example 4** - Line-Chart_3_Final2

![Line-Chart_3_Final2](https://user-images.githubusercontent.com/27955299/62184588-53843280-b37c-11e9-851b-4eb32167932c.png)

**Example 5** - Line-Chart_3_Final3

![Screenshot 2019-08-01 at 11 23 26 AM](https://user-images.githubusercontent.com/27955299/62268933-1e94e000-b44f-11e9-873f-1c89dd352d5b.png)

**Example 6** - Line-Chart_3_Final4

![Line-Chart_3_Final4](https://user-images.githubusercontent.com/27955299/62274714-07a9ba00-b45e-11e9-9220-0269b46ebbfb.png)

**Example 7** - Line-Chart_3_Final4_Swift4 - This example work fine with swift 4

**Following line/code is not available after 4.0 versions** (i.e 4.2, 5.0 swift verions)

chartViewOutlet.xAxis.valueFormatter = IndexAxisValueFormatter(values: months) 

Solutions: - You need to add following code in order to show values on X- Axis

        let customFormater = CustomFormatter()
        customFormater.labels =  months
        chartViewOutlet.xAxis.valueFormatter = customFormater
      
and write seperate class like below,     

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

