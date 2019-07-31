- dashboard: reliability_cloudflare
  title: Reliability Cloudflare
  layout: newspaper
  elements:
  - name: Summary of Edge and Origin Response Status
    type: text
    title_text: Summary of Edge and Origin Response Status
    subtitle_text: Get an overview of the edge and origin response status codes
    row: 0
    col: 5
    width: 18
    height: 2
  - title: Edge Response Status in rps
    name: Edge Response Status in rps
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.edge_response_status, current_second_stats.current_ops,
      cloudflare_logs.count, events_per_second.avg_events_per_second, events_per_second.max_events_per_second]
    sorts: [max desc]
    limit: 500
    column_limit: 50
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
    hidden_fields:
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
    row: 14
    col: 16
    width: 7
    height: 5
  - title: Edge Response Status in rps
    name: Edge Response Status in rps
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.edge_start_timestamp_minute15, cloudflare_logs.edge_response_status,
      cloudflare_logs.avg_rps_15m]
    pivots: [cloudflare_logs.edge_response_status]
    fill_fields: [cloudflare_logs.edge_start_timestamp_minute15]
    sorts: [cloudflare_logs.edge_start_timestamp_minute15 desc, cloudflare_logs.edge_response_status]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      200 - cloudflare_logs.count: "#61ed65"
      404 - cloudflare_logs.count: "#f3280b"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Ops, orientation: left, series: [{id: 0 - cf_analytics_logs.count,
            name: '0', axisId: cloudflare_logs.count}, {id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 500 - cf_analytics_logs.count,
            name: '500', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 14
    col: 1
    width: 15
    height: 5
  - title: Origin Response Error Ratio
    name: Origin Response Error Ratio
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_pie
    fields: [cloudflare_logs.count, cloudflare_logs.origin_response_status_class]
    sorts: [cloudflare_logs.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 9
    col: 16
    width: 7
    height: 5
  - title: 5xx Errors (Edge)
    name: 5xx Errors (Edge)
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_week]
    fill_fields: [cloudflare_logs.edge_start_timestamp_week]
    filters:
      cloudflare_logs.edge_response_status_class_5xx: "-NULL"
    sorts: [cloudflare_logs.edge_start_timestamp_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: last_week, label: last week, expression: "${cloudflare_logs.count}\
          \ - offset(${cloudflare_logs.count}, 1)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 2
    col: 1
    width: 7
    height: 2
  - title: 4xx Errors (Edge)
    name: 4xx Errors (Edge)
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_week]
    fill_fields: [cloudflare_logs.edge_start_timestamp_week]
    filters:
      cloudflare_logs.edge_response_status_class_4xx: "-NULL"
    sorts: [cloudflare_logs.edge_start_timestamp_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: last_week, label: last week, expression: "${cloudflare_logs.count}\
          \ - offset(${cloudflare_logs.count}, 1)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 2
    col: 8
    width: 8
    height: 2
  - title: 3xx Errors (Edge)
    name: 3xx Errors (Edge)
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_week]
    fill_fields: [cloudflare_logs.edge_start_timestamp_week]
    filters:
      cloudflare_logs.edge_response_status_class_3xx: "-NULL"
    sorts: [cloudflare_logs.edge_start_timestamp_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: last_week, label: last week, expression: "${cloudflare_logs.count}\
          \ - offset(${cloudflare_logs.count}, 1)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 2
    col: 16
    width: 7
    height: 2
  - title: Origin Response Status Over Time
    name: Origin Response Status Over Time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_area
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_hour, cloudflare_logs.origin_response_status]
    pivots: [cloudflare_logs.origin_response_status]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    sorts: [cloudflare_logs.count desc 0, cloudflare_logs.origin_response_status]
    limit: 500
    column_limit: 50
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
      200 - cloudflare_logs.count: "#32e612"
      403 - cloudflare_logs.count: "#f21b90"
      404 - cloudflare_logs.count: "#f02e13"
      301 - cloudflare_logs.count: "#4187d9"
      302 - cloudflare_logs.count: "#3d6ecc"
      499 - cloudflare_logs.count: "#e6de17"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: cloudflare_logs.count, name: Camiliame
              Logs Requests, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
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
    row: 9
    col: 1
    width: 15
    height: 5
  - title: Top Client IPs and AS Number
    name: Top Client IPs and AS Number
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_ip, cloudflare_logs.client_asn, cloudflare_logs.count,
      cloudflare_logs.edge_response_status]
    sorts: [cloudflare_logs.count desc]
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
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 19
    col: 8
    width: 8
    height: 5
  - title: Top Countries
    name: Top Countries
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [countries.country_name, cloudflare_logs.count, cloudflare_logs.edge_response_status]
    sorts: [cloudflare_logs.count desc]
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
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 19
    col: 1
    width: 7
    height: 5
  - title: Top ASN Numbers
    name: Top ASN Numbers
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_asn, cloudflare_logs.count, cloudflare_logs.edge_response_status]
    sorts: [cloudflare_logs.count desc]
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
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 19
    col: 16
    width: 7
    height: 5
  - title: Top User Agents
    name: Top User Agents
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_user_agent_wrap, cloudflare_logs.count,
      cloudflare_logs.edge_response_status]
    sorts: [cloudflare_logs.count desc]
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
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 26
    col: 8
    width: 8
    height: 5
  - title: Top Requested URI
    name: Top Requested URI
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.client_request_uri_wrap, cloudflare_logs.edge_response_status]
    sorts: [cloudflare_logs.count desc]
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
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 26
    col: 1
    width: 7
    height: 5
  - title: Top Hostnames
    name: Top Hostnames
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_host, cloudflare_logs.count, cloudflare_logs.edge_response_status]
    sorts: [cloudflare_logs.count desc]
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
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 26
    col: 16
    width: 7
    height: 5
  - name: Detailed View
    type: text
    title_text: Detailed View
    subtitle_text: Breakdown of Origin Response Status Codes by Various Metrics
    row: 24
    col: 1
    width: 22
    height: 2
  - name: '<img style="display: block;" class="top-nav__logo top-nav__logo--dark top-nav__logo--transparent"
      src="https://www.cloudflare.com/img/logo-cloudflare-dark.svg">'
    type: text
    title_text: '<img style="display: block;" class="top-nav__logo top-nav__logo--dark
      top-nav__logo--transparent" src="https://www.cloudflare.com/img/logo-cloudflare-dark.svg">'
    row: 0
    col: 1
    width: 4
    height: 2
  - title: Edge Response Status Over Time
    name: Edge Response Status Over Time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_area
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_hour, cloudflare_logs.edge_response_status]
    pivots: [cloudflare_logs.edge_response_status]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    sorts: [cloudflare_logs.count desc 0, cloudflare_logs.edge_response_status]
    limit: 500
    column_limit: 50
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
      200 - cloudflare_logs.count: "#32e612"
      403 - cloudflare_logs.count: "#f21b90"
      404 - cloudflare_logs.count: "#f02e13"
      301 - cloudflare_logs.count: "#4187d9"
      302 - cloudflare_logs.count: "#3d6ecc"
      499 - cloudflare_logs.count: "#e6de17"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: cloudflare_logs.count, name: Camiliame
              Logs Requests, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
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
    row: 4
    col: 1
    width: 15
    height: 5
  - title: Edge Response Error Ratio
    name: Edge Response Error Ratio
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_pie
    fields: [cloudflare_logs.count, cloudflare_logs.edge_response_status_class]
    sorts: [cloudflare_logs.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      301 - cloudflare_logs.count: "#7481c5"
      200 - cloudflare_logs.count: "#62d467"
      403 - cloudflare_logs.count: "#e02272"
      404 - cloudflare_logs.count: "#f23b13"
      302 - cloudflare_logs.count: "#1d97f0"
      499 - cloudflare_logs.count: "#34e0e0"
      520 - cloudflare_logs.count: "#d7f218"
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 200 - cf_analytics_logs.count,
            name: '200', axisId: cloudflare_logs.count}, {id: 301 - cf_analytics_logs.count,
            name: '301', axisId: cloudflare_logs.count}, {id: 302 - cf_analytics_logs.count,
            name: '302', axisId: cloudflare_logs.count}, {id: 304 - cf_analytics_logs.count,
            name: '304', axisId: cloudflare_logs.count}, {id: 403 - cf_analytics_logs.count,
            name: '403', axisId: cloudflare_logs.count}, {id: 404 - cf_analytics_logs.count,
            name: '404', axisId: cloudflare_logs.count}, {id: 499 - cf_analytics_logs.count,
            name: '499', axisId: cloudflare_logs.count}, {id: 520 - cf_analytics_logs.count,
            name: '520', axisId: cloudflare_logs.count}], showLabels: false, showValues: true,
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
    row: 4
    col: 16
    width: 7
    height: 5
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