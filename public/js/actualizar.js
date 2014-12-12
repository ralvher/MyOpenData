(function() {
  setInterval(
    function(){
      $.get('/actualizar');
    },
  10000);
})();