import winim/lean

proc addTwoNumbers(x,y: int): int
  {.noinline,exportc:"addTwoNumbers".} =
  x + y

proc main() =
  echo addTwoNumbers(1,0)

  var hlib = LoadLibrary("./dll/math.dll")
  if hlib == 0:
    echo "LoadLibrary_Error"
  
  echo addTwoNumbers(1,1)

  if FreeLibrary(hlib) == 0:
    echo "FreeLibrary_Error"

  echo addTwoNumbers(1,2)

main()