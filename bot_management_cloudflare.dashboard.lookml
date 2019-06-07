- dashboard: bot_management_cloudflare
  title: Bot Management Cloudflare
  layout: newspaper
  elements:
  - name: Bad Bots
    type: text
    title_text: Bad Bots
    row: 0
    col: 16
    width: 7
    height: 2
  - name: <img src="https://www.cloudflare.com/img/logo-cloudflare-dark.svg">
    type: text
    title_text: <img src="https://www.cloudflare.com/img/logo-cloudflare-dark.svg">
    row: 0
    col: 1
    width: 4
    height: 2
  - title: Bad Bots - Top IPs - AS Number - Country
    name: Bad Bots - Top IPs - AS Number - Country
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_ip, cloudflare_logs.client_asn, countries.country_name,
      cloudflare_logs.bad_bot_count]
    filters:
      cloudflare_logs.bad_bot_count: not 0
    sorts: [cloudflare_logs.bad_bot_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, custom: {
            id: 748995a5-96c2-bbb5-e5f1-1c0f40d1b267, label: Custom, type: continuous,
            stops: [{color: "#FFCCCC", offset: 0}, {color: "#FF6666", offset: 100}]},
          options: {steps: 5, reverse: false}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 9
    col: 16
    width: 7
    height: 4
  - title: Bad Bots - Top Requested URIs
    name: Bad Bots - Top Requested URIs
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_uri_wrap, cloudflare_logs.bad_bot_count]
    filters:
      cloudflare_logs.bad_bot_count: not 0
    sorts: [cloudflare_logs.bad_bot_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, custom: {
            id: 9667199d-55f8-afdf-820b-3283410cc52d, label: Custom, type: continuous,
            stops: [{color: "#FFCCCC", offset: 0}, {color: "#F36254", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 13
    col: 16
    width: 7
    height: 4
  - title: Bad Bots Top Requested User Agents
    name: Bad Bots Top Requested User Agents
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_user_agent_wrap, cloudflare_logs.bad_bot_count]
    filters:
      cloudflare_logs.bad_bot_count: not 0
    sorts: [cloudflare_logs.bad_bot_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, custom: {
            id: ecefef80-4726-70e9-f9c6-b6a4e1c5a4be, label: Custom, type: continuous,
            stops: [{color: "#FFCCCC", offset: 0}, {color: "#F36254", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 17
    col: 16
    width: 7
    height: 4
  - title: Total Number of requests
    name: Total Number of requests
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.count]
    filters:
      cloudflare_logs.client_country_code: ''
      cloudflare_logs.origin_ip: ''
    sorts: [cloudflare_logs.count desc]
    limit: 500
    column_limit: 50
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
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 1
    width: 8
    height: 2
  - title: Top Requested URIs
    name: Top Requested URIs
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.client_request_uri_wrap]
    filters: {}
    sorts: [cloudflare_logs.count desc]
    limit: 500
    column_limit: 50
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
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 13
    col: 1
    width: 8
    height: 4
  - title: Top IPs - AS Number - Country
    name: Top IPs - AS Number - Country
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_ip, cloudflare_logs.client_asn, countries.country_name,
      cloudflare_logs.count]
    filters: {}
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
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 9
    col: 1
    width: 8
    height: 4
  - title: Top Requested User Agents
    name: Top Requested User Agents
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.count, cloudflare_logs.client_request_user_agent_wrap]
    filters: {}
    sorts: [cloudflare_logs.count desc]
    limit: 500
    column_limit: 50
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
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 17
    col: 1
    width: 8
    height: 4
  - name: Global Traffic
    type: text
    title_text: Global Traffic
    row: 0
    col: 5
    width: 4
    height: 2
  - title: Bad Bots
    name: Bad Bots
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.bad_bot_count]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#ff6666"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 16
    width: 7
    height: 2
  - name: CAPTCHAs Solved
    type: text
    title_text: CAPTCHAs Solved
    row: 0
    col: 9
    width: 7
    height: 2
  - title: CAPTCHAs Solved
    name: CAPTCHAs Solved
    model: cloudflare_looker
    explore: cloudflare_logs
    type: single_value
    fields: [cloudflare_logs.captha_solved_count]
    limit: 500
    column_limit: 50
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
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 2
    col: 9
    width: 7
    height: 2
  - title: CAPTCHAs Solved - Top IPs - AS Number - Country
    name: CAPTCHAs Solved - Top IPs - AS Number - Country
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_ip, cloudflare_logs.client_asn, countries.country_name,
      cloudflare_logs.captha_solved_count]
    filters:
      cloudflare_logs.captha_solved_count: not 0
    sorts: [cloudflare_logs.captha_solved_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential2,
          options: {steps: 5, reverse: false}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 9
    col: 9
    width: 7
    height: 4
  - title: CAPTCHAs Solved - Top Requested URIs
    name: CAPTCHAs Solved - Top Requested URIs
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_uri_wrap, cloudflare_logs.captha_solved_count]
    filters:
      cloudflare_logs.captha_solved_count: not 0
    sorts: [cloudflare_logs.captha_solved_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential2,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 13
    col: 9
    width: 7
    height: 4
  - title: CAPTCHAs Solved - Top Requested User Agents
    name: CAPTCHAs Solved - Top Requested User Agents
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_user_agent_wrap, cloudflare_logs.captha_solved_count]
    filters:
      cloudflare_logs.captha_solved_count: not 0
    sorts: [cloudflare_logs.client_request_user_agent_wrap]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential2,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 17
    col: 9
    width: 7
    height: 4
  - title: Bad Bots -. Top Referer
    name: Bad Bots -. Top Referer
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.bad_bot_count, cloudflare_logs.client_request_referer_wrap]
    filters:
      cloudflare_logs.bad_bot_count: not 0
    sorts: [cloudflare_logs.bad_bot_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, custom: {
            id: ecefef80-4726-70e9-f9c6-b6a4e1c5a4be, label: Custom, type: continuous,
            stops: [{color: "#FFCCCC", offset: 0}, {color: "#F36254", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 21
    col: 16
    width: 7
    height: 5
  - title: CAPTCHAs Solved - Top Referer
    name: CAPTCHAs Solved - Top Referer
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_referer_wrap, cloudflare_logs.captha_solved_count]
    filters:
      cloudflare_logs.captha_solved_count: not 0
    sorts: [cloudflare_logs.client_request_referer_wrap]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: legacy
      palette_id: looker_classic
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential2,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 21
    col: 9
    width: 7
    height: 5
  - title: Top Referer
    name: Top Referer
    model: cloudflare_looker
    explore: cloudflare_logs
    type: table
    fields: [cloudflare_logs.client_request_referer_wrap, cloudflare_logs.count]
    filters: {}
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
    series_labels: {}
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, custom: {
            id: ecefef80-4726-70e9-f9c6-b6a4e1c5a4be, label: Custom, type: continuous,
            stops: [{color: "#FFCCCC", offset: 0}, {color: "#F36254", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 21
    col: 1
    width: 8
    height: 5
  - title: Total Requests vs Bad Bots Over Time
    name: Total Requests vs Bad Bots Over Time
    model: cloudflare_looker
    explore: cloudflare_logs
    type: looker_area
    fields: [cloudflare_logs.bad_bot_count, cloudflare_logs.count, cloudflare_logs.edge_start_timestamp_hour]
    fill_fields: [cloudflare_logs.edge_start_timestamp_hour]
    filters:
      cloudflare_logs.edge_start_timestamp_minute: 2 weeks
    sorts: [cloudflare_logs.edge_start_timestamp_hour desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      cloudflare_logs.bad_bot_count: "#e31a1c"
      cloudflare_logs.count: "#1ea8df"
    series_labels:
      cloudflare_logs.bad_bot_count: Bad Bots
      cloudflare_logs.count: Total Requests
    series_types: {}
    limit_displayed_rows: false
    y_axes: []
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
    custom_color_enabled: true
    custom_color: "#ff6666"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    listen:
      Date: cloudflare_logs.edge_start_timestamp_hour
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
      RayID: cloudflare_logs.ray_id
      Worker Subrequest: cloudflare_logs.worker_subrequest
      Client Request Method: cloudflare_logs.client_request_method
    row: 4
    col: 1
    width: 15
    height: 5
  - title: "% Bad Bots vs Humans&Good Bots"
    name: "% Bad Bots vs Humans&Good Bots"
    model: cloudflare_looker
    explore: cloudflare_logs
    type: FillGauge
    fields: [cloudflare_logs.bad_bot_count, cloudflare_logs.count]
    sorts: [percent_of_total desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: percent_of_total, label: Percent of Total,
        expression: "${cloudflare_logs.bad_bot_count}/${cloudflare_logs.count}*100",
        value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    showComparison: false
    minValue: 0
    maxValue: 100
    circleThickness: 0.05
    circleFillGap: 0.05
    circleColor: "#268cc9"
    waveHeight: 0.05
    waveCount: 1
    waveRiseTime: 1000
    waveAnimateTime: 1800
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#cf1f2b"
    waveOffset: 0
    textVertPosition: 0.5
    textSize: 1
    valueCountUp: true
    displayPercent: false
    textColor: "#000000"
    waveTextColor: "#fffbf8"
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    series_colors:
      cloudflare_logs.bad_bot_count: "#d94141"
      cloudflare_logs.count: "#1ea8df"
      'Yes': "#e31a1c"
      'No': "#33a02c"
    series_labels:
      cloudflare_logs.bad_bot_count: Bad Bots
      'No': Humans & Good Bots
      'Yes': Bad Bots
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: []
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
    custom_color_enabled: true
    custom_color: "#ff6666"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [cloudflare_logs.count, cloudflare_logs.bad_bot_count]
    listen:
      Date: cloudflare_logs.edge_start_timestamp_minute
      Device Type: cloudflare_logs.client_device_type
      Country: countries.country_name
      Hostname: cloudflare_logs.client_request_host
      IP address: cloudflare_logs.client_ip
      User Agent: cloudflare_logs.client_request_user_agent
      Edge Response Status: cloudflare_logs.edge_response_status
      Origin Response Code: cloudflare_logs.origin_response_status
      Request URI: cloudflare_logs.client_request_uri
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
    field: cloudflare_logs.edge_start_timestamp_minute
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
  - name: IP address
    title: IP address
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.client_ip
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
  - name: Origin Response Code
    title: Origin Response Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cloudflare_looker
    explore: cloudflare_logs
    listens_to_filters: []
    field: cloudflare_logs.origin_response_status
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
