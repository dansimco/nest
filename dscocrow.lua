--- dsco crow ---

txi_1 = 0
txi_2 = 0
txi_3 = 0
txi_4 = 0

function t(state)

end

function v2n(v)
	-- return a note number based on volt
end

function er(k,n,s)
	-- k > Fill
	-- n > Length
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

function init ()
	input[1].mode('change',1.0,0.1,'rising')
	input[1].change = t

	-- Input read metro
	metro[1].event = function(c) 
		ii.ansible.trigger(1,1)
		ii.txi.get( 'param', 1)
		ii.txi.get("in", 1)
	end
	metro[1].time  = 1.0
	metro[1]:start()


	ii.txi.event = function (e, data, id)
		print("return")
		if e == 'param' then
			print(e, id)
		end
	end


end






