**Line Chart, Bar Chart and Pie Charts Examples**

**Library**: https://github.com/danielgindi/Charts


**Example 1 - 7** -Output Screens

![1](https://user-images.githubusercontent.com/27955299/62760603-0271ee00-baa2-11e9-98a2-6bda66c94d92.jpg)

![2](https://user-images.githubusercontent.com/27955299/62760612-0b62bf80-baa2-11e9-8e75-11b1ceb8c484.jpg)
**Example 7** - Line-Chart_3_Final4_Swift4 - This example work fine with swift 4

**Following line/code is not available after 4.0 versions** (i.e 4.2, 5.0 swift verions)

        chartViewOutlet.xAxis.valueFormatter = IndexAxisValueFormatter(value: months)
      
**Solutions**: - You need to add following code in order to show values on X- Axis

        let customFormater = CustomFormatter()
        customFormater.labels =  months
        chartViewOutlet.xAxis.valueFormatter = customFormater
      
and write seperate class like below,     
  
    final class CustomFormatter: IAxisValueFormatter{
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


**Bar Chart** - Output Screens

![3](https://user-images.githubusercontent.com/27955299/62760620-0f8edd00-baa2-11e9-8fb7-e01b94fbf72a.jpg)

