local kind = get_config("kind") or "static"

-- CSerialPort c binding shared library
target("cserialport")
    set_kind(kind)
    add_defines("CSERIALPORT_BINDING_LANGUAGE=C") -- CSerialPort Binding Language
    if is_plat("windows") and kind == "shared" then
        add_files("$(projectdir)/lib/version.rc")
    end
    add_includedirs(".") -- cserialport.h
    add_files("cserialport.cpp")

-- CSerialPort c binding example
target("CSerialPortDemoC")
    set_kind("binary")
    if is_config("CSERIALPORT_ENABLE_NATIVE_SYNC", true) then
        add_files("example/main_sync_native.c")
    else
        add_files("example/main.c")
    end
    add_deps("cserialport")
