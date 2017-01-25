$(document).on 'turbolinks:load', ->
  console.log '(document).turbolinks:load'
  jQuery ($) ->
    $bodyEl = $('body')
    $sidedrawerEl = $('#sidedrawer')

    showSidedrawer = ->
      # show overlay
      options = onclose: ->
        $sidedrawerEl.removeClass('active').appendTo document.body
        return
      $overlayEl = $(mui.overlay('on', options))
      # show element
      $sidedrawerEl.appendTo $overlayEl
      setTimeout (->
        $sidedrawerEl.addClass 'active'
        return
      ), 20
      return

    hideSidedrawer = ->
      $bodyEl.toggleClass 'hide-sidedrawer'
      return

    $('.js-show-sidedrawer').on 'click', showSidedrawer
    $('.js-hide-sidedrawer').on 'click', hideSidedrawer
    return
  $titleEls = $('strong', $sidedrawerEl)
  $titleEls.next().hide()
  $titleEls.on 'click', ->
    $(this).next().slideToggle 200
    return
  return