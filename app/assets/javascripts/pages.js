$(document).on('turbolinks:load', function() {
  var $titleEls;
  console.log('(document).turbolinks:load');
  jQuery(function($) {
    var $bodyEl, $sidedrawerEl, hideSidedrawer, showSidedrawer;
    $bodyEl = $('body');
    $sidedrawerEl = $('#sidedrawer');
    showSidedrawer = function() {
      var $overlayEl, options;
      options = {
        onclose: function() {
          $sidedrawerEl.removeClass('active').appendTo(document.body);
        }
      };
      $overlayEl = $(mui.overlay('on', options));
      $sidedrawerEl.appendTo($overlayEl);
      setTimeout((function() {
        $sidedrawerEl.addClass('active');
      }), 20);
    };
    hideSidedrawer = function() {
      $bodyEl.toggleClass('hide-sidedrawer');
    };
    $('.js-show-sidedrawer').on('click', showSidedrawer);
    $('.js-hide-sidedrawer').on('click', hideSidedrawer);
  });
  $titleEls = $('strong', $sidedrawerEl);
  $titleEls.next().hide();
  $titleEls.on('click', function() {
    $(this).next().slideToggle(200);
  });
});

// ---
// generated by coffee-script 1.9.2