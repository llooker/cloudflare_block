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
  - name: logo
    type: text
    title_text: '<img style="display: block;" class="top-nav__logo top-nav__logo--dark
      top-nav__logo--transparent" src="https://www.cloudflare.com/img/logo-cloudflare-dark.svg">'
    row: 0
    col: 1
    width: 4
    height: 2
  - title: Total Number of requests
    name: Total Number of requests
    model: camilia_looker
    explore: camiliame_logs
    type: single_value
    fields:
    - camiliame_logs.count
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 2
    col: 1
    width: 6
    height: 2
  - title: WAF Events Triggered
    name: WAF Events Triggered
    model: camilia_looker
    explore: camiliame_logs
    type: single_value
    fields:
    - camiliame_logs.count
    filters:
      camiliame_logs.wafrule_id: "-EMPTY"
    sorts:
    - camiliame_logs.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 2
    col: 7
    width: 6
    height: 2
  - title: Threats Stopped
    name: Threats Stopped
    model: bruce3
    explore: camiliame_logs
    type: single_value
    fields:
    - camiliame_logs.count
    filters:
      camiliame_logs.is_threat: 'Yes'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    listen:
      Date: camiliame_logs.edge_start_timestamp_date
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 2
    col: 13
    width: 5
    height: 2
  - title: Threats vs Requests
    name: Threats vs Requests
    model: bruce3
    explore: camiliame_logs
    type: looker_pie
    fields:
    - camiliame_logs.count
    - camiliame_logs.is_threat
    fill_fields:
    - camiliame_logs.is_threat
    sorts:
    - camiliame_logs.count desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    series_labels:
      'Yes': Threats
      'No': Requests
    series_types: {}
    listen:
      Date: camiliame_logs.edge_start_timestamp_date
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 2
    col: 18
    width: 5
    height: 2
  - title: Top Threat Countries Map
    name: Top Threat Countries Map
    model: bruce3
    explore: camiliame_logs
    type: looker_map
    fields:
    - camiliame_logs.count
    - countries.country_name
    filters:
      camiliame_logs.is_threat: 'Yes'
    sorts:
    - camiliame_logs.count desc
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 53.74871079689897
    map_longitude: -0.17578125
    map_zoom: 2
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen:
      Date: camiliame_logs.edge_start_timestamp_date
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 4
    col: 1
    width: 8
    height: 6
  - title: Top Threat Countries
    name: Top Threat Countries
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - countries.country_name
    filters:
      camiliame_logs.is_threat: 'Yes'
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 4
    col: 9
    width: 4
    height: 6
  - title: Top Threats Stopped
    name: Top Threats Stopped
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.edgepathingstatus_full
    filters:
      camiliame_logs.is_threat: 'Yes'
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 4
    col: 18
    width: 5
    height: 6
  - title: Top Threat Client IPs
    name: Top Threat Client IPs
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.client_ip
    - camiliame_logs.count
    - countries.country_name
    filters:
      camiliame_logs.is_threat: 'Yes'
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 4
    col: 13
    width: 5
    height: 6
  - title: Top Threat Target URIs
    name: Top Threat Target URIs
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_request_uri_wrap
    filters:
      camiliame_logs.is_threat: 'Yes'
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 15
    col: 1
    width: 7
    height: 5
  - title: Threats Over Time
    name: Threats Over Time
    model: camilia_looker
    explore: camiliame_logs
    type: looker_line
    fields:
    - camiliame_logs.count
    - camiliame_logs.edge_start_timestamp_hour
    - camiliame_logs.edge_pathing_status
    pivots:
    - camiliame_logs.edge_pathing_status
    fill_fields:
    - camiliame_logs.edge_start_timestamp_hour
    filters:
      camiliame_logs.is_threat: 'Yes'
    sorts:
    - camiliame_logs.count desc 0
    - camiliame_logs.edge_pathing_status
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
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ctry - camiliame_logs.count
        name: ctry
        axisId: camiliame_logs.count
      - id: ip - camiliame_logs.count
        name: ip
        axisId: camiliame_logs.count
      - id: rateLimit - camiliame_logs.count
        name: rateLimit
        axisId: camiliame_logs.count
      - id: ua - camiliame_logs.count
        name: ua
        axisId: camiliame_logs.count
      - id: unknown - camiliame_logs.count
        name: unknown
        axisId: camiliame_logs.count
      - id: zl - camiliame_logs.count
        name: zl
        axisId: camiliame_logs.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 10
    col: 1
    width: 22
    height: 5
  - title: Top Threat User Agents
    name: Top Threat User Agents
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_request_user_agent
    filters:
      camiliame_logs.is_threat: 'Yes'
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 15
    col: 8
    width: 8
    height: 5
  - title: Top Pathing Statuses
    name: Top Pathing Statuses
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.edge_pathing_src
    - camiliame_logs.edge_pathing_op
    - camiliame_logs.edge_pathing_status
    - camiliame_logs.count
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 15
    col: 16
    width: 7
    height: 5
  - title: WAF Events Over Time
    name: WAF Events Over Time
    model: camilia_looker
    explore: camiliame_logs
    type: looker_area
    fields:
    - camiliame_logs.count
    - camiliame_logs.edge_start_timestamp_date
    fill_fields:
    - camiliame_logs.edge_start_timestamp_date
    filters:
      camiliame_logs.wafrule_id: "-EMPTY"
    sorts:
    - camiliame_logs.count desc
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
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: camiliame_logs.count
        name: Requests
        axisId: camiliame_logs.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 22
    col: 1
    width: 16
    height: 5
  - title: 'WAF: Top Countries'
    name: 'WAF: Top Countries'
    model: camilia_looker
    explore: camiliame_logs
    type: looker_pie
    fields:
    - camiliame_logs.count
    - countries.country_name
    filters:
      camiliame_logs.wafrule_id: "-EMPTY"
    sorts:
    - camiliame_logs.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 22
    col: 17
    width: 6
    height: 5
  - title: 'WAF: Top Hosts'
    name: 'WAF: Top Hosts'
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_request_host
    filters:
      camiliame_logs.wafrule_id: "-EMPTY"
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 27
    col: 14
    width: 4
    height: 5
  - title: 'WAF: Top User Agents'
    name: 'WAF: Top User Agents'
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.wafrule_id
    - camiliame_logs.client_request_user_agent_wrap
    filters:
      camiliame_logs.wafrule_id: "-EMPTY"
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 27
    col: 7
    width: 7
    height: 5
  - title: Top WAF Rules Triggered
    name: Top WAF Rules Triggered
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.wafrule_id
    - camiliame_logs.wafrule_message
    - camiliame_logs.count
    filters:
      camiliame_logs.wafrule_id: "-EMPTY"
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 27
    col: 1
    width: 6
    height: 5
  - title: 'WAF: Top Client IPs'
    name: 'WAF: Top Client IPs'
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_ip
    filters:
      camiliame_logs.wafrule_id: "-EMPTY"
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 27
    col: 18
    width: 5
    height: 5
  - title: Rate Limit Over Time
    name: Rate Limit Over Time
    model: camilia_looker
    explore: camiliame_logs
    type: looker_line
    fields:
    - camiliame_logs.edge_start_timestamp_date
    - camiliame_logs.edge_rate_limit_action
    - camiliame_logs.count
    pivots:
    - camiliame_logs.edge_rate_limit_action
    fill_fields:
    - camiliame_logs.edge_start_timestamp_date
    filters:
      camiliame_logs.edge_rate_limit_action: "-EMPTY"
    sorts:
    - camiliame_logs.count desc 0
    - camiliame_logs.edge_rate_limit_action
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
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ban - camiliame_logs.count
        name: ban
        axisId: camiliame_logs.count
      - id: simulate - camiliame_logs.count
        name: simulate
        axisId: camiliame_logs.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 34
    col: 1
    width: 22
    height: 5
  - title: Top Edge Rate Limit ID
    name: Top Edge Rate Limit ID
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.edge_rate_limit_id
    filters: {}
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 39
    col: 1
    width: 5
    height: 5
  - title: Top Rate Limit Actions
    name: Top Rate Limit Actions
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.edge_rate_limit_action
    filters: {}
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 39
    col: 6
    width: 5
    height: 5
  - title: Top Banned URIs
    name: Top Banned URIs
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_request_uri
    - camiliame_logs.client_request_host
    filters:
      camiliame_logs.edge_rate_limit_action: ban
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 39
    col: 17
    width: 6
    height: 5
  - title: Top Banned Client IPs
    name: Top Banned Client IPs
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_ip
    - camiliame_logs.client_request_host
    filters:
      camiliame_logs.edge_rate_limit_action: ban
    sorts:
    - camiliame_logs.count desc
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Client IP: camiliame_logs.client_ip
      Hostname: camiliame_logs.client_request_host
      Request URI: camiliame_logs.client_request_uri_wrap
      Origin Response Status: camiliame_logs.origin_response_status
      Edge Response Status: camiliame_logs.edge_response_status
      Origin IP: camiliame_logs.origin_ip
      User Agent: camiliame_logs.client_request_user_agent
    row: 39
    col: 11
    width: 6
    height: 5
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.edge_start_timestamp_hour
  - name: Device Type
    title: Device Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.client_device_type
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: countries.country_name
  - name: Client IP
    title: Client IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.client_ip
  - name: Hostname
    title: Hostname
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.client_request_host
  - name: Request URI
    title: Request URI
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.client_request_uri_wrap
  - name: Origin Response Status
    title: Origin Response Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.origin_response_status
  - name: Edge Response Status
    title: Edge Response Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.edge_response_status
  - name: Origin IP
    title: Origin IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.origin_ip
  - name: User Agent
    title: User Agent
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.client_request_user_agent
