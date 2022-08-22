module ApplicationHelper
  def station_prev_next(station_name, route)
    "Prev - Next: #{prev_station(station_name, route)} - #{next_station(station_name, route)}"
  end

  def prev_station(station_name, route)
    @all_stations[get_station_id(station_name, route) - 1]&.name if (get_station_id(station_name, route) - 1) >= 0
  end

  def next_station(station_name, route)
    @all_stations[get_station_id(station_name, route) + 1]&.name if (get_station_id(station_name, route) - 1) <= route.stations.size
  end

  def get_station_id(station_name, route)
    id = 0
    route.stations.each_with_index do |station, i|
      id = i if station.name == station_name
    end
    id
  end
end
