tRange = [0 180];                               %% Time Range
Yo = [999; 1 ;0];                               %% Initial Conditions
[tSol,YSol] = ode45(@SIRmodels, tRange, Yo);
 
S = YSol(:,1);
I = YSol(:,2);
R = YSol(:,3);


plot(tSol,S)
hold on
plot(tSol,I)
plot(tSol,R)
%  hold off
legend("Susceptible","Infected","Recovered")
xlabel("Days")
ylabel("Number of Individuals")


function dYdt = SIRmodels(t,Y)

   S = Y(1);                    %% Susceptibles
   I = Y(2);                    %% Infected
   R = Y(3);                    %% Recovered
    
    N = S+I+R;                  %% Total Population
    b = 1+0.5*sin(t);           %% Infection Rate (Beta)
    k = 0.005*t;                %% Recovery Rate (Gamma)
    
    dSdt = -b * (S/N) * I;
    dIdt = b * (S/N) * I - k * I;
    dRdt = k * I;

    dYdt = [dSdt ; dIdt; dRdt];
end