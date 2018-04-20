m1 = 250 % left wing
m2 = 1000 % fuselage
m3 = 250 % right wing
m4 = 75 % landing gear
k1 = 600E3 % left wing stiffness
k2 = 600E3 % right wing stiffness
k3 = 150E3 % fuselage-landing gear stifness
k4 = 350E3 % tires stiffness
m = [ m1 0 0 0 ; 0 m2 0 0 ; 0 0 m3 0 ; 0 0 0 m4 ] % mass matrix of model
k = [ k1 -k1 0 0 ; -k1 k1+k2+k3 -k2 -k3 ; 0 -k2 k2 0 ; 0 -k3 0 k3+k4 ] %stiffness matrix
[evectors evalues] = eig(k,m) %eigenvectors and eigenvalues of the system
natcircfreq = sqrt(diag(evalues))
natcyclfreq = natcircfreq/(2*pi)

