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
import ResearchKit

class ChartController: UIViewController {
    // Chart
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var barChartView: BarChartView!
    
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
    let bloodValues = [80.0, 99.0, 100.0, 120.0, 100.0, 126.0]
    var survey = SurveyObj()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart(dataPoints: months, values: bloodValues)
    }
    @IBAction func takeSurvey(_ sender: Any) {
        // Create a question.
        let q1 = StepObj()
        q1.title = "Do you have diabetes?"
        q1.id = "q1"
        q1.type = "yesNo"
        
        // Add the question to the survey.
        self.survey.questions.append(q1)
        // Build the survey.
        let taskViewController = self.survey.buildSurv()
        // For resignation of survey.
        taskViewController.delegate = self
        // Trigger the survey.
        present(taskViewController, animated: true, completion: nil)
    }
    @IBAction func returnHome(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
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
extension ChartController:ORKTaskViewControllerDelegate {
    
    public func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
}
