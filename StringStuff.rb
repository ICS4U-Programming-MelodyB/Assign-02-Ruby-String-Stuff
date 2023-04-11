fileList = Array.new

# Function to find max run
def findMaxRun(line)
    # Declare variables
    currentRun = 1
    maxRun = 0

    # Checks if the line only holds one character.
    # (maxRun is already set to 0 for 0-length lines.)
    if line.length == 1
        maxRun = 1
    end

    # Create and array of all characters in the line.
    lineArr = line.split('')

    # Iterate through array and check if current character is equivalent
    # to the next one in the array.
    # For loop will not be executed if the line holds less than two
    # characters.
    (0...lineArr.length-1).each do |counter|
        if lineArr[counter] == lineArr[counter + 1]
            currentRun += 1
        else
            currentRun = 1
        end
        if currentRun > maxRun
            maxRun = currentRun
        end
    end
    return maxRun
end

# Open the input file and read each line
File.open("input1.txt", "r") do |input_file|
    input_file.each_line do |line|
        fileList << line
    end
end

# Create an array with all elements in the file list
lineArr = fileList.map(&:chomp)

# Open the output file for writing
outputFile = File.new("output1.txt", "w")

# Call function to find run and write to output file
lineArr.each do |line|
    run = findMaxRun(line)
    # Write results to output 
    outputFile.puts(run)
end

# Close output file
outputFile.close
