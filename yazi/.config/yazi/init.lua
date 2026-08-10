function Linemode:iso_time()
    local time = math.floor(self._file.cha.mtime or 0)
    if time > 0 then
        return os.date("%Y-%m-%d %H:%M", time)
    else
        return "-"
    end
end

