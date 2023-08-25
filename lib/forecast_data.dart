import 'dart:convert';

class ForecastData {
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  ForecastData({
    this.location,
    this.current,
    this.forecast,
  });

  factory ForecastData.fromRawJson(String str) =>
      ForecastData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForecastData.fromJson(Map<String, dynamic> json) => ForecastData(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
        "forecast": forecast?.toJson(),
      };
}

class Current {
  final double? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final double? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final double? windDegree;
  final WindDir? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final double? humidity;
  final double? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? visKm;
  final double? visMiles;
  final double? uv;
  final double? gustMph;
  final double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromRawJson(String str) => Current.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch:
            double.parse((json["last_updated_epoch"] ?? 0).toString()),
        lastUpdated: json["last_updated"],
        tempC: double.parse((json["temp_c"] ?? 0).toString()),
        tempF: double.parse((json["temp_f"] ?? 0).toString()),
        isDay: double.parse((json["is_day"] ?? 0).toString()),
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: double.parse((json["wind_mph"] ?? 0).toString()),
        windKph: double.parse((json["wind_kph"] ?? 0).toString()),
        windDegree: double.parse((json["wind_degree"] ?? 0).toString()),
        windDir: windDirValues.map[json["wind_dir"]],
        pressureMb: double.parse((json["pressure_mb"] ?? 0).toString()),
        pressureIn: double.parse((json["pressure_in"] ?? 0).toString()),
        precipMm: double.parse((json["precip_mm"] ?? 0).toString()),
        precipIn: double.parse((json["precip_in"] ?? 0).toString()),
        humidity: double.parse((json["humidity"] ?? 0).toString()),
        cloud: double.parse((json["cloud"] ?? 0).toString()),
        feelslikeC: double.parse((json["feelslike_c"] ?? 0).toString()),
        feelslikeF: double.parse((json["feelslike_c"] ?? 0).toString()),
        visKm: double.parse((json["vis_km"] ?? 0).toString()),
        visMiles: double.parse((json["vis_miles"] ?? 0).toString()),
        uv: double.parse((json["uv"] ?? 0).toString()),
        gustMph: double.parse((json["gust_mph"] ?? 0).toString()),
        gustKph: double.parse((json["gust_kph"] ?? 0).toString()),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDirValues.reverse[windDir],
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
      };
}

class Condition {
  final Text? text;
  final String? icon;
  final int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromRawJson(String str) =>
      Condition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: textValues.map[json["text"]],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": textValues.reverse[text],
        "icon": icon,
        "code": code,
      };
}

enum Text {
  CLOUDY,
  LIGHT_RAIN_SHOWER,
  MIST,
  PARTLY_CLOUDY,
  PATCHY_RAIN_POSSIBLE
}

final textValues = EnumValues({
  "Cloudy": Text.CLOUDY,
  "Light rain shower": Text.LIGHT_RAIN_SHOWER,
  "Mist": Text.MIST,
  "Partly cloudy": Text.PARTLY_CLOUDY,
  "Patchy rain possible": Text.PATCHY_RAIN_POSSIBLE
});

enum WindDir { SSW, SW, WSW }

final windDirValues =
    EnumValues({"SSW": WindDir.SSW, "SW": WindDir.SW, "WSW": WindDir.WSW});

class Forecast {
  final List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromRawJson(String str) =>
      Forecast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: json["forecastday"] == null
            ? []
            : List<Forecastday>.from(
                json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": forecastday == null
            ? []
            : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
      };
}

class Forecastday {
  final DateTime? date;
  final int? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Hour>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromRawJson(String str) =>
      Forecastday.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: json["day"] == null ? null : Day.fromJson(json["day"]),
        astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
        hour: json["hour"] == null
            ? []
            : List<Hour>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day?.toJson(),
        "astro": astro?.toJson(),
        "hour": hour == null
            ? []
            : List<dynamic>.from(hour!.map((x) => x.toJson())),
      };
}

class Astro {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final String? moonIllumination;
  final int? isMoonUp;
  final int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromRawJson(String str) => Astro.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
        isMoonUp: json["is_moon_up"],
        isSunUp: json["is_sun_up"],
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
        "is_moon_up": isMoonUp,
        "is_sun_up": isSunUp,
      };
}

class Day {
  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm;
  final double? totalprecipIn;
  final double? totalsnowCm;
  final double? avgvisKm;
  final double? avgvisMiles;
  final double? avghumidity;
  final double? dailyWillItRain;
  final double? dailyChanceOfRain;
  final double? dailyWillItSnow;
  final double? dailyChanceOfSnow;
  final Condition? condition;
  final double? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromRawJson(String str) => Day.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: double.parse((json["maxtemp_c"] ?? 0).toString()),
        maxtempF: double.parse((json["maxtemp_f"] ?? 0).toString()),
        mintempC: double.parse((json["mintemp_c"] ?? 0).toString()),
        mintempF: double.parse((json["mintemp_f"] ?? 0).toString()),
        avgtempC: double.parse((json["avgtemp_c"] ?? 0).toString()),
        avgtempF: double.parse((json["avgtemp_f"] ?? 0).toString()),
        maxwindMph: double.parse((json["maxwind_mph"] ?? 0).toString()),
        maxwindKph: double.parse((json["maxwind_kph"] ?? 0).toString()),
        totalprecipMm: double.parse((json["totalprecip_mm"] ?? 0).toString()),
        totalprecipIn: double.parse((json["totalprecip_in"] ?? 0).toString()),
        totalsnowCm: double.parse((json["totalsnow_cm"] ?? 0).toString()),
        avgvisKm: double.parse((json["avgvis_km"] ?? 0).toString()),
        avgvisMiles: double.parse((json["avgvis_miles"] ?? 0).toString()),
        avghumidity: double.parse((json["avghumidity"] ?? 0).toString()),
        dailyWillItRain:
            double.parse((json["daily_will_it_rain"] ?? 0).toString()),
        dailyChanceOfRain:
            double.parse((json["daily_chance_of_rain"] ?? 0).toString()),
        dailyWillItSnow:
            double.parse((json["daily_will_it_snow"] ?? 0).toString()),
        dailyChanceOfSnow:
            double.parse((json["daily_chance_of_snow"] ?? 0).toString()),
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mintemp_c": mintempC,
        "mintemp_f": mintempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxwindMph,
        "maxwind_kph": maxwindKph,
        "totalprecip_mm": totalprecipMm,
        "totalprecip_in": totalprecipIn,
        "totalsnow_cm": totalsnowCm,
        "avgvis_km": avgvisKm,
        "avgvis_miles": avgvisMiles,
        "avghumidity": avghumidity,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition?.toJson(),
        "uv": uv,
      };
}

class Hour {
  final double? timeEpoch;
  final String? time;
  final double? tempC;
  final double? tempF;
  final double? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final double? windDegree;
  final WindDir? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final double? humidity;
  final double? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatindexC;
  final double? heatindexF;
  final double? dewpointC;
  final double? dewpointF;
  final double? willItRain;
  final double? chanceOfRain;
  final double? willItSnow;
  final double? chanceOfSnow;
  final double? visKm;
  final double? visMiles;
  final double? gustMph;
  final double? gustKph;
  final double? uv;

  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  factory Hour.fromRawJson(String str) => Hour.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: double.parse((json["time_epoch"] ?? 0).toString()),
        time: json["time"],
        tempC: double.parse((json["temp_c"] ?? 0).toString()),
        tempF: double.parse((json["temp_f"] ?? 0).toString()),
        isDay: double.parse((json["is_day"] ?? 0).toString()),
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: double.parse((json["wind_mph"] ?? 0).toString()),
        windKph: double.parse((json["wind_kph"] ?? 0).toString()),
        windDegree: double.parse((json["wind_degree"] ?? 0).toString()),
        windDir: windDirValues.map[json["wind_dir"]],
        pressureMb: double.parse((json["pressure_mb"] ?? 0).toString()),
        pressureIn: double.parse((json["pressure_in"] ?? 0).toString()),
        precipMm: double.parse((json["precip_mm"] ?? 0).toString()),
        precipIn: double.parse((json["precip_in"] ?? 0).toString()),
        humidity: double.parse((json["humidity"] ?? 0).toString()),
        cloud: double.parse((json["cloud"] ?? 0).toString()),
        feelslikeC: double.parse((json["feelslike_c"] ?? 0).toString()),
        feelslikeF: double.parse((json["feelslike_f"] ?? 0).toString()),
        windchillC: double.parse((json["windchill_c"] ?? 0).toString()),
        windchillF: double.parse((json["windchill_f"] ?? 0).toString()),
        heatindexC: double.parse((json["heatindex_c"] ?? 0).toString()),
        heatindexF: double.parse((json["heatindex_f"] ?? 0).toString()),
        dewpointC: double.parse((json["dewpoint_c"] ?? 0).toString()),
        dewpointF: double.parse((json["dewpoint_f"] ?? 0).toString()),
        willItRain: double.parse((json["will_it_rain"] ?? 0).toString()),
        chanceOfRain: double.parse((json["chance_of_rain"] ?? 0).toString()),
        willItSnow: double.parse((json["will_it_snow"] ?? 0).toString()),
        chanceOfSnow: double.parse((json["chance_of_snow"] ?? 0).toString()),
        visKm: double.parse((json["vis_km"] ?? 0).toString()),
        visMiles: double.parse((json["vis_miles"] ?? 0).toString()),
        gustMph: double.parse((json["gust_mph"] ?? 0).toString()),
        gustKph: double.parse((json["gust_kph"] ?? 0).toString()),
        uv: double.parse((json["uv"] ?? 0).toString()),
      );

  Map<String, dynamic> toJson() => {
        "time_epoch": timeEpoch,
        "time": time,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDirValues.reverse[windDir],
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpoint_c": dewpointC,
        "dewpoint_f": dewpointF,
        "will_it_rain": willItRain,
        "chance_of_rain": chanceOfRain,
        "will_it_snow": willItSnow,
        "chance_of_snow": chanceOfSnow,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "uv": uv,
      };
}

class Location {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
