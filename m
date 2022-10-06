Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E045F6B0C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 17:53:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjwvK3Qk6z3cB8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 02:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DxaJ7TEm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DxaJ7TEm;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjwtK4Yv6z3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 02:52:09 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296EpkG5037827;
	Thu, 6 Oct 2022 15:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5uREJMuHsVWvW8yX1zTPKyS7MmsQg9u3W7cEcMD29MA=;
 b=DxaJ7TEm7SSCjq13qJ4iQNPXmpv0Dpo5XzINQnIlrkJbDR3g16BMhw56Pw30qEd4o2yZ
 rAeumf3FlZJq4hacb0hNERqTa0i7CEVYlLXfNn2//pdL6bNCAdZOWwMsR8wHUvU4lDka
 Guk2rMxD8Lo9CTQ23Hn9bHmycmbTn6eL+11h7mqydSV1Exk9dqHct25+NL3l/N2+jgT6
 Er523LBHsmlo7BoDwoaMZo9i3P9b7SwTjcOCJC3NUky01J38in52GVft2zsaFLBnn1J6
 8qGbaAINuiWhtD1cnXUBXtBjdXQ2KLnKos/vWrW3oGEXXCTq27FxUc9GDkv4XlKV2qkH cQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k215g237q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 15:52:01 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 296FoKSk005521;
	Thu, 6 Oct 2022 15:51:59 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3jxd697bf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 15:51:59 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 296FpuiM63832320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 15:51:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A1B14203F;
	Thu,  6 Oct 2022 15:51:56 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FACD42042;
	Thu,  6 Oct 2022 15:51:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.108.68])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  6 Oct 2022 15:51:53 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH 2/2] tools/perf/tests/shell: Update stat+json_output.sh to include sanity check for topology
Date: Thu,  6 Oct 2022 21:21:49 +0530
Message-Id: <20221006155149.67205-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221006155149.67205-1-atrajeev@linux.vnet.ibm.com>
References: <20221006155149.67205-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9HxrfL4R0TBFaAsOHJn3ELnwJqDY64rO
X-Proofpoint-GUID: 9HxrfL4R0TBFaAsOHJn3ELnwJqDY64rO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_04,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060089
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Testcase stat+json_output.sh fails in powerpc:

	86: perf stat JSON output linter : FAILED!

The testcase "stat+json_output.sh" verifies perf stat
JSON output. The test covers aggregation modes like
per-socket, per-core, per-die, -A (no_aggr mode) along
with few other tests. It counts expected fields for
various commands. For example say -A (i.e, AGGR_NONE
mode), expects 7 fields in the output having "CPU" as
first field. Same way, for per-socket, it expects the
first field in result to point to socket id. The testcases
compares the result with expected count.

The values for socket, die, core and cpu are fetched
from topology directory:
/sys/devices/system/cpu/cpu*/topology.
For example, socket value is fetched from
"physical_package_id" file of topology directory.
(cpu__get_topology_int() in util/cpumap.c)

If a platform fails to fetch the topology information,
values will be set to -1. For example, incase of pSeries
platform of powerpc, value for  "physical_package_id" is
restricted and not exposed. So, -1 will be assigned.

Perf code has a checks for valid cpu id in "aggr_printout"
(stat-display.c), which displays the fields. So, in cases
where topology values not exposed, first field of the
output displaying will be empty. This cause the testcase
to fail, as it counts  number of fields in the output.

Incase of -A (AGGR_NONE mode,), testcase expects 7 fields
in the output, becos of -1 value obtained from topology
files for some, only 6 fields are printed. Hence a testcase
failure reported due to mismatch in number of fields in
the output.

Patch here adds a sanity check in the testcase for topology.
Check will help to skip the test if -1 value found.

Fixes: 0c343af2a2f8 ("perf test: JSON format checking")
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Suggested-by: James Clark <james.clark@arm.com>
Suggested-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/stat+json_output.sh | 43 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/stat+json_output.sh b/tools/perf/tests/shell/stat+json_output.sh
index ea8714a36051..2c4212c641ed 100755
--- a/tools/perf/tests/shell/stat+json_output.sh
+++ b/tools/perf/tests/shell/stat+json_output.sh
@@ -6,6 +6,8 @@
 
 set -e
 
+skip_test=0
+
 pythonchecker=$(dirname $0)/lib/perf_json_output_lint.py
 if [ "x$PYTHON" == "x" ]
 then
@@ -134,14 +136,47 @@ check_per_socket()
 	echo "[Success]"
 }
 
+# The perf stat options for per-socket, per-core, per-die
+# and -A ( no_aggr mode ) uses the info fetched from this
+# directory: "/sys/devices/system/cpu/cpu*/topology". For
+# example, socket value is fetched from "physical_package_id"
+# file in topology directory.
+# Reference: cpu__get_topology_int in util/cpumap.c
+# If the platform doesn't expose topology information, values
+# will be set to -1. For example, incase of pSeries platform
+# of powerpc, value for  "physical_package_id" is restricted
+# and set to -1. Check here validates the socket-id read from
+# topology file before proceeding further
+
+FILE_LOC="/sys/devices/system/cpu/cpu*/topology/"
+FILE_NAME="physical_package_id"
+
+check_for_topology()
+{
+	if ! ParanoidAndNotRoot 0
+	then
+		socket_file=`ls $FILE_LOC/$FILE_NAME | head -n 1`
+		[ -z $socket_file ] && return 0
+		socket_id=`cat $socket_file`
+		[ $socket_id == -1 ] && skip_test=1
+		return 0
+	fi
+}
+
+check_for_topology
 check_no_args
 check_system_wide
-check_system_wide_no_aggr
 check_interval
 check_event
-check_per_core
 check_per_thread
-check_per_die
 check_per_node
-check_per_socket
+if [ $skip_test -ne 1 ]
+then
+	check_system_wide_no_aggr
+	check_per_core
+	check_per_die
+	check_per_socket
+else
+	echo "[Skip] Skipping tests for system_wide_no_aggr, per_core, per_die and per_socket since socket id exposed via topology is invalid"
+fi
 exit 0
-- 
2.31.1

