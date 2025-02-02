# encoding: UTF-8
#
# Cookbook Name:: ssh_authorized_keys
# Attributes:: default
# Author:: Xabier de Zuazo (<xabier@zuazo.org>)
# Copyright:: Copyright (c) 2015 Onddo Labs, SL.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['ssh_authorized_keys']['keytypes'] = %w(
  ecdsa-sha2-nistp256
  ecdsa-sha2-nistp384
  ecdsa-sha2-nistp521
  ssh-ed25519
  ssh-dss
  ssh-rsa
)

default['ssh_authorized_keys']['ssh_key']['validate_key'] = false
