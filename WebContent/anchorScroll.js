$(document).ready(function(){
    $(document).ready(function(){
        $('a[href^="#"]').on('click',function (e) {
            e.preventDefault();

            var target = this.hash;
            var $target = $(target);

            $('html, body').animate({'scrollTop': $target.offset().top-60}, 900);
        });
    });
});

