/*This is just a very basic model that generates the brick reservoir based on the size of the digester*/

/*Digester Size
1. Make an estimate
2. Readjust with proper parameters based on brick sizes
*/

//Make a function here that makes proper adjustment of dimensions
dl=215;//length
dw=107.5;//width
dh=31.5;


/*Brick Parameters*/
h=10.5;//height
w=10.5;//width
l=21.5;//length

//lg =dl/l;
z_end=dw/l;
y_end=dh/h;// heightness



//brick line




// Create wall with proper positioning of bricks
module l_wall(inv,dist,lg){
    module l_line(dist,lg){
    for (i=[0:lg-1])
      if(i*dist<=dl){
        if(i%2==0){
            translate([0,i*(dist),0])
                cube(size=[w,l,h], center=false);
        }
        else{
            translate([0,i*(dist),0])
            color("red")
            cube(size=[w,l,h], center=false);
        
        }
    }
    else{
        }

}
    if (inv==true)
    for (z=[0:y_end]){
            if(z%2==0){
                translate([0,l/2,z*h])
                l_line(dist,lg);
                }
            else{
                translate([0,0,z*h])
                l_line(dist,lg);
                }
            }    
    else
    for (z=[0:y_end]){
            if(z%2!=0){
                translate([0,l/2,z*h])
                l_line(dist,lg);
                }
            else{
                translate([0,0,z*h])
                l_line(dist,lg);
                } 
        
    }

}


translate([0,0,0])l_wall(false,l,dl/l);
translate([dw,0,0])l_wall(true,l,dl/l);
translate([0,dl+w,0])rotate([0,0,-90])l_wall(false,l,dw/l);
translate([0,w,0])rotate([0,0,-90])l_wall(true,l,dw/l);

/*
translate([-dw/2,-dl/2,0])l_wall(false,l,dl/l);
translate([dw/2,-dl/2,0])l_wall(true,l,dl/l);
translate([dw/2,-dl/2,0])rotate([0,0,90])l_wall(false,l,dw/l);
translate([dw/2,dl/2,0])rotate([0,0,90])l_wall(false,l,dw/l);

*/