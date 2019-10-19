class Image
  attr_accessor :row

  def initialize(row)          
    @rows = row
    # @column = column
    # @pixel = pixel 
  end  

  def output_image   
    @rows.each do |row|      
      puts row.join      
    end
  end  
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
# puts image.inspect

