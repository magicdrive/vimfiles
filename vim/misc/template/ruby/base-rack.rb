#! /usr/bin/env rackup
# frozen_string_literal: true

class RackApp
  def call env
    [200,
     {"Content-Type" => "text/plain"},
     ["hello, RackApplication!!"]
    ]
  end
end

run RackApp.new
