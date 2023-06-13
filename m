Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDA272E97A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 19:24:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SGXWL/WM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgb5c5Prgz30PV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:24:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SGXWL/WM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgb4k2FcDz301c
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 03:23:49 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGi0PG031970;
	Tue, 13 Jun 2023 17:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mnMy0ZfoN9X2pgmIV0QzJ2aP0Jdndpg4O8NDuRs92UQ=;
 b=SGXWL/WM3Vy8YmdhFnpXrPTxtDNwWw0k6lalE16PSN+Au+8yY15yS3EAbD/2KxVPtyLj
 M4eANGJprUR6fl9MhWMW2dXb+J72tLQdSKl0f7AOaFqySmATl0OAsegbXLZrqvaN1Cgh
 3y1t5qu/Gfo9vTktCOZ7Q7hrvfgyeWjRRBxi1nFoea6qpoFEcfrMKUvlDDwpbTwwlJBX
 3l3RBwkfbY/9DxfIxFs6gMxDFS1UQrQNa5R532yGQr3tvWdFozNM3QkaC+X5CtkQWp+w
 MW5OqY5awP05Zit7g3eZwZmA3qayfL9tjhx0DV7KIROyjzg9GxfGXT/2Adbf28XVd9f5 +w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6uues5fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:04:46 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DGu7qs018153;
	Tue, 13 Jun 2023 17:04:44 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6uues59r-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:04:44 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D9HtPi009704;
	Tue, 13 Jun 2023 16:42:24 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee2a71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:42:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGgLoT21758482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:42:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 515542004B;
	Tue, 13 Jun 2023 16:42:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C33820040;
	Tue, 13 Jun 2023 16:42:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:42:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 04/17] tools/perf/tests: fix shellcheck warnings for daemon.sh
Date: Tue, 13 Jun 2023 22:11:32 +0530
Message-Id: <20230613164145.50488-5-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GAqsagWrI0123ARKH5U_HcvUVkSqdzpY
X-Proofpoint-ORIG-GUID: iP_628-Jre7iaTtSgLRFmxPgsQj_Yld6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130151
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
Cc: atrajeev@linux.vnet.ibm.com, Shirisha G <shirisha@linux.ibm.com>, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Shirisha G <shirisha@linux.ibm.com>

Running shellcheck -S on daemon.sh throws below warnings:

Result from shellcheck:
     # shellcheck -S warning daemon.sh
     local line_name=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $2 }'`
           ^-------^ SC2155: Declare and assign separately to avoid masking return values.

     trap "echo 'FAILED: Signal caught'; daemon_exit ${config}; exit 1" SIGINT SIGTERM
                                                     ^-------^ SC2064: Use single quotes, otherwise this expands now rather than when signalled.

     count=`ls ${base}/session-test/ | grep perf.data | wc -l`
            ^-- SC2010: Don't use ls | grep. Use a glob or a for loop with a condition to allow non-alphanumeric filenames.

     if [ ${size} != "OK" -o ${type} != "OK" ]; then
                          ^-- SC2166: Prefer [ p ] || [ q ] as [ p -o q ] is not well defined.

Fixed above warnings by:
   - declaring and assigning local variables separately
   - To fix SC2010, instead of using "ls | grep", used glob to allow non-alphanumeric filenames
   - Used single quotes to prevent expanding.

Result from shellcheck after patch changes:
     $ shellcheck -S warning daemon.sh
     $ echo $?
       0

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Shirisha G <shirisha@linux.ibm.com>
---
 tools/perf/tests/shell/daemon.sh | 113 ++++++++++++++++++++-----------
 1 file changed, 75 insertions(+), 38 deletions(-)

diff --git a/tools/perf/tests/shell/daemon.sh b/tools/perf/tests/shell/daemon.sh
index 45fc24af5b07..aaf3849353e8 100755
--- a/tools/perf/tests/shell/daemon.sh
+++ b/tools/perf/tests/shell/daemon.sh
@@ -11,11 +11,16 @@ check_line_first()
 	local lock=$5
 	local up=$6
 
-	local line_name=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $2 }'`
-	local line_base=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $3 }'`
-	local line_output=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $4 }'`
-	local line_lock=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $5 }'`
-	local line_up=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $6 }'`
+	local line_name
+	line_name=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $2 }'`
+	local line_base
+	line_base=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $3 }'`
+	local line_output
+	line_output=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $4 }'`
+	local line_lock
+	line_lock=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $5 }'`
+	local line_up
+	line_up=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $6 }'`
 
 	if [ "${name}" != "${line_name}" ]; then
 		echo "FAILED: wrong name"
@@ -54,13 +59,20 @@ check_line_other()
 	local ack=$7
 	local up=$8
 
-	local line_name=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $2 }'`
-	local line_run=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $3 }'`
-	local line_base=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $4 }'`
-	local line_output=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $5 }'`
-	local line_control=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $6 }'`
-	local line_ack=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $7 }'`
-	local line_up=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $8 }'`
+	local line_name
+	line_name=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $2 }'`
+	local line_run
+	line_run=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $3 }'`
+	local line_base
+	line_base=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $4 }'`
+	local line_output
+	line_output=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $5 }'`
+	local line_control
+	line_control=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $6 }'`
+	local line_ack
+	line_ack=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $7 }'`
+	local line_up
+	line_up=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $8 }'`
 
 	if [ "${name}" != "${line_name}" ]; then
 		echo "FAILED: wrong name"
@@ -102,8 +114,10 @@ daemon_exit()
 {
 	local config=$1
 
-	local line=`perf daemon --config ${config} -x: | head -1`
-	local pid=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $1 }'`
+	local line
+	line=`perf daemon --config ${config} -x: | head -1`
+	local pid
+	pid=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $1 }'`
 
 	# Reset trap handler.
 	trap - SIGINT SIGTERM
@@ -123,7 +137,7 @@ daemon_start()
 	perf daemon start --config ${config}
 
 	# Clean up daemon if interrupted.
-	trap "echo 'FAILED: Signal caught'; daemon_exit ${config}; exit 1" SIGINT SIGTERM
+	trap 'echo "FAILED: Signal caught"; daemon_exit "${config}"; exit 1' SIGINT SIGTERM
 
 	# wait for the session to ping
 	local state="FAIL"
@@ -144,8 +158,10 @@ test_list()
 {
 	echo "test daemon list"
 
-	local config=$(mktemp /tmp/perf.daemon.config.XXX)
-	local base=$(mktemp -d /tmp/perf.daemon.base.XXX)
+	local config
+	config=$(mktemp /tmp/perf.daemon.config.XXX)
+	local base
+	base=$(mktemp -d /tmp/perf.daemon.base.XXX)
 
 	cat <<EOF > ${config}
 [daemon]
@@ -165,19 +181,22 @@ EOF
 
 	# check first line
 	# pid:daemon:base:base/output:base/lock
-	local line=`perf daemon --config ${config} -x: | head -1`
+	local line
+	line=`perf daemon --config ${config} -x: | head -1`
 	check_line_first ${line} daemon ${base} ${base}/output ${base}/lock "0"
 
 	# check 1st session
 	# pid:size:-e cpu-clock:base/size:base/size/output:base/size/control:base/size/ack:0
-	local line=`perf daemon --config ${config} -x: | head -2 | tail -1`
+	local line
+	line=`perf daemon --config ${config} -x: | head -2 | tail -1`
 	check_line_other "${line}" size "-e cpu-clock -m 1 sleep 10" ${base}/session-size \
 			 ${base}/session-size/output ${base}/session-size/control \
 			 ${base}/session-size/ack "0"
 
 	# check 2nd session
 	# pid:time:-e task-clock:base/time:base/time/output:base/time/control:base/time/ack:0
-	local line=`perf daemon --config ${config} -x: | head -3 | tail -1`
+	local line
+	line=`perf daemon --config ${config} -x: | head -3 | tail -1`
 	check_line_other "${line}" time "-e task-clock -m 1 sleep 10" ${base}/session-time \
 			 ${base}/session-time/output ${base}/session-time/control \
 			 ${base}/session-time/ack "0"
@@ -193,8 +212,10 @@ test_reconfig()
 {
 	echo "test daemon reconfig"
 
-	local config=$(mktemp /tmp/perf.daemon.config.XXX)
-	local base=$(mktemp -d /tmp/perf.daemon.base.XXX)
+	local config
+	config=$(mktemp /tmp/perf.daemon.config.XXX)
+	local base
+	base=$(mktemp -d /tmp/perf.daemon.base.XXX)
 
 	# prepare config
 	cat <<EOF > ${config}
@@ -215,10 +236,12 @@ EOF
 
 	# check 2nd session
 	# pid:time:-e task-clock:base/time:base/time/output:base/time/control:base/time/ack:0
-	local line=`perf daemon --config ${config} -x: | head -3 | tail -1`
+	local line
+	line=`perf daemon --config ${config} -x: | head -3 | tail -1`
 	check_line_other "${line}" time "-e task-clock -m 1 sleep 10" ${base}/session-time \
 			 ${base}/session-time/output ${base}/session-time/control ${base}/session-time/ack "0"
-	local pid=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $1 }'`
+	local pid
+	pid=`echo "${line}" | awk 'BEGIN { FS = ":" } ; { print $1 }'`
 
 	# prepare new config
 	local config_new=${config}.new
@@ -249,7 +272,8 @@ EOF
 
 	# check reconfigured 2nd session
 	# pid:time:-e task-clock:base/time:base/time/output:base/time/control:base/time/ack:0
-	local line=`perf daemon --config ${config} -x: | head -3 | tail -1`
+	local line
+	line=`perf daemon --config ${config} -x: | head -3 | tail -1`
 	check_line_other "${line}" time "-e cpu-clock -m 1 sleep 10" ${base}/session-time \
 			 ${base}/session-time/output ${base}/session-time/control ${base}/session-time/ack "0"
 
@@ -276,7 +300,8 @@ EOF
 		state=`perf daemon ping --config ${config} --session size | awk '{ print $1 }'`
 	done
 
-	local one=`perf daemon --config ${config} -x: | wc -l`
+	local one
+	one=`perf daemon --config ${config} -x: | wc -l`
 
 	if [ ${one} -ne "1" ]; then
 		echo "FAILED: wrong list output"
@@ -312,8 +337,10 @@ test_stop()
 {
 	echo "test daemon stop"
 
-	local config=$(mktemp /tmp/perf.daemon.config.XXX)
-	local base=$(mktemp -d /tmp/perf.daemon.base.XXX)
+	local config
+	config=$(mktemp /tmp/perf.daemon.config.XXX)
+	local base
+	base=$(mktemp -d /tmp/perf.daemon.base.XXX)
 
 	# prepare config
 	cat <<EOF > ${config}
@@ -332,8 +359,12 @@ EOF
 	# start daemon
 	daemon_start ${config} size
 
-	local pid_size=`perf daemon --config ${config} -x: | head -2 | tail -1 | awk 'BEGIN { FS = ":" } ; { print $1 }'`
-	local pid_time=`perf daemon --config ${config} -x: | head -3 | tail -1 | awk 'BEGIN { FS = ":" } ; { print $1 }'`
+	local pid_size
+	pid_size=`perf daemon --config ${config} -x: | head -2 | tail -1 |
+		  awk 'BEGIN { FS = ":" } ; { print $1 }'`
+	local pid_time
+	pid_time=`perf daemon --config ${config} -x: | head -3 | tail -1 |
+		  awk 'BEGIN { FS = ":" } ; { print $1 }'`
 
 	# check that sessions are running
 	if [ ! -d "/proc/${pid_size}" ]; then
@@ -364,8 +395,10 @@ test_signal()
 {
 	echo "test daemon signal"
 
-	local config=$(mktemp /tmp/perf.daemon.config.XXX)
-	local base=$(mktemp -d /tmp/perf.daemon.base.XXX)
+	local config
+	config=$(mktemp /tmp/perf.daemon.config.XXX)
+	local base
+	base=$(mktemp -d /tmp/perf.daemon.base.XXX)
 
 	# prepare config
 	cat <<EOF > ${config}
@@ -389,7 +422,7 @@ EOF
 	daemon_exit ${config}
 
 	# count is 2 perf.data for signals and 1 for perf record finished
-	count=`ls ${base}/session-test/ | grep perf.data | wc -l`
+	count=`ls ${base}/session-test/*perf.data* | wc -l`
 	if [ ${count} -ne 3 ]; then
 		error=1
 		echo "FAILED: perf data no generated"
@@ -403,8 +436,10 @@ test_ping()
 {
 	echo "test daemon ping"
 
-	local config=$(mktemp /tmp/perf.daemon.config.XXX)
-	local base=$(mktemp -d /tmp/perf.daemon.base.XXX)
+	local config
+	config=$(mktemp /tmp/perf.daemon.config.XXX)
+	local base
+	base=$(mktemp -d /tmp/perf.daemon.base.XXX)
 
 	# prepare config
 	cat <<EOF > ${config}
@@ -426,7 +461,7 @@ EOF
 	size=`perf daemon ping --config ${config} --session size | awk '{ print $1 }'`
 	type=`perf daemon ping --config ${config} --session time | awk '{ print $1 }'`
 
-	if [ ${size} != "OK" -o ${type} != "OK" ]; then
+	if [ ${size} != "OK" ] || [ ${type} != "OK" ]; then
 		error=1
 		echo "FAILED: daemon ping failed"
 	fi
@@ -442,8 +477,10 @@ test_lock()
 {
 	echo "test daemon lock"
 
-	local config=$(mktemp /tmp/perf.daemon.config.XXX)
-	local base=$(mktemp -d /tmp/perf.daemon.base.XXX)
+	local config
+	config=$(mktemp /tmp/perf.daemon.config.XXX)
+	local base
+	base=$(mktemp -d /tmp/perf.daemon.base.XXX)
 
 	# prepare config
 	cat <<EOF > ${config}
-- 
2.39.1

