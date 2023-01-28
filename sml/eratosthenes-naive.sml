fun erato max =
  let
    fun listGen 1 = []
      | listGen n = n::listGen(n-1)

    fun removeMuls m [] = []
      | removeMuls m (x::xs) = if x mod m = 0 then 
          removeMuls m xs else x::(removeMuls m xs)

    fun helpy (mul, l) = mul::(removeMuls mul l)

    val start = Time.now()
    val orig = listGen max
    val res = foldl helpy orig orig
    val endTime = Time.now()
  in
    Time.toReal (Time.-(endTime, start))
  end
