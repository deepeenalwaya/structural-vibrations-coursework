m1 = 250 ; 
m2 = 1000 ;
m3 = 250 ; 
m4 = 75 ; 

k1 = 600E3 ; 
k2 = 600E3 ; 
k3 = 150E3 ;
k4 = 350E3 ;

g_1 = 0.05 ;
g_2 = 0.05 ;
g_3 = 0.05 ;
g_4 = 0.05 ;

m = [ m1 0 0 0 ; 0 m2 0 0 ; 0 0 m3 0 ; 0 0 0 m4 ] ;
k = [ k1 -k1 0 0 ; -k1 k1+k2+k3 -k2 -k3 ; 0 -k2 k2 0 ; 0 -k3 0 k3+k4 ] ; 
[evec,eval] = eig(k,m) ;

mm = evec ;

syms t

f = [ 0 ; 0 ; 0 ; 52500*sin(6.98*t) ]

f_modal = transpose(mm)*f

% modal damping ratios, natural frequencies, and modal forcing functions are known. solve uncoupled diff eqns online %



