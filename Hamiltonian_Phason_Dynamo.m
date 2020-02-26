%close all; 
clear all; 
clear frame; 
delete 1DHam.avi; 
figure, 
% -- START parameters
fibN =7;
Bcoeff = 0; Mcoeff=1; 
temperature = 0.6;
Nloops = 500; 
H_OUT = 0; 
% -- END parameters
% START opening video files 
v = VideoWriter('1DHam.avi');
open(v);
set(gca, 'nextplot','replacechildren', 'Visible','off');

% set figure size to [600,600] pixels
figure_position_vector = get(gcf,'Position');
figure_position_vector([3,4]) = [2000,1000];
set(gcf,'Position',figure_position_vector);
axis vis3d
% frame(1:Nloops) = struct('cdata',zeros(600, 600, 1,'uint8'),'colormap', 'gray');
%END opening video files

% -- START operations
% START creating Fibonacci lattice of LS tiles and the initial chain
Fib_Word_fibN = Fibonacci_Word_length_FibN(fibN); 
fib_lattice = Make_Fibonacci_lattice(Fib_Word_fibN);
Num_L_in_fib_lattice = length(find(fib_lattice == -1)); 
Num_S_in_fib_lattice = length(find(fib_lattice == 1));
% START initialization of chain
%initial_chain = makeInitialChainAlternate(fib_lattice,Num_L_in_fib_lattice, Num_S_in_fib_lattice); 
%initial_chain = makeInitialChainWithTwoBlocks(fib_lattice, 1);
initial_chain = makeInitialChainWithAllL(fib_lattice); 
%initial_chain = fib_lattice; 
%initial_chain = [1 -1  1 -1  -1 -1  1 -1  -1 -1  1 -1  1];
% END initialization of chain
fib_lattice = initial_chain; 
clear initial_chain; 
% END creating Fibonacci lattice of LS tiles and the initial chain

x=[1:length(fib_lattice)];
lt_bdy = 2; rt_bdy = length(fib_lattice); 


for ext_loop_index=1:Nloops
% pick a VC and find its empire
random_coordinate = randi([lt_bdy,rt_bdy],1,1);
% determine VC -- 1=LL, 2=LS, 3=SL
vc = Detect_VC(fib_lattice, random_coordinate);
% compute empire of vc located at random_coordinate
oldEmp_Vec = Enlist_empire1D_CutProj(fib_lattice, vc, random_coordinate,fibN);
coeff_B = Bcoeff*ones(1,length(fib_lattice));
coeff_M = Mcoeff*ones(1,length(fib_lattice));
if ext_loop_index==1
    [H_IN] = calculateHAM(fib_lattice, Bcoeff, Mcoeff, fibN); 
else % if ext_loop_index>1
    H_IN = H_now_OUT(ext_loop_index-1); 
end
[newfib_lattice newvc H_now_OUT(ext_loop_index) H_prop_OUT(ext_loop_index) propfib_lattice] = singleFlipMonteCarloStep1D(fib_lattice, ...
    temperature, random_coordinate, coeff_B, coeff_M, fibN, H_IN); %random_coordinate is the flip_loc
H_now_OUT(ext_loop_index)
H_prop_OUT(ext_loop_index)
propEmp_Vec = Enlist_empire1D_CutProj(propfib_lattice, newvc, random_coordinate,fibN);
defect_count(ext_loop_index) = countDefectsFibChain(fib_lattice);

newlatt2D = constructMotherLattice2Dfor1DChain(fib_lattice); 

% -- END operations

% -- START visualization
% -- visualizing Fibonacci chain, VC picked and its empire
% if length(newEmp_Vec) == 0 || length(oldEmp_Vec) == 0
%     continue; 
% end
subplot(3,2,1);
x=[1:length(fib_lattice)];
plot(x,(fib_lattice>0)-1,'m*',x,(fib_lattice<0)-1,'g*','LineWidth',2);% green is L, magenta is S
title(['\fontsize{16}Current state of chain with empires']);
hold on; 
xlim([0,length(fib_lattice)+1]);
ylim([-0.5,0.5]);
stem(x,oldEmp_Vec./3,'r','LineWidth',0.5); 
hold on; 
stem(x(random_coordinate-1:random_coordinate), ...
    oldEmp_Vec(random_coordinate-1:random_coordinate)./3,'k','LineWidth',2); 
xlabel('tile coordinates','fontsize',16);
ylabel('activated VC displaying the constituent tiles','fontsize',16)
%hold on; 
%pause;
subplot(3,2,2);
x=[1:length(propfib_lattice)];
plot(x,(propfib_lattice>0)-1,'m*',x,(propfib_lattice<0)-1,'g*','LineWidth',2);
title(['\fontsize{16}Proposed state of chain with empires']);
% green is L, magenta is S
hold on; 
xlim([0,length(fib_lattice)+1]);
ylim([-0.5,0.5]);
stem(x,propEmp_Vec./3,'r','LineWidth',0.5); 
hold on; 
stem(x(random_coordinate-1:random_coordinate), ...
    propEmp_Vec(random_coordinate-1:random_coordinate)./3,'k','LineWidth',2); 
xlabel('tile coordinates','fontsize',16);
ylabel('activated VC displaying the constituent tiles','fontsize',16)
subplot(3,2,3);
plot(defect_count, 'r-o'); 
title(['\fontsize{16}No. of defects in current state of chain']);
xlabel('iteration count','fontsize',16);
ylabel('Number of illegal configurations: \{LLL,SS\}','fontsize',16);
hold on; 
ylim([0,max(defect_count)+1]);
subplot(3,2,4);
bar(H_prop_OUT, 0.95, 'b'); hold on;
%str = '$ H_\Omega = -\underbrace{\sum_{\alpha \in V}\sum_{k,l \in X} B^\alpha_{k,l}E^\alpha_{k,l}}_\textrm{interaction free terms} ~- \underbrace{\sum_{\alpha_1,\alpha_2 \in V}\sum_{j,i\in X}M^{\alpha_1,\alpha_2}_{j,i}\langle {\bf E}^{\alpha_1}_j|{\bf E}^{\alpha_2}_i \rangle}_\textrm{interaction terms} $';
str='iteration count'
%text(0.25,2.5,str,'Interpreter','latex'); 
%legend('Location','southwest','Orientation','horizontal',{str},'Interpreter','latex'); 
xlabel(str,'fontsize',16);
bar(H_now_OUT,'c');
alpha(.2)
ylabel('total energy','fontsize',16);
%legend boxoff; 
title(['\fontsize{16}Dynamic evolution of the Hamiltonian: total energy of the chain']);
xlim([0, ext_loop_index+1]); 
ylim([min(H_now_OUT)-5,0]);
hold on;
subplot(3,2,6);
plot(newlatt2D(1,:), newlatt2D(2,:), 'b*-');
xlim([0, max(newlatt2D(1,:)) ]);
ylim([min(newlatt2D(2,:))-1, max(newlatt2D(2,:))+1 ]);
title(['\fontsize{16}Mother lattice of the current state of the chain (rotated frame)']);
xlabel('Dimension corresponding to the quasicrystal coordinates','fontsize',16);
ylabel('Dimension orthogonal to the quasicrystal coordinates','fontsize',16);
hold on; 
subplot(3,2,5);
plot(x,(fib_lattice>0)-1,'ro',... 
    'LineWidth',1,...
    'MarkerSize',20,...
    'MarkerFaceColor',[0.5,0,0]); 
hold on; 
plot(x,(fib_lattice<0)-1,'go',...
    'LineWidth',1,...
    'MarkerSize',20,...
    'MarkerFaceColor',[0,0.5,0]);
xlim([0,length(fib_lattice)+1]);
ylim([-0.5,0.5]);
title(['\fontsize{16}Phason dynamics']);
xlabel('tile coordinates','fontsize',16);
ylabel('lattice configuration: L (green), S (red)','fontsize',16);
hold on;
pause(2);
% START grabbing frame and checking frame size and write it to filename v
frame(ext_loop_index) = getframe(gcf); 
s = size(frame(ext_loop_index).cdata);
fprintf('%d %d\n', s(2), s(1))
writeVideo(v,frame(ext_loop_index).cdata);
% START grabbing frame and checking frame size and write it to filename v
% -- END visualization
fib_lattice = newfib_lattice;
if ext_loop_index ~= Nloops
    clf;
end
%clf;
%if ext_loop_index < Nloops, close all; end
end

stop=1;
close(v);
%movie(frame,1,8);
