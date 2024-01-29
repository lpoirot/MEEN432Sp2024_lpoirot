% Project 1 Demo/Scaffolding
% this code is to be used a start-off point, do not expect this code to be
% perfect already.

% Initial Conditions To Loop Through
w_0_arr = [10,0]; % Initial Angular Velocity [rad/s]
J_arr = [100,0.01]; % Rotational Inertia [kg-m^2]
b_arr = [10,0.1]; % Damping Coefficient [N-m-s/rad]
A_arr = [0,100]; % Constant Applied Torque [N-m]
dT_arr = [0.001, 0.1, 1]; % Time Step [s]

% Ask user to specify solver
solverInput = input('Specify a solver to use (Euler or Runge-Kutta): ', 's');
solverInputlower = lower(solverInput);
if strcmp(solverInputlower,'euler')
    clc;
    disp(['Thank you. Please wait 30 sec while I compute the angular velocity over time for all']);
    disp(['provided conditions using the ',solverInput,' solver.'])
    solver='ode1';
elseif strcmp(solverInputlower,'runge-kutta')
    clc;
    disp(['Thank you. Please wait 30 sec while I compute the angular velocity over time for all']);
    disp(['provided conditions using the ',solverInput,' solver.']);
    solver='ode4';
else
    clc;
    disp(['You did not enter one of the allowed inputs. Please run the script again. Exiting now.']);
    return;
end


indexmain=1;
for index1 = w_0_arr
    w_0 = index1; % Initial Angular Velocity [rad/s]
    for index2 = J_arr
        J = index2; % Rotational Inertia [kg-m^2]
        for index3 = b_arr
            b = index3; % Damping Coefficient [N-m-s/rad]
            for index4 = A_arr
                A = index4; % Constant Applied Torque [N-m]
                clc;
                disp(['Thank you. Please wait 30 sec while I compute the angular velocity over time for all']);
                disp(['provided conditions using the ',solverInput,' solver.'])
                disp('');
                fprintf('Computing Graph %d/16\r', indexmain);
                for index5 = dT_arr
                    dT = index5; % Time Step [s]
                    simout = sim("P1_demo.slx","Solver",solver);

                    W = simout.w.Data;
                    W_DOT = simout.w_dot.Data;
                    T = simout.tout;

                    subplot(4,4,indexmain);
                    plot(W,T);
                    hold on;
                    disp('.');
                    %plot(W_DOT,T);
                    %hold on;
                end
                title(['w_0=',num2str(w_0),', J=',num2str(J),', b=',num2str(b),', A=',num2str(A)]);
                legend('dT=0.001','dT=0.1','dT=1');
                xlabel('Angular Velocity [rad/s]');
                ylabel('Time [s]');
                indexmain=indexmain+1;
            end
        end
    end
end
hold off;
hFig = gcf;  % Get the current figure handle
set(hFig, 'WindowState', 'maximized');
%hold off;

%dT = [0.001, 0.1, 1]; % Time Step [s]
%solver = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler]
%simout = sim("P1_demo.slx","Solver",solver,"FixedStep",string(dT));

