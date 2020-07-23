//  https://github.com/k9doghouse/RiverGauge.git
//  ViewController.swift
//  RiverGauge
//
//  Created by Arthur Murphy on 10/10/17.
//  Copyright © 2017 MurphySpringsLodge. All rights reserved.
import UIKit

extension String {
    var lines: [String] {
        var result: [String] = []
        enumerateLines { line, _ in result.append(line) }
        return result
    } // end var result
} // end extension String

var riverGauges: Array = [[String]]()
var stationName: String = "p. h."
var line: String = "p. h."
var corners: CGFloat = 8.0
var borders: CGFloat = 1.0
var colors : UIColor = UIColor.green
let stations: Int = 0
let floods: Int = 1
let darkBlue: UIColor = UIColor.init(red: 0.008, green: 0.094, blue: 0.576, alpha: 1)
let darkTeal: UIColor = UIColor.init(red: 0, green: 0.567, blue: 0.576, alpha: 1)
let butterColor: UIColor = UIColor.init(red: 0.999, green: 0.999, blue: 0.866, alpha: 1)
let milkColor: UIColor = UIColor.init(red: 0.911, green: 0.911, blue: 0.911, alpha: 1)

let stationArray: Array = ["CAPE GIRARDEAU", "NEW MADRID", "TIPTONVILLE", "CARUTHERSVILLE", "OSCEOLA", "MEMPHIS", "TUNICA", "HELENA", "ARKANSAS CITY", "GREENVILLE", "VICKSBURG", "NATCHEZ", "RED RIVER LNDG", "BATON ROUGE", "DONALDSONVILLE", "RESERVE", "NEW ORLEANS"]

let floodArray: Array = ["32 ft.", "34 ft.", "37 ft.", "32 ft.", "28 ft.", "34 ft.", "41 ft.", "44 ft.", "37 ft.", "48 ft.", "43 ft.", "48 ft.", "48 ft.", "35 ft.", "27 ft.", "22 ft.", "17 ft."]

let riverURL: String = "http://forecast.weather.gov/product.php?site=NWS&issuedby=ORN&product=RVA&format=TXT&version=1&glossary=0"

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var LMSRGLabel: UILabel!
    @IBOutlet var observationLabel: UILabel!
    @IBOutlet var stationLabel: UILabel!
    @IBOutlet var floodLabel: UILabel!
    @IBOutlet var currentLabel: UILabel!
    @IBOutlet var forecastLabel: UILabel!
    @IBOutlet var stationPicker: UIPickerView!
    @IBOutlet var oneDayAfterLabel: UILabel!
    @IBOutlet var twoDaysAfterLabel: UILabel!
    @IBOutlet var nowDateTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      <- - - - - light color gradiant background for Status Bar - - - - ->
        let layers: CAGradientLayer = CAGradientLayer()
        layers.frame = CGRect(x: 0, y: 0, width: 414, height: 20)
        layers.colors = [butterColor.cgColor, UIColor.white.cgColor]
        layers.cornerRadius = corners
        layers.borderWidth = borders
        layers.masksToBounds = true
        layers.borderColor = colors.cgColor
        view.layer.addSublayer(layers)
//      <- - - - - end background for Status Bar - - - - ->
        
        stationPicker.dataSource = self
        stationPicker.delegate = self
        riverGauges.append(stationArray)
        riverGauges.append(floodArray)
        
//      <- - - - - Customize label rects - - - - ->
        LMSRGLabel.layer.cornerRadius = corners
        LMSRGLabel.layer.borderWidth = borders
        LMSRGLabel.layer.masksToBounds = true
        LMSRGLabel.layer.borderColor = colors.cgColor
        observationLabel.layer.cornerRadius = corners
        observationLabel.layer.borderWidth = borders
        observationLabel.layer.masksToBounds = true
        observationLabel.layer.borderColor = colors.cgColor
        stationLabel.layer.cornerRadius = corners
        stationLabel.layer.borderWidth = borders
        stationLabel.layer.masksToBounds = true
        stationLabel.layer.borderColor = colors.cgColor
        floodLabel.layer.cornerRadius = corners
        floodLabel.layer.borderWidth = borders
        floodLabel.layer.masksToBounds = true
        floodLabel.layer.borderColor = colors.cgColor
        currentLabel.layer.cornerRadius = corners
        currentLabel.layer.borderWidth = borders
        currentLabel.layer.masksToBounds = true
        currentLabel.layer.borderColor = colors.cgColor
        forecastLabel.layer.cornerRadius = corners
        forecastLabel.layer.borderWidth = borders
        forecastLabel.layer.masksToBounds = true
        forecastLabel.layer.borderColor = colors.cgColor
        oneDayAfterLabel.layer.cornerRadius = corners
        oneDayAfterLabel.layer.borderWidth = borders
        oneDayAfterLabel.layer.masksToBounds = true
        oneDayAfterLabel.layer.borderColor = colors.cgColor
        twoDaysAfterLabel.layer.cornerRadius = corners
        twoDaysAfterLabel.layer.borderWidth = borders
        twoDaysAfterLabel.layer.masksToBounds = true
        twoDaysAfterLabel.layer.borderColor = colors.cgColor
        nowDateTimeLabel.layer.cornerRadius = corners
        nowDateTimeLabel.layer.borderWidth = borders
        nowDateTimeLabel.layer.masksToBounds = true
        nowDateTimeLabel.layer.borderColor = colors.cgColor
//      <- - - - - End Customize label rects - - - - ->
        
    }  // end super.didViewLoad()
    
    // Customize the pickerView()
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label: UILabel = (view as? UILabel) ?? UILabel()
        pickerView.layer.cornerRadius = corners
        pickerView.layer.borderWidth = borders
        pickerView.layer.masksToBounds = true
        pickerView.layer.borderColor = colors.cgColor
        
        label.layer.cornerRadius = corners
        label.layer.borderWidth = borders - 0.5
        label.layer.masksToBounds = true
        label.layer.borderColor = colors.cgColor
        
        label.textColor = darkBlue
        label.shadowColor = darkTeal
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Tamil Sangam MN", size: 24.0)
        label.text = riverGauges[stations][row]
        stationName = label.text!
        return label
    } // end func PV viewForRow...
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    } // end func number...
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return riverGauges[stations].count
    } // end func pV...count
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    } // end func pV(row height...)
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return riverGauges[stations][row]
    }//end func pV...[row]
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//      <- - - - - set static labels - - - - ->
        let currentDateTime: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.timeStyle = .full
        self.nowDateTimeLabel.text = "Time Now: \n\(dateFormatter.string(from: currentDateTime))"
        self.floodLabel.text = "Flood Gauge: \(riverGauges[floods][row])"
        self.stationLabel.text = riverGauges[stations][row]
        
        grabRiverGaugeRawData(stationName: stationLabel.text!)
        
    }//end func pV...didSelectRow()
    
    var today: Int = 2
    var tomorrow: Int = 4
    var oneDayAfters: Int = 5
    var twoDaysAfters: Int = 6
    
    func grabRiverGaugeRawData(stationName: String) {
        
        if let url: URL = URL(string: riverURL) {
            do {
                let content: String = try String(contentsOf: url)
                let rivDat: String = String(content)
                // regex to grab the time the river gauge was observed i.e. 0929AM or 1929PM or 2329PM
                let regex: NSRegularExpression = try NSRegularExpression(pattern: "(?:((0|1|2)(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)(A|P)M).*)")
                
                for match in regex.matches(in: rivDat, range: NSRange(0..<rivDat.utf16.count)) {
//                  <- - - - - find and display the observation report time from webpage - - - - ->
                    let lineRange: NSRange = match.range(at: 1)
                    let line = lineRange.location != NSNotFound ? (rivDat as NSString).substring(with: lineRange): nil
                    let funkyPattern: String = line!
                    var lines: [String] = []
                    rivDat.enumerateLines { line, _ in
                        
                        // if the time pattern (funkyPattern) is detected then grab the time of observation
                        if line.hasPrefix(funkyPattern) {
                            self.observationLabel.text = "Gauge reading observed at: \n\(line)"
                        } // end if...
                        
//                      <- - - - - find the line with the data for the selected name of a river gauge city - - - - ->
                        if line.contains(stationName) {
                            lines.append(line)
                            // massage the data to account for city names with a space or spaces
                            let stationCity: String = lines[stations]
                            let currentRiverGauge: Array = stationCity.split(separator: " ", maxSplits: 16, omittingEmptySubsequences: true)
                            let gauge: ArraySlice = currentRiverGauge[...]
                            
                            switch gauge[stations] {    // city name has 2 spaces
                            case "RED":                 // Red River Lndg
                                self.today = 4
                                self.tomorrow = 6
                                self.oneDayAfters = 7
                                self.twoDaysAfters = 8
                            case "NEW",             // city names have 1 space
                                 "CAPE",            // New Orleans, New Madrid, Cape G, Ark City, Baton R.
                                 "ARKANSAS",
                                 "BATON":
                                self.today = 3
                                self.tomorrow = 5
                                self.oneDayAfters = 6
                                self.twoDaysAfters = 7
                            default:                // city names having no spaces
                                self.today = 2      // Memphis, Tiptonville, Reserve, Oceola...
                                self.tomorrow = 4
                                self.oneDayAfters = 5
                                self.twoDaysAfters = 6
                            } // end switch...
//                          <- - - - - set labels from data on webpage - - - - ->
                            self.currentLabel.text = " Today: \(gauge[self.today]) ft."
                            self.forecastLabel.text = " Tommorrow: \(gauge[self.tomorrow]) ft."
                            self.oneDayAfterLabel.text = " 1 Day After Tomorrow: \(gauge[self.oneDayAfters]) ft."
                            self.twoDaysAfterLabel.text = " 2 Days After Tomorrow: \(gauge[self.twoDaysAfters]) ft."
                        } // end if...
                    } // end closure enumerateLines...
                } // end for match...
            } // end do...
                
            catch {
                print("contents could not be loaded.\n")
            } // end catch...
        } // end if let url...
        else {
            print("the URL was bad!\n")
        }  // end else...
        
    } // end func grabRiverGaugeData
    
    // <- - - - - The End - - - - ->
}   // end class VC                >
    // <- - - - - The End - - - - ->
