syms n x L A MOI P w wn t tau E rho alpha 

% NATURAL FREQUENCIES AND EIGENFUNCTIONS

wn = ((n*pi)^2)*sqrt((E*MOI)/(rho*A*L^4));
pretty(wn)

Yn = sin((n*pi*x)/L);
pretty(Yn)

% CALCULATING b

int_a = Yn^2;
inta = int(int_a,x,0,L);
pretty(inta)

% DEFINING b

b=L/2;

% DEFINING Qn CALCULATED ON PAPER

Qn = P*sin(w*t)*sin((n*pi)/2);
pretty(Qn)

% CALCULATING qn

Qn_1 = subs(Qn,t,tau);
term2 = sin(wn*(t-tau));
int2 = Qn_1*term2;
qn=int(int2,tau,0,t)/(rho*A*b*wn);
pretty(qn)

% AMPLITUDE INFINITE SERIES CALCULATION

sum=0;

for x=1:2:inf
    y = ((sin((x*pi)/2))^2)/((x^4)-4);
    sum = sum+y;
end

sum




