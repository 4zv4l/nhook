import winim/lean
import minhook

proc NimMain() {.cdecl,importc.}

proc filter_addTwoNumbers(x,y: int): int = 400

proc DllMain(hinstDLL: HINSTANCE, fdwReason: DWORD, lpvReserved: LPVOID) : BOOL
  {.stdcall, exportc, dynlib.} =
  
  if fdwReason == DLL_PROCESS_ATTACH:
    NimMain()
    let
      baseAddr = cast[int](GetModuleHandleA("./prog/prog.exe"))
      pfn      = cast[pointer](baseAddr + 0x58e5)
    assert createHook(pfn, filter_addTwoNumbers, nil) == mhOK
    assert enableHook(pfn) == mhOK
  return true