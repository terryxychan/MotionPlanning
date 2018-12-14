#include "planner/obstacles.h"

Obstacles::Obstacles()
{
}

/**
* @brief Obstacles are stored as rectangles. Rectangle is denoted by two points : topLeft and bottomRight.
* @param firstPoint
* @param secondPoint
*/
void Obstacles::addObstacle(Vector2f firstPoint, Vector2f secondPoint, int shapeAdd)
{
  // Get topLeft and bottomRight points from the given points.
  if(shapeAdd==1){//rectangle
    Vector2f tmp;
    if (firstPoint.x() > secondPoint.x() && firstPoint.y() > secondPoint.y()) {
      tmp = firstPoint;
      firstPoint = secondPoint;
      secondPoint = tmp;
    } else if (firstPoint.x() < secondPoint.x() && firstPoint.y() > secondPoint.y()) {
      int height = firstPoint.y() - secondPoint.y();
      firstPoint.y() -= height;
      secondPoint.y() += height;
    } else if (firstPoint.x() > secondPoint.x() && firstPoint.y() < secondPoint.y()) {
      int length = firstPoint.x() - secondPoint.x();
      firstPoint.x() -= length;
      secondPoint.x() += length;
    }
    firstPoint.x() -= BOT_CLEARANCE;
    firstPoint.y() -= BOT_CLEARANCE;
    secondPoint.x() += BOT_CLEARANCE;
    secondPoint.y() += BOT_CLEARANCE;
    obstacles.push_back(make_pair(firstPoint, secondPoint));
    shapeType.push_back(shapeAdd);
  }
  else if(shapeAdd==2){//circle
    secondPoint.x() += BOT_CLEARANCE;
    obstacles.push_back(make_pair(firstPoint, secondPoint));
    shapeType.push_back(shapeAdd);
  }
}

/**
* @brief Check if a line segment intersects a rectangle.
* @param p1
* @param p2
* @return
*/
bool Obstacles::isSegmentInObstacle(Vector2f &p1, Vector2f &p2)
{
  Line lineSegment(p1.x(), p1.y(), p2.x(), p2.y());
  for(int i = 0; i < (int)obstacles.size(); i++) {
    if(shapeType[i]==1){//rectangle
      float length = obstacles[i].second.x() - obstacles[i].first.x();
      float breadth = obstacles[i].second.y() - obstacles[i].first.y();
      Line lseg1(obstacles[i].first.x(), obstacles[i].first.y(), obstacles[i].first.x() + length, obstacles[i].first.y());
      Line lseg2(obstacles[i].first.x(), obstacles[i].first.y(), obstacles[i].first.x(), obstacles[i].first.y() + breadth);
      Line lseg3(obstacles[i].second.x(), obstacles[i].second.y(), obstacles[i].second.x(), obstacles[i].second.y() - breadth);
      Line lseg4(obstacles[i].second.x(), obstacles[i].second.y(), obstacles[i].second.x() - length, obstacles[i].second.y());
      bool x1 = lineSegment.intersect(lseg1);
      bool x2 = lineSegment.intersect(lseg2);
      bool x3 = lineSegment.intersect(lseg3);
      bool x4 = lineSegment.intersect(lseg4);
      // check for bounded intersection. IntersectType for bounded intersection is 1.
      if (x1 == 1 || x2 == 1 || x3 == 1 || x4 == 1)
      return true;
    }
    else if(shapeType[i]==2){//circle
      Vector2f d(p1.x()-p2.x(),p1.y()-p2.y());
      Vector2f f(p1.x()-obstacles[i].first.x(),p1.y()-obstacles[i].first.y());
      double r=obstacles[i].second.x();
      float a = d.dot( d ) ;
      float b = 2*f.dot( d ) ;
      float c = f.dot( f ) - r*r ;

      float discriminant = b*b-4*a*c;
      if( discriminant < 0 )
      {
        // no intersection
      }
      else
      {
        // ray didn't totally miss sphere,
        // so there is a solution to
        // the equation.

        discriminant = sqrt( discriminant );

        // either solution may be on or off the ray so need to test both
        // t1 is always the smaller value, because BOTH discriminant and
        // a are nonnegative.
        float t1 = (-b - discriminant)/(2*a);
        float t2 = (-b + discriminant)/(2*a);

        // 3x HIT cases:
        //          -o->             --|-->  |            |  --|->
        // Impale(t1 hit,t2 hit), Poke(t1 hit,t2>1), ExitWound(t1<0, t2 hit),

        // 3x MISS cases:
        //       ->  o                     o ->              | -> |
        // FallShort (t1>1,t2>1), Past (t1<0,t2<0), CompletelyInside(t1<0, t2>1)

        if( t1 >= 0 && t1 <= 1 )
        {
          // t1 is the intersection, and it's closer than t2
          // (since t1 uses -b - discriminant)
          // Impale, Poke
          return false ;
        }
        // here t1 didn't intersect so we are either started
        // inside the sphere or completely past it
        if( t2 >= 0 && t2 <= 1 )
        {
          // ExitWound
          return false ;
        }
        // no intn: FallShort, Past, CompletelyInside
        return true ;
      }
    }
  }
  return false;
}
