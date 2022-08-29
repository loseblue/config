function time_translator(input, seg)
   if (input == "rq") then
      local cand = Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d_"), "")
      cand.quality = 1
      yield(cand)
   end
   if (input == "sj") then
      local cand = Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " ")
      cand.quality = 1
      yield(cand)
   end
end
