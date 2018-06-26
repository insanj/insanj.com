$(document).ready(function () {
    // $('.circlet').click(function () { //Circlet Image Function To Move It and Shrink It... no success here :(
    //    $(this).animate(({
    //        height: 100,    //Trying to figure out how to smootly animate moving the image left x amount of pixels 
    //                         //(although I could keep it 0 and make the circlet image stay centered and text shows up underneath) 
    //                        //and up x amount of pixels and change it's height from either 500x500px (defined in HTML.. but CSS wouldn't
    //                        //hurt) to around 200x200 so that user does not have to scroll to see anything.. I had this working before
    //                        // to translate the image 200px left and up 100px, but no way whatsoever that I have found or tinkered with has
    //                        // not been successful.
    //        width: 100,
    //       top: 200,
    //        left: 200
    //    }));
    //});
    $('#body').hover(function () { //when the body div is hovered it should fade from 0.0 opacity to 1.0.
        $(this).fadeTo('slow', 1.0);
    });
    $('.img1').mouseenter(function () { //First ScreenShot Function to brighten image as it the mouse enters it
        $(this).animate({opacity: 1.0}, 750);
    });
    $('.img1').mouseleave(function () { //First ScreenShot Function to Darken Image as the Mouse Leaves
        $(this).animate({opacity: 0.25}, 750);
    });
    $('.img2').mouseenter(function () { //Second ScreenShot Function to brighten image as it the mouse enters it
        $(this).animate({opacity: 1.0}, 750);
    });
    $('.img2').mouseleave(function () { //Second ScreenShot Function to Darken Image as the Mouse Leaves
        $(this).animate({opacity: 0.25}, 750);
    });
    $('.img3').mouseenter(function () { //Third ScreenShot Function to brighten image as it the mouse enters it
        $(this).animate({opacity: 1.0}, 750);
    });
    $('.img3').mouseleave(function () { //Third ScreenShot Function to Darken Image as the Mouse Leaves
        $(this).animate({opacity: 0.25}, 750);
    });
    $('.img4').mouseenter(function () { //Fourth ScreenShot Function to brighten image as it the mouse enters it
        $(this).animate({opacity: 1.0}, 750);
    });
    $('.img4').mouseleave(function () { //Fourth ScreenShot Function to Darken Image as the Mouse Leaves
        $(this).animate({opacity: 0.25}, 750);
    });
    $('#contact').hover(function () { //Change opacity of #contact div (which is really a footer) from 0.1 to 1.0 in 3/4 of a second
        $(this).animate({opacity: 1.0}, 750);
    });
    $('#contact').mouseleave(function () { //Change opacity of #contact div (which is really a footer) from 1.0 to 0.1 in 3/4 of a second
        $(this).animate({opacity: 0.1}, 750);
    });
    $('html, body').css({
        'overflow': 'hidden',
        'height': '100%'
    });
});