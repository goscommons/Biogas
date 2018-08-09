/*This is just a very basic model that generates the brick reservoir based on the size of the digester*/

// Make an estimate of the size of the digester pool
el=300;//length
ew=100;//width
eh=60;

//Adjust brick dimensions
l=21.5;//length
w=10.5;//width
h=10.5;//height

// This section normalizes the dimension between estimate and real brick dimensions
dl=round(el/l)*l;//length
dw=round(ew/l)*l;
dh=round(eh/h)*h;

// Create wall with proper positioning of bricks
module l_wall(inv,dist,lg,zlg){
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
    for (z=[0:zlg]){
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
    for (z=[0:zlg]){
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


translate([0,0,0])l_wall(false,l,dl/l,dh/h);
translate([dw,0,0])l_wall(true,l,dl/l,dh/h);
translate([0,dl+w,0])rotate([0,0,-90])l_wall(false,l,dw/l,dh/h);
translate([0,w,0])rotate([0,0,-90])l_wall(true,l,dw/l,dh/h);

/*
translate([-dw/2,-dl/2,0])l_wall(false,l,dl/l);
translate([dw/2,-dl/2,0])l_wall(true,l,dl/l);
translate([dw/2,-dl/2,0])rotate([0,0,90])l_wall(false,l,dw/l);
translate([dw/2,dl/2,0])rotate([0,0,90])l_wall(false,l,dw/l);

*/