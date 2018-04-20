syms n x L
Yn=sin((n*pi*x)/L);
b_integrand=Yn^2;
b=int(b_integrand,x,0,L);
pretty(b)

syms P w_star t 
% f=P*sin(w_star*t);
% Qn_integrand=f*Yn;
% Qn=int(Qn_integrand,x,0,L);
% pretty(Qn)

Qn=P*sin(n*pi/2)*sin(w_star*t) ;

syms tau wn rho A 
term1=subs(Qn,t,tau);
term2=sin(wn*(t-tau));
qn_integrand=term1*term2;
qn=int(qn_integrand,tau,0,t)*(2/(rho*A*L*wn));
pretty(qn)
% 
% qn code version 1 
% 
% syms tau wn
% term1=sin(w_star*tau);
% term2=sin(wn*(t-tau));
% qn_integrand=term1*term2;
% qn=int(qn_integrand,tau,0,t);
% pretty(qn)

% qn code version 2
% syms tau wn
% term1=sin(w_star*tau)*sin(wn*t)*cos(wn*tau);
% term2=sin(w_star*tau)*cos(wn*t)*sin(wn*tau);
% qn_integrand=term1-term2;
% qn=int(qn_integrand,tau,0,t);
% pretty(qn)
