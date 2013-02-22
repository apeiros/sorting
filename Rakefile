$LOAD_PATH.unshift(File.expand_path('../rake/lib', __FILE__))
Dir.glob(File.expand_path('../rake/tasks/**/*.{rake,task,rb}', __FILE__)) do |task_file|
  begin
    import task_file
  rescue LoadError => e
    warn "Failed to load task file #{task_file}"
    warn "  #{e.class} #{e.message}"
    warn "  #{e.backtrace.first}"
  end
end
