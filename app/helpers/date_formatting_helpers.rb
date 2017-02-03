def date_converter(created, updated)
  result = (updated - created) > 0 ? "modified " : "asked "
  time_lapse = Time.now - updated
  time_lapse = time_lapse.to_i

  result += case time_lapse
            when 0..59
              "#{time_lapse} seconds ago"
            when 60..119
              "1 minute ago"
            when 120..3599
              "#{time_lapse / 60} minutes ago"
            when 3600..7199
              "1 hour ago"
            when 7200..86399
              "#{time_lapse / 60 / 60} hours ago"
            else
              "on #{created.strftime('%B %e, %Y')}"
            end
    result
end
