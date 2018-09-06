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



module frame(){
module line(){
for (i=[0:i_end])
   translate([0,i*(l+l*0.05),0])
     cube([w,l,h]);


for (z=[0:z_end])
   translate([z*(l+l*0.05),0,0])
     rotate()
     cube([l,w,h]);
}

line();
translate([dw+l,dl+l,0])
rotate([180,180,0])line();
}

for (i=[0:y_end])
  translate([0,0,i*(h+(h*0.05))])
  //translate([0,0,20*i])
    frame();


/*$fn=64;
for ( i = [0 : 5] ){
    rotate( i * 60, [1, 0, 0])
    translate([0, 10, 0])
    sphere(r = 10);
}*/


