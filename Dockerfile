# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations

FROM ibmcom/db2express-c:10.5.0.5-3.10.0

MAINTAINER Luciano Resende <lresende@apache.org>

RUN su - db2inst1 -c "db2start && db2set DB2COMM=TCPIP && db2 update dbm cfg using INSTANCE_MEMORY AUTOMATIC" \
 && su - db2inst1 -c "db2stop force"

RUN su - db2inst1 -c "db2start && /home/db2inst1/sqllib/bin/db2 CREATE DATABASE foo" 

ENTRYPOINT ["/entrypoint.sh"]
