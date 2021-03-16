--- dsco crow ---

function t()
	print("tick")
end

function v2n(v)
	-- return a note number based on volt
end

function qt(v,s,o)
	-- return quantized voltage with offset
end

function er(k,n,s)
	-- ER function adapted from  https://gist.github.com/vrld/b1e6f4cce7a8d15e00e4
	-- k > Euclidean Fill
	-- n > Euclidean Length
	-- s > current step (0-indexed)
	local r = {}
	for i = 1,n do
		r[i] = {i <= k}
	end
	local function cat(i,k)
		for _,v in ipairs(r[k]) do
			r[i][#r[i]+1] = v
		end
		r[k] = nil
	end

	while #r > k do
		for i = 1,math.min(k, #r-k) do
			cat(i, #r)
		end
	end

	while #r > 1 do
		cat(#r-1, #r)
	end

	return r[1][s+1]
end


input[1].change = function(state) t() end

