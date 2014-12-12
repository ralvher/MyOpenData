(function() {
  setInterval(
    function(){
      $.get('/actualizar');
    },
  300000);
})();