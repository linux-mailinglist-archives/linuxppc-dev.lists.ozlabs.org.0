Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1A4737D51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 10:36:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eBc2UDBY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmH046MV4z3cDw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 18:36:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eBc2UDBY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmGtD2ZLtz3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 18:31:00 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L8Jra0006340;
	Wed, 21 Jun 2023 08:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P0CCNRyJfDkFJfrzp7BAucvhadwLDOI73E4hPSkQU/w=;
 b=eBc2UDBYJKQX+z46l04gFogDGMRCtLPvwTJnKF1dLMFtNdLK3SLlbMLzTGAg89qgIx/k
 bjW8UUOZednbpenGSBE1usKrqSg1lxsrMh5boyK2zZ7y2ubEZf28FVdUyDEaRZvRAWfk
 8o8MKx8IlAUdh7udhOr3Rxz3dO03e5BhufVP9UlH8O/TGR4Ow4+Wo5qDU0pWUQzMiW99
 fTya5YAajIq0WbFumH5sa/VdJl4NE8+OQmiOwZYdcoKMg7W7zO1ltecoLxsYzp6jOJ3s
 iffITnojhqDNY3bddcqi2BdohvyH2gQKVhdBCuhAS2YNwbch9dxA6PAUQBB2bw8cQhp1 Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwkr06sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:30:55 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L8LQGA010189;
	Wed, 21 Jun 2023 08:30:55 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwkr06rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:30:54 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L4tfFe011372;
	Wed, 21 Jun 2023 08:30:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3r94f59ymt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:30:52 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L8Ul2D20775546
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 08:30:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEBE02004E;
	Wed, 21 Jun 2023 08:30:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D101C20043;
	Wed, 21 Jun 2023 08:30:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.215.188])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 08:30:44 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 05/22] tools/perf/tests: Fix shellcheck issue for stat_bpf_counters_cgrp.sh testcase
Date: Wed, 21 Jun 2023 14:00:04 +0530
Message-Id: <20230621083021.71203-6-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
References: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rWB3s-xn_K-eJh_D8Lty-Ar3gDjLqvmO
X-Proofpoint-GUID: gW5F5c26_34d20tJFMGh0S0NQgUeBJfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306210067
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

Running shellcheck on lock_contention.sh generates below warning:

In stat_bpf_counters_cgrp.sh line 28:
	if [ -d /sys/fs/cgroup/system.slice -a -d /sys/fs/cgroup/user.slice ]; then
                                            ^-- SC2166 (warning): Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.

In stat_bpf_counters_cgrp.sh line 34:
	local self_cgrp=$(grep perf_event /proc/self/cgroup | cut -d: -f3)
        ^-------------^ SC3043 (warning): In POSIX sh, 'local' is undefined.
              ^-------^ SC2155 (warning): Declare and assign separately to avoid masking return values.
                        ^-- SC2046 (warning): Quote this to prevent word splitting.

In stat_bpf_counters_cgrp.sh line 51:
	local output
        ^----------^ SC3043 (warning): In POSIX sh, 'local' is undefined.

In stat_bpf_counters_cgrp.sh line 65:
	local output
        ^----------^ SC3043 (warning): In POSIX sh, 'local' is undefined.

Fixed above warnings by:
- Changing the expression [p -a q] to [p] && [q].
- Fixing shellcheck warnings for local usage, by prefixing
  function name to the variable.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh b/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
index d724855d097c..a74440a00b6b 100755
--- a/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
+++ b/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
@@ -25,22 +25,22 @@ check_bpf_counter()
 find_cgroups()
 {
 	# try usual systemd slices first
-	if [ -d /sys/fs/cgroup/system.slice -a -d /sys/fs/cgroup/user.slice ]; then
+	if [ -d /sys/fs/cgroup/system.slice ] && [ -d /sys/fs/cgroup/user.slice ]; then
 		test_cgroups="system.slice,user.slice"
 		return
 	fi
 
 	# try root and self cgroups
-	local self_cgrp=$(grep perf_event /proc/self/cgroup | cut -d: -f3)
-	if [ -z ${self_cgrp} ]; then
+	find_cgroups_self_cgrp=$(grep perf_event /proc/self/cgroup | cut -d: -f3)
+	if [ -z ${find_cgroups_self_cgrp} ]; then
 		# cgroup v2 doesn't specify perf_event
-		self_cgrp=$(grep ^0: /proc/self/cgroup | cut -d: -f3)
+		find_cgroups_self_cgrp=$(grep ^0: /proc/self/cgroup | cut -d: -f3)
 	fi
 
-	if [ -z ${self_cgrp} ]; then
+	if [ -z ${find_cgroups_self_cgrp} ]; then
 		test_cgroups="/"
 	else
-		test_cgroups="/,${self_cgrp}"
+		test_cgroups="/,${find_cgroups_self_cgrp}"
 	fi
 }
 
@@ -48,13 +48,11 @@ find_cgroups()
 # Just check if it runs without failure and has non-zero results.
 check_system_wide_counted()
 {
-	local output
-
-	output=$(perf stat -a --bpf-counters --for-each-cgroup ${test_cgroups} -e cpu-clock -x, sleep 1  2>&1)
-	if echo ${output} | grep -q -F "<not "; then
+	check_system_wide_counted_output=$(perf stat -a --bpf-counters --for-each-cgroup ${test_cgroups} -e cpu-clock -x, sleep 1  2>&1)
+	if echo ${check_system_wide_counted_output} | grep -q -F "<not "; then
 		echo "Some system-wide events are not counted"
 		if [ "${verbose}" = "1" ]; then
-			echo ${output}
+			echo ${check_system_wide_counted_output}
 		fi
 		exit 1
 	fi
@@ -62,13 +60,11 @@ check_system_wide_counted()
 
 check_cpu_list_counted()
 {
-	local output
-
-	output=$(perf stat -C 1 --bpf-counters --for-each-cgroup ${test_cgroups} -e cpu-clock -x, taskset -c 1 sleep 1  2>&1)
-	if echo ${output} | grep -q -F "<not "; then
+	check_cpu_list_counted_output=$(perf stat -C 1 --bpf-counters --for-each-cgroup ${test_cgroups} -e cpu-clock -x, taskset -c 1 sleep 1  2>&1)
+	if echo ${check_cpu_list_counted_output} | grep -q -F "<not "; then
 		echo "Some CPU events are not counted"
 		if [ "${verbose}" = "1" ]; then
-			echo ${output}
+			echo ${check_cpu_list_counted_output}
 		fi
 		exit 1
 	fi
-- 
2.39.1

