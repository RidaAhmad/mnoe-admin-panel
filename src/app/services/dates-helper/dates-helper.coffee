@App.service 'DatesHelper', () ->
  _self = @

  # The expected date is the 2nd of the month following the invoice period
  @expectedPaymentDate = (endOfInvoiceDate) ->
    # calculate day of end of invoiced period
    endOfInvoicePeriod = moment(endOfInvoiceDate, 'YYYY-M-D')
    # calculate 2nd of the last month invoiced
    secondOftheEndOfInvoicePeriod = moment(endOfInvoicePeriod, 'YYYY-M-D').startOf('month').add(1, 'day')
    # if the 2nd of the month invoiced is > period invoiced, return second of the same month
    if endOfInvoicePeriod < secondOftheEndOfInvoicePeriod
      secondOftheEndOfInvoicePeriod
    else
      # if the 2nd of the month invoiced < of period invoiced, return second of the following month
      moment(endOfInvoicePeriod, 'YYYY-M-D').startOf('month').add(1, 'month').add(1, 'day')

  return
