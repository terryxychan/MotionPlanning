#ifndef OBSTACLES_H
#define OBSTACLES_H

#include <vector>
#include <eigen3/Eigen/Dense>
#include <assert.h>
#include "planner/constants.h"

using namespace Eigen;
using namespace std;

class Line
{
public:
  Line(double x_1,double y_1,double x_2,double y_2){
    x1=x_1;
    x2=x_2;
    y1=y_1;
    y2=y_2;
  }
  bool intersect(Line t){

    double a1 = y2 - y1;
    double b1 = x1 - x2;
    double c1 = a1*(x1) + b1*(y1);

    // Line CD represented as a2x + b2y = c2
    double a2 = t.y2 - t.y1;
    double b2 = t.x1 - t.x2;
    double c2 = a2*(t.x1)+ b2*(t.y1);

    double determinant = a1*b2 - a2*b1;

    if (determinant == 0)
    {
      // The lines are parallel. This is simplified
      // by returning a pair of FLT_MAX
      return false;
    }
    else
    {
      return true;
    }
  }
private:
  double x1,x2,y1,y2;
};

class Obstacles
{
public:
  Obstacles();
  void addObstacle(Vector2f firstPoint, Vector2f secondPoint, int shapeAdd);
  bool isSegmentInObstacle(Vector2f &p1, Vector2f &p2);
  vector<pair<Vector2f, Vector2f> > obstacles;
  vector<int> shapeType;
};

#endif // OBSTACLES_H
