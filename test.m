% for k=1:2^n
%     plot([1:n*(n-1)/2],traceEmpMat(k,:)); hold on; 
% end
[m n] = size(configs);
cum_lambda = cumsum(lambda,2); 
k = find(min(sum(lambda,2)) == sum(lambda,2))
select_cum_lambda = [cum_lambda(1:k-1,:);cum_lambda(k+1:end,:)]
avg_cum_lambda = mean(cum_lambda);



figure, 
p1 = plot(cum_lambda','--'); hold on;

%leg1=legend('all possible configurations','Location','NorthEast');
p2 = plot(avg_cum_lambda,'-kd',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[1,0,1]);hold on;

p3 = plot(cum_lambda(k,:)','ko-','MarkerSize',10,'MarkerFaceColor',[0,0,1]);hold on;
leg1 = legend([p2 p3],'average trend','Fibonacci configuration');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',16);
xlim([1 13])
%ylim([-17 0]);
xlabel('m','fontsize',20); ylabel('{\bf $\sum\limits_{j=1}^{m} \lambda_{(j)} $}','fontsize',20,'interpreter','latex')
% figure, 
% for i=1:m
%     cum_lambda=0;
%     for j=1:n
%         cum_lambda = cum_lambda + lambda(i,j); 
%         plot(cum_lambda,'*-'); hold on;
%     end
% end


configs(k,:)

