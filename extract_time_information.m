% ####################################################################### %
% ####################################################################### %
%     Extracting Time Information of packet arrival from CSI Data         %
%     Author: Tahmid Z. Chowdhury                                         %
%     The University of British Columbia, Canada
%     Copyright: Using Wi-Fi Channel State Information (CSI) for Human
%                Activity Recognition & Fall Detection
% ####################################################################### %
% ####################################################################### %

function [time_stamp] = extract_time_information(packet)
 % where packet is your CSI file
 csi_trace=read_bf_file(packet);   
 
 for a=1:j          %where j is the total number packets in the CSI file structure
     % extract the low 32 bits of the NIC's 1 MHz clock
     % The code doesn't account for wrapping about every 4300 seconds, or 72 minutes. 
     time(a)=csi_trace{a,1}.timestamp_low; 
 end

 time_diff=(diff(time))*10^-6; %--convert difference b/w time_stamps to seconds
 actualtime=[0,time_diff];     %--row vector consisting of timestamp differences in seconds
 sum(time_diff,2);
 time_stamp=cumsum(actualtime);
end


% ####################################################################### %
% ####################################################################### %
% NOTE: If you use this code, please consider citing:
% @phdthesis{Chowdhury_2018, series={Electronic Theses and Dissertations (ETDs) 2008+}, 
% title={Using Wi-Fi channel state information (CSI) for human activity recognition and fall detection}, 
% url={https://open.library.ubc.ca/collections/ubctheses/24/items/1.0365967}, DOI={http://dx.doi.org/10.14288/1.0365967}, 
% school={University of British Columbia}, author={Chowdhury, Tahmid Z.}, year={2018}, 
% collection={Electronic Theses and Dissertations (ETDs) 2008+}}
% ####################################################################### %
% ####################################################################### %
