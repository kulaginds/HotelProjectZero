(function(w, $) {
  var count = $("#breadcrumb .crumbs li").length;
  $("#breadcrumb .crumbs li a").each(function(index, item, arr) {
    $(item).css("z-index", count - index);
  });
})(window, jQuery);