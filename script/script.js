var image1 = new Image();
image1.src = "images/pic1.jpg";
var image2 = new Image();
image2.src = "images/pic2.jpg";
var image3 = new Image();
image3.src = "images/pic3.jpg";
var step = 1;
function slide(){
	document.images.slide.src=eval("image"+step+".src");
	if(step <3)
	{
		step++;
	}
	else{
		step =1;
	}
	setTimeout(slide,2500);
}
slide();
