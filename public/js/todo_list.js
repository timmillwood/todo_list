$(document).ready(function() {
  $(".done").click(function(e) {
    var item_id = $(this).parents('li').attr('id');
    $.ajax({
      type: "POST",
      url: "/done",
      data: { id: item_id },
      complete: function(data) {
        if($("#" + item_id + " a.done").text() == 'Done') {
          $("#" + item_id + " a.done").text('Not done')
          $("#" + item_id + " .item").wrapInner("<del>");
        }
        else {
          $("#" + item_id + " a.done").text('Done')
          $("#" + item_id + " .item").text($("#" + item_id + " .item del").text());
        }
      }
    });
    e.preventDefault();
  });
});