package metadata

components: sinks: sematext_logs: {
	title:       "Sematext Logs"
	description: "[Sematext](\(urls.sematext)) is a hosted monitoring platform based on Elasticsearch. Providing powerful monitoring and management solutions to monitor and observe your apps in real-time."

	classes: {
		commonly_used: false
		delivery:      "at_least_once"
		development:   "beta"
		egress_method: "batch"
		service_providers: ["Sematext"]
	}

	features: {
		buffer: enabled:      true
		healthcheck: enabled: true
		send: {
			batch: {
				enabled:      true
				common:       false
				max_bytes:    10490000
				max_events:   null
				timeout_secs: 1
			}
			compression: enabled: false
			encoding: {
				enabled: true
				codec: enabled: false
			}
			request: {
				enabled:                    true
				in_flight_limit:            5
				rate_limit_duration_secs:   1
				rate_limit_num:             5
				retry_initial_backoff_secs: 1
				retry_max_duration_secs:    10
				timeout_secs:               60
			}
			tls: enabled: false
			to: sinks._sematext.features.send.to
		}
	}

	support: {
		platforms: {
			"aarch64-unknown-linux-gnu":  true
			"aarch64-unknown-linux-musl": true
			"x86_64-apple-darwin":        true
			"x86_64-pc-windows-msv":      true
			"x86_64-unknown-linux-gnu":   true
			"x86_64-unknown-linux-musl":  true
		}

		requirements: []
		warnings: []
		notices: []
	}

	configuration: sinks._sematext.configuration

	input: {
		logs:    true
		metrics: null
	}

	how_it_works: {
		setup: {
			title: "Setup"
			body:  """
				1. Register for a free account at [Sematext.com](\(urls.sematext_registration))

				2. [Create a Logs App](\(urls.sematext_create_logs_app)) to get a Logs Token
				for [Sematext Logs](\(urls.sematext_logsense))
				"""
		}
	}
}
