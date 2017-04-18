//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

<script js>



(function($) {
    "use strict";
    // manual carousel controls
    $('.next').click(function(){ $('.carousel').carousel('next');return false; });
    $('.prev').click(function(){ $('.carousel').carousel('prev');return false; });

})(jQuery);
</script>
