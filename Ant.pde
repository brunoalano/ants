/**
 * Agente: Formiga
 *
 * A formiga possui métodos para incrementar sua vida,
 * cruzar com outra formiga (recebendo os parâmetros da
 * formiga mãe) e outros métodos do nosso agente.
 */
class Ant {
  /* Location in Coordination Space */
  PVector location;

  /* Movement */
  PVector velocity;
  PVector acceleration;

  /* Euler Integration */
  float r;
  float maxforce;
  float maxspeed;

  /* Species Types */
  color species_color; 

  /**
   * Creates an Ant
   *
   * Receives the (X, Y) coordinate of the Ant start
   * point in our system.
   */
  Ant(float x, float y)
  {
    /* Start with location */
    location = new PVector(x, y);

    /* Velocity */
    velocity = new PVector(0, 0);

    /* Set the default acceleration */
    acceleration = new PVector(0, 0);

    /* Euler Integration */
    r = 3.0;
    maxspeed = 3.0;
    maxforce = 0.1;

    /* Setup the Species */
    species_color = color(95, 61, 10);
  }

  /**
   * Do the job!
   */
  void run()
  {
    update();
    display();
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);

    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);

    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  /**
   * Display on Screen
   *
   * This will render a object that will be the Ant on
   * our screen based on our Vectors of velocity.
   */
  void display() {
    /* Setup the Species Color */
    fill(species_color);

    /* Little border */
    stroke(1);

    /* Start a transformation matrix */
    pushMatrix();
    translate(location.x, location.y);
    rotate(atan2(velocity.y, velocity.x));
    
    /* Draw the Ant leg moving (references[1]) */
    float ant_leg_movement = sin(frameCount * .2) * 2;
    line(0, 0, ant_leg_movement-10, -10);
    line(0, 0, ant_leg_movement+10, -10);
    line(0, 0, -ant_leg_movement, -12);
    line(0, 0, ant_leg_movement-10, 10);
    line(0, 0, -ant_leg_movement, 12);
    line(0, 0, ant_leg_movement+10, 10);
    
    /* Antenna */
    line(10, 0, 17, -4);
    line(10, 0, 17, 4);
    
    /* Without borders */
    noStroke();

    /* Body */
    ellipse(0, 0, 15, 10);

    /* Head */
    ellipse(10, 0, 8, 8);

    /* Render */
    popMatrix();
  }
}