//MH-Z16 Intelligent Infrared Gas Module https://github.com/Arduinolibrary/DFRobot_Gravity_UART_Infrared_CO2_Sensor/raw/master/MH-Z16%20CO2%20Datasheet.pdf

// Note: Is more like slotting to the side...
//https://www.google.com/search?q=MH-Z16&safe=off&rlz=1C5CHFA_enAU750AU750&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjUmJXZqdvjAhUZSo8KHTWYB64Q_AUIESgB#imgrc=dEoMSrVowFoMMM:

difference()
{
    union()
    {
        translate([0,0,-5/2-1])
            cube([16,16,5],center=true);
        translate([0,0,0])
            cube([20,20,2],center=true);
        translate([0,0,1])
            cylinder(r=16.8/2,97);
        translate([0,0,97])
            sphere(r=16.8/2);
    }
    
    translate([0,0,90])
    difference()
    {
        cylinder(r1=30/2,r2=30/2,2);
        cylinder(r1=15/2,r2=16.8/2,2);
    }
    translate([0,0,90-4])
    difference()
    {
        cylinder(r1=30/2,r2=30/2,2);
        cylinder(r1=15/2,r2=16.8/2,2);
    }
    translate([0,0,90+4])
    difference()
    {
        cylinder(r1=30/2,r2=30/2,2);
        cylinder(r1=15/2,r2=16.8/2,2);
    }

    
    translate([0,0,30])
    union()
    {
        rotate([0,0,0])
        union()
        {
            translate([0,15,0])
                cube([2,16,30],center=true);
            translate([0,-15,0])
                cube([2,16,30],center=true);
        }
       
        rotate([0,0,40])
        union()
        {
            translate([0,15,0])
                cube([2,16,30],center=true);
            translate([0,-15,0])
                cube([2,16,30],center=true);
        }
        
        rotate([0,0,-40])
        union()
        {
            translate([0,15,0])
                cube([2,16,30],center=true);
            translate([0,-15,0])
                cube([2,16,30],center=true);
        }
    }
    translate([0,0,70-5])
    union()
    {
        rotate([0,0,0])
        union()
        {
            translate([0,15,0])
                cube([2,16,30],center=true);
            translate([0,-15,0])
                cube([2,16,30],center=true);
        }
       
        rotate([0,0,40])
        union()
        {
            translate([0,15,0])
                cube([2,16,30],center=true);
            translate([0,-15,0])
                cube([2,16,30],center=true);
        }
        
        rotate([0,0,-40])
        union()
        {
            translate([0,15,0])
                cube([2,16,30],center=true);
            translate([0,-15,0])
                cube([2,16,30],center=true);
        }
    }
}