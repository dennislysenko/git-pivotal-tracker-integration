# Git Pivotal Tracker Integration
# Copyright (c) 2013 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


require "pivotal-tracker"
require "rugged"
require "git-pivotal-tracker-integration/pivotal_configuration"

class Base
  def initialize
    @repository = Rugged::Repository.new Rugged::Repository.discover(Dir.pwd)

    configuration = PivotalConfiguration.new @repository
    PivotalTracker::Client.token = configuration.api_token
    PivotalTracker::Client.use_ssl = true
    @project = PivotalTracker::Project.find configuration.project_id
  end

  def run

  end

end
