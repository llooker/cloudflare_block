- dashboard: snapshot_cloudflare
  title: Snapshot Cloudflare
  layout: newspaper
  elements:
  - name: Web Traffic Overview
    type: text
    title_text: Web Traffic Overview
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 5
    width: 18
    height: 2
  - name: Web Traffic Types
    type: text
    title_text: Web Traffic Types
    subtitle_text: Get insight into the various types of traffic and content
    row: 10
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
  - name: Top IPs, User Agents and Traffic Type
    type: text
    title_text: Top IPs, User Agents and Traffic Type
    row: 22
    col: 1
    width: 22
    height: 2
  - title: Total Number of Requests
    name: Total Number of Requests
    model: camilia_looker
    explore: camiliame_logs
    type: single_value
    fields:
    - camiliame_logs.count
    filters: {}
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
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 2
    col: 1
    width: 5
    height: 2
  - title: Total Bandwidth
    name: Total Bandwidth
    model: camilia_looker
    explore: camiliame_logs
    type: single_value
    fields:
    - camiliame_logs.total_bandwidth
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    colors:
    - "#265780"
    - "#D98541"
    - "#C53DCC"
    - "#33992E"
    - "#36B38D"
    - "#A2BF39"
    - "#5A3DCC"
    - "#8a0f3d"
    - "#ff7aa3"
    - "#2d89bd"
    - "#8f09b0"
    - "#d94141"
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      200 - camiliame_logs.count: "#26802a"
      403 - camiliame_logs.count: "#992e68"
      404 - camiliame_logs.count: "#a936b3"
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 2
    col: 6
    width: 5
    height: 2
  - title: Saved Bandwidth
    name: Saved Bandwidth
    model: camilia_looker
    explore: camiliame_logs
    type: single_value
    fields:
    - camiliame_logs.saved_bandwidth_percentage
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 2
    col: 15
    width: 4
    height: 2
  - title: Cached Bandwidth
    name: Cached Bandwidth
    model: camilia_looker
    explore: camiliame_logs
    type: single_value
    fields:
    - camiliame_logs.saved_bandwidth
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    colors:
    - "#265780"
    - "#D98541"
    - "#C53DCC"
    - "#33992E"
    - "#36B38D"
    - "#A2BF39"
    - "#5A3DCC"
    - "#8a0f3d"
    - "#ff7aa3"
    - "#2d89bd"
    - "#8f09b0"
    - "#d94141"
    show_value_labels: true
    label_density: 25
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      200 - camiliame_logs.count: "#26802a"
      403 - camiliame_logs.count: "#992e68"
      404 - camiliame_logs.count: "#a936b3"
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 2
    col: 11
    width: 4
    height: 2
  - title: Top Traffic Countries Map
    name: Top Traffic Countries Map
    model: camilia_looker
    explore: camiliame_logs
    type: looker_map
    fields:
    - camiliame_logs.client_country_code
    - camiliame_logs.count
    filters: {}
    sorts:
    - camiliame_logs.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
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
    map_value_scale_clamp_max: 10000
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 4
    col: 1
    width: 8
    height: 6
  - title: Traffic Type
    name: Traffic Type
    model: camilia_looker
    explore: camiliame_logs
    type: looker_pie
    fields:
    - camiliame_logs.client_device_type
    - camiliame_logs.count
    filters:
      camiliame_logs.edge_start_timestamp_date: 24 hours
    sorts:
    - camiliame_logs.count desc
    - camiliame_logs.client_device_type
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
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: desktop - camiliame_logs.count
        name: desktop
        axisId: camiliame_logs.count
      - id: mobile - camiliame_logs.count
        name: mobile
        axisId: camiliame_logs.count
      showLabels: false
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 12
    col: 1
    width: 6
    height: 4
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
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 2
    col: 19
    width: 4
    height: 2
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
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 4
    col: 16
    width: 7
    height: 6
  - title: HTTP Protocols
    name: HTTP Protocols
    model: camilia_looker
    explore: camiliame_logs
    type: looker_pie
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_request_protocol
    filters:
      camiliame_logs.edge_start_timestamp_date: 24 hours
    sorts:
    - camiliame_logs.count desc
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
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: desktop - camiliame_logs.count
        name: desktop
        axisId: camiliame_logs.count
      - id: mobile - camiliame_logs.count
        name: mobile
        axisId: camiliame_logs.count
      showLabels: false
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 12
    col: 7
    width: 5
    height: 4
  - title: Top Traffic Countries
    name: Top Traffic Countries
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - countries.country_name
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
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 4
    col: 9
    width: 7
    height: 6
  - title: Request Methods
    name: Request Methods
    model: camilia_looker
    explore: camiliame_logs
    type: looker_pie
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_request_method
    filters:
      camiliame_logs.edge_start_timestamp_date: 24 hours
    sorts:
    - camiliame_logs.count desc
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
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: desktop - camiliame_logs.count
        name: desktop
        axisId: camiliame_logs.count
      - id: mobile - camiliame_logs.count
        name: mobile
        axisId: camiliame_logs.count
      showLabels: false
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
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 12
    col: 12
    width: 5
    height: 4
  - title: Content Type
    name: Content Type
    model: camilia_looker
    explore: camiliame_logs
    type: looker_pie
    fields:
    - camiliame_logs.count
    - camiliame_logs.edge_response_content_type_group
    filters: {}
    sorts:
    - camiliame_logs.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    listen:
      Date: camiliame_logs.edge_start_timestamp_hour
      Device Type: camiliame_logs.client_device_type
      Country: countries.country_name
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 12
    col: 17
    width: 6
    height: 4
  - title: Top Requested URI
    name: Top Requested URI
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_request_uri_wrap
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
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 16
    col: 1
    width: 11
    height: 6
  - title: Top Traffic IPs
    name: Top Traffic IPs
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.client_ip
    - camiliame_logs.count
    - countries.country_name
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
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 24
    col: 7
    width: 7
    height: 6
  - title: Top Referer
    name: Top Referer
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_request_referer_wrap
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
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 16
    col: 12
    width: 11
    height: 6
  - title: Top Traffic Type
    name: Top Traffic Type
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_ipclass
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
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 24
    col: 1
    width: 6
    height: 6
  - title: Top User Agents
    name: Top User Agents
    model: camilia_looker
    explore: camiliame_logs
    type: table
    fields:
    - camiliame_logs.count
    - camiliame_logs.client_request_user_agent_wrap
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
      Hostname: camiliame_logs.client_request_host
      IP address: camiliame_logs.client_ip
      User Agent: camiliame_logs.client_request_user_agent
      Edge Response Status: camiliame_logs.edge_response_status
      Origin Response Code: camiliame_logs.origin_response_status
      Request URI: camiliame_logs.client_request_uri
    row: 24
    col: 14
    width: 9
    height: 6
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
  - name: IP address
    title: IP address
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.client_ip
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
  - name: Origin Response Code
    title: Origin Response Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.origin_response_status
  - name: Request URI
    title: Request URI
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: camilia_looker
    explore: camiliame_logs
    listens_to_filters: []
    field: camiliame_logs.client_request_uri
