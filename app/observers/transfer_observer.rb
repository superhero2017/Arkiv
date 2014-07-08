class TransferObserver < AuditObserver
  observe :deposit, :withdraw

  def after_update(record)
    if record.aasm_state_changed?
      TransferAuditLog.audit!(record, current_user)
    end
  end

end
