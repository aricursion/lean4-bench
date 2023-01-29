structure STSeq: ST_SEQUENCE = MkSTSequence (structure Seq = ArraySequence)
structure Seq = ArraySequence

fun erato top =
  let
    val res = ref (STSeq.fromSeq (Seq.tabulate (fn i => true) top))
    
    fun removeMuls p l =
      let
        val counter' = ref (p*p)
      in
        while (!counter') < top do (
          l := STSeq.update (!l, (!counter', false));
          counter' := !counter' + p
        )
      end

    val counter = ref 2
    
    val startTime = Time.now()

    val _ = 
      while ((!counter)*(!counter)) < top do (
        removeMuls (!counter) res;
        counter := !counter + 1
    );

    val endTime = Time.now()
 in
    Time.toReal (Time.-(endTime, startTime))
  end
