import $ from "jquery";
import popper from "popper.js";
import bootstrap from "bootstrap";
import slick from 'slick-carousel';




$( document ).ready(function() {
  $(".slider").slick({

    infinite: true,
    autoplay: true,
    autoplaySpeed: 4000,
    arrows: false,
    fade: true,
    speed: 1000,
    cssEase: 'linear',
  });
})
