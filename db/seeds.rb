# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  Location.create(Location.convert_area(name: 'Scottsdale',
                                        area: "[[33.5185, -111.90236],[33.51736,-111.96313],[33.48286,-111.96296],[33.483,-111.90133]]"))
  Location.create(Location.convert_area(name: 'Sweden',
                                        area: "[[65.99792, 28.28868],[67.05405, 9.52369],[60.51734, 7.66717],[59.24974, 25.75736]]"))
  Location.create(Location.convert_area(name: 'San Diego',
                                        area: "[[34.1479, -114.16588],[34.11608, -118.04852],[31.88179, -117.98244],[31.67179, -114.57272]]"))
  Location.create(Location.convert_area(name: 'Albuquerque',
                                        area: "[[35.20748, -106.45314],[35.17493, -106.77759],[34.94323, -106.78291],[34.93435, -106.41366]]"))
