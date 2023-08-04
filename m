Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFC76F93E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 07:02:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f3R0DCm6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHD8m3PLJz3cQj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:02:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f3R0DCm6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHD7m2g3fz2yVf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 15:01:07 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37450NYZ017960;
	Fri, 4 Aug 2023 05:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=uz5ytYwwX0TTvJex0osI+8rjzdDDVk58bO2kCoOFohE=;
 b=f3R0DCm6WGByeiiB9VGS2a6E3+F5/GZqvTHqUcLHuk/jZzHD4VS0kjdbPR/uoviBG9DL
 L+mOCDlS5uMn4TdCsxuYX0pZQq9JSMg/VhlJeYWNNjMnU4lzrdCoMQgtLGU/622u118d
 UAhxtqYFtxHWeHyS+OnDZgtC4YC2Cp7vFUBS4ZNMFRWuq+ud0aSe1cq3q5CZhsoLcXB0
 1R7iFViyXU+gEiAJFb6wAkcQDbPDHFFF8ED9dy5hedI8z4Vc9xcvsHyUpK9470n0Dyvc
 RgQexm9lw9t1YM9cmb7qytTqy4acR+2kLIJ53NzBl2LEKovbVHspRV3UGebGoDdhx4TT Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s8tt900bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:01:00 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 374510hY021409;
	Fri, 4 Aug 2023 05:01:00 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s8tt900bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:01:00 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3744nBBc015848;
	Fri, 4 Aug 2023 05:00:59 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s8kn72rgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:00:59 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37450uGC60096818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Aug 2023 05:00:56 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 390F62004B;
	Fri,  4 Aug 2023 05:00:56 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CA2F20040;
	Fri,  4 Aug 2023 05:00:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.75.173])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  4 Aug 2023 05:00:52 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 1/2] tools/perf/tests: perf all metrics test fails when perf_event access is restricted
Date: Fri,  4 Aug 2023 10:30:46 +0530
Message-Id: <20230804050047.94240-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JrSpfX10BWhY6wC-Nq2YaWKyO6o55NH_
X-Proofpoint-GUID: NC0ELYwNzgxSxCEd3ajWm5d5gCUjiQ9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_01,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308040040
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

Perf all metrics test fails as below when perf_event access
is restricted.

   ./perf test -v "perf all metrics test"
   Metric 'Memory_RD_BW_Chip' not printed in:
   Error:
   Access to performance monitoring and observability operations is limited.
   Enforced MAC policy settings (SELinux) can limit access to performance
   —
   access to performance monitoring and observability operations for processes
   without CAP_PERFMON, CAP_SYS_PTRACE or CAP_SYS_ADMIN Linux capability.
   —
   test child finished with -1
   ---- end ----
   perf all metrics test: FAILED!

The perf all metrics test picks the input events from
"perf list --raw-dump metrics" and runs "perf stat -M "$m""
for each of the metrics in the list. It fails here for some
of the metrics which needs access, since it collects system
wide resource details/statistics. Fix the testcase to skip
those metric events. The check is added at two places:
- When metric is run for workload monitoring
- when metric is run for system wide.

It could happen that some of the metric events are not valid
in per-thread mode. Example from an x86 system:

    $ ./perf stat -M smi_cycles true
    Error:
    Invalid event (msr/smi/u) in per-thread mode, enable system wide with '-a'.

The test fallbacks to system wide if first stage fails.
But when run with system wide for this metric, it hits the
issue with access restriction.

    $ ./perf stat -M smi_cycles -a sleep 0.1
    Error:
    Access to performance monitoring and observability operations is limited.

Similar some events report not supported while running with system wide.

Example from an x86 system:

   $ ./perf stat -M tma_info_system_socket_clks -a sleep 0.1

   Performance counter stats for 'system wide':

    <not supported>      cbox_0/event=0x0/u

       0.102633747 seconds time elapsed

Hence the checks for unsupported events and access restrictions is
added for both cases.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
v1 -> v2:
 Added the check for access restriction in workload as
 well as system wide check.

 tools/perf/tests/shell/stat_all_metrics.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
index 54774525e18a..b26420885560 100755
--- a/tools/perf/tests/shell/stat_all_metrics.sh
+++ b/tools/perf/tests/shell/stat_all_metrics.sh
@@ -1,18 +1,18 @@
 #!/bin/bash
 # perf all metrics test
 # SPDX-License-Identifier: GPL-2.0
-
 err=0
+//list="tma_info_system_socket_clks"
 for m in $(perf list --raw-dump metrics); do
   echo "Testing $m"
   result=$(perf stat -M "$m" true 2>&1)
-  if [[ "$result" =~ ${m:0:50} ]] || [[ "$result" =~ "<not supported>" ]]
+  if [[ "$result" =~ ${m:0:50} ]] || [[ "$result" =~ "<not supported>" ]] || [[ "$result" =~ "Access to performance monitoring and observability operations is limited" ]]
   then
     continue
   fi
   # Failed so try system wide.
   result=$(perf stat -M "$m" -a sleep 0.01 2>&1)
-  if [[ "$result" =~ ${m:0:50} ]]
+  if [[ "$result" =~ ${m:0:50} ]] || [[ "$result" =~ "<not supported>" ]] ||  [[ "$result" =~ "Access to performance monitoring and observability operations is limited" ]]
   then
     continue
   fi
-- 
2.31.1

