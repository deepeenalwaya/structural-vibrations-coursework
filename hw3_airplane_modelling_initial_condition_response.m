
% masses %

m1 = 250 ; % left wing
m2 = 1000 ; % fuselage
m3 = 250 ; % right wing
m4 = 75 ; % landing gear

% stiffnesses %

k1 = 600E3 ; % left wing stiffness
k2 = 600E3 ; % right wing stiffness
k3 = 150E3 ;% fuselage-landing gear stifness
k4 = 350E3 ;% tires stiffness

% modal damping factors %

g_1 = 0.05 ;% mode 1
g_2 = 0.05 ;% mode 2
g_3 = 0.05 ;% mode 3
g_4 = 0.05 ;% mode 4

syms t ; % time 
syms z1(t) z2(t) z3(t) z4(t) ; % physical coordinates
syms y1(t) y2(t) y3(t) y4(t) ; % modal coordinates
z = [ z1 ; z2 ; z3 ; z4 ] ; % physical displacement vector
y = [ y1 ; y2 ; y3 ; y4 ] ; % modal displacement vector

% initial displacements in physical coordinates %

z1_0 = 0 ;
z2_0 = 0 ;
z3_0 = 0 ;
z4_0 = 0 ;

% initial velocities in physical coordinates %

v_z1_0 = -0.5 ;
v_z2_0 = -0.5 ;
v_z3_0 = -0.5 ;
v_z4_0 = -0.5 ;

z_0 = [ z1_0 ; z2_0 ; z3_0 ; z4_0 ] ; % initial physical displacement vector
v_0 = [v_z1_0 ; v_z2_0 ; v_z3_0 ; v_z4_0 ] ; % initial physical velocity vector


m = [ m1 0 0 0 ; 0 m2 0 0 ; 0 0 m3 0 ; 0 0 0 m4 ] ; % mass matrix of model
k = [ k1 -k1 0 0 ; -k1 k1+k2+k3 -k2 -k3 ; 0 -k2 k2 0 ; 0 -k3 0 k3+k4 ] ; %stiffness matrix

[evectors evalues] = eig(k,m) ; % eigenvectors and eigenvalues of the system
natcircfreq = sqrt(diag(evalues)) ; % natural circular frequencies
natcyclfreq = natcircfreq/(2*pi) ; % natural cyclic frequencies

% initial conditions in modal coordinates %

p = evectors  % weighted modal matrix
y_0 = inv(p)*z_0 ; % initial modal displacement vector
v_0 = inv(p)*v_0 ; % initial modal velocity vector

% response in modal coordinates %

y = inv(p)*z ;
pretty(y);


y_1 = 2.363 * exp(-0.415*t) * sin(8.296*t) ;
y_2 = 0 ;
y_3 = -0.009 * exp(-3.009*t) * sin(60.069*t) ;
y_4 = -0.036 * exp(-4.101*t) * sin(81.935*t) ;

y_net = [ y_1 ; y_2 ; y_3 ; y_4 ] ;
pretty(y_net);

x_net = p*y_net;
pretty(x_net);

x1 = x_net(1);
x2 = x_net(2);
x3 = x_net(3);
x4 = x_net(4);



