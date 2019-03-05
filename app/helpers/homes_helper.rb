module HomesHelper

	def projet_date
		Liste.create(lejour: Date.current.to_s)
	end

	def last_projet_day
		return Liste.last ? Liste.last.lejour.to_date : "2016-01-01".to_date
	end

	def date_valid?
		#((Date.current.day == last_projet_day.day) && (Date.current.month == last_projet_day.month) && (Date.current.year == last_projet_day.year )) ? true : false
		Date.current == last_projet_day ? true : false
	end

	def correction_date
		Date.current == last_projet_day.tomorrow ? true : false
	end

	def id_random(num)
		return rand(num) + 1
	end

	def hash1(num)
		i = 1
		arr = {}
		while (i <= num) do
			j = id_random(num)
			if !(arr.has_value?(j)) && j != i
				arr[i] = j
				i += 1
			end
		end
		return arr
	end

	def hash2(num)
		x = 0
		l = 1
		arr2 = hash1(num)
		arr1 = {}
		arr = {}
		while ( l <= num) do
			m = id_random(num)
			if !(arr1.has_value?(m)) && (m != l) && (m != arr2[l])
				arr1[l] = m
				arr[l] = [m, arr2[l]]
				l += 1
			end
			x += 1
			break if x == 10000
		end
		hash2(num) if arr.length < num
		return arr
	end

	
    def no_admin
      h = Student.all.order(:id)
      return (1..h.length).zip(h.to_a).to_h
    end

end
