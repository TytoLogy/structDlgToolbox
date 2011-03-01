function outstruct = StructDlg_buildInput(instruct, limstruct)
%------------------------------------------------------------------------
% outstruct = StructDlg_buildInput(instruct, limstruct)
%------------------------------------------------------------------------
% 
% Input Arguments:
% 	instruct		input structure
%	limstruct	limits structure with same fieldnames as 
% 					instruct and corresponding limits as [minval maxval].
% 					If no matching name for field in instruct exists, 
% 					no limits will be specified for that field in outstruct
% 					output structure
% 				
% Output Arguments:
% 	outstruct	struct containing values and limits for use with 
% 					StructDlg.m function
% 
%------------------------------------------------------------------------
% See also: StructDlg, HPSearch_settingsUpdate
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Sharad Shanbhag
%	sharad.shanbhag@einstein.yu.edu
%------------------------------------------------------------------------
% Created: 20 July, 2009 (SJS)
%
% Revisions:
%	3 Nov 2009 (SJS): - revised documentation
%------------------------------------------------------------------------

% get the values from the input structure as a cell array
vals = struct2cell(instruct);
% get the names of the fields of T as a cell array
names = fieldnames(instruct);
% # of fields in instruct
nfields = length(vals);

% similar for  limits structure
limvals = struct2cell(limstruct);
limnames = fieldnames(limstruct);
nlims = length(limvals);

% loop through the fields, and see if limit exists for that field
for n = 1:nfields
	if ~strcmp(names{n}, 'type')
		disp(names{n});
		tmp = cell(1, 3);
		tmp{1} = vals{n};
		tmp{2} = names{n};
		% if there is a field in limits that matches one of the fieldnames
		% in T (in the names{} cell), then assign the limits field to the
		% tmp cell element.  Otherwise, leave tmp{3} empty
		if isfield(limstruct, names{n})
			tmp{3} = limstruct.(names{n});
		else
			tmp{3} = [];
		end

		% assign the tmp cell to the S structure that will be passed to
		% the structdlg.m function
		outstruct.(names{n}) = tmp;
	end
end
