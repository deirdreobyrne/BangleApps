(() => {

  var timeout_id = undefined;

  function btOn() {
    try { NRF.wake(); } catch (e) { }
    Bluetooth.setConsole(1);
    timeout_id = setTimeout( function() {
      timeout_id = undefined;
      btOff();
    }, 60000);
  }
  
  function btOff() {
    try { NRF.sleep(); } catch (e) { }
    timeout_id = setTimeout( function() {
      timeout_id = undefined;
      btOn();
    }, 6 * 3600000 - 60000);
  }
    
  function draw() {
  }
  
  btOn();
  
  WIDGETS["widbttoggler"] = {
    area: "tr",
    width: 0,
    draw: draw
  };

})()
