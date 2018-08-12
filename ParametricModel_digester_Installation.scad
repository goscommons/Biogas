/*A rectangular brick pool that is normally used when bulding small farm biodigesters.*/

// Make an estimate of the size of the digester pool
el=200;//estimated length
ew=100;//estimated width
eh=50;//estimated height

//Adjust brick dimensions
l=21.5;//brick length
w=10.5;//brick width
h=10.5;//brick height

// This section normalizes the dimension between estimate and real brick dimensions
dl=round(el/l)*l;//real length
dw=round(ew/l)*l;// real width
dh=round(eh/h)*h;// real height

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

echo("you need in total: ",round(el/l*2)*round(eh/h)+ round(ew/l*2)*round(eh/h)," bricks to build this pool");