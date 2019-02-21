class WordReader
  def read_from_file(file_name)
    begin
      lines = File.readlines(file_name, mode: "r:UTF-8", chomp: true)
      lines.sample
    rescue SystemCallError
      abort "Файл со словами не найден!"
    end
  end
end
