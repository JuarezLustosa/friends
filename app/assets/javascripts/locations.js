// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function reloadLocation() {
  if ($("tr").closest(".where_iam")) {
    setInterval(loadLocations, 1000);
  };
};

function loadLocations(){
  $.ajax({
   type: "GET",
    url: "change_locations"
  });
}

reloadLocation();