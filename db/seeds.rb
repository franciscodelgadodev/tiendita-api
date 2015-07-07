# Defines default percentage of profit
percentage = Setting.find_by(name: "profit_percentage")
percentage ||= Setting.create(name: "profit_percentage", value: "0.25", datatype: "number")
