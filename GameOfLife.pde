import java.util.Random;

color black = color(0, 0, 0);
color white = color(255, 255, 255);

void setup()
{
    size(1000, 1000);
    background(#ffffff);
    
    loadPixels();
    
    for(int i = 1001; i < pixels.length - 2000; i++)
    {
        int a = new Random().nextInt(2);
        
        if(a == 1)
        {
            pixels[i] = black;
        }
    }
    
    updatePixels();
    
    frameRate(100);
}

int grid[] = new int[1000000];
long gen = 1;

void draw()
{
    loadPixels();
    
    for(int i = 0; i < pixels.length; i++)
    {
        grid[i] = pixels[i];
    }
    
    for(int i = 1001; i < grid.length - 2000; i++)
    {
        int counter = 0;
        
        if(pixels[i - 1001] == black)
        {
            counter++;
        }
        
        if(pixels[i - 1000] == black)
        {
            counter++;
        }
        
        if(pixels[i - 999] == black)
        {
            counter++;
        }
        
        if(pixels[i - 1] == black)
        {
            counter++;
        }
        
        if(pixels[i + 1] == black)
        {
            counter++;
        }
        
        if(pixels[i + 999] == black)
        {
            counter++;
        }
        
        if(pixels[i + 1000] == black)
        {
            counter++;
        }
        
        if(pixels[i + 1001] == black)
        {
            counter++;
        }
        
        if(counter < 2 || counter > 3)
        {
            grid[i] = white;
        }
        
        if(pixels[i] == white && counter == 3)
        {
            grid[i] = black;
        }
    }
    
    for(int i = 0; i < pixels.length; i++)
    {
        pixels[i] = grid[i];
    }
    
    updatePixels();
    
    println(gen);
    gen++;
}
