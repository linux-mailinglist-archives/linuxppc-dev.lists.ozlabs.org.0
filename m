Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4866884BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 17:45:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P74R35Ls6z3f63
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 03:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nxIqALAU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nxIqALAU;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P74Q54xzLz3f40
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 03:44:44 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312GgQKg003459;
	Thu, 2 Feb 2023 16:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=glr2Qz4LR5oKjY02PzCgzDHPFEpa8AR/wqSc9b8P4AA=;
 b=nxIqALAUmddmvTlgA7JFwn6voG9Myg3poLPVcg92Afe0RsW3YWMBBBtJvcmFWYioPGKK
 DEoCdsrxEP9lVhC7ncK7c9hmlTHjKlba9dejKav47vJglizWsK1PII60jcFLdAHPubg8
 g3JIpdmZZ+qHYOiUQabK26uwn27urb+4G6A2Ycq/5g7r6TuCjtCC5DrzCXVEKWP8cufi
 YObsKh+48XqvZXnTgylmK0Et2g63LfqLtr23cQELH+SFAUiJTnBBg+MYICZti+W879+k
 xucs/uCMr6QYYaSJ8PccEGRvoQumizySTHikeYQV9eC2CCYgtFuS6P8Igucyi5v3j8FO LA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngeufby6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 16:44:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312D6SKs014946;
	Thu, 2 Feb 2023 16:44:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ncvttxduk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 16:44:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312GiXdu22610574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 16:44:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8BA220040;
	Thu,  2 Feb 2023 16:44:33 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E830D20043;
	Thu,  2 Feb 2023 16:44:30 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.122.12])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 16:44:30 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH] tools/perf/tests: Add system wide check for perf bench workload in all metric test
Date: Thu,  2 Feb 2023 22:14:13 +0530
Message-Id: <20230202164413.56743-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 41r1ELxGuL4wsH0TYVDB9-Ce89kby-8j
X-Proofpoint-ORIG-GUID: 41r1ELxGuL4wsH0TYVDB9-Ce89kby-8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_10,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302020148
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

Testcase stat_all_metrics.sh fails in powerpc:
    
92: perf all metrics test : FAILED!

Logs with verbose:

[command]# ./perf test 92 -vv
 92: perf all metrics test                                           :
--- start ---
test child forked, pid 13262
Testing BRU_STALL_CPI
Testing COMPLETION_STALL_CPI
----
Testing TOTAL_LOCAL_NODE_PUMPS_P23
Metric 'TOTAL_LOCAL_NODE_PUMPS_P23' not printed in:
Error:
Invalid event (hv_24x7/PM_PB_LNS_PUMP23,chip=3/) in per-thread mode, enable system wide with '-a'.
Testing TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01
Metric 'TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01' not printed in:
Error:
Invalid event (hv_24x7/PM_PB_RTY_LNS_PUMP01,chip=3/) in per-thread mode, enable system wide with '-a'.
----

Based on above logs, we could see some of the hv-24x7 metric events fails,
and logs suggest to run the metric event with -a option.
This change happened after the commit a4b8cfcabb1d ("perf stat: Delay metric
parsing"), which delayed the metric parsing phase and now before metric parsing
phase perf tool identifies, whether target is system-wide or not. With this
change, perf_event_open will fails with workload monitoring for uncore events
as expected.

The perf all metric test case fails as some of the hv-24x7 metric events
may need bigger workload to get the data. And the added perf bench
workload in 'perf all metric test case' will not run for hv-24x7 without 
-a option.

Fix this issue by adding system wide check for perf bench workload.

Result with the patch changes in powerpc:

92: perf all metrics test : Ok

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/tests/shell/stat_all_metrics.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
index 6e79349e42be..d49832a316d9 100755
--- a/tools/perf/tests/shell/stat_all_metrics.sh
+++ b/tools/perf/tests/shell/stat_all_metrics.sh
@@ -23,6 +23,13 @@ for m in $(perf list --raw-dump metrics); do
   then
     continue
   fi
+  # Failed again, possibly the event is uncore pmu event which will need
+  # system wide monitoring with workload, so retry with -a option
+  result=$(perf stat -M "$m" -a perf bench internals synthesize 2>&1)
+  if [[ "$result" =~ "${m:0:50}" ]]
+  then
+    continue
+  fi
   echo "Metric '$m' not printed in:"
   echo "$result"
   if [[ "$err" != "1" ]]
-- 
2.39.0

