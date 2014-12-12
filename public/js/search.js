
$('#busqueda').keyup(function() {
	b = $('#busqueda').val();
  	function(){
      $.post('/ejemplos',{busqueda:b},
        function(response){

          $('#info').append(response);
        }
      );
    }
);