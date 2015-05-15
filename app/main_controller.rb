class MainController < UIViewController
  extend IB

  outlet :ipTextField, UITextField

  def viewDidLoad
    @ipTextField.text = DataStore.valueForKey(:mqip)
  end

  def save
    @ipTextField.resignFirstResponder
  end

  def ipDidChange(sender)
    sender.text == "" ? ip = "255.255.255.255" : ip = sender.text
    DataStore.storeValue(ip, forKey: :mqip)
  end


  #### text field delegate methods ####
  def textFieldShouldReturn(textField)
    textField.resignFirstResponder
  end

end