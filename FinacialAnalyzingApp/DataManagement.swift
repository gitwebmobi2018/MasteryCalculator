//
//  DataManagement.swift
//  FinacialAnalyzingApp
//
//  Created by pei on 2017-04-08.
//
//

import UIKit
import Foundation

class DataManagement: NSObject {
    
    static let sharedInstance = DataManagement()
    
    var windowSize = CGSize.zero
    var expired = false
    
    var flipSubSliderViewCell = FlipSliderTableViewCell()
    
    var keyboardHide = true
    var viewMode_Flip = "Input"
    var viewMode_Cash = "Input"
    
    func addComma(number: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:number))!
    }
    
    // MARK: Flip Calculator Data - PART 1
    
    func hideTextF() {
        flipSubSliderViewCell.hideTextField()
    }
    let flip_CalculationMode = [
        "Flip - Flip Max",
        "Flip - Cash Flow",
        "Auction - Flip Max",
        "Auction - Cash Flow",
        "Definitions",
        "Input"
    ]
    let flip_flipMax_InputTitleArray = [
        "ARV",
        "Hold Time",
        "Purchase Cost",
        "Finance Cost/mo",
        "Prop.Taxes/mo",
        "Ins./mo",
        "Rehab Cost",
        "Rehab Overrun",
        "Utilities Etc",
        "Commissions",
        "Closing,Attorney Etc",
        "Desired Profit"
    ]
    let flip_cashFlow_InputTitleArray = [
        "ARV",
        "Hold Time",
        "Purchase Cost",
        "Finance Cost/mo",
        "Prop.Taxes/mo",
        "Ins./mo",
        "Rehab Cost",
        "Rehab Overrun",
        "Utilities Etc",
        "Commissions",
        "Closing,Attorney Etc",
        "Desired Equity"
    ]
    
    var flip_ValueArray = [
        "200000","5","1500", "1200","380","50","41000","0","100","3","3000","26000"
    ]
    
    func valueSet(value: String, valueIndex: Int) -> String {
        var valueString = ""
        let numComma = addComma(number: Int(value)!)
        switch valueIndex {
        case 0:
            valueString = "$\(numComma)"
            break
        case 1:
            valueString = "\(value) months"
            break
        case 2:
            valueString = "$\(numComma)"
            break
        case 3:
            valueString = "$\(numComma)"
            break
        case 4:
            valueString = "$\(numComma)"
            break
        case 5:
            valueString = "$\(numComma)"
            break
        case 6:
            valueString = "$\(numComma)"
            break
        case 7:
//            let numberFormatter = NumberFormatter()
//            numberFormatter.maximumFractionDigits = 2
//            numberFormatter.minimumIntegerDigits = 1
//            let valueFloat = "\(String(describing: numberFormatter.string(from: NSNumber(value: (value as NSString).floatValue))!))"
            valueString = "\(value)%"
            break
        case 8:
            valueString = "$\(numComma)"
            break
        case 9:
            valueString = "\(value)%"
            break
        case 10:
            valueString = "$\(numComma)"
            break
        case 11:
            valueString = "$\(numComma)"
            break
        case 12:
            valueString = "$\(numComma)"
            break
            
        default:
            break
        }
        return valueString
    }

    
    let flip_Flipping_FlipMaxCalculator = [
        "After Repair Value",
        "Acquasition Costs",
        "Repair Costs",
        "Finance Cost",
        "Carrying Costs",
        "Cost Over Runs",
        "Selling Costs",
        "Desired Profit",
        "Total Cost",
        "Max Offer"
    ]
    var flip_Flipping_FlipMaxCalculator_Values = [String]()
    public func flip_Flipping_FlipMaxCalculator_GetValueArray() {
        self.flip_Flipping_FlipMaxCalculator_Values = AndrewFlippingCalculator_FlipMaxCalculator(array: self.flip_ValueArray)
    }
    
    let flip_Flipping_CashFlow = [
        "After Repair Value",
        "Acquasition Costs",
        "Repair Costs",
        "Finance Cost",
        "Carrying Costs",
        "Cost Over Runs",
        "Desired Equity",
        "Total Cost",
        "Max Offer"
    ]
    var flip_Flipping_CashFlow_Values = [String]()
    public func flip_Flipping_CashFlow_GetValueArray() {
        self.flip_Flipping_CashFlow_Values = AndrewFlippingCalculator_CashFlowCalculator(array: self.flip_ValueArray)
    }
    
//    let flip_Auction_FlipMaxCalculator = [
//        "After Repair Value",
//        "Acquasition Costs",
//        "Repair Costs",
//        "Finance Cost",
//        "Carrying Costs",
//        "Auction Tax Costs",
//        "Cost Over Runs",
//        "Selling Costs",
//        "Desired Profit",
//        "Total Cost",
//        "Max Offer"
//    ]
//    var flip_Auction_FlipMaxCalculator_Values = [String]()
//    public func flip_Auction_FlipMaxCalculator_GetValueArray() {
//        self.flip_Auction_FlipMaxCalculator_Values = AndrewAuctionCalculator_FlipMaxCalculator(array: self.flip_ValueArray)
//    }
//    
//    let flip_Auction_CashFlow = [
//        "After Repair Value",
//        "Acquasition Costs",
//        "Repair Costs",
//        "Finance Cost",
//        "Carrying Costs",
//        "Auction Tax Costs",
//        "Cost Over Runs",
//        "Desired Equity",
//        "Total Cost",
//        "Max Offer"
//    ]
//    var flip_Auction_CashFlow_Values = [String]()
//    public func flip_Auction_CashFlow_GetValueArray() {
//        self.flip_Auction_CashFlow_Values = AndrewAuctionCalculator_CashFlowCalculator(array: self.flip_ValueArray)
//    }
    
    let flip_Definitions_Tilte = [
        "After Repair Value(ARV)",
        "Total Hold Time",
        "Purchase Related Costs",
        "Finance Cost",
        "Property Taxes Per Month",
        "Insurance Per Month",
        "Rehab Costs",
        "Rehab Overrun",
        "Other Expenses Per Monthly Expenses",
        "Commissions Cost For Selling",
        "Closing Costs",
        "Desired Profit",
        "Rental Equity",
        
        "Capitalization Rate",
        "Cash Flow(Annual)",
        "Debt Service",
        "Effective Gross Income",
        "Gross Income",
        "Net Operating Income",
        "Operating Expenses",
        "Vacancy Rate",
        "Return On Investment",
        "Gross Rent Multiplier",
        "Breakeven Point(%)",
        "Debt Coverage Ratio"
    ]
    let flip_Definitions_content = [
        "Current market value after rehab is done. ",
        "Flip - How long do you intend to take to rehab       and resell the property or have it rented and refinanced.This value is entered in # of months. Cashflow – How long to rehab, rent and refinance",
        "Purchase related attorney or title expenses or any other expenses you are going to incur.(Typical $2000)",
        "What do you expect your monthly finance cost to be.\n Even if you are paying cash do you want to pay yourself something for using your own capital.(Typical 12% per month)",
        "What is your monthly Tax Burden.",
        "Your monthly costs for insurance.",
        "How much rehab do you expect to do.",
        "0 - 35% (Our suggestion is unless you are 100% certain about your numbers at least use a 10% as default rehab overruns cost.)",
        "utilities, HOA fees.",
        "What do you expect to pay for commission this should be a minimum of 2.5% to 6% depending on how much you will pay the agent.",
        "This should included any transfer taxes or fees, title charges, attorney fees or other misc costs.",
        "What would you like to make in terms of profit.(**Per $ 100K invested net profit of $ 15k for a 6 month time frame is a good start)",
        "After purchase and rehab how much equity would you like to have.(Typical 15% of ARV)",
        
        "NOI/Sales Price.     [If you paid all cash, what return would you make?]",
        "NOI - debt service",
        "Monthly mortgage payment X 12",
        "Income - (vacancy rate % X income)",
        "All income, including rents(fully occupied), fees, vending machine sales, late fees, etc.",
        "Eff. Gross Income - Operating Expenses   [Waht is left after expenses to pay the mortgage]",
        "Taxes, insurance, utilities, management fees, payroll, landscaping, maintenance, supplies, repairs.    Excludes mortgage payments or interest expense.",
        "Number of vacancies X the number of units.",
        "Net proft(including all expenses and debt service)/cash invested in the deal",
        "Purchase Price / Effective Gross Income",
        "(Operating expenses + annual mortgage payments)/gross potential income",
        "NOI/Debt Service"
    ]
    
    func AndrewFlippingCalculator_FlipMaxCalculator(array:[String]) -> [String] {
        
        let first = (array[0] as NSString).integerValue
        let second = (array[2] as NSString).integerValue
        let third = (array[6] as NSString).integerValue
        let forth = (array[1] as NSString).integerValue*(array[3] as NSString).integerValue
        let fifth = (array[1] as NSString).integerValue*((array[4] as NSString).integerValue+(array[5] as NSString).integerValue+(array[8] as NSString).integerValue)
        let sixth = Int(roundf((array[6] as NSString).floatValue*(array[7] as NSString).floatValue)/100)
        let seventh = Int(roundf((array[0] as NSString).floatValue*(array[9] as NSString).floatValue)/100)
        let eighth = (array[11] as NSString).integerValue
        let ninth = second+third+forth+fifth+sixth+seventh+eighth
        let tenth = first-ninth
        
        let resultArray = [
            "\(first)","\(second)","\(third)","\(forth)","\(fifth)","\(sixth)","\(seventh)","\(eighth)","\(ninth)","\(tenth)"
            ]
        return resultArray
    }
    func AndrewFlippingCalculator_CashFlowCalculator(array:[String]) -> [String] {
        
        let first = (array[0] as NSString).integerValue
        let second = (array[2] as NSString).integerValue
        let third = (array[6] as NSString).integerValue
        let forth = (array[1] as NSString).integerValue*(array[3] as NSString).integerValue
        let fifth = (array[1] as NSString).integerValue*((array[4] as NSString).integerValue+(array[5] as NSString).integerValue+(array[8] as NSString).integerValue)
        let sixth = Int(roundf((array[6] as NSString).floatValue*(array[7] as NSString).floatValue)/100)
//        let seventh = (array[12] as NSString).integerValue
        let seventh = (array[11] as NSString).integerValue
        let eighth = second+third+forth+fifth+sixth+seventh
        let ninth = first-eighth
        
        let resultArray = [
            "\(first)","\(second)","\(third)","\(forth)","\(fifth)","\(sixth)","\(seventh)","\(eighth)","\(ninth)"
        ]
        
        return resultArray
    }
//    func AndrewAuctionCalculator_FlipMaxCalculator(array:[String]) -> [String] {
//        
//        let first = (array[0] as NSString).floatValue
//        let second = (array[2] as NSString).floatValue*2.5
//        let third = (array[6] as NSString).floatValue
//        let forth = (array[1] as NSString).floatValue*(array[3] as NSString).floatValue
//        let fifth = (array[1] as NSString).floatValue*((array[4] as NSString).floatValue+(array[5] as NSString).floatValue+(array[8] as NSString).floatValue)
//        let sixth = (array[4] as NSString).floatValue*12
//        let seventh = (array[6] as NSString).floatValue*(array[7] as NSString).floatValue
//        let eighth = (array[0] as NSString).floatValue*(array[9] as NSString).floatValue / 100
//        let ninth = (array[11] as NSString).floatValue
//        let tenth = second+third+forth+fifth+sixth+seventh+eighth+ninth
//        let eleventh = first-tenth
//        
//        let resultArray = [
//            "\(first)","\(second)","\(third)","\(forth)","\(fifth)","\(sixth)","\(seventh)","\(eighth)","\(ninth)","\(tenth)","\(eleventh)",
//        ]
//        
//        return resultArray
//    }
//    func AndrewAuctionCalculator_CashFlowCalculator(array:[String]) -> [String] {
//        
//        let first = (array[0] as NSString).floatValue
//        let second = (array[2] as NSString).floatValue*2.5
//        let third = (array[6] as NSString).floatValue
//        let forth = ((array[1] as NSString).floatValue*(array[3] as NSString).floatValue) + 2500
//        let fifth = (array[1] as NSString).floatValue*((array[4] as NSString).floatValue+(array[5] as NSString).floatValue+(array[8] as NSString).floatValue)
//        let sixth = (array[4] as NSString).floatValue*12
//        let seventh = (array[6] as NSString).floatValue*(array[7] as NSString).floatValue
//        let eighth = (array[12] as NSString).floatValue
//        let ninth = second+third+forth+fifth+sixth+seventh+eighth
//        let tenth = first-ninth
//        
//        let resultArray = [
//            "\(first)","\(second)","\(third)","\(forth)","\(fifth)","\(sixth)","\(seventh)","\(eighth)","\(ninth)","\(tenth)"
//        ]
//        
//        return resultArray
//    }
    
    // MARK: PART 2 - Cash Flow Calculator
    
    var cashSliderCell = CashFlowSliderTableViewCell()
    
    func cashHideTextF() {
        cashSliderCell.hideTextField()
    }
    
    let cash_input_titleArray = [
        
        "Financial Data:",
        "Purchase Price",
        "Rehab. Cost",
        "Estimated ARV",
        "LTV",
        "Interest Rate",
        "Loan Term/yr",
        
        "Gross Income:",
        "Rent",
        "Vacancy",
        
        "Operating Expenses:",
        "Prop.Taxes/yr",
        "Insurance/yr",
        "Repairs(Annual)",
        "HOA",
        "Mgmt Fee/mo",
        "Inflation Rate",
        
        "Loan Details:"
    ]
    
    var cash_valueArray = [
        "section1","120000", "0", "170000", "75", "4", "30",
        "section2","1350", "0",
        "section3","600", "12", "0", "400", "0", "3"
    ]
    
    let cash_first_titleArray = [
        "Mortgage Amount:", "Cash in Deal:", "Mortgage Payment(monthly)", "Gross Income(annual):", "Vacancy Rate:", "Occupancy Rate:", "Effective Gross Income:", "Association Fees(Annual):", "Management Fees(Annual):", "Total Operating Expenses:"
    ]
    var cash_first_valueArray = [String]()
    public func cash_first_GetValueArray() {
        let first = roundf(((cash_valueArray[1] as NSString).floatValue+(cash_valueArray[2] as NSString).floatValue)<((cash_valueArray[3] as NSString).floatValue*(cash_valueArray[4] as NSString).floatValue/100) ? ((cash_valueArray[1] as NSString).floatValue+(cash_valueArray[2] as NSString).floatValue) : ((cash_valueArray[3] as NSString).floatValue*(cash_valueArray[4] as NSString).floatValue/100))
        let second = Int(roundf((cash_valueArray[1] as NSString).floatValue+(cash_valueArray[2] as NSString).floatValue-first))
        let third = roundFloatValue(value: "\(pmt(rate: ((cash_valueArray[5] as NSString).doubleValue/12)/100, nper: (cash_valueArray[6] as NSString).doubleValue*12, pv: Double(first)))")
        
        let forth = (cash_valueArray[8] as NSString).floatValue*12
        let fifth = (cash_valueArray[9] as NSString).floatValue
        let sixth = (1 - fifth)*100
        let seventh = Int(roundf(forth*sixth/100))
        
        let eighth = (cash_valueArray[14] as NSString).floatValue*12
        let ninth = roundFloatValue(value: "\((cash_valueArray[15] as NSString).floatValue*12/100)")
        
        let tenth = (cash_valueArray[11] as NSString).floatValue+(cash_valueArray[12] as NSString).floatValue+(cash_valueArray[13] as NSString).floatValue+eighth+(ninth as NSString).floatValue
        cash_first_valueArray = [
            "\(Int(first))","\(second)", third,"\(Int(forth))","\(fifth)","\(sixth)","\(seventh)","\(eighth)", ninth,"\(tenth)",
        ]
    }
    let cash_summary_titleArray = [
        "NOI(annual, w/o loan):", "NOI(monthly,w/o laon):", "Princial+Interest", "Net Cash Flow", "Cash On Cash Return:", "Cap Rate:", "Cash Flow(annual):", "Cash Flow(monthly):", "Years to  Earn back Down Pm", "Breakeven Point:", "Debt Coverage Ratio:", "Andrew's (75%)Formula", "CashFlow as % of Rent(25%)"
    ]
    var cash_summary_valueArray = [String]()
    public func cash_summary_GetValueArray() {
        let first = (cash_first_valueArray[6] as NSString).floatValue - (cash_first_valueArray[9] as NSString).floatValue
        let second = first/12
        let third = round(pmt(rate: ((cash_valueArray[5] as NSString).doubleValue/12)/100, nper: (cash_valueArray[6] as NSString).doubleValue*12, pv: (cash_first_valueArray[0] as NSString).doubleValue))
        let forth = roundf((cash_valueArray[8] as NSString).floatValue-(Float(third)+((cash_first_valueArray[9] as NSString).floatValue/12)))
        let fifth = (cash_first_valueArray[1] as NSString).floatValue>0 ? (first-(cash_first_valueArray[2] as NSString).floatValue*12)/(cash_first_valueArray[1] as NSString).floatValue : 0.0
        let sixth = roundFloatValue(value: "\(first/((cash_valueArray[1] as NSString).floatValue+(cash_valueArray[2] as NSString).floatValue)*100)")
        
        let seventh = Int(roundf((second-(cash_first_valueArray[2] as NSString).floatValue)*12))
        let eighth = Int(roundf(second-(cash_first_valueArray[2] as NSString).floatValue))
        
        let ninth = (cash_first_valueArray[1] as NSString).floatValue>0 ? 1/fifth : 0.0
        let tenth = Int(roundf(((cash_first_valueArray[9] as NSString).floatValue+(cash_first_valueArray[2] as NSString).floatValue*12)/(cash_first_valueArray[3] as NSString).floatValue*100))
        
        let eleventh = roundFloatValue(value: "\(first/((cash_first_valueArray[2] as NSString).floatValue*12))")
        let twelfth = Int(roundf((Float(third)+((cash_first_valueArray[9] as NSString).floatValue/12))/(cash_valueArray[8] as NSString).floatValue*100))
        let thirteenth = Int(roundf(forth/(cash_valueArray[8] as NSString).floatValue*100))
        
        cash_summary_valueArray = [
            "\(Int(first))","\(Int(second))","\(Int(third))","\(Int(forth))","\(fifth)", sixth,"\(seventh)","\(eighth)","\(ninth)","\(tenth)", eleventh,"\(twelfth)","\(thirteenth)"
        ]
    }
    public func cash_projection_getValue(intialValue: String) -> [String] {
        if intialValue == "Intial Value" {
            let salePrice = "\(Int(roundf((cash_valueArray[3] as NSString).floatValue)))"
            let sellingCosts = Int(roundf((salePrice as NSString).floatValue*0.07))
            let profitFromSale = (salePrice as NSString).integerValue - Int(roundf((cash_valueArray[1] as NSString).floatValue)) - Int(roundf((cash_valueArray[2] as NSString).floatValue)) - sellingCosts
            let resultArray = [
                intialValue,"\(salePrice)", "\(sellingCosts)", "0", "\(profitFromSale)", "\(profitFromSale)"
            ]
            return resultArray
        } else {
            let salePrice = round(fv(rate: 0.03, nper: (intialValue as NSString).doubleValue, pmt : 0.0, pv : (cash_valueArray[3] as NSString).doubleValue))
            let sellingCosts = Int(roundf(Float(salePrice)*0.07))
            let netCashFlow = Int(roundf((cash_summary_valueArray[3] as NSString).floatValue))*((intialValue as NSString).integerValue*12-6)
            let profitFromSale = Int(salePrice) - (cash_valueArray[1] as NSString).integerValue - (cash_valueArray[2] as NSString).integerValue - Int(sellingCosts)
            let totalProfit = netCashFlow+profitFromSale
            let resultArray = [
                intialValue,"\(Int(salePrice))","\(sellingCosts)","\(netCashFlow)","\(profitFromSale)","\(totalProfit)"
            ]
            return resultArray
        }
    }
    
    let loan_input_titleArray = [
        "Loan amount",
        "Anual interest rate",
        "Loan period in years",
        "Start date of loan",
        "Optional extra payment"
    ]
    var loan_valueArray = [
        "120000","4","30","01/01/2015","326"
    ]
    func loan_getValueArray() {
        cash_first_GetValueArray()
        cash_summary_GetValueArray()
        let first = cash_first_valueArray[0]
        let second = cash_valueArray[5]
        let third = cash_valueArray[6]
        let forth = loan_valueArray[3]
        let fifth = cash_summary_valueArray[3]
        loan_valueArray = [
            first, second, third, forth, fifth
        ]
    }
    let loan_first_titleArray = [
        "Scheduled monthly payment", "Scheduled number of payments", "Actual number of payments", "Total of early payments", "Total interest"
    ]
    var valuesOfArrays = [[String]()]
    func loan_first_sumOfInterest() -> String {
        loan_table_first_getValue()
        valuesOfArrays = [
            loan_table_fristValue
        ]
        var sum : Float = 0.0
        for index in 2...178 {
            valuesOfArrays.append(loan_table_getValueArray(array:valuesOfArrays[index - 2]))
            sum = sum + (valuesOfArrays[index - 2][7] as NSString).floatValue
        }
        return roundFloatValue(value: "\(sum)")
    }
    var loan_first_value = [String]()
    func loan_first_getValueArray() {
        let first = roundFloatValue(value: "\(pmt(rate: (loan_valueArray[1] as NSString).doubleValue/100/12, nper: (loan_valueArray[2] as NSString).doubleValue*12, pv: (loan_valueArray[0] as NSString).doubleValue))")
        let second = (loan_valueArray[2] as NSString).integerValue*12
        let third = second
        let forth = roundFloatValue(value: "\((loan_valueArray[4] as NSString).floatValue*177)")
        let fifth = loan_first_sumOfInterest()
        loan_first_value = [
            first, "\(second)", "\(third)", roundFloatValue(value: "\(forth)"), roundFloatValue(value: "\(fifth)")
        ]
    }
    
    var loan_table_fristValue = [String]()
    func loan_table_first_getValue() {
        
        let second = loan_valueArray[3]
        let third = roundFloatValue(value: "\((loan_valueArray[0] as NSString).floatValue)")
        let forth = roundFloatValue(value: "\(pmt(rate: (loan_valueArray[1] as NSString).doubleValue/100/12, nper: (loan_valueArray[2] as NSString).doubleValue*12, pv: (loan_valueArray[0] as NSString).doubleValue))")
        let fifth = roundFloatValue(value: "\((loan_valueArray[4] as NSString).floatValue)")
        let sixth = roundFloatValue(value: "\((forth as NSString).floatValue + (fifth as NSString).floatValue)")
        let eighth = roundFloatValue(value: "\((third as NSString).floatValue*((loan_valueArray[1] as NSString).floatValue/12)/100)")
        let seventh = roundFloatValue(value: "\((sixth as NSString).floatValue - (eighth as NSString).floatValue)")
        let ninth = roundFloatValue(value: "\((third as NSString).floatValue - (seventh as NSString).floatValue)")
        loan_table_fristValue = [
            "1", second, third, forth, fifth, sixth,seventh ,eighth,ninth
        ]
    }
    
    func loan_table_getValueArray(array:[String]) -> [String]{
        let num = (array[0] as NSString).intValue + 1
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let toDate = dateFormatter.date(from: array[1])
        let dateforCal = Calendar.current
        var dateIncreased = dateforCal.date(bySetting: .month, value: 1, of: toDate!)
        dateIncreased = dateforCal.date(byAdding: .month, value: 1, to: toDate!)
        let dateforPay = dateFormatter.string(from: dateIncreased!)
        
        let beg_bal = array[8]
        let sch_pay = array[3]
        let ext_pay = array[4]
        let tot_pay = array[5]
        let interest = roundFloatValue(value: "\((beg_bal as NSString).floatValue*((loan_valueArray[1] as NSString).floatValue/100/12))")
        let princ = roundFloatValue(value: "\((tot_pay as NSString).floatValue - (interest as NSString).floatValue)")
        let end_bal = roundFloatValue(value: "\((beg_bal as NSString).floatValue - (princ as NSString).floatValue)")
        
        let resultArray = [
            "\(num)",dateforPay,beg_bal,sch_pay,ext_pay,tot_pay,princ,interest,end_bal
        ]
        return resultArray
    }
    
    func roundFloatValue(value: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumIntegerDigits = 1
        let valueFloat = "\(String(describing: numberFormatter.string(from: NSNumber(value: (value as NSString).floatValue))!))"
        return valueFloat
    }
    
    func fv(rate : Double, nper : Double, pmt : Double, pv : Double) ->Double {
        return pv*pow((1 + rate), nper)
    }
    
    func pmt(rate : Double, nper : Double, pv : Double, fv : Double = 0, type : Double = 0) -> Double {
        return ((pv * pvif(rate: rate, nper: nper) + fv) / ((1.0 + rate * type) * fvifa(rate: rate, nper: nper)))
    }
    
    func pow1pm1(x : Double, y : Double) -> Double {
        return (x <= -1) ? pow((1 + x), y) - 1 : exp(y * log(1.0 + x)) - 1
    }
    
    func pow1p(x : Double, y : Double) -> Double {
        return (abs(x) > 0.5) ? pow((1 + x), y) : exp(y * log(1.0 + x))
    }
    
    func pvif(rate : Double, nper : Double) -> Double {
        return pow1p(x: rate, y: nper)
    }
    
    func fvifa(rate : Double, nper : Double) -> Double {
        return (rate == 0) ? nper : pow1pm1(x: rate, y: nper) / rate
    }
    let cash_definition_titleArray = [
        "Capitalization Rate", "Cash Flow(Annual)", "Debt Service", "Effective Gross Income", "Gross Income", "Net Operating Income", "Operating Expenses", "Vacancy Rate", "Return On Investment", "Gross Rent Multiplier", "Breakeven Point(%)", "Debt Coverage Ratio"
    ]
    
    //MARK: Rehab step
    
    var isShown = false
    
    var fieldIndex : Int = 0
    
    var fieldTitle : String?
    var valueTitle : String?
    var unit : String?
    var costRepair : String?
    var costReplace : String?
    var labor : String?
    var totalPerField : String?
    var selectionMode : Int = 0
    
    var rehabValueDic = [ String : AnyObject ]()
    
    var rehab_exteriorDic = [ String : AnyObject ]()
    var rehab_interiorDic = [ String : AnyObject ]()
    var rehab_plumbingDic = [ String : AnyObject ]()
    var rehab_electricalDic = [ String : AnyObject ]()
    var rehab_hvacDic = [ String : AnyObject ]()
    var rehab_generalDic = [String : AnyObject]()
    
    func initRehabData() {
        rehab_exteriorDic["valueTitle"] = rehab_exterior_titleArray as AnyObject
        rehab_exteriorDic["unit"] = rehab_exterior_unit_titleArray as AnyObject
        rehab_exteriorDic["costRepair"] = rehab_exterior_costRepairArray as AnyObject
        rehab_exteriorDic["costReplace"] = rehab_exterior_costReplaceArray as AnyObject
        rehab_exteriorDic["labor"] = rehab_exterior_labor_multivaluArray as AnyObject
        rehab_exteriorDic["quentityValue"] = rehab_exterior_quentity_valueArray as AnyObject
        rehab_exteriorDic["totalValue"] = rehab_exterior_total_valueArray as AnyObject
        rehab_exteriorDic["laborValue"] = rehab_exterior_labor_valueArray as AnyObject
        rehab_exteriorDic["materialValue"] = rehab_exterior_material_valueArray as AnyObject
        rehab_exteriorDic["fieldTotal"] = "---" as AnyObject
        rehab_exteriorDic["loaborTotal"] = "---" as AnyObject
        rehab_exteriorDic["materialTotal"] = "---" as AnyObject
        rehab_exteriorDic["selectionMode"] = rehab_exterior_selectionMode_valueArray as AnyObject
        rehabValueDic["Exterior"] = rehab_exteriorDic as AnyObject
        
        rehab_interiorDic["valueTitle"] = rehab_interior_titleArray as AnyObject
        rehab_interiorDic["unit"] = rehab_interior_unit_titleArray as AnyObject
        rehab_interiorDic["costRepair"] = rehab_interior_costRepairArray as AnyObject
        rehab_interiorDic["costReplace"] = rehab_interior_costReplaceArray as AnyObject
        rehab_interiorDic["labor"] = rehab_interior_labor_multivaluArray as AnyObject
        rehab_interiorDic["quentityValue"] = rehab_interior_quentity_valueArray as AnyObject
        rehab_interiorDic["totalValue"] = rehab_interior_total_valueArray as AnyObject
        rehab_interiorDic["laborValue"] = rehab_interior_labor_valueArray as AnyObject
        rehab_interiorDic["materialValue"] = rehab_interior_material_valueArray as AnyObject
        rehab_interiorDic["fieldTotal"] = "---" as AnyObject
        rehab_interiorDic["loaborTotal"] = "---" as AnyObject
        rehab_interiorDic["materialTotal"] = "---" as AnyObject
        rehab_interiorDic["selectionMode"] = rehab_interior_selectionMode_valueArray as AnyObject
        rehabValueDic["Interior"] = rehab_interiorDic as AnyObject
        
        rehab_plumbingDic["valueTitle"] = rehab_plumbing_titleArray as AnyObject
        rehab_plumbingDic["unit"] = rehab_plumbing_unit_titleArray as AnyObject
        rehab_plumbingDic["costRepair"] = rehab_plumbing_costRepairArray as AnyObject
        rehab_plumbingDic["costReplace"] = rehab_plumbing_costReplaceArray as AnyObject
        rehab_plumbingDic["labor"] = rehab_plumbing_labor_multivaluArray as AnyObject
        rehab_plumbingDic["quentityValue"] = rehab_plumbing_quentity_valueArray as AnyObject
        rehab_plumbingDic["totalValue"] = rehab_plumbing_total_valueArray as AnyObject
        rehab_plumbingDic["laborValue"] = rehab_plumbing_labor_valueArray as AnyObject
        rehab_plumbingDic["materialValue"] = rehab_plumbing_material_valueArray as AnyObject
        rehab_plumbingDic["fieldTotal"] = "---" as AnyObject
        rehab_plumbingDic["loaborTotal"] = "---" as AnyObject
        rehab_plumbingDic["materialTotal"] = "---" as AnyObject
        rehab_plumbingDic["selectionMode"] = rehab_plumbing_selectionMode_valueArray as AnyObject
        rehabValueDic["Plumbing"] = rehab_plumbingDic as AnyObject
        
        rehab_electricalDic["valueTitle"] = rehab_electrical_titleArray as AnyObject
        rehab_electricalDic["unit"] = rehab_electrical_unit_titleArray as AnyObject
        rehab_electricalDic["costRepair"] = rehab_electrical_costRepairArray as AnyObject
        rehab_electricalDic["costReplace"] = rehab_electrical_costReplaceArray as AnyObject
        rehab_electricalDic["labor"] = rehab_electrical_labor_multivaluArray as AnyObject
        rehab_electricalDic["quentityValue"] = rehab_electrical_quentity_valueArray as AnyObject
        rehab_electricalDic["totalValue"] = rehab_electrical_total_valueArray as AnyObject
        rehab_electricalDic["laborValue"] = rehab_electrical_labor_valueArray as AnyObject
        rehab_electricalDic["materialValue"] = rehab_electrical_material_valueArray as AnyObject
        rehab_electricalDic["selectionMode"] = rehab_electrical_selectionMode_valueArray as AnyObject
        rehab_electricalDic["fieldTotal"] = "---" as AnyObject
        rehab_electricalDic["loaborTotal"] = "---" as AnyObject
        rehab_electricalDic["materialTotal"] = "---" as AnyObject
        rehabValueDic["Electrical"] = rehab_electricalDic as AnyObject
        
        rehab_hvacDic["valueTitle"] = rehab_hvac_titleArray as AnyObject
        rehab_hvacDic["unit"] = rehab_hvac_unit_titleArray as AnyObject
        rehab_hvacDic["costRepair"] = rehab_hvac_costRepairArray as AnyObject
        rehab_hvacDic["costReplace"] = rehab_hvac_costReplaceArray as AnyObject
        rehab_hvacDic["labor"] = rehab_hvac_labor_multivaluArray as AnyObject
        rehab_hvacDic["quentityValue"] = rehab_hvac_quentity_valueArray as AnyObject
        rehab_hvacDic["totalValue"] = rehab_hvac_total_valueArray as AnyObject
        rehab_hvacDic["laborValue"] = rehab_hvac_labor_valueArray as AnyObject
        rehab_hvacDic["materialValue"] = rehab_hvac_material_valueArray as AnyObject
        rehab_hvacDic["fieldTotal"] = "---" as AnyObject
        rehab_hvacDic["loaborTotal"] = "---" as AnyObject
        rehab_hvacDic["materialTotal"] = "---" as AnyObject
        rehab_hvacDic["selectionMode"] = rehab_hvac_selectionMode_valueArray as AnyObject
        rehabValueDic["HVAC"] = rehab_hvacDic as AnyObject
        
        rehab_generalDic["valueTitle"] = rehab_general_titleArray as AnyObject
        rehab_generalDic["unit"] = rehab_general_unit_titleArray as AnyObject
        rehab_generalDic["costRepair"] = rehab_general_costRepairArray as AnyObject
        rehab_generalDic["costReplace"] = rehab_general_costReplaceArray as AnyObject
        rehab_generalDic["quentityValue"] = rehab_general_quentity_valueArray as AnyObject
        rehab_generalDic["totalValue"] = rehab_general_total_valueArray as AnyObject
        rehab_generalDic["laborValue"] = rehab_general_labor_valueArray as AnyObject
        rehab_generalDic["materialValue"] = rehab_general_material_valueArray as AnyObject
        rehab_generalDic["fieldTotal"] = "---" as AnyObject
        rehab_generalDic["loaborTotal"] = "---" as AnyObject
        rehab_generalDic["materialTotal"] = "---" as AnyObject
        rehab_generalDic["selectionMode"] = rehab_general_selectionMode_valueArray as AnyObject
        rehabValueDic["General In/Exterior"] = rehab_generalDic as AnyObject
        
    }
    
    let rehab_exterior_quentity_valueArray = Array(repeating: "", count: 19)
    let rehab_exterior_total_valueArray = Array(repeating: "---", count: 19)
    let rehab_exterior_labor_valueArray = Array(repeating: "---", count: 19)
    let rehab_exterior_material_valueArray = Array(repeating: "---", count: 19)
    let rehab_exterior_selectionMode_valueArray = Array(repeating: 0, count: 19)
    
    let rehab_exterior_titleArray = [
        "Roof","Siding","Brick Tuckpointing","Gutters","Soffit","Fascia","Driveway (Concrete)","Driveway (Asphalt)","Concrete Walkways","Garage (2 Car)","Garage (1 Car)","Garage Door Opener","Garage Door (1 Car)","Garage Door (2 Car)","Windows","Basic Landscape & Cleanup","Landscaping (All New)","Powerwashing","Other"
    ]
    let rehab_exterior_unit_titleArray = [
        "Square (100 sqft)","Square (100 sqft)","Whole House vs. Spot","Linear ft","Linear ft","Linear ft","Sqft", "Sqft","Sqft","Each","Each","Each","Each","Each","Each","Each","Each","Each","Each"
    ]
    let rehab_exterior_costRepairArray = [
        "50","50","1,000","1","1","1","2","1","2","4000","3000","75","150","200","75","400","750","200","100"
    ]
    let rehab_exterior_costReplaceArray = [
        "230","230","4000","4","4","4","6.5","3.5","6.5","13000","9000","350","600","750","275","800","2500","500","100"
    ]
    let rehab_exterior_labor_multivaluArray = [
        "0.36","0.36","0.5","0.75","0.75","0.75","0.5","0.5","0.5","0.5","0.5","0.5","0.5","0.5","0.3","0.65","0.65","1","0.5"
    ]
    
    let rehab_interior_quentity_valueArray = Array(repeating: "", count: 26)
    let rehab_interior_total_valueArray = Array(repeating: "---", count: 26)
    let rehab_interior_labor_valueArray = Array(repeating: "---", count: 26)
    let rehab_interior_material_valueArray = Array(repeating: "---", count: 26)
    let rehab_interior_selectionMode_valueArray = Array(repeating: 0, count: 26)
    
    let rehab_interior_titleArray = [
        "Demo & Cleanout","Dumpster (30 cubic yd)","Mold Or Water Damage","Foundation Repair","Drywall","Painting","Kitchen Backsplash (Tile)","Bathroom Wall (Tile)","Flooring (Vinyl)","Flooring (Tile)","Flooring (Carpet)","Flooring (Wood - New)","Flooring (Wood - Refinish)","Millwork","Interior Doors","Exterior Doors","Door Hardware","Kitchen Cabinets (Flip)","Kitchen Cabinets (Rental)","Kitchen Countertops, Laminate","Kitchen Countertops, Granite","Kitchen Appliances","Laundry Appliances","Tub Glazing/Spraying","Vanities & Tops (30' - 48')","Other"

    ]
    let rehab_interior_unit_titleArray = [
        "Each","Each","Each","Each Crack","Sheet","Sqft","Sqft","Sqft","Sqft","Sqft","Sq yd (9 Sqft)","Sqft","Sqft","Linear ft","Each","Each","Each","Set","Set","Linear ft","Sqft","Set","Set","Each","Each","Each",
    ]
    let rehab_interior_costRepairArray = [
        "0.25","360","500","275","16","0.75","6","4","1.5","4","4","2","0.50","0.75","50","75","5","575","415","5","7","650","250","150","200","100"
    ]
    let rehab_interior_costReplaceArray = [
        "0.5","540","2000","400","24","1.5","16","6","2.8","6","12","6","1.3","1.5","125","225","25","2850","2100","25","35","2000","900","250","350","100"
    ]
    let rehab_interior_labor_multivaluArray = [
        "1","0","0.25","0.6","0.6","0.7","0.3","0.3","0.35","0.3","0.35","0.2","0.8","0.6","0.4","0.25","0.5","0.15","0.2","0.6","0.3","0.1","0.1","0.8","0.5","0.5"
    ]
    
    let rehab_plumbing_quentity_valueArray = Array(repeating: "", count: 8)
    let rehab_plumbing_total_valueArray = Array(repeating: "---", count: 8)
    let rehab_plumbing_labor_valueArray = Array(repeating: "---", count: 8)
    let rehab_plumbing_material_valueArray = Array(repeating: "---", count: 8)
    let rehab_plumbing_selectionMode_valueArray = Array(repeating: 0, count: 8)
    
    let rehab_plumbing_titleArray = [
        "Rough Plumbing","Trim Plumbing","Hot Water Heater","Ejector Pump (Sewage Water)","Sump Pump (Fresh Water)","Sink Disposal","Drain Rodding","Other"
    ]
    let rehab_plumbing_unit_titleArray = [
        "Each","Each","Each","Each","Each","Each","Each","Each"
    ]
    let rehab_plumbing_costRepairArray = [
        "1450","400","175","200","150","75","250","100",
    ]
    let rehab_plumbing_costReplaceArray = [
        "3250","1750","750","400","375","175","600","100"
    ]
    let rehab_plumbing_labor_multivaluArray = [
        "0.85","0.7","0.3","0.25","0.25","0.45","1","0.5"
    ]
    
    let rehab_electrical_quentity_valueArray = Array(repeating: "", count: 8)
    let rehab_electrical_total_valueArray = Array(repeating: "---", count: 8)
    let rehab_electrical_labor_valueArray = Array(repeating: "---", count: 8)
    let rehab_electrical_material_valueArray = Array(repeating: "---", count: 8)
    let rehab_electrical_selectionMode_valueArray = Array(repeating: 0, count: 8)
    
    let rehab_electrical_titleArray = [
        "Rough Electrical","Trim Electrical","Interior Service Panel","Exterior Service Panel","Devices (Switches/Outlets)","Other"

    ]
    let rehab_electrical_unit_titleArray = [
        "Each","Each","Each","Each","Each","Each"
    ]
    let rehab_electrical_costRepairArray = [
        "1200","900","300","200","5","100"
    ]
    let rehab_electrical_costReplaceArray = [
        "3000","1500","600","500","10","100"
    ]
    let rehab_electrical_labor_multivaluArray = [
        "0.8","0.65","0.5","0.5","0.8","0.5"
    ]
    
    let rehab_hvac_quentity_valueArray = Array(repeating: "", count: 8)
    let rehab_hvac_total_valueArray = Array(repeating: "---", count: 8)
    let rehab_hvac_labor_valueArray = Array(repeating: "---", count: 8)
    let rehab_hvac_material_valueArray = Array(repeating: "---", count: 8)
    let rehab_hvac_selectionMode_valueArray = Array(repeating: 0, count: 8)
    
    let rehab_hvac_titleArray = [
        "Furnace (Heater)","A/C Package","A/C Condenser","Humidifier (On Furnace)","Boiler System (Hot Water)","Ductwork (Whole house)","Supply/Return Vents","Other"
    ]
    let rehab_hvac_unit_titleArray = [
        "Each","Each","Each","Each","Each","Each","Each","Each"
    ]
    let rehab_hvac_costRepairArray = [
        "400","550","300","80","600","400","5","100"
    ]
    let rehab_hvac_costReplaceArray = [
        "1200","1750","1100","240","2200","1500","12","100"

    ]
    let rehab_hvac_labor_multivaluArray = [
        "0.25","0.25","0.25","0.35","0.25","0.7","0.1","0.5"
    ]
    
    let rehab_general_quentity_valueArray = Array(repeating: "", count: 2)
    let rehab_general_total_valueArray = Array(repeating: "---", count: 2)
    let rehab_general_labor_valueArray = Array(repeating: "---", count: 2)
    let rehab_general_material_valueArray = Array(repeating: "---", count: 2)
    let rehab_general_selectionMode_valueArray = Array(repeating: 0, count: 2)
    
    let rehab_general_titleArray = [
        "Labor and Material","Other"
    ]
    let rehab_general_unit_titleArray = [
        "Work Day","Each"
    ]
    let rehab_general_costRepairArray = [
        "300","100"
    ]
    let rehab_general_costReplaceArray = [
        "300","200"
    ]
    
     // MARK: Calculation Functions
    
    func initRehabDetailCellWithData(calModeSubIndex : Int) {
        
        fieldTitle = getFieldTitle(index: fieldIndex)
        var fieldDic = rehabValueDic[fieldTitle!] as! [String : AnyObject]
        
        let valueTitleArray = fieldDic["valueTitle"] as! [String]
        valueTitle = valueTitleArray[calModeSubIndex]
        
        let unitArray = fieldDic["unit"] as! [String]
        unit = unitArray[calModeSubIndex]
        
        let costRepairArray = fieldDic["costRepair"] as! [String]
        costRepair = costRepairArray[calModeSubIndex]
        
        let costReplaceArray = fieldDic["costReplace"] as! [String]
        costReplace = costReplaceArray[calModeSubIndex]
        
        totalPerField = fieldDic["fieldTotal"] as? String
        
        let selectionModeArray = fieldDic["selectionMode"] as! [Int]
        selectionMode = selectionModeArray[calModeSubIndex]
    }
    
    func getFieldTitle(index: Int) -> String {
        switch index {
        case 0:
            return "Exterior"
            
        case 1:
            return "Interior"
            
        case 2:
            return "Plumbing"
            
        case 3:
            return "Electrical"
            
        case 4:
            return "HVAC"
            
        case 5:
            return "General In/Exterior"
            
        default:
            return "Error"
        }
    }
    
    func getShowValuesNum() -> Int {
        
        if !isShown {
            initRehabData()
            isShown = true
        }
        fieldTitle = getFieldTitle(index: fieldIndex)
        var fieldDic = rehabValueDic[fieldTitle!] as! [String : AnyObject]
        
        let valueTitleArray = fieldDic["valueTitle"] as! [String]
        let fieldValuesNum = valueTitleArray.count
        
        return fieldValuesNum
    }
    
    func calculation(index : Int, quentity : String, selectionModeNum : Int) -> (String, String, String) {
        
        // get values
        
        fieldTitle = getFieldTitle(index: fieldIndex)
        var fieldDic = rehabValueDic[fieldTitle!] as! [String : AnyObject]
        
        let costReplaceArray = fieldDic["costReplace"] as! [String]
        costReplace = costReplaceArray[index]
        
        let costRepairArray = fieldDic["costRepair"] as! [String]
        costRepair = costRepairArray[index]
        
        if fieldIndex != 5 {
            let laborArray = fieldDic["labor"] as! [String]
            labor = laborArray[index]
        }
        
        // calculation
        
        var totalValueDouble : Double = 0.0
        var laborValueDouble : Double = 0.0
        var materialValueDouble : Double = 0.0
        
        if selectionModeNum == 0 {
            totalValueDouble = Double(round(100 * (quentity as NSString).doubleValue * (costReplace! as NSString).doubleValue) / 100)
        } else {
            totalValueDouble = Double(round(100 * (quentity as NSString).doubleValue * (costRepair! as NSString).doubleValue) / 100)
        }
        
        if fieldIndex != 5 {
            laborValueDouble = Double(round(100 * (totalValueDouble*(labor! as NSString).doubleValue)) / 100)
            materialValueDouble = Double(round(100 * (totalValueDouble-laborValueDouble)) / 100)
        } else {
            laborValueDouble = Double(round(100 * (totalValueDouble * 2 / 3)) / 100)
            materialValueDouble = Double(round(100 * (laborValueDouble / 3)) / 100)
        }
        
        var totalValueString = "\(totalValueDouble)"
        var laborValueString = "\(laborValueDouble)"
        var materialValueString = "\(materialValueDouble)"
        
        if quentity == "" {
            totalValueString = "---"
            laborValueString = "---"
            materialValueString = "---"
        }
        
        // save data
        
        var quentityArray = fieldDic["quentityValue"] as! [String]
        quentityArray[index] = quentity
        fieldDic["quentityValue"] = quentityArray as AnyObject
        
        var totalValueArray = fieldDic["totalValue"] as! [String]
        totalValueArray[index] = "\(totalValueString)"
        fieldDic["totalValue"] = totalValueArray as AnyObject
        
        var laborValueArray = fieldDic["laborValue"] as! [String]
        laborValueArray[index] = "\(laborValueString)"
        fieldDic["laborValue"] = laborValueArray as AnyObject
        
        var materialValueArray = fieldDic["materialValue"] as! [String]
        materialValueArray[index] = "\(materialValueString)"
        fieldDic["materialValue"] = materialValueArray as AnyObject
        
        var selectionModeValueArray = fieldDic["selectionMode"] as! [Int]
        selectionModeValueArray[index] = selectionModeNum
        fieldDic["selectionMode"] = selectionModeValueArray as AnyObject
        
        rehabValueDic[fieldTitle!] = fieldDic as AnyObject
        
        let sum = getSumFieldTotal()
        totalPerField = sum
        fieldDic["fieldTotal"] = sum as AnyObject
        
        rehabValueDic[fieldTitle!] = fieldDic as AnyObject
        
        return (totalValueString, laborValueString, materialValueString)
    }
    
    func getSumFieldTotal() -> String {
        
        fieldTitle = getFieldTitle(index: fieldIndex)
        var fieldDic = rehabValueDic[fieldTitle!] as! [String : AnyObject]
        
        let array = fieldDic["totalValue"] as! [String]
        var sum : Double = 0.0
        
        for item in array {
            if item != "---" {
                sum += (item as NSString).doubleValue
            }
        }
        if sum == 0 {
            return "---"
        }
        return "\(sum)"
    }
    
    func getBestEstimate() -> (String, String, String, String, String, String, String, String, String) {
        var estLabSum : Double = 0.0
        var estMatSum : Double = 0.0
        var estTotSum : Double = 0.0
        var i = 0
        while i < 6 {
            
            let fieldTitleStr = getFieldTitle(index: i)
            var fieldDic = rehabValueDic[fieldTitleStr] as! [String : AnyObject]
            
            let laborArray = fieldDic["laborValue"] as! [String]
            var laborSum : Double = 0.0
            
            for item in laborArray {
                if item != "---" {
                    laborSum += (item as NSString).doubleValue
                }
            }
            
            let materialArray = fieldDic["materialValue"] as! [String]
            var materialSum : Double = 0.0
            
            for item in materialArray {
                if item != "---" {
                    materialSum += (item as NSString).doubleValue
                }
            }
            
            let totalValue = fieldDic["fieldTotal"] as! String
            estTotSum += (totalValue as NSString).doubleValue
            
            fieldDic["laborTotal"] = "\(estLabSum)" as AnyObject
            fieldDic["materialTotal"] = "\(estMatSum)" as AnyObject
            rehabValueDic[fieldTitleStr] = fieldDic as AnyObject
            
            estLabSum += laborSum
            estMatSum += materialSum
            i += 1
        }
        
        var lowTotSum = "\(Double(round(100 * (estTotSum * 0.85)) / 100))"
        var lowLabSum = "\(Double(round(100 * (estLabSum * 0.85)) / 100))"
        var lowMatSum = "\(Double(round(100 * (estMatSum * 0.85)) / 100))"
        
        var highTotSum = "\(Double(round(100 * (estTotSum * 1.15)) / 100))"
        var highLabSum = "\(Double(round(100 * (estLabSum * 1.15)) / 100))"
        var highMatSum = "\(Double(round(100 * (estMatSum * 1.15)) / 100))"
        
        var estTotSumStr = "\(estTotSum)"
        var estLabSumStr = "\(estLabSum)"
        var estMatSumStr = "\(estMatSum)"
        
        if estTotSum == 0 {
            lowTotSum = "---"
            highTotSum = "---"
            lowLabSum = "---"
            highLabSum = "---"
            lowMatSum = "---"
            highMatSum = "---"
            estTotSumStr = "---"
            estLabSumStr = "---"
            estMatSumStr = "---"
        }
        
        return (estTotSumStr, estLabSumStr, estMatSumStr, lowTotSum, lowLabSum, lowMatSum, highTotSum, highLabSum, highMatSum)
        
    }
    
    func getValues(index : Int) -> (String, String, String, String) {
        fieldTitle = getFieldTitle(index: fieldIndex)
        var fieldDic = rehabValueDic[fieldTitle!] as! [String : AnyObject]
        
        var quentityArray = fieldDic["quentityValue"] as! [String]
        let quentity = quentityArray[index]
        
        var totalValueArray = fieldDic["totalValue"] as! [String]
        let totalValueDouble = totalValueArray[index]
        
        var laborValueArray = fieldDic["laborValue"] as! [String]
        let laborValueDouble = laborValueArray[index]
        
        var materialValueArray = fieldDic["materialValue"] as! [String]
        let materialValueDouble = materialValueArray[index]

        return (quentity, totalValueDouble, laborValueDouble, materialValueDouble)
    }
    
}
