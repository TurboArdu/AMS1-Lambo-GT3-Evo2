//////////////////////////////////////////////////////////////////////////
//
// Conventions:
//
// +x = left
// +y = up
// +z = rear
// 
// +pitch = nose up
// +yaw = nose right
// +roll = right
//
// [BODY]  - a rigid mass with mass and inertial properties
// [JOINT] - a ball joint constraining an offset of one body to an
//           offset of another body (eliminates 3 DOF)
// [HINGE] - a constraint restricting the relative rotations of two
//           bodies to be around a single axis (eliminates 2 DOF).
// [BAR]   - a constraint holding an offset of one body from an offset of
//           another body at a fixed distance (eliminates 1 DOF).
// [JOINT&HINGE] - both the joint and hinge constraints, forming the
//           conventional definition of a hinge (eliminates 5 DOF).
//
//////////////////////////////////////////////////////////////////////////


// Body including all rigidly attached parts (wings, barge boards, etc.)
[BODY]
name=body mass=(0.0) inertia=(0.0,0.0,0.0)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)

// Front spindles
[BODY]
name=fl_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(0.831,0.0,-1.324) ori=(0.0,0.0,0.0)

[BODY]
name=fr_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(-0.831,0.0,-1.324) ori=(0.0,0.0,0.0)

// Front wheels
[BODY]
name=fl_wheel mass=(20.0) inertia=(1.292,0.724,0.724)
pos=(0.8525,0.0,-1.324) ori=(0.0,0.0,0.0)

[BODY]
name=fr_wheel mass=(20.0) inertia=(1.292,0.724,0.724)
pos=(-0.8525,0.0,-1.324) ori=(0.0,0.0,0.0)

// Rear spindles
[BODY]
name=rl_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(0.809,0.000,1.324) ori=(0.0,0.0,0.0)

[BODY]
name=rr_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(-0.809,0.000,1.324) ori=(0.0,0.0,0.0)

// Rear wheels (includes half of rear-axle)
[BODY]
name=rl_wheel mass=(25.0) inertia=(1.446,0.875,0.875)
pos=(0.835,0.000,1.324) ori=(0.0,0.0,0.0)

[BODY]
name=rr_wheel mass=(25.0) inertia=(1.446,0.875,0.875)
pos=(-0.835,0.000,1.324) ori=(0.0,0.0,0.0)





[BODY]
name=fuel_tank mass=(0) inertia=(0, 0, 0)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)


[BODY]
name=driver_head mass=(7.0) inertia=(0.035,0.035,0.035)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)

//////////////////////////////////////////////////////////////////////////
//
// Constraints
//
//////////////////////////////////////////////////////////////////////////

// Front wheel and spindle connections
[JOINT&HINGE]
posbody=fl_wheel negbody=fl_spindle pos=fl_wheel axis=(-1.000, 0.000, 0.000)

[JOINT&HINGE]
posbody=fr_wheel negbody=fr_spindle pos=fr_wheel axis=(1.000, 0.000, 0.000)





// Front left suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm
name=fl_fore_upper posbody=body negbody=fl_spindle pos=(0.4757,0.0741,-1.4102) neg=(0.6997,0.0583,-1.2825)

[BAR] // rearward upper arm
posbody=body negbody=fl_spindle pos=(0.4721,0.0544,-1.1841) neg=(0.6997,0.0583,-1.2825)

[BAR] // forward lower arm
posbody=body negbody=fl_spindle pos=(0.3541,-0.1648,-1.5652) neg=(0.7536,-0.1545,-1.3212)

[BAR] // rearward lower arm
name=fl_fore_lower posbody=body negbody=fl_spindle pos=(0.3296,-0.1388,-1.2370) neg=(0.7536,-0.1545,-1.3212)

[BAR] // steering arm (must be named for identification)
name=fl_steering posbody=body negbody=fl_spindle pos=(0.3972,-0.0572,-1.4440) neg=(0.7455,-0.0553,-1.4360)



// Front right suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm (used in steering lock calculation)
name=fr_fore_upper posbody=body negbody=fr_spindle pos=(-0.4757,0.0741,-1.4102) neg=(-0.6997,0.0583,-1.2825)

[BAR] // rearward upper arm
posbody=body negbody=fr_spindle pos=(-0.4721,0.0544,-1.1841) neg=(-0.6997,0.0583,-1.2825)

[BAR] // forward lower arm
name=fr_fore_lower posbody=body negbody=fr_spindle pos=(-0.3541,-0.1648,-1.5652) neg=(-0.7536,-0.1545,-1.3212)

[BAR] // rearward lower arm
posbody=body negbody=fr_spindle pos=(-0.3296,-0.1388,-1.2370) neg=(-0.7536,-0.1545,-1.3212)

[BAR] // steering arm (must be named for identification)
name=fr_steering posbody=body negbody=fr_spindle pos=(-0.3972,-0.0572,-1.4440) neg=(-0.7455,-0.0553,-1.4360)








// Rear left suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rl_spindle pos=(0.5228,0.0807,1.2010) neg=(0.7213,0.1490,1.2981)

[BAR] // rearward upper arm
posbody=body negbody=rl_spindle pos=(0.5234,0.1020,1.5654) neg=(0.7213,0.1490,1.2981)

[BAR] // forward lower arm
posbody=body negbody=rl_spindle pos=(0.4203,-0.1242,1.1170) neg=(0.7531,-0.1370,1.2416)

[BAR] // rearward lower arm
posbody=body negbody=rl_spindle pos=(0.4061,-0.1568,1.4796) neg=(0.7531,-0.1370,1.2416)

[BAR] // straight link
posbody=body negbody=rl_spindle pos=(0.4463,-0.0750,1.5020) neg=(0.7578,-0.0469,1.4570)



// Rear right suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rr_spindle pos=(-0.5228,0.0807,1.2010) neg=(-0.7213,0.1490,1.2981)

[BAR] // rearward upper arm
posbody=body negbody=rr_spindle pos=(-0.5234,0.1020,1.5654) neg=(-0.7213,0.1490,1.2981)

[BAR] // forward lower arm
posbody=body negbody=rr_spindle pos=(-0.4203,-0.1242,1.1170) neg=(-0.7531,-0.1370,1.2416)

[BAR] // rearward lower arm
posbody=body negbody=rr_spindle pos=(-0.4061,-0.1568,1.4796) neg=(-0.7531,-0.1370,1.2416)

[BAR] // straight link
posbody=body negbody=rr_spindle pos=(-0.4463,-0.0750,1.5020) neg=(-0.7578,-0.0469,1.4570)


// Rear wheel and spindle connections
[JOINT&HINGE]
posbody=rl_wheel negbody=rl_spindle pos=rl_wheel axis=(-1.000, 0.000, 0.000)

[JOINT&HINGE]
posbody=rr_wheel negbody=rr_spindle pos=rr_wheel axis=(1.000, 0.000, 0.000)