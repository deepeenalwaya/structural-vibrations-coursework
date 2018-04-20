syms n x L
Yn = sin((n*pi*x)/L);
integrand = Yn^2;
integral=int(integrand,x,0,L);
pretty(integral)

syms P w_star t E MOI rho A

f=P*sin(w_star*t);

syms tau
Yn_bar = sqrt(2/(rho*L))*Yn;
pretty(Yn_bar)

Qn_integrand=Yn_bar*f
Qn=int(Qn_integrand,x,0,L);
pretty(Qn)
Qn_tau=subs(Qn,t,tau)

syms wn

qn_integrand = Qn_tau*sin(wn*(t-tau));
qn=int(qn_integrand,tau,0,t)/(wn*rho*A*(L/2));
pretty(qn)

qn_final = qn

% P=(0.96*E*MOI)/L^3;
% w_star=2*pi^2*sqrt((E*MOI)/(rho*A*L^4));
% wn=((n*pi)^2)*sqrt((E*MOI)/(rho*A*L^4));
% qn_1 = subs(qn_final,w_star,2*pi^2*sqrt((E*MOI)/(rho*A*L^4)));
% qn_2 = subs(qn_1,P,(0.96*E*MOI)/L^3);
% qn_3 = subs(qn_2,wn,((n*pi)^2)*sqrt((E*MOI)/(rho*A*L^4)));
% pretty(qn_3)