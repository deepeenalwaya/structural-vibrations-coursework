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

m = [ m1 0 0 0 ; 0 m2 0 0 ; 0 0 m3 0 ; 0 0 0 m4 ] ; % mass matrix of model
k = [ k1 -k1 0 0 ; -k1 k1+k2+k3 -k2 -k3 ; 0 -k2 k2 0 ; 0 -k3 0 k3+k4 ] ; %stiffness matrix

[evectors evalues] = eig(k,m) ; % eigenvectors and eigenvalues of the system
natcircfreq = sqrt(diag(evalues)) ; % natural circular frequencies
natcyclfreq = natcircfreq/(2*pi) ; % natural cyclic frequencies

p = evectors ; % weighted modal matrix

y_1 = 2.363 * exp(-0.415*t) * sin(8.296*t) ;
y_2 = 0 ;
y_3 = -0.009 * exp(-3.009*t) * sin(60.069*t) ;
y_4 = -52500*sin((349*t)/50)*((1125899906842624*exp(-(4618345716376363*t)/1125899906842624)*(92251383432622768*cos((5765711464538923*t)/70368744177664) + 4618345716376363*sin((5765711464538923*t)/70368744177664)))/8531646862388758419292310857089593 - 103865824012893161538190135263232/8531646862388758419292310857089593)

y_net = [ y_1 ; y_2 ; y_3 ; y_4 ] ;
pretty(y_net);

x_net = p*y_net;
pretty(x_net);

x1 = x_net(1)
x2 = x_net(2)
x3 = x_net(3)
x4 = x_net(4)

