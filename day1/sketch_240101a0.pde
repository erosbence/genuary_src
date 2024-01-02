// Genuary2024, day 1
// https://genuary.art/

// This code is based on
// https://processing.org/examples/simpleparticlesystem.html

// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 100.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  float radius;
  // Method to display
  void display() {
    stroke(255, 0, 0, lifespan);
    fill(255, 255, 0, lifespan);
    radius = random(7);
    ellipse(position.x, position.y, radius, radius);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

/**
 * Simple Particle System
 * by Daniel Shiffman.  
 * 
 * Particles are generated each cycle through draw(),
 * fall with gravity, and fade out over time.
 * A ParticleSystem object manages a variable size (ArrayList) 
 * list of particles. 
 */

ParticleSystem ps;
ParticleSystem ps2;
ParticleSystem ps3;
ParticleSystem ps4;
ParticleSystem ps5;
ParticleSystem ps6;
ParticleSystem ps7;
ParticleSystem ps8;
ParticleSystem ps9;
ParticleSystem ps10;
ParticleSystem ps11;
ParticleSystem ps12;
ParticleSystem ps13;
ParticleSystem ps14;
ParticleSystem ps15;
ParticleSystem ps16;
ParticleSystem ps17;
ParticleSystem ps18;
ParticleSystem ps19;
ParticleSystem ps20;
ParticleSystem ps21;
ParticleSystem ps22;
ParticleSystem ps23;
ParticleSystem ps24;
ParticleSystem ps25;
ParticleSystem ps26;
ParticleSystem ps27;
ParticleSystem ps28;
ParticleSystem ps29;
ParticleSystem ps30;
ParticleSystem ps31;

int parNumber = 31;

ParticleSystem[] particles;

void setup() {
  size(800, 800);
  frameRate(5);
  particles = new ParticleSystem[parNumber];
  float t =  0;
  for(int i = 0; i < parNumber; i++) {
      particles[i] = new ParticleSystem(new PVector(250 * cos(t) + width/2, 250 * sin(t)*cos(t) + height/2));
      t += (2*PI)/parNumber;
  }
}

void draw() {
  background(20);
  
  for(int j = 0; j < parNumber; j++) {
    particles[j].addParticle();
    particles[j].run();
  }
  
  saveFrame("screen-####.jpg");
}
