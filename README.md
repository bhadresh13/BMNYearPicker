# BMNYearPicker

Overview
BMNYear Picker is UIPickerView Control with Custom Month and Year

How to use
Just drag and drop BMNYearPicker from Demo Project to your code, Add BMNYearPickerViewDelegate to your view controller

    let picker : BMNYearPicker = BMNYearPicker()
    picker.startYear = 2000
    picker.endYear = 2016
    picker.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
    picker.delegate = self
    self.presentViewController(picker, animated: true, completion: nil)
Delegate Methods

func pickerDone(year: String) 
func pickerCancel()
Speacial Thanks
