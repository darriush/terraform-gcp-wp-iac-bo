
//Project ID Variable
variable "project_id" {
  type = string
  default = "fullstacknet"
}

//Region1 Variable
variable "region1" {
  type = string
  description = "Region1 Name"
  default = "us-central1"
}

//Region2 Variable
variable "region2" {
  type = string
  description = "Region2 Name"
  default = "asia-south1"
}

/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

###############################################################################
#                                zone variables                               #
###############################################################################

variable "domain" {
  description = "Zone domain, must end with a period."
  type        = string
  default     = "florida-burns."
}

variable "name" {
  description = "Zone name, must be unique within the project."
  type        = string
  default     = "fshcorp"
}

variable "private_visibility_config_networks" {
  description = "List of VPC self links that can see this zone."
  default     = []
  type        = list(string)
}



variable "target_name_server_addresses" {
  description = "List of target name servers for forwarding zone."
  default     = []
  type        = list(map(any))
}

variable "target_network" {
  description = "Peering network."
  default     = ""
}

variable "description" {
  description = "zone description (shown in console)"
  default     = "Managed by Terraform"
  type        = string
}

variable "type" {
  description = "Type of zone to create, valid values are 'public', 'private', 'forwarding', 'peering'."
  default     = "public"
  type        = string
}

variable "dnssec_config" {
  description = "Object containing : kind, non_existence, state. Please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone.html#dnssec_config for futhers details"
  type        = any
  default     = {}
}

variable "labels" {
  type        = map(any)
  description = "A set of key/value label pairs to assign to this ManagedZone"
  default     = {}
}

variable "default_key_specs_key" {
  description = "Object containing default key signing specifications : algorithm, key_length, key_type, kind. Please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone.html#dnssec_config for futhers details"
  type        = any
  default     = {}
}

variable "default_key_specs_zone" {
  description = "Object containing default zone signing specifications : algorithm, key_length, key_type, kind. Please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone.html#dnssec_config for futhers details"
  type        = any
  default     = {}
}

variable "force_destroy" {
  description = "Set this true to delete all records in the zone."
  default     = false
  type        = bool
}

variable "network_self_links" {
  description = "Self link of the network that will be allowed to query the zone."
  default     = []
}



###############################################################################
#                               record variables                              #
###############################################################################

variable "recordsets" {
  type = list(object({
    name    = string
    type    = string
    ttl     = number
    records = list(string)
  }))
  description = "List of DNS record objects to manage, in the standard terraform dns structure."
  default     = []
}


variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "namespace" {
  type    = string
  default = "floridaburns"
}



//SQL Database Root Password
variable "root_pass" {
    type = string
    description = "Root Password For SQL Database"
    default = "toor"
}

//SQL Database Name
variable "database" {
    type = string
    description = "SQL Database Name"
    default = "wpdb"
}

//SQL Database User
variable "db_user" {
    type = string
    description = "SQL Database User Name"
    default = "wpuser"
}

//SQL Databse User Password
variable "db_user_pass" {
    type = string
    description = "Passowrd for SQL Database User"
    default = "wppass"
}
