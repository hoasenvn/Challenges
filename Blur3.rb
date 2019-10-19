class Image  

  def initialize(row)          
    @row = row     
  end

  def output_image   
    @row.each {|row| puts row.join}        
  end    

  def blur(distance)
    
    location = []

    @row.each_with_index {|row, rowIndex|              
      row.each_with_index {|column, columnIndex| 
        if column == 1 then location << [rowIndex, columnIndex] end } } 

        location.each do |rowIndex, columnIndex|
       
          a = 1          
          while a <= distance do      
            @row[rowIndex][columnIndex-a] = 'x' unless columnIndex-a < 0 
            @row[rowIndex][columnIndex+a] = 'x' unless columnIndex+a >= @row[0].length
            @row[rowIndex-a][columnIndex] = 'x' unless rowIndex-a < 0                      # U
            @row[rowIndex+a][columnIndex] = 'x' unless rowIndex+a >= @row.length 
            a = a + 1
          end  
          fill = []
          b = 1
          while (distance*2 - b) > 0 do 
            fill << - (distance - b)
            b = b + 1          
          end  
          
          fill.each do |n|
            if n < 0
              m = -n 
              while m <= distance do      
              @row[rowIndex+n][columnIndex+(distance-m)] = 'x' unless rowIndex+n < 0 || rowIndex+n >= @row.length || columnIndex+(distance-m) >= @row[0].length-1
              @row[rowIndex+n][columnIndex-(distance-m)] = 'x' unless rowIndex+n < 0 || rowIndex+n >= @row.length 
              m = m + 1 
              end
            end                 
            if n > 0
              m = n
              while m <= distance do      
              @row[rowIndex+n][columnIndex-(distance-m)] = 'x' unless rowIndex+n < 0 || rowIndex+n >= @row.length
              @row[rowIndex+n][columnIndex+(distance-m)] = 'x' unless rowIndex+n < 0 || rowIndex+n >= @row.length || columnIndex+(distance-m) >= @row[0].length-1
              m = m + 1             
              end
            end  
            
          end      
        end     
    
    self.output_image        
  end  
  
end

image = Image.new([
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],   
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
])
puts "Image: "
image.output_image
puts "Image after blurred:"
image.blur(5)