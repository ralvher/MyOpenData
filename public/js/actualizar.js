(function() {
  setInterval(
    function(){
      $.get('/actualizar');
    },
  1000);
})();