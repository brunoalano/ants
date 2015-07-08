/**
 * Artificial Simulations of Ant
 *
 * Este modelo em Processing tenta simular agentes autônomos
 * em uma colônia de formigas, onde os seus cruzamentos geram
 * filhos mais novos, e possuem um certo tempo de vida nesta
 * colônia.
 *
 * Caso não haja cruzamentos o suficiente ao passar do tempo,
 * a colônia irá deixar de existir.
 *
 * @author Bruno Alano Medina
 * @based Turtles, Termites, and Traffic Jams by Mitchel Resnick
 */

/* Global Variables */
ArrayList<Ant> ants;

/* Setup */
void setup()
{
  /* Setup the screen */
  size(640, 320);

  /* Store the Ants */
  ants = new ArrayList<Ant>();

  /* Create they pretty little creatures */
  for (int i = 0; i < 10; i++)
    ants.add( new Ant(random(width), random(height)) );
}

/* Draw */
void draw()
{
  /* Erase all content from screen */
  background(255);

  /* Iterate over active Ants */
  for (Ant a : ants)
  {
    /* Update for iteration */
    a.run();
  }
}