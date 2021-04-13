module ReceiptsHelper
  def receipts_choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_receipts_path
    elsif action_name == 'edit'
      receipt_path
    end
  end
end
