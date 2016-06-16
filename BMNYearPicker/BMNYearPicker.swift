import UIKit

@objc
public protocol BMNYearPickerViewDelegate: UIPickerViewDelegate {
    
    func pickerDone(year :String)
    func pickerCancel()
}

public class BMNYearPicker: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerContainerView : UIView!
    var pickerView: UIPickerView!
    var pickerToolbar: UIToolbar!
    var dataSource : NSMutableArray!
    public var startYear : Int!
    public var endYear : Int!
    var yearArray:NSMutableArray = NSMutableArray()
    public var toolBarItems : [UIBarButtonItem]!
    
    public var delegate: BMNYearPickerViewDelegate!
//    var selectedMonth : String!
    var selectedYear : String!

    private var selectedRows: [Int]?
    var monthArray : NSArray!
    //MARK: - Life Cycle Methods
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.initFunc()
    }
    
    private func initFunc() {
        monthArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        for(var i  = startYear ; i <= endYear ; i=i+1) {
            self.yearArray.addObject("\(i)")
        }
//        self.selectedMonth = monthArray[0] as! String
        self.selectedYear = yearArray[0] as! String

        let screenSize = UIScreen.mainScreen().bounds.size
        self.view.backgroundColor = UIColor.clearColor()
        
        pickerToolbar = UIToolbar()
        pickerView = UIPickerView()
        toolBarItems = []
        
        pickerToolbar.translucent = true
        pickerView.showsSelectionIndicator = true
        pickerView.backgroundColor = UIColor.whiteColor()
        
        pickerToolbar.frame = CGRectMake(0, 0, screenSize.width, 44)
        pickerView.frame = CGRectMake(0, 44, screenSize.width, 216)
        
        pickerContainerView = UIView(frame: CGRectMake(0, screenSize.height - 260, screenSize.width, 260))
        
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        space.width = 12
        let cancelItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action:Selector("cancelPicker"))
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: Selector("endPicker"))
        toolBarItems! += [space, cancelItem, flexSpaceItem, doneButtonItem, space]
        
        pickerToolbar.setItems(toolBarItems, animated: false)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.pickerContainerView.addSubview(pickerToolbar)
        self.pickerContainerView.addSubview(pickerView)
        self.view.addSubview(self.pickerContainerView)
    }
    
    //MARK: - Custom Methods
    
    public func showPicker() {
        
    }
    
    func cancelPicker() {
//        restoreSelectedRows()
        selectedRows = nil
        self.delegate?.pickerCancel()
        hidePicker()
    }

    func endPicker() {
        selectedRows = nil
        self.delegate?.pickerDone(self.selectedYear)
        hidePicker()
    }
    
    private func hidePicker() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func getSelectedRows() -> [Int] {
        var selectedRows = [Int]()
        for i in 0..<pickerView.numberOfComponents {
            selectedRows.append(pickerView.selectedRowInComponent(i))
        }
        return selectedRows
    }
    private func getSelectedRowsValue() -> Int {
        var selectedRowsValue = Int()
        selectedRowsValue = pickerView.selectedRowInComponent(0)
        
        return selectedRowsValue
    }
    private func restoreSelectedRows() {
        for i in 0..<selectedRows!.count {
            pickerView.selectRow(selectedRows![i], inComponent: i, animated: true)
        }
    }
    
    //MARK: - UIPicker Delegate/DataSource
    
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return yearArray.count
    }
   
    public func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return yearArray[row] as? String
    }
    
    public func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.selectedYear = yearArray[row] as! String;
    }
}

