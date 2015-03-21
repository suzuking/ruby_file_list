require 'find'

def output_file_list(dir)
  file_list = []
  Find.find(dir) do |path|
    file_list << path if FileTest.file?(path)

    if( ARGV[1] )
       output_file = ARGV[1]
    else
       output_file = "./output_file_list.txt"
    end

    File.open(output_file, 'a') {|file|
       file.write path + "\n"
    }
  end
  file_list
end

if( ARGV[0] )
  output_file_list(ARGV[0])
else
  output_file_list('/root/')
end