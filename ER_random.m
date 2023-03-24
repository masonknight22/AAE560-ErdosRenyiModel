function ER_random(n,p)

% %%%%%%%%%%%% ER_random(dim,p) %%%%%%%%%%%%%%%
% %%    Creates symmetric random networks    %%
% %%      using the Erdos-Raniy model        %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Input parameters
%  n: size of the network (number of nodes)
%  p: probability that a pair of nodes (i,j)
%     has a link connecting them. Range [0,1]
%
%  Output
%  Figure 1: graph of the network
%  Figure 2: histogram of degree distribution
%  Figure 3: histogram of cumulative degree
%            distribution (nodes with
%            degree <= k)
%


A = zeros(n); % Initialize adjacency matrix
for i = 1:n
    for j = i+1:n % Symmetric network: use only upper triangular
        if p > rand(1,1) % Generates random number in uniform range (0,1).
            % If p is higher than the random number (event which will happen with
            % probability p), add undirected link between i and j
            A(i,j) = 1; 
            A(j,i) = 1;
        end
    end
end
G = graph(A);
plot(G)  % Build and plot the undirected graph with adjacency matrix A

D = degree(G); % Calculate the discrete degree distribution of the graph

figure(2)
histogram(D) % Plot the histogram of the degree distribution

figure(3)
histogram(D, 'normalization', 'cdf') % Plot the histogram of the cumulative
                                     % degree distribution

