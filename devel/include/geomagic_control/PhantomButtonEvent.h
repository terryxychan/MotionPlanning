// Generated by gencpp from file geomagic_control/PhantomButtonEvent.msg
// DO NOT EDIT!


#ifndef GEOMAGIC_CONTROL_MESSAGE_PHANTOMBUTTONEVENT_H
#define GEOMAGIC_CONTROL_MESSAGE_PHANTOMBUTTONEVENT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace geomagic_control
{
template <class ContainerAllocator>
struct PhantomButtonEvent_
{
  typedef PhantomButtonEvent_<ContainerAllocator> Type;

  PhantomButtonEvent_()
    : grey_button(0)
    , white_button(0)  {
    }
  PhantomButtonEvent_(const ContainerAllocator& _alloc)
    : grey_button(0)
    , white_button(0)  {
  (void)_alloc;
    }



   typedef int32_t _grey_button_type;
  _grey_button_type grey_button;

   typedef int32_t _white_button_type;
  _white_button_type white_button;




  typedef boost::shared_ptr< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> const> ConstPtr;

}; // struct PhantomButtonEvent_

typedef ::geomagic_control::PhantomButtonEvent_<std::allocator<void> > PhantomButtonEvent;

typedef boost::shared_ptr< ::geomagic_control::PhantomButtonEvent > PhantomButtonEventPtr;
typedef boost::shared_ptr< ::geomagic_control::PhantomButtonEvent const> PhantomButtonEventConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace geomagic_control

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'geomagic_control': ['/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fb77877e6b639935c3360838062f05f0";
  }

  static const char* value(const ::geomagic_control::PhantomButtonEvent_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xfb77877e6b639935ULL;
  static const uint64_t static_value2 = 0xc3360838062f05f0ULL;
};

template<class ContainerAllocator>
struct DataType< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geomagic_control/PhantomButtonEvent";
  }

  static const char* value(const ::geomagic_control::PhantomButtonEvent_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 grey_button\n\
int32 white_button\n\
";
  }

  static const char* value(const ::geomagic_control::PhantomButtonEvent_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.grey_button);
      stream.next(m.white_button);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PhantomButtonEvent_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::geomagic_control::PhantomButtonEvent_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::geomagic_control::PhantomButtonEvent_<ContainerAllocator>& v)
  {
    s << indent << "grey_button: ";
    Printer<int32_t>::stream(s, indent + "  ", v.grey_button);
    s << indent << "white_button: ";
    Printer<int32_t>::stream(s, indent + "  ", v.white_button);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GEOMAGIC_CONTROL_MESSAGE_PHANTOMBUTTONEVENT_H