class Image  

  def initialize(row)          
    @row = row     
  end

  def output_image   
    @row.each {|row| puts row.join}        
  end    

  def blur_image
    location = []

    @row.each_with_index {|row, rowIndex|              
      row.each_with_index {|column, columnIndex| 
        if column == 1 then location << [rowIndex, columnIndex] end } } 

    location.each do |rowIndex, columnIndex| 
      @row[rowIndex][columnIndex-1] = 'x' unless columnIndex == 0                   # L
      @row[rowIndex][columnIndex+1] = 'x' unless columnIndex == @row[0].length-1    # R
      @row[rowIndex-1][columnIndex] = 'x' unless rowIndex == 0                      # U
      @row[rowIndex+1][columnIndex] = 'x' unless rowIndex == @row.length-1          # D   
    end 

    self.output_image        
  end  
  
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
image.blur_image