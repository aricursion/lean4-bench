fun erato max =
  let
    val counter = ref 2
    fun listGen 1 = []
      | listGen n = listGen(n-1)@[n]

    fun removeMuls m [] = []
      | removeMuls m (x::xs) = 
        if m <> x andalso x mod m = 0 then 
          removeMuls m xs
        else 
          x::(removeMuls m xs)

    val res = ref (listGen max)

    val startTime = Time.now()

    val _ = 
      while ((!counter)*(!counter)) < max do (
        res := removeMuls (!counter) (!res);
        counter := !counter + 1
    );

    val endTime = Time.now()
  in
    Time.toReal (Time.-(endTime, startTime))
  end
