/*This is just a very basic model that generates the brick reservoir based on the size of the digester*/

/*Digester Size*/
dl=200;//length
dw=100;//width
dh=50;


/*Brick Parameters*/
h=10.5;//height
w=10.5;//width
l=21.5;//length

i_end=dl/l;
z_end=dw/l;
y_end=dh/h;



//brick line
module l_line(dist){
for (i=[0:i_end])
translate([0,i*(dist+dist*0.05),0])
 cube(size=[w,l,h], center=true);
}

module w_line(dist){
for (i=[0:z_end])
rotate(-90,30,0)
translate([0,i*(dist+dist*0.05),0])
 cube(size=[w,l,h], center=true);
}



// Create wall with proper positioning of bricks
module l_wall(){
    for (i=[0:y_end])
        if (i%2==0){
        translate([0,l/2,i*(h+(h*0.05))])
        l_line(l);
        }
    else{
        translate([0,0,i*(h+(h*0.05))])
        l_line(l);
        }
}

//w_line(l);




l_wall();
//mirror([0,1,0])l_wall();

rotate([0,0,180])
color("lime")
translate([-dw,-dl,0])
l_wall();

//translate([0,0,0])color("red")w_wall();



