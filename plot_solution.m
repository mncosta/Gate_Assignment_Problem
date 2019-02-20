function [] = plot_solution(  x,M,N,K,start_time,int_duration,serviceTime )
%PLOT_SOLUTION Summary of this function goes here
%   Detailed explanation goes here


x = reshape(x, [N*K,M])';

clf(figure(2))
figure(2),title('Gate Assignment')

time_ticks = cell(K,1);
for k=1:K
    time_ticks{k} = datestr((start_time) + (k-1)*int_duration, 'HH:MM');
end


for j=1:N
    gate_j = x(:,(j-1)*K+1:j*K);
    gate_j_squeezed = sum(gate_j,1);
    
    if sum(gate_j_squeezed)==0
        continue
    end
    subplot(N,1,j)
    hold on
    bar(gate_j_squeezed,1,'g','EdgeColor','b','LineWidth',0.01)
    bar(abs(gate_j_squeezed-1),1,'b','EdgeColor','b','LineWidth',0.01)
    aux = gate_j_squeezed;
    for k=1:serviceTime-1
        aux = [0 aux(1:(end-1))];
        bar(aux,1,'FaceColor',[0 .5 .5],'EdgeColor',[0 .5 .5],'LineWidth',0.01)
%         bar(aux,1,'g','EdgeColor','g','LineWidth',0.01)
    end
    bar(gate_j_squeezed,1,'g','EdgeColor','r','LineWidth',0.01)
    
    
    
%     bar(gate_j_squeezed,0.5,'g','LineWidth',0.01)
    
    ylabel(['Gate ', num2str(j)])
    set(get(gca,'YLabel'),'Rotation',0,'Position',[-1,0.1,0])
    set(gca, 'XTick', [1:K])
    set(gca, 'XTickLabel', time_ticks)
    set(gca, 'YTick', [])
    set(gca, 'YTickLabel', {})
    set(gca, 'XTickLabelRotation',45)
    ylim([0,1])
    
    [idx_row,idx_col] = find(gate_j);
 
    hold on
    for i=1:size(idx_col,1)
        text(idx_col(i),0.5,num2str(idx_row(i)))
    end

    hold off
    
end





end

