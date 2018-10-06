class WordReader
  def read_from_file(file_name)
      begin
        file = File.new(file_name, "r:UTF-8")
        lines = file.readlines
        file.close
        lines.sample.chomp
      rescue SystemCallError
        abort "Файл со словами не найден!"
      end
  end
end
