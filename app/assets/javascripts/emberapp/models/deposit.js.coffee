class Deposit extends PeatioModel.Model
  @configure 'Deposit', 'account_id', 'member_id', 'currency', 'amount', 'fee', 'fund_uid', 'fund_extra',
    'txid', 'state', 'aasm_state', 'created_at', 'updated_at', 'done_at', 'memo', 'type', 'confirmations'

  @initData: (records) ->
    PeatioModel.Ajax.disable ->
      $.each records, (idx, record) ->
        Deposit.create(record)

window.Deposit = Deposit



