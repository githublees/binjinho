$(".row a").click(function() {
  $(".video-popup").addClass("reveal"),
  $(".video-popup .video-wrapper").remove(),
  $(".video-popup").append("<div class='video-wrapper'><iframe width='560' height='315' src='https://youtube.com/embed/" + $(this).data("video") + "?rel=0&playsinline=1&autoplay=1' allow='autoplay; encrypted-media' allowfullscreen></iframe></div>")
}),
$(".video-popup-closer").click(function() {
  $(".video-popup .video-wrapper").remove(),
  $(".video-popup").removeClass("reveal")
});
