$(document).on 'turbolinks:load', ->
(($) ->

  $.tablesort = ($table, settings) ->
    self = this
    @$table = $table
    @$thead = @$table.find('thead')
    @settings = $.extend({}, $.tablesort.defaults, settings)
    @$sortCells = if @$thead.length > 0 then @$thead.find('th:not(.no-sort)') else @$table.find('th:not(.no-sort)')
    @$sortCells.on 'click.tablesort', ->
      self.sort $(this)
      return
    @index = null
    @$th = null
    @direction = null
    return

  $.tablesort.prototype =
    sort: (th, direction) ->
      start = new Date
      self = this
      table = @$table
      rowsContainer = if table.find('tbody').length > 0 then table.find('tbody') else table
      rows = rowsContainer.find('tr').has('td, th')
      cells = rows.find(':nth-child(' + th.index() + 1 + ')').filter('td, th')
      sortBy = th.data().sortBy
      sortedMap = []
      unsortedValues = cells.map((idx, cell) ->
        if sortBy
          return if typeof sortBy == 'function' then sortBy($(th), $(cell), self) else sortBy
        if $(this).data().sortValue != null then $(this).data().sortValue else $(this).text()
      )
      if unsortedValues.length == 0
        return
      #click on a different column
      if @index != th.index()
        @direction = 'asc'
        @index = th.index()
      else if direction != 'asc' and direction != 'desc'
        @direction = if @direction == 'asc' then 'desc' else 'asc'
      else
        @direction = direction
      direction = if @direction == 'asc' then 1 else -1
      self.$table.trigger 'tablesort:start', [ self ]
      self.log 'Sorting by ' + @index + ' ' + @direction
      # Try to force a browser redraw
      self.$table.css 'display'
      # Run sorting asynchronously on a timeout to force browser redraw after
      # `tablesort:start` callback. Also avoids locking up the browser too much.
      setTimeout (->
        self.$sortCells.removeClass self.settings.asc + ' ' + self.settings.desc
        i = 0
        length = unsortedValues.length
        while i < length
          sortedMap.push
            index: i
            cell: cells[i]
            row: rows[i]
            value: unsortedValues[i]
          i++
        sortedMap.sort (a, b) ->
          self.settings.compare(a.value, b.value) * direction
        $.each sortedMap, (i, entry) ->
          rowsContainer.append entry.row
          return
        th.addClass self.settings[self.direction]
        self.log 'Sort finished in ' + (new Date).getTime() - start.getTime() + 'ms'
        self.$table.trigger 'tablesort:complete', [ self ]
        #Try to force a browser redraw
        self.$table.css 'display'
        return
      ), if unsortedValues.length > 2000 then 200 else 10
      return
    log: (msg) ->
      if ($.tablesort.DEBUG or @settings.debug) and console and console.log
        console.log '[tablesort] ' + msg
      return
    destroy: ->
      @$sortCells.off 'click.tablesort'
      @$table.data 'tablesort', null
      null
  $.tablesort.DEBUG = false
  $.tablesort.defaults =
    debug: $.tablesort.DEBUG
    asc: 'sorted ascending'
    desc: 'sorted descending'
    compare: (a, b) ->
      if a > b
        1
      else if a < b
        -1
      else
        0

  $.fn.tablesort = (settings) ->
    table = undefined
    sortable = undefined
    previous = undefined
    @each ->
      table = $(this)
      previous = table.data('tablesort')
      if previous
        previous.destroy()
      table.data 'tablesort', new ($.tablesort)(table, settings)
      return

  return
) window.Zepto or window.jQuery
