
require 'gosu'
require_relative 'cell.rb'
require_relative 'game.rb'
require_relative 'world.rb'

class GameOfLifeWindow < Gosu::Window

  attr_accessor :random_color
  #not sure if arguments below are backward
  def initialize(height = 900, width = 900)

    @white = Gosu::Color.new(0xffdedede)
    @black = Gosu::Color.new(0xff000000)
    @blue = Gosu::Color.new(0xff0000ff)
    @cyan = Gosu::Color.new(0xff00ffff)
    @green = Gosu::Color.new(0xff00ff00)
    @magenta = Gosu::Color.new(0xffff00ff)
    @red = Gosu::Color.new(0xffff0000)
    @yellow = Gosu::Color.new(0xffffff00)


    @pink_colors = [
    @MediumVioletRed = Gosu::Color.rgba(199, 21, 255, 133),
    @DeepPink = Gosu::Color.rgba(255, 20, 147, 255),
    @PaleVioletRed = Gosu::Color.rgba(219, 112, 147, 255),
    @HotPink = Gosu::Color.rgba(255, 105, 180, 255),
    @LightPink = Gosu::Color.rgba(255, 182, 193, 255),
    @Pink = Gosu::Color.rgba(255, 192, 203, 255)]
    # require "pry"; binding.pry

    @red_colors = [
    @DarkRed	= Gosu::Color.rgba(139, 0, 0, 255),
    @Red	= Gosu::Color.rgba(255, 0, 0, 255),
    @Firebrick	= Gosu::Color.rgba(178, 34, 34, 255),
    @Crimson	= Gosu::Color.rgba(220, 20, 60, 255),
    @IndianRed	= Gosu::Color.rgba(205, 92, 92, 255),
    @LightCoral	= Gosu::Color.rgba(240, 128, 128, 255),
    @Salmon	= Gosu::Color.rgba(250, 128, 114, 255),
    @DarkSalmon	= Gosu::Color.rgba(233, 150, 122, 255),
    @LightSalmon	= Gosu::Color.rgba(255, 160, 122, 255)]

    @orange_colors = [
    @OrangeRed = Gosu::Color.rgba(255, 69, 0, 255),
    @Tomato = Gosu::Color.rgba(255, 99, 71, 255),
    @DarkOrange = Gosu::Color.rgba(255, 140, 0, 255),
    @Orange = Gosu::Color.rgba(255, 165, 0, 255),
    @Coral = Gosu::Color.rgba(255, 127, 80, 255)]

    @yellow_colors = [
    @DarkKhaki = Gosu::Color.rgba(189, 183, 107, 255),
    @Gold = Gosu::Color.rgba(255, 215, 0, 255),
    @Khaki = Gosu::Color.rgba(240, 230, 140, 255),
    @PeachPuff = Gosu::Color.rgba(2, 18, 185, 255),
    @Yellow = Gosu::Color.rgba(255, 255, 0, 255),
    @PaleGoldenrod = Gosu::Color.rgba(238, 232, 170, 255),
    @Moccasin = Gosu::Color.rgba(255, 228, 181, 255),
    @PapayaWhip = Gosu::Color.rgba(255, 239, 213, 255),
    @LightGoldenrodYellow = Gosu::Color.rgba(250, 250, 210, 255),
    @LemonChiffon = Gosu::Color.rgba(255, 250, 205, 255),
    @LightYellow = Gosu::Color.rgba(255, 255, 224, 255)]

    @brown_colors = [
    @Maroon = Gosu::Color.rgba(128, 0, 0, 255),
    @Brown = Gosu::Color.rgba(165, 42, 42, 255),
    @SaddleBrown = Gosu::Color.rgba(139, 69, 19, 255),
    @Sienna = Gosu::Color.rgba(160, 82, 45, 255),
    @Chocolate = Gosu::Color.rgba(210, 105, 30, 255),
    @DarkGoldenrod = Gosu::Color.rgba(184, 134, 11, 255),
    @Peru = Gosu::Color.rgba(205, 133, 63, 255),
    @RosyBrown = Gosu::Color.rgba(188, 143, 143, 255),
    @Goldenrod = Gosu::Color.rgba(218, 165, 32, 255),
    @SandyBrown = Gosu::Color.rgba(244, 164, 96, 255),
    @Tan = Gosu::Color.rgba(210, 180, 140, 255),
    @Burlywood = Gosu::Color.rgba(222, 184, 135, 255),
    @Wheat = Gosu::Color.rgba(245, 222, 179, 255),
    @NavajoWhite = Gosu::Color.rgba(255, 222, 173, 255),
    @Bisque = Gosu::Color.rgba(255, 228, 196, 255),
    @BlanchedAlmond = Gosu::Color.rgba(255, 235, 205, 255),
    @Cornsilk = Gosu::Color.rgba(255, 248, 220, 255)]

    @green_colors = [
    @DarkGreen = Gosu::Color.rgba(0, 100, 0, 255),
    @Green = Gosu::Color.rgba( 0, 128, 255, 0),
    @DarkOliveGreen = Gosu::Color.rgba(85, 107, 47, 255),
    @ForestGreen = Gosu::Color.rgba(34, 139, 34, 255),
    @SeaGreen = Gosu::Color.rgba(46, 139, 87, 255),
    @Olive = Gosu::Color.rgba(128, 128, 0, 255),
    @OliveDrab = Gosu::Color.rgba(107, 142, 35, 255),
    @MediumSeaGreen = Gosu::Color.rgba(60, 179, 113, 255),
    @LimeGreen = Gosu::Color.rgba(50, 205, 50, 255),
    @Lime = Gosu::Color.rgba(0, 255, 0, 255),
    @SpringGreen = Gosu::Color.rgba(0, 255, 127, 255),
    @MediumSpringGreen = Gosu::Color.rgba(0, 250, 154, 255),
    @DarkSeaGreen = Gosu::Color.rgba(143, 188, 143, 255),
    @MediumAquamarine = Gosu::Color.rgba(102, 205, 170, 255),
    @YellowGreen = Gosu::Color.rgba(154, 205, 50, 255),
    @LawnGreen = Gosu::Color.rgba(124, 252, 0, 255),
    @Chartreuse = Gosu::Color.rgba(127, 255, 0, 255),
    @LightGreen = Gosu::Color.rgba(144, 238, 144, 255),
    @GreenYellow = Gosu::Color.rgba(173, 255, 47, 255),
    @PaleGreen = Gosu::Color.rgba(152, 251, 152, 255)]

    @cyan_colors = [
    @Teal = Gosu::Color.rgba(0, 128, 128, 255),
    @DarkCyan = Gosu::Color.rgba(0, 139, 139, 255),
    @LightSeaGreen = Gosu::Color.rgba(32, 178, 170, 255),
    @CadetBlue = Gosu::Color.rgba(95, 158, 160, 255),
    @DarkTurquoise = Gosu::Color.rgba(0, 206, 209, 255),
    @MediumTurquoise = Gosu::Color.rgba(72, 209, 204, 255),
    @Turquoise = Gosu::Color.rgba(64, 224, 208, 255),
    @Aqua = Gosu::Color.rgba(0, 255, 255, 255),
    @Cyan = Gosu::Color.rgba(0, 255, 255, 255),
    @Aquamarine = Gosu::Color.rgba(127, 255, 212, 255),
    @PaleTurquoise = Gosu::Color.rgba(175, 238, 238, 255),
    @LightCyan = Gosu::Color.rgba(224, 255, 255, 255)]

    @blue_colors = [
    @Navy = Gosu::Color.rgba(0, 0, 128, 255),
    @DarkBlue = Gosu::Color.rgba(0, 0, 139, 255),
    @MediumBlue = Gosu::Color.rgba(0, 0, 205, 255),
    @Blue = Gosu::Color.rgba(0, 0, 255, 255),
    @MidnightBlue = Gosu::Color.rgba(25, 25, 112, 255),
    @RoyalBlue = Gosu::Color.rgba(65, 105, 225, 255),
    @SteelBlue = Gosu::Color.rgba(70, 130, 180, 255),
    @DodgerBlue = Gosu::Color.rgba(30, 144, 255, 255),
    @DeepSkyBlue = Gosu::Color.rgba(0, 191, 255, 255),
    @CornflowerBlue = Gosu::Color.rgba(100, 149, 237, 255),
    @SkyBlue = Gosu::Color.rgba(135, 206, 235, 255),
    @LightSkyBlue = Gosu::Color.rgba(135, 206, 250, 255),
    @LightSteelBlue = Gosu::Color.rgba(176, 196, 222, 255),
    @LightBlue = Gosu::Color.rgba(173, 216, 230, 255),
    @PowderBlue = Gosu::Color.rgba(176, 224, 230, 255)]

    @purple_colors = [
    @Indigo = Gosu::Color.rgba(75, 0, 130, 255),
    @Purple = Gosu::Color.rgba(128, 0, 128, 255),
    @DarkMagenta = Gosu::Color.rgba(139, 0, 139, 255),
    @DarkViolet = Gosu::Color.rgba(148, 0, 211, 255),
    @DarkSlateBlue = Gosu::Color.rgba(72, 61, 139, 255),
    @BlueViolet = Gosu::Color.rgba(138, 43, 226, 255),
    @DarkOrchid = Gosu::Color.rgba(153, 50, 204, 255),
    @Fuchsia = Gosu::Color.rgba(255, 0, 255, 255),
    @Magenta = Gosu::Color.rgba(255, 0, 255, 255),
    @SlateBlue = Gosu::Color.rgba(106, 90, 205, 255),
    @MediumSlateBlue = Gosu::Color.rgba(123, 104, 238, 255),
    @MediumOrchid = Gosu::Color.rgba(186, 85, 211, 255),
    @MediumPurple = Gosu::Color.rgba(147, 112, 219, 255),
    @Orchid = Gosu::Color.rgba(218, 112, 214, 255),
    @Violet = Gosu::Color.rgba(238, 130, 238, 255),
    @Plum = Gosu::Color.rgba(221, 160, 221, 255),
    @Thistle = Gosu::Color.rgba(216, 191, 216, 255),
    @Lavender = Gosu::Color.rgba(230, 230, 250, 255)]

    @large_pallete = [
      @pink_colors, @red_colors, @orange_colors, @yellow_colors, @brown_colors, @green_colors, 
      @cyan_colors, @blue_colors, @purple_colors].flatten


# require "pry"; binding.pry


    @color_wheel = [@white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white, @white,
                    @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @black, @black, @black, @black, @black, @black, @black, @black, @black, @black, @black, @black, @black, @black, @black, @black, @black, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @black, @black, @black, @black, @black, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue, @blue,
                    @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan, @cyan,
                    @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green, @green,
                    @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta, @magenta,
                    @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red, @red,
                    @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow,@yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow, @yellow]
    
    # require "pry"; binding.pry
    
    # @random_color = @color_wheel.sample
    # @random_color_new = @large_pallete.sample
    @height = height
    @width = width
    super width, height, false #, 500
    self.caption = "The game of life"
    #color
    @background_color = Gosu::Color.new(0xff000000)
    # @background_color = Gosu::Color.new(0xffdedede)
    # @alive_color = @random_color
    @alive_color = Gosu::Color.new(0xff121212)
    # @dead_color = Gosu::Color.new(0xffdedede)
    @dead_color = Gosu::Color.new(0xff000000)
    # @dead_color = Gosu::Color.new(0xff0099ff)
    # require "pry"; binding.pry

    #The Game
    @cols = width/10
    @rows = height/10

    @col_width = width/@cols
    @row_height = height/@rows

    @world = World.new(@cols, @rows)
    @game = Game.new(@world)
    @game.world.randomly_populate

    @generation = 0
  end

  def update
    unless @game.world.live_cells.count == 0
      # sleep(0.5)
      @game.tick!
      # @game.color_change
    end
    # require "pry"; binding.pry
    @generation += 1
    puts "Generation Number: #{@generation}"
  end

  def draw
    #needs to be dynamic
    # background
    draw_quad(0, 0, @background_color, 
              width, 0, @background_color,
              width, height, @background_color,
              0, height, @background_color)
              
              #Drawing cells
              @game.world.cells.each do |cell|
                if cell.alive?
                  # #random colors
                  @color_sample_1 = @color_wheel.sample
                  @color_sample_2 = @color_wheel.rotate!.first
                  @color_sample_3 = @large_pallete.rotate!.first

                  @pink_colors_sample = @pink_colors.rotate!.first
                  @red_colors_sample = @red_colors.rotate!.first
                  @orange_colors_sample = @orange_colors.rotate!.first
                  @yellow_colors_sample = @yellow_colors.rotate!.first
                  @brown_colors_sample = @brown_colors.rotate!.first
                  @green_colors_sample = @green_colors.rotate!.first
                  @cyan_colors_sample = @cyan_colors.rotate!.first
                  @blue_colors_sample = @blue_colors.rotate!.first
                  @purple_colors_sample = @purple_colors.rotate!.first
                  # require "pry"; binding.pry
                  
    # pink colors
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @pink_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @pink_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @pink_colors_sample,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @pink_colors_sample)
   
        # red colors
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @red_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @red_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @red_colors_sample,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @red_colors_sample)
    
        # orange colors
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @orange_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @orange_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @orange_colors_sample,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @orange_colors_sample)
        
    # yellow colors
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @yellow_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @yellow_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @yellow_colors_sample,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @yellow_colors_sample)
   
    # brown colors
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @brown_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @brown_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @brown_colors_sample,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @brown_colors_sample)
  
    # green colors
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @green_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @green_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @green_colors_sample,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @green_colors_sample)
 
    # cyan colors
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @cyan_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @cyan_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @cyan_colors_sample,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @cyan_colors_sample)
    
    # blue colors
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @blue_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @blue_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @blue_colors_sample,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @blue_colors_sample)
    
    # purple colors
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @purple_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @purple_colors_sample,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @purple_colors_sample,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @purple_colors_sample)
  
      
    
    # large pallete
                  
    # draw_quad(cell.x * @col_width, cell.y * @row_height, @color_sample_3,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @color_sample_3,
    #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @color_sample_3,
    #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @color_sample_3)
    
   #  organized rainbow

    draw_quad(cell.x * @col_width, cell.y * @row_height, @color_sample_2,
        cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @color_sample_2,
        cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @color_sample_2,
        cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @color_sample_2)
    
    
    #super random colors 
    
          # draw_quad(cell.x * @col_width, cell.y * @row_height, @color_wheel.sample,
          #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @color_wheel.sample,
          #     cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @color_wheel.sample,
          #     cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @color_wheel.sample)

# normal color

        # draw_quad(cell.x * @col_width, cell.y * @row_height, @alive_color,
        #           cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @alive_color,
        #           cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @alive_color,
        #           cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @alive_color)

      else 

#normal colors

        draw_quad(cell.x * @col_width, cell.y * @row_height, @dead_color,
                  cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @dead_color,
                  cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @dead_color,
                  cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @dead_color)
        end

#random colors        

      # draw_quad(cell.x * @col_width, cell.y * @row_height, @color_sample_1,
      #   cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @color_sample_1,
      #   cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @color_sample_1,
      #   cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @color_sample_1)
      # end
      
      # draw_quad(cell.x * @col_width, cell.y * @row_height, @color_sample_1,
      #   cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @color_sample_1,
      #   cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @color_sample_1,
      #   cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @color_sample_1)
      # end

      # draw_quad(cell.x * @col_width, cell.y * @row_height, @color_sample_2,
      #   cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @color_sample_2,
      #   cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @color_sample_2,
      #   cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @color_sample_2)
      # end

      # draw_quad(cell.x * @col_width, cell.y * @row_height, @color_wheel.sample,
      #   cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @color_wheel.sample,
      #   cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @color_wheel.sample,
      #   cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @color_wheel.sample)
      # end
    end
  end

  def self.from_rgba(r, g, b, a); end

  def button_down(id)
    case id
    when Gosu::KbSpace
      @game.world.randomly_populate
    when Gosu::KbEscape
      close
    end
  end

  def needs_cursor?
    true
  end
# or
  # def needs_cursor?; true; end
end

game = GameOfLifeWindow.new


# require "pry"; binding.pry
gameshow = game.show