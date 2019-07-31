- dashboard: security_cloudflare
  title: Security Cloudflare
  layout: newspaper
  elements:
  - name: Threats
    type: text
    title_text: Threats
    subtitle_text: Review threat activity
    row: 0
    col: 5
    width: 18
    height: 2
  - name: WAF
    type: text
    title_text: WAF
    subtitle_text: Events triggered by the Web Application Firewall
    body_text: ''
    row: 20
    col: 1
    width: 22
    height: 2
  - name: Rate Limiting
    type: text
    title_text: Rate Limiting
    subtitle_text: Get insights into rate limiting events and banned IPs and URIs
    row: 32
    col: 1
    width: 22
    height: 2
  - title: Total Number of requests
    name: Total Number of requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count]
    sorts: [cloudflare_logs.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Total Number of Requests
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 1
    width: 6
    height: 2
  - title: 'WAF: Top Countries'
    name: 'WAF: Top Countries'
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_pie
    fields: [cloudflare_logs.count, countries.country_name]
    filters:
      cloudflare_logs.wafrule_id: "-EMPTY"
    sorts: [cloudflare_logs.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 22
    col: 17
    width: 6
    height: 5
  - title: WAF Events Triggered
    name: WAF Events Triggered
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count]
    filters:
      cloudflare_logs.wafrule_id: "-EMPTY"
    sorts: [cloudflare_logs.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 7
    width: 6
    height: 2
  - title: Top Threats Stopped
    name: Top Threats Stopped
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.edgepathingstatus_full]
    filters:
      cloudflare_logs.is_threat: 'Yes'
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 4
    col: 18
    width: 5
    height: 6
  - title: Top Threat Client IPs
    name: Top Threat Client IPs
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_ip, cloudflare_logs.count, countries.country_name]
    filters:
      cloudflare_logs.is_threat: 'Yes'
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 4
    col: 13
    width: 5
    height: 6
  - title: Top Threat Countries
    name: Top Threat Countries
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, countries.country_name]
    filters:
      cloudflare_logs.is_threat: 'Yes'
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 4
    col: 9
    width: 4
    height: 6
  - title: Top Threat Target URIs
    name: Top Threat Target URIs
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.client_request_uri_wrap]
    filters:
      cloudflare_logs.is_threat: 'Yes'
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 15
    col: 1
    width: 7
    height: 5
  - title: Top Threat User Agents
    name: Top Threat User Agents
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.client_request_user_agent]
    filters:
      cloudflare_logs.is_threat: 'Yes'
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 15
    col: 8
    width: 8
    height: 5
  - title: Top Pathing Statuses
    name: Top Pathing Statuses
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.edge_pathing_src, cloudflare_logs.edge_pathing_op, cloudflare_logs.edge_pathing_status,
      cloudflare_logs.count]
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 15
    col: 16
    width: 7
    height: 5
  - title: Threats Over Time
    name: Threats Over Time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_hour, cloudflare_logs.edgepathingstatus_full]
    pivots: [cloudflare_logs.edgepathingstatus_full]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters:
      cloudflare_logs.is_threat: 'Yes'
    sorts: [cloudflare_logs.count desc 0]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: ctry - cf_analytics_logs.count,
            name: ctry, axisId: cloudflare_logs.count}, {id: ip - cf_analytics_logs.count,
            name: ip, axisId: cloudflare_logs.count}, {id: rateLimit - cf_analytics_logs.count,
            name: rateLimit, axisId: cloudflare_logs.count}, {id: ua - cf_analytics_logs.count,
            name: ua, axisId: cloudflare_logs.count}, {id: unknown - cf_analytics_logs.count,
            name: unknown, axisId: cloudflare_logs.count}, {id: zl - cf_analytics_logs.count,
            name: zl, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
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
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 10
    col: 1
    width: 22
    height: 5
  - title: WAF Events Over Time
    name: WAF Events Over Time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_area
    fields: [cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_date]
    fill_fields: [cloudflare_logs.edge_start_timestamp_date]
    filters:
      cloudflare_logs.wafrule_id: "-EMPTY"
    sorts: [cloudflare_logs.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: cloudflare_logs.count, name: Requests,
            axisId: cloudflare_logs.count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 22
    col: 1
    width: 16
    height: 5
  - title: 'WAF: Top Client IPs'
    name: 'WAF: Top Client IPs'
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.client_ip]
    filters:
      cloudflare_logs.wafrule_id: "-EMPTY"
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 27
    col: 18
    width: 5
    height: 5
  - title: 'WAF: Top Hosts'
    name: 'WAF: Top Hosts'
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.client_request_host]
    filters:
      cloudflare_logs.wafrule_id: "-EMPTY"
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 27
    col: 14
    width: 4
    height: 5
  - title: Top WAF Rules Triggered
    name: Top WAF Rules Triggered
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.wafrule_id, cloudflare_logs.wafrule_message, cloudflare_logs.count]
    filters:
      cloudflare_logs.wafrule_id: "-EMPTY"
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 27
    col: 1
    width: 6
    height: 5
  - title: 'WAF: Top User Agents'
    name: 'WAF: Top User Agents'
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.wafrule_id, cloudflare_logs.client_request_user_agent_wrap]
    filters:
      cloudflare_logs.wafrule_id: "-EMPTY"
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 27
    col: 7
    width: 7
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
  - title: Threats Stopped
    name: Threats Stopped
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count]
    filters:
      cloudflare_logs.is_threat: 'Yes'
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 13
    width: 5
    height: 2
  - title: Threats vs Requests
    name: Threats vs Requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_pie
    fields: [cloudflare_logs.count, cloudflare_logs.is_threat]
    fill_fields: [cloudflare_logs.is_threat]
    sorts: [cloudflare_logs.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    series_labels:
      'No': Requests
      'Yes': Threats
    series_types: {}
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 18
    width: 5
    height: 2
  - title: Top Threat Countries Map
    name: Top Threat Countries Map
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_map
    fields: [cloudflare_logs.count, cloudflare_logs.client_country_code]
    filters:
      cloudflare_logs.is_threat: 'Yes'
    sorts: [cloudflare_logs.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    series_labels:
      'No': Requests
      'Yes': Threats
    series_types: {}
    map_position: custom
    map_latitude: 53.4357192066942
    map_longitude: -0.17578125
    map_zoom: 2
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 4
    col: 1
    width: 8
    height: 6
  - title: Top Rate Limit Actions
    name: Top Rate Limit Actions
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.edge_rate_limit_action, cloudflare_logs.edge_rate_limit_id]
    filters:
      cloudflare_logs.edge_rate_limit_action: ban,simulate
    sorts: [cloudflare_logs.edge_rate_limit_action]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    point_style: none
    series_types: {}
    y_axes: [{label: '', orientation: left, series: [{id: ban - cf_analytics_logs.count,
            name: ban, axisId: cloudflare_logs.count}, {id: simulate - cf_analytics_logs.count,
            name: simulate, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
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
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 39
    col: 1
    width: 5
    height: 4
  - title: Rate Limit Over Time
    name: Rate Limit Over Time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_line
    fields: [cloudflare_logs.count, cloudflare_logs.edge_rate_limit_action, cloudflare_logs.edge_start_timestamp_date]
    pivots: [cloudflare_logs.edge_rate_limit_action]
    fill_fields: [cloudflare_logs.edge_start_timestamp_date]
    filters:
      cloudflare_logs.edge_rate_limit_action: "-EMPTY"
    sorts: [cloudflare_logs.count desc 0, cloudflare_logs.edge_rate_limit_action]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: ban - cf_analytics_logs.count,
            name: ban, axisId: cloudflare_logs.count}, {id: simulate - cf_analytics_logs.count,
            name: simulate, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
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
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 34
    col: 1
    width: 22
    height: 5
  - title: Top Banned URIs
    name: Top Banned URIs
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_uri, cloudflare_logs.client_request_host,
      cloudflare_logs.count]
    filters:
      cloudflare_logs.edge_rate_limit_action: ban
    sorts: [cloudflare_logs.count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    point_style: none
    series_types: {}
    y_axes: [{label: '', orientation: left, series: [{id: ban - cf_analytics_logs.count,
            name: ban, axisId: cloudflare_logs.count}, {id: simulate - cf_analytics_logs.count,
            name: simulate, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
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
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 39
    col: 18
    width: 5
    height: 4
  - title: Top Banned Client IPs
    name: Top Banned Client IPs
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_ip, cloudflare_logs.client_request_host, cloudflare_logs.count]
    filters:
      cloudflare_logs.edge_rate_limit_action: ban
    sorts: [cloudflare_logs.count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    point_style: none
    series_types: {}
    y_axes: [{label: '', orientation: left, series: [{id: ban - cf_analytics_logs.count,
            name: ban, axisId: cloudflare_logs.count}, {id: simulate - cf_analytics_logs.count,
            name: simulate, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
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
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 39
    col: 12
    width: 6
    height: 4
  - title: Top Rate Limit Countries
    name: Top Rate Limit Countries
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [countries.country_name, cloudflare_logs.client_request_host, cloudflare_logs.count,
      cloudflare_logs.edge_rate_limit_action]
    filters:
      cloudflare_logs.edge_rate_limit_action: ban,simulate
    sorts: [cloudflare_logs.count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: true
    y_axis_gridlines: true
    point_style: none
    series_types: {}
    y_axes: [{label: '', orientation: left, series: [{id: ban - cf_analytics_logs.count,
            name: ban, axisId: cloudflare_logs.count}, {id: simulate - cf_analytics_logs.count,
            name: simulate, axisId: cloudflare_logs.count}], showLabels: true, showValues: true,
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
      Country: cloudflare_logs.client_country_code
      Client IP: cloudflare_logs.client_ip
      Hostname: cloudflare_logs.client_request_host
      Request URI: cloudflare_logs.client_request_uri
      Origin Response Status: cloudflare_logs.origin_response_status
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin IP: cloudflare_logs.origin_ip
      User Agent: cloudflare_logs.client_request_user_agent
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 39
    col: 6
    width: 6
    height: 4
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
    field: cloudflare_logs.client_country_code
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