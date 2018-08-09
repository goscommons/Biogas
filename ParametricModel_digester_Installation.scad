/*This is just a very basic model that generates the brick reservoir based on the size of the digester*/

/*Digester Size*/
dl=200;//length
dw=100;//width
dh=50;


/*Brick Parameters*/
h=10.5;//height
w=10.5;//width
l=21.5;//length

lg =dl/l;
z_end=dw/l;
y_end=dh/h;



//brick line
module l_line(dist,lg){
for (i=[0:lg])
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



// Create wall with proper positioning of bricks
module l_wall(inv,dist,lg){
    if (inv==true)
    for (i=[0:y_end]){
            if(i%2==0){
                translate([0,l/2,i*h])
                l_line(dist,lg);
                }
            else{
                translate([0,0,i*h])
                l_line(dist,lg);
                }
            }    
    else
    for (i=[0:y_end]){
            if(i%2!=0){
                translate([0,l/2,i*h])
                l_line(dist,lg);
                }
            else{
                translate([0,0,i*h])
                l_line(dist,lg);
                } 
        
}

}



l_wall(true,l,dl/l);
translate([dw+w,0,0])l_wall(false,l,dl/l);


translate([0,l/2,0])rotate([0,0,-90])l_wall(false,l,dw/l);
//translate([0,dl+30,0])rotate([0,0,-90])l_wall(true,l,dw/l);
translate([0,dl,0])rotate([0,0,-90])l_wall(true,l,dw/l);



