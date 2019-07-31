- dashboard: performance_cloudflare
  title: Performance Cloudflare
  layout: newspaper
  elements:
  - name: Requests
    type: text
    title_text: Requests
    row: 0
    col: 5
    width: 18
    height: 2
  - name: Bandwidth
    type: text
    title_text: Bandwidth
    row: 9
    col: 1
    width: 22
    height: 2
  - name: Cache
    type: text
    title_text: Cache
    row: 18
    col: 1
    width: 22
    height: 2
  - name: Static vs Dynamic Content
    type: text
    title_text: Static vs Dynamic Content
    row: 25
    col: 1
    width: 22
    height: 2
  - name: Origin Requests By Hostname
    type: text
    title_text: Origin Requests By Hostname
    row: 53
    col: 1
    width: 22
    height: 2
  - name: Client Request Methods
    type: text
    title_text: Client Request Methods
    row: 67
    col: 1
    width: 11
    height: 2
  - name: Client Requests By Connection
    type: text
    title_text: Client Requests By Connection
    row: 67
    col: 12
    width: 11
    height: 2
  - name: Origin Requests By Content Type
    type: text
    title_text: Origin Requests By Content Type
    row: 60
    col: 1
    width: 22
    height: 2
  - name: Slowest URLs  - Static Requests
    type: text
    title_text: Slowest URLs  - Static Requests
    row: 45
    col: 1
    width: 22
    height: 2
  - name: Slowest URLs - Dynamic Requests
    type: text
    title_text: Slowest URLs - Dynamic Requests
    row: 37
    col: 1
    width: 22
    height: 2
  - title: Total Number of Requests
    name: Total Number of Requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${cloudflare_logs.count}\
          \ - offset(${cloudflare_logs.count}, -1) ", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_points_if_no: [last_week_comparison]
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 1
    width: 5
    height: 2
  - title: Cached Bandwidth
    name: Cached Bandwidth
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.saved_bandwidth]
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    colors: ["#265780", "#D98541", "#C53DCC", "#33992E", "#36B38D", "#A2BF39", "#5A3DCC",
      "#8a0f3d", "#ff7aa3", "#2d89bd", "#8f09b0", "#d94141"]
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      200 - cf_analytics_logs.count: "#26802a"
      403 - cf_analytics_logs.count: "#992e68"
      404 - cf_analytics_logs.count: "#a936b3"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 11
    col: 10
    width: 5
    height: 2
  - title: Uncached Bandwidth
    name: Uncached Bandwidth
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.uncached_bandwidth]
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    colors: ["#265780", "#D98541", "#C53DCC", "#33992E", "#36B38D", "#A2BF39", "#5A3DCC",
      "#8a0f3d", "#ff7aa3", "#2d89bd", "#8f09b0", "#d94141"]
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      200 - cf_analytics_logs.count: "#26802a"
      403 - cf_analytics_logs.count: "#992e68"
      404 - cf_analytics_logs.count: "#a936b3"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 11
    col: 15
    width: 5
    height: 2
  - title: Total Bandwidth
    name: Total Bandwidth
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.total_bandwidth]
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    colors: ["#265780", "#D98541", "#C53DCC", "#33992E", "#36B38D", "#A2BF39", "#5A3DCC",
      "#8a0f3d", "#ff7aa3", "#2d89bd", "#8f09b0", "#d94141"]
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      200 - cf_analytics_logs.count: "#26802a"
      403 - cf_analytics_logs.count: "#992e68"
      404 - cf_analytics_logs.count: "#a936b3"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 11
    col: 1
    width: 5
    height: 2
  - title: Saved Bandwidth %
    name: Saved Bandwidth %
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.saved_bandwidth_percentage]
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 11
    col: 20
    width: 3
    height: 2
  - title: Cache Status Ratio
    name: Cache Status Ratio
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_pie
    fields: [cloudflare_logs.count, cloudflare_logs.cache_cache_status]
    filters: {}
    sorts: [cloudflare_logs.count desc]
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: desktop - cf_analytics_logs.count,
            name: desktop, axisId: cloudflare_logs.count}, {id: mobile - cf_analytics_logs.count,
            name: mobile, axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 20
    col: 11
    width: 6
    height: 5
  - title: Cached Requests
    name: Cached Requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count, cloudflare_logs.is_cached_r]
    filters:
      cloudflare_logs.is_cached_r: 'Yes'
    sorts: [cloudflare_logs.count desc]
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: desktop - cf_analytics_logs.count,
            name: desktop, axisId: cloudflare_logs.count}, {id: mobile - cf_analytics_logs.count,
            name: mobile, axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 14
    width: 4
    height: 2
  - title: Uncached Requests
    name: Uncached Requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count, cloudflare_logs.is_not_cached_r]
    filters:
      cloudflare_logs.is_not_cached_r: 'Yes'
    sorts: [cloudflare_logs.count desc]
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: desktop - cf_analytics_logs.count,
            name: desktop, axisId: cloudflare_logs.count}, {id: mobile - cf_analytics_logs.count,
            name: mobile, axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 18
    width: 5
    height: 2
  - title: Average rps
    name: Average rps
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [events_per_second.avg_events_per_second]
    filters: {}
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Ops, orientation: left, series: [{id: 0 - cf_analytics_logs.count,
            name: '0', axisId: cf_analytics_logs.count}, {id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cf_analytics_logs.count}, {id: 206 - cf_analytics_logs.count,
            name: '206', axisId: cf_analytics_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cf_analytics_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cf_analytics_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cf_analytics_logs.count}, {id: 401 - cf_analytics_logs.count,
            name: '401', axisId: cf_analytics_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cf_analytics_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cf_analytics_logs.count}, {id: 405 - cf_analytics_logs.count,
            name: '405', axisId: cf_analytics_logs.count}, {id: 500 - cf_analytics_logs.count,
            name: '500', axisId: cf_analytics_logs.count}, {id: 502 - cf_analytics_logs.count,
            name: '502', axisId: cf_analytics_logs.count}, {id: 503 - cf_analytics_logs.count,
            name: '503', axisId: cf_analytics_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cf_analytics_logs.count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (15s)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 6
    width: 4
    height: 2
  - title: Cached vs Uncached Bandwidth Over Time
    name: Cached vs Uncached Bandwidth Over Time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_area
    fields: [cloudflare_logs.edge_start_timestamp_hour, cloudflare_logs.saved_bandwidth,
      cloudflare_logs.uncached_bandwidth]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters: {}
    sorts: [cloudflare_logs.edge_start_timestamp_hour desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    colors: ["#265780", "#D98541", "#C53DCC", "#33992E", "#36B38D", "#A2BF39", "#5A3DCC",
      "#8a0f3d", "#ff7aa3", "#2d89bd", "#8f09b0", "#d94141"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      200 - cf_analytics_logs.count: "#26802a"
      403 - cf_analytics_logs.count: "#992e68"
      404 - cf_analytics_logs.count: "#a936b3"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: cloudflare_logs.saved_bandwidth,
            name: Saved Bandwidth, axisId: cloudflare_logs.saved_bandwidth}, {id: cloudflare_logs.uncached_bandwidth,
            name: Uncached Bandwidth, axisId: cloudflare_logs.uncached_bandwidth}],
        showLabels: true, showValues: true, valueFormat: '[>=1099511627776]0.00,,,,"
          TB";[>=1073741824]0.00,,," GB";[>=1048576]0.00,," MB";[>1024]0.00," KB "',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 13
    col: 1
    width: 12
    height: 5
  - title: Cache status over time
    name: Cache status over time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.cache_cache_status, cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_hour]
    pivots: [cloudflare_logs.cache_cache_status]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters: {}
    sorts: [cloudflare_logs.count desc 0, cloudflare_logs.cache_cache_status]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Requests, orientation: left, series: [{id: expired - cf_analytics_logs.count,
            name: expired, axisId: cloudflare_logs.count}, {id: hit - cf_analytics_logs.count,
            name: hit, axisId: cloudflare_logs.count}, {id: miss - cf_analytics_logs.count,
            name: miss, axisId: cloudflare_logs.count}, {id: revalidated - cf_analytics_logs.count,
            name: revalidated, axisId: cloudflare_logs.count}, {id: unknown - cf_analytics_logs.count,
            name: unknown, axisId: cloudflare_logs.count}, {id: updating - cf_analytics_logs.count,
            name: updating, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 20
    col: 1
    width: 10
    height: 5
  - title: Total number of requests vs cached vs uncached over time
    name: Total number of requests vs cached vs uncached over time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_area
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_hour, cloudflare_logs.cached_count,
      cloudflare_logs.uncached_count]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters: {}
    sorts: [cloudflare_logs.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      cloudflare_logs.count: "#13eb53"
      cloudflare_logs.cached_count: "#1d1fdc"
      cloudflare_logs.uncached_count: "#1ab7ba"
    series_labels:
      cloudflare_logs.count: Total requests
      cloudflare_logs.cached_count: Cached requests
      cloudflare_logs.uncached_count: Uncached requests
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: Requests, orientation: left, series: [{id: cloudflare_logs.count,
            name: Total requests, axisId: cloudflare_logs.count}, {id: cloudflare_logs.cached_count,
            name: Cached requests, axisId: cloudflare_logs.cached_count}, {id: cloudflare_logs.uncached_count,
            name: Uncached requests, axisId: cloudflare_logs.uncached_count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 4
    col: 1
    width: 12
    height: 5
  - title: Top URIs with Cache Status Miss
    name: Top URIs with Cache Status Miss
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.client_request_uri_wrap, cloudflare_logs.cache_cache_status]
    pivots: [cloudflare_logs.cache_cache_status]
    filters:
      cloudflare_logs.cache_cache_status: miss
    sorts: [cloudflare_logs.count desc 0, cloudflare_logs.cache_cache_status]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 20
    col: 17
    width: 6
    height: 5
  - title: Slowest URIs by cumulative time to first byte for dynamic requests
    name: Slowest URIs by cumulative time to first byte for dynamic requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_uri_wrap, events_per_second.avg_events_per_second,
      cloudflare_logs.count, cloudflare_logs.avg_originresponsetime, cloudflare_logs.waittime_originresponsetime,
      cloudflare_logs.percentile99_originresponsetime, cloudflare_logs.percentile999_originresponsetime]
    filters:
      cloudflare_logs.is_dynamic: 'Yes'
    sorts: [cloudflare_logs.waittime_originresponsetime desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      origin_response_time_quantiles.p95: p95
      origin_response_time_quantiles.p75: p75
      origin_response_time_quantiles.p50: p50
      events_per_second.avg_events_per_second: Rps
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors: {}
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (15s)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 39
    col: 1
    width: 22
    height: 6
  - title: Slowest URIs by cumulative time to first byte for static requests
    name: Slowest URIs by cumulative time to first byte for static requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_uri_wrap, events_per_second.avg_events_per_second,
      cloudflare_logs.count, cloudflare_logs.avg_originresponsetime, cloudflare_logs.waittime_originresponsetime,
      cloudflare_logs.percentile99_originresponsetime, cloudflare_logs.percentile999_originresponsetime]
    filters:
      cloudflare_logs.is_static: 'Yes'
    sorts: [cloudflare_logs.waittime_originresponsetime desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      origin_response_time_quantiles.p95: p95
      origin_response_time_quantiles.p75: p75
      origin_response_time_quantiles.p50: p50
      events_per_second.avg_events_per_second: Rps
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors: {}
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (15s)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 47
    col: 1
    width: 22
    height: 6
  - title: Total Requests vs. Origin Requests in rps last 24 hours
    name: Total Requests vs. Origin Requests in rps last 24 hours
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.edge_start_timestamp_minute15, cloudflare_logs.avg_rps_15m,
      cloudflare_logs.origin_rps_15m]
    fill_fields: [cloudflare_logs.edge_start_timestamp_minute15]
    filters:
      cloudflare_logs.edge_start_timestamp_minute15: 24 hours
    sorts: [cloudflare_logs.edge_start_timestamp_minute15 desc]
    limit: 500
    column_limit: 50
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    series_labels:
      cf_analytics_logs.count_origin_requests: Origin Requests
      cf_analytics_logs.count_edge_requests: Total Requests
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: rps, orientation: left, series: [{id: cloudflare_logs.avg_rps_15m,
            name: Camiliame Logs total rps, axisId: cloudflare_logs.avg_rps_15m}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (15s)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_series: []
    hidden_fields: []
    listen:
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 4
    col: 13
    width: 10
    height: 5
  - title: Total Bandwidth vs Origin Bandwidth in Mbps last 24 hours
    name: Total Bandwidth vs Origin Bandwidth in Mbps last 24 hours
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.edge_start_timestamp_minute15, cloudflare_logs.average_origin_bandwidth,
      cloudflare_logs.average_total_bandwidth]
    fill_fields: [cloudflare_logs.edge_start_timestamp_minute15]
    filters:
      cloudflare_logs.edge_start_timestamp_minute15: 24 hours
    sorts: [cloudflare_logs.edge_start_timestamp_minute15 desc]
    limit: 500
    column_limit: 50
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors: {}
    series_labels:
      cf_analytics_logs.count_origin_requests: Origin Requests
      cf_analytics_logs.count_edge_requests: Edge Requests
      cf_analytics_logs.total_edge_bandwidth: Edge Bandwidth
      cf_analytics_logs.total_origin_bandwidth: Origin Bandwidth
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: cf_analytics_logs.total_edge_bandwidth,
            name: Edge Bandwidth, axisId: cf_analytics_logs.total_edge_bandwidth}, {
            id: cf_analytics_logs.total_origin_bandwidth, name: Origin Bandwidth, axisId: cf_analytics_logs.total_origin_bandwidth}],
        showLabels: true, showValues: true, valueFormat: '[>=1099511627776]0.00,,,,"
          Tbps";[>=1073741824]0.00,,," Gbps";[>=1048576]0.00,," Mbps";[>1024]0.00,"
          Kbps"', unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (15s)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 13
    col: 13
    width: 10
    height: 5
  - title: Origin time to first byte dynamic requests
    name: Origin time to first byte dynamic requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.percentile95_originresponsetime, cloudflare_logs.percentile75_originresponsetime,
      cloudflare_logs.percentile50_originresponsetime, cloudflare_logs.edge_start_timestamp_hour]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters:
      cloudflare_logs.is_dynamic: 'Yes'
    sorts: [cloudflare_logs.edge_start_timestamp_hour desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      origin_response_time_quantiles.p95: p95
      origin_response_time_quantiles.p75: p75
      origin_response_time_quantiles.p50: p50
      events_per_second.avg_events_per_second: Rps
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors: {}
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (15s)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 27
    col: 1
    width: 22
    height: 5
  - title: Origin time to first byte static requests
    name: Origin time to first byte static requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.percentile95_originresponsetime, cloudflare_logs.percentile75_originresponsetime,
      cloudflare_logs.percentile50_originresponsetime, cloudflare_logs.edge_start_timestamp_hour]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters:
      cloudflare_logs.is_static: 'Yes'
    sorts: [cloudflare_logs.edge_start_timestamp_hour desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      origin_response_time_quantiles.p95: p95
      origin_response_time_quantiles.p75: p75
      origin_response_time_quantiles.p50: p50
      events_per_second.avg_events_per_second: Rps
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors: {}
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (15s)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 32
    col: 1
    width: 22
    height: 5
  - title: Origin requests by hostname in rps
    name: Origin requests by hostname in rps
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_host, events_per_second.avg_events_per_second,
      events_per_second.max_events_per_second]
    filters: {}
    sorts: [events_per_second.avg_events_per_second desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 55
    col: 16
    width: 7
    height: 5
  - title: Origin requests by hostname over time
    name: Origin requests by hostname over time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.count, cloudflare_logs.client_request_host, cloudflare_logs.edge_start_timestamp_hour]
    pivots: [cloudflare_logs.client_request_host]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters: {}
    sorts: [cloudflare_logs.client_request_host, cloudflare_logs.edge_start_timestamp_hour
        desc]
    limit: 500
    column_limit: 20
    query_timezone: America/Los_Angeles
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      200 - cloudflare_logs.count: "#61ed65"
      404 - cloudflare_logs.count: "#f3280b"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Requests, orientation: left, series: [{id: access.camilia.me
              - cf_analytics_logs.count, name: access.camilia.me, axisId: cloudflare_logs.count},
          {id: admin.camilia.me - cf_analytics_logs.count, name: admin.camilia.me, axisId: cloudflare_logs.count},
          {id: c4ca4238a0b923820dcc509a6f75849b.camilia.me - cf_analytics_logs.count,
            name: c4ca4238a0b923820dcc509a6f75849b.camilia.me, axisId: cloudflare_logs.count},
          {id: c513153ecafa067c9247304d538e1e32.camilia.me - cf_analytics_logs.count,
            name: c513153ecafa067c9247304d538e1e32.camilia.me, axisId: cloudflare_logs.count},
          {id: camilia.me - cf_analytics_logs.count, name: camilia.me, axisId: cloudflare_logs.count},
          {id: f8522ebf95af9a9cc0b0c2663eebcb20.camilia.me - cf_analytics_logs.count,
            name: f8522ebf95af9a9cc0b0c2663eebcb20.camilia.me, axisId: cloudflare_logs.count},
          {id: login.camilia.me - cf_analytics_logs.count, name: login.camilia.me, axisId: cloudflare_logs.count},
          {id: net.camilia.me - cf_analytics_logs.count, name: net.camilia.me, axisId: cloudflare_logs.count},
          {id: stats.camilia.me - cf_analytics_logs.count, name: stats.camilia.me, axisId: cloudflare_logs.count},
          {id: www.camilia.me - cf_analytics_logs.count, name: www.camilia.me, axisId: cloudflare_logs.count}],
        showLabels: true, showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (15s)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 55
    col: 1
    width: 15
    height: 5
  - title: Origin requests by content type
    name: Origin requests by content type
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_minute15,
      cloudflare_logs.edge_response_content_type_group]
    pivots: [cloudflare_logs.edge_response_content_type_group]
    fill_fields: [cloudflare_logs.edge_start_timestamp_minute15]
    filters: {}
    sorts: [cloudflare_logs.edge_start_timestamp_minute15 desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      200 - cloudflare_logs.count: "#61ed65"
      404 - cloudflare_logs.count: "#f3280b"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Requests, orientation: left, series: [{id: application/javascript
              - cf_analytics_logs.count, name: application/javascript, axisId: cloudflare_logs.count},
          {id: application/javascript; charset=utf-8 - cf_analytics_logs.count, name: application/javascript;
              charset=utf-8, axisId: cloudflare_logs.count}, {id: text/html; charset=iso-8859-1
              - cf_analytics_logs.count, name: text/html; charset=iso-8859-1, axisId: cloudflare_logs.count},
          {id: text/html; charset=UTF-8 - cf_analytics_logs.count, name: text/html; charset=UTF-8,
            axisId: cloudflare_logs.count}, {id: text/xml; charset=UTF-8 - cf_analytics_logs.count,
            name: text/xml; charset=UTF-8, axisId: cloudflare_logs.count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (15s)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 62
    col: 1
    width: 15
    height: 5
  - title: Client requests by connection
    name: Client requests by connection
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [events_per_second.avg_events_per_second, events_per_second.max_events_per_second,
      cloudflare_logs.client_sslprotocol]
    filters: {}
    sorts: [events_per_second.avg_events_per_second desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 74
    col: 12
    width: 11
    height: 4
  - title: Origin requests by content type in rps
    name: Origin requests by content type in rps
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [events_per_second.avg_events_per_second, events_per_second.max_events_per_second,
      cloudflare_logs.edge_response_content_type_group]
    filters: {}
    sorts: [events_per_second.avg_events_per_second desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 62
    col: 16
    width: 7
    height: 5
  - title: Client requests methods
    name: Client requests methods
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [events_per_second.avg_events_per_second, events_per_second.max_events_per_second,
      cloudflare_logs.client_request_method]
    filters: {}
    sorts: [events_per_second.avg_events_per_second desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 74
    col: 1
    width: 11
    height: 4
  - title: Client requests by connection over time
    name: Client requests by connection over time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_hour, cloudflare_logs.client_sslprotocol]
    pivots: [cloudflare_logs.client_sslprotocol]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters: {}
    sorts: [cloudflare_logs.edge_start_timestamp_hour desc, cloudflare_logs.client_sslprotocol]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      200 - cloudflare_logs.count: "#61ed65"
      404 - cloudflare_logs.count: "#f3280b"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Requests, orientation: left, series: [{id: none - cf_analytics_logs.count,
            name: none, axisId: cloudflare_logs.count}, {id: TLSv1 - cf_analytics_logs.count,
            name: TLSv1, axisId: cloudflare_logs.count}, {id: TLSv1.2 - cf_analytics_logs.count,
            name: TLSv1.2, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (hours)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 69
    col: 12
    width: 11
    height: 5
  - title: Client Requests Methods Over Time
    name: Client Requests Methods Over Time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.count, cloudflare_logs.client_request_method, cloudflare_logs.edge_start_timestamp_hour]
    pivots: [cloudflare_logs.client_request_method]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters: {}
    sorts: [cloudflare_logs.client_request_method, cloudflare_logs.edge_start_timestamp_hour
        desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      200 - cloudflare_logs.count: "#61ed65"
      404 - cloudflare_logs.count: "#f3280b"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Requests, orientation: left, series: [{id: GET - cf_analytics_logs.count,
            name: GET, axisId: cloudflare_logs.count}, {id: POST - cf_analytics_logs.count,
            name: POST, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Edge Start Time (hours)
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 69
    col: 1
    width: 11
    height: 5
  - name: '<img style="display: block;" class="top-nav__logo top-nav__logo--dark top-nav__logo--transparent"
      src="https://www.cloudflare.com/img/logo-cloudflare-dark.svg">'
    type: text
    title_text: '<img style="display: block;" class="top-nav__logo top-nav__logo--dark
      top-nav__logo--transparent" src="https://www.cloudflare.com/img/logo-cloudflare-dark.svg">'
    row: 0
    col: 1
    width: 4
    height: 2
  - title: Cache Hit Rate - Requests
    name: Cache Hit Rate - Requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.cache_hit_rate_r]
    sorts: [cloudflare_logs.cache_hit_rate_r desc]
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 10
    width: 4
    height: 2
  - title: Cache Hit Rate - Bandwidth
    name: Cache Hit Rate - Bandwidth
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.cache_hit_rate_b]
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      User Agent: cloudflare_logs.client_request_user_agent
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 11
    col: 6
    width: 4
    height: 2
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 24 hours
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.edge_start_timestamp_hour
  - name: Device Type
    title: Device Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.client_device_type
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: countries.country_name
  - name: Client IP
    title: Client IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.client_ip
  - name: Hostname
    title: Hostname
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.client_request_host
  - name: Request URI
    title: Request URI
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.client_request_uri
  - name: User Agent
    title: User Agent
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.client_request_user_agent
  - name: Origin Response Status
    title: Origin Response Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.origin_response_status
  - name: Edge Response Status
    title: Edge Response Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.edge_response_status
  - name: Origin IP
    title: Origin IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.origin_ip
  - name: RayID
    title: RayID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.ray_id
  - name: Worker Subrequest
    title: Worker Subrequest
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.worker_subrequest
  - name: Client Request Method
    title: Client Request Method
    type: field_filter
    default_value: "-PURGE"
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.client_request_method