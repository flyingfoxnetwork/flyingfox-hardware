/*
    Flying Fox Proto Case
    
    Based on https://www.instructables.com/id/Creating-a-custom-sized-box-for-3D-printing-with-O/
*/

$fn=20;


// UTIL
function inchtomm(x) = x*25.4; 

// Case Spec
case_height = 40;
case_standoff = 20;

//ARDUINO MKR NB 1500
controller_pcb_width  = 25;
controller_pcb_length = 67.63;
controller_pcb_holedia = 2.25;

//MH-Z16 Intelligent Infrared Gas Module https://github.com/Arduinolibrary/DFRobot_Gravity_UART_Infrared_CO2_Sensor/raw/master/MH-Z16%20CO2%20Datasheet.pdf

// Box calc
length = 180;
width  = controller_pcb_width + 50 + case_standoff*2;
height = case_height;
cornerRadius = 10;

part_sel=false;

//if (part_sel)
union()
{
    /* Mounts */
    translate([-30,0,0])
        arduino_mkr_nb_mount(15);
    translate([0,,0])
        qwiic_gps_mount(5);
    translate([20,0,0])
        battery_module_lipo();

    /* Box Bottom */
    translate([10, 10, 0]){
        difference() {
                roundedBox(length, width, height, cornerRadius); 
                translate([1,1,1.001]) {
                    roundedBox(length-2, width-2, height-1, cornerRadius); 
                }
                translate([width/2-cornerRadius,length/2-cornerRadius+20,0])

                translate([0,0,20])rotate([90,0,0])cylinder(r=6.5/2, h=1000, center=true);
        }
    }
}

/* Box Top */
//if (!part_sel)
translate([width*2, 10, 0]){
    mirror([1,0,0]) {
        difference()
        {
            union(){
                roundedBox(length, width, 1, cornerRadius);
                difference() {
                    translate([1,1,0]) {
                        roundedBox(length-2,width-2,4,cornerRadius);
                    }
                    translate([2,2,0.001]) {
                        roundedBox(length-4,width-4,4,cornerRadius);
                    }
                }
            }

            /* SMA Holes */
            translate([width/2-cornerRadius,length/2-cornerRadius+20,0])
                cylinder(r=6.5/2, h=100, center=true);
            translate([width/2-cornerRadius,length/2-cornerRadius-20,0])
                cylinder(r=6.5/2, h=100, center=true);
            
            /* CO2 Sensor Hole */
            translate([width/2-cornerRadius,length/2-cornerRadius+50,0])
                cube([17.5,17.5,4], center=true);
            translate([width/2-cornerRadius,length/2-cornerRadius-50,0])
                cube([17.5,17.5,4], center=true);
        }
    }
}

module roundedBox(length, width, height, radius)
{
    dRadius = 2*radius;

    //base rounded shape
    minkowski() {
        cube(size=[width-dRadius,length-dRadius, height]);
        cylinder(r=radius, h=0.01);
    }
}

/* Components */
module battery_module_aa()
{
    battery_w=40.8;
    battery_l=74.5;
    battery_h=17.7;
    %translate([width/2,length/2,battery_h/2+1])
      cube([battery_w, battery_l, battery_h], center=true);
}

module battery_module_lipo()
{
    battery_w=55;
    battery_l=165;
    battery_h=2;
    %translate([width/2,length/2,battery_h/2+1])
      cube([battery_w, battery_l, battery_h], center=true);
}

module arduino_mkr_nb_mount(offset_height)
{
    pcb_width   = 25;
    pcb_length  = 67.63;
    pcb_holedia = 2.25;
    pcb_holedia_base = 3;
    pcb_hole_spacing_y_a = 2.25;
    pcb_hole_spacing_y_b = 8.35;
    pcb_hole_spacing_x   = 2.25;
    
    module mount(x, y)
    {
        translate([x,y,1])
        union()
        {
            cylinder(r1=pcb_holedia_base/2+1, r2=pcb_holedia_base/2, h=2);
            cylinder(r=pcb_holedia_base/2, h=offset_height);
            difference()
            {
                union()
                {
                    translate([0,0,offset_height])
                        cylinder(r1=(pcb_holedia/2)*1,r2=(pcb_holedia/2)*0.8, h=4);
                    translate([0,0,offset_height+3])
                        minkowski() {
                            cylinder(r=(pcb_holedia/2)*0.7, h=0.1);
                            sphere(r=0.2);
                        }
                }
                cube([0.5,pcb_holedia*2,offset_height*2+10], center=true);
            }
        }
    }
    
    %translate([width/2,length/2,offset_height+1])
        cube([pcb_width,pcb_length, 1], center=true);
    
    mount(width/2-pcb_width/2+pcb_hole_spacing_x, length/2-pcb_length/2+pcb_hole_spacing_y_a);
    mount(width/2+pcb_width/2-pcb_hole_spacing_x, length/2-pcb_length/2+pcb_hole_spacing_y_a);
    mount(width/2-pcb_width/2+pcb_hole_spacing_x, length/2+pcb_length/2-pcb_hole_spacing_y_b);
    mount(width/2+pcb_width/2-pcb_hole_spacing_x, length/2+pcb_length/2-pcb_hole_spacing_y_b);
    
}

module qwiic_gps_mount(offset_height)
{
    pcb_width   = 25.4;
    pcb_length  = 30.48;
    pcb_holedia = 2.25;
    pcb_holedia_base = 3;
    pcb_hole_spacing_y = 2.25;
    pcb_hole_spacing_x   = 2.25;
    
    module mount(x, y)
    {
        translate([x,y,1])
        union()
        {
            cylinder(r1=pcb_holedia_base/2+1, r2=pcb_holedia_base/2, h=2);
            cylinder(r=pcb_holedia_base/2, h=offset_height);
            difference()
            {
                union()
                {
                    translate([0,0,offset_height])
                        cylinder(r1=(pcb_holedia/2)*1,r2=(pcb_holedia/2)*0.8, h=4);
                    translate([0,0,offset_height+3])
                        minkowski() {
                            cylinder(r=(pcb_holedia/2)*0.7, h=0.1);
                            sphere(r=0.2);
                        }
                }
                cube([0.5,pcb_holedia*2,offset_height*2+10], center=true);
            }
        }
    }
    
    %translate([width/2,length/2,offset_height+1])
        cube([pcb_width,pcb_length, 1], center=true);
    
    mount(width/2-pcb_width/2+pcb_hole_spacing_x, length/2+20.32/2);
    mount(width/2-pcb_width/2+pcb_hole_spacing_x, length/2-20.32/2);
    
}