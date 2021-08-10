var cod = {};

cod.Open = function (data) {
  $(".container").fadeIn(150);
  const cops = JSON.parse(data.cops);
  $("#officers-table td").remove();
  cops.forEach((cop) => {
    $("#officers-table").append(`
    <tr>
      <td>${cop.name}</td>
      <td>${cop.citizenid}</td>
      <td>${cop.phone}</td>
      <td>${cop.grade}</td>
    </tr>
    `);
  });
};

cod.Close = function () {
  $(".container").fadeOut(150, function () {});
  $.post("https://nm-copsonduty/close");
};

$(document).ready(function () {
  window.addEventListener("message", function (event) {
    switch (event.data.action) {
      case "open":
        cod.Open(event.data);
        break;
      case "close":
        cod.Close();
        break;
    }
  });
});

$(document).ready(function(){
  $(document).bind('keydown', function(e) { 
      if (e.which == 27) {
        cod.Close();
      }
  }); 
});

$(".close").click(function (e) {
  cod.Close();
});
