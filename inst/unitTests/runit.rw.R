#
# Copyright (c) 2016 by ? (email to opensource@fb.com to confirm personal or fb)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

test.rw <- function() {
  out.file <- tempfile()
  writer <-FstrmWriter$new(out.file, "hello:binformat")
  writer$filename
  checkEquals(writer$content.type, "hello:binformat")
  writer$write(charToRaw("0123456789"))
  writer$write(charToRaw("0123456789"))
  rm(writer)
  gc()
  
  reader <- FstrmReader$new(out.file, "hello:binformat")
  checkEquals(rawToChar(reader$readOne()), "0123456789")
  checkEquals(rawToChar(reader$readOne()), "0123456789")
}
