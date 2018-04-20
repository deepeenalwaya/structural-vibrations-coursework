syms L Area E MOI P w rho t n beta A x tau wn P1
P = (0.96*E*MOI)/L^3;
pretty(P)
w = sqrt((E*MOI)/(rho*Area*L^4))*2*pi^2;
pretty(w)
force = P1*sin(w*t);
force_readable = vpa(force,4);
pretty(force_readable)

Yn = A*sin((n*pi*x)/L);
pretty(Yn)

Qn_integrand = force*Yn;
Qn = int(Qn_integrand,x,0,L);
pretty(Qn)

Qn_tau = subs(Qn,t,tau);
pretty(Qn_tau)

b_integrand = Yn^2
b = int(b_integrand,x,0,L)
pretty(b)

b_new = ((L*Area^2)/2)

qn_integrand = Qn_tau*sin(wn*t-wn*tau);
qn = int(qn_integrand,tau,0,t)/(rho*Area*b*wn)
qn_readable = vpa(qn,3)
pretty(qn_readable)

