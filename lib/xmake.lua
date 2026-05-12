local kind = get_config("kind") or "static"
target("cserialport")
    set_kind(kind)
    if is_plat("windows") and kind == "shared" then
        add_files("version.rc")
    end
