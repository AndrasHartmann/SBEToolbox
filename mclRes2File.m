function [clusters] = mclRes2file(g, nodes, filename)
%function [num_clusters] = deduce_mcl_clusters(g, nodes, filename)
%This function will interpret the MCL results and
% returns MCL clusters and writes their membership into a file
% 
% g     - Current network
%         ===============
%         The current loaded network.
%
% nodes - Cell string vector containing network node information
%         ======================================================
%         Current node information
% 
% filename
%
%
% Example : [num_clusters, guiOutput] = deduce_mcl_clusters(g, n)
%        
% See also: mcl
%
% Systems Biology and Evolution Toolbox (SBEToolbox).
% Author Andras Hartmann, based on the work of
% Kranti Konganti, James Cai.
% (C) Texas A&M University.
%
% $LastChangedDate: 2013-05-24 11:18:16 -0500 (Fri, 24 May 2013) $
% $LastChangedRevision: 561 $
% $LastChangedBy: konganti $
%

deduced_indices = full(unique(g,'rows')~=0);

num_clusters = 0;
%num_nodes = 0;

clusters = cell(1);

fid = fopen(filename,'w');
for nc = 1:size(deduced_indices, 1)
   nodeIndices = find(deduced_indices(nc, :));
   if length(nodeIndices) <= 0, continue; end
   num_clusters = num_clusters + 1;
   clusters{num_clusters} =  nodes(nodeIndices)';
   fprintf(fid, '%d\t1.0\t%s\n',num_clusters, strjoin(nodes(nodeIndices), '\t'));

   
   %for nodeIndex = 1:length(nodeIndices);
       %num_nodes = num_nodes + 1;
        %guiOutput{num_nodes} = sprintf('Node%04d\t%s\t%d',...
            %nodeIndices(nodeIndex), nodes{nodeIndices(nodeIndex)}, num_clusters);
   %end

end
fclose(fid);
