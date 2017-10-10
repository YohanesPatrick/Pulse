//
//  ChartController.swift
//  Pulse2
//
//  Created by Chalermpon Thongmotai on 10/2/17.
//  Copyright © 2017 Yohanes Patrik Handrianto. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ChartController: UIViewController {
    // Chart
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var barChartView: BarChartView!
    
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
    let bloodValues = [80.0, 99.0, 100.0, 120.0, 100.0, 126.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart(dataPoints: months, values: bloodValues)
    }
    func setChart(dataPoints: [String], values: [Double]) {
        
        var lineDataEntries = [ChartDataEntry]()
        var barDataEntries = [BarChartDataEntry]()
        
        for i in 0..<dataPoints.count {
            let lineDataEntry = ChartDataEntry(x: Double(i), y: values[i])
            lineDataEntries.append(lineDataEntry)
            let barDataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            barDataEntries.append(barDataEntry)
            
        }
        
        let plotLine = LineChartDataSet(values: lineDataEntries, label: "Unit")
        plotLine.colors = [NSUIColor.white]
        
        
        let lineChartData = LineChartData()
        lineChartData.addDataSet(plotLine)
        
        if lineChartView != nil{
            lineChartView.chartDescription?.enabled = false
            lineChartView.data = lineChartData
        }
        
        let plotBar = BarChartDataSet(values: barDataEntries, label: "Units Sold")
        
        let barChartData = BarChartData()
        barChartData.addDataSet(plotBar)
        
        if barChartView != nil {
            barChartView.chartDescription?.enabled = false
            barChartView.data = barChartData
        }
    }
}

