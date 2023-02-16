Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9F698CB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 07:14:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHPlq24x1z3chZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 17:13:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F7NDhh/I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F7NDhh/I;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHPkr1DHRz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 17:13:07 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31G600ts022740;
	Thu, 16 Feb 2023 06:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JiN/dvf4km/vJNfgTO+6RbKK8MPR21td+sSZc06tm34=;
 b=F7NDhh/ILYwNfkf5COjy1N7nDYxZeE8IQz4aI5tquBg+SeQ3ySm9KS4aFgZDxiPTcgR9
 /oYvDYu4xNANvRUUl0IHZal3dQLJk7Eq3+PcL3v6FLQVyogu5L/XYNPes0zZNLpRGKMP
 QzqACM0KdGe7vdokdEJaZPzQm7JrIoF2cwJflhhaw4pHuwV/xMvHNuXz4wojUMSe8cpb
 BW8j9VDYzp89oIedr5lb7MEjD6WnT8cKwGZK3HybusL3n0n/tjWvU5FiWS0xdt9b8dzZ
 fYDo4q0XQB7fg/iZCU9M51qVgTZxZY0TaeETlGJpMPmB9aweWNhVbStPbNsMl9+2j5/7 Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nseu60auq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 06:12:57 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31G60Nge024694;
	Thu, 16 Feb 2023 06:12:56 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nseu60aty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 06:12:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31G62fPA011341;
	Thu, 16 Feb 2023 06:12:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6x8ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 06:12:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31G6CniL47251906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 06:12:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 705B720043;
	Thu, 16 Feb 2023 06:12:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79F1820040;
	Thu, 16 Feb 2023 06:12:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.95.24])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Feb 2023 06:12:43 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH] powerpc/perf: Add json metric events to present CPI stall cycles in powerpc
Date: Thu, 16 Feb 2023 11:42:40 +0530
Message-Id: <20230216061240.18067-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dIkqiMJTan-19OIfAm6qDwRkd-Bsg1H2
X-Proofpoint-GUID: XQyw1ybHMz6jQoTek9aTcYPDi0N9xLEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_04,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160050
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Power10 Performance Monitoring Unit (PMU) provides events
to understand stall cycles of different pipeline stages.
These events along with completed instructions provides
useful metrics for application tuning.

Patch implements the json changes to collect counter statistics
to present the high level CPI stall breakdown metrics. New metric
group is named as "CPI_STALL_RATIO" and this new metric group
presents these stall metrics:
- DISPATCHED_CPI ( Dispatch stall cycles per insn )
- ISSUE_STALL_CPI ( Issue stall cycles per insn )
- EXECUTION_STALL_CPI ( Execution stall cycles per insn )
- COMPLETION_STALL_CPI ( Completition stall cycles per insn )

To avoid multipling of events, PM_RUN_INST_CMPL event has been
modified to use PMC5(performance monitoring counter5) instead
of PMC4. This change is needed, since completion stall event
is using PMC4.

Usage example:

 ./perf stat --metric-no-group -M CPI_STALL_RATIO <workload>

 Performance counter stats for 'workload':

    63,056,817,982      PM_CMPL_STALL                    #     0.28 COMPLETION_STALL_CPI
 1,743,988,038,896      PM_ISSUE_STALL                   #     7.73 ISSUE_STALL_CPI
   225,597,495,030      PM_RUN_INST_CMPL                 #     6.18 DISPATCHED_CPI
                                                  #    37.48 EXECUTION_STALL_CPI
 1,393,916,546,654      PM_DISP_STALL_CYC
 8,455,376,836,463      PM_EXEC_STALL

"--metric-no-group" is used for forcing PM_RUN_INST_CMPL to be scheduled
in all group for more accuracy.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/pmu-events/arch/powerpc/power10/metrics.json | 8 ++++----
 tools/perf/pmu-events/arch/powerpc/power10/others.json  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
index b57526fa44f2..6f53583a0c62 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
@@ -15,7 +15,7 @@
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled for any reason",
         "MetricExpr": "PM_DISP_STALL_CYC / PM_RUN_INST_CMPL",
-        "MetricGroup": "CPI",
+        "MetricGroup": "CPI;CPI_STALL_RATIO",
         "MetricName": "DISPATCHED_CPI"
     },
     {
@@ -147,13 +147,13 @@
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction has been dispatched but not issued for any reason",
         "MetricExpr": "PM_ISSUE_STALL / PM_RUN_INST_CMPL",
-        "MetricGroup": "CPI",
+        "MetricGroup": "CPI;CPI_STALL_RATIO",
         "MetricName": "ISSUE_STALL_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting to be finished in one of the execution units",
         "MetricExpr": "PM_EXEC_STALL / PM_RUN_INST_CMPL",
-        "MetricGroup": "CPI",
+        "MetricGroup": "CPI;CPI_STALL_RATIO",
         "MetricName": "EXECUTION_STALL_CPI"
     },
     {
@@ -309,7 +309,7 @@
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction cannot complete because the thread was blocked",
         "MetricExpr": "PM_CMPL_STALL / PM_RUN_INST_CMPL",
-        "MetricGroup": "CPI",
+        "MetricGroup": "CPI;CPI_STALL_RATIO",
         "MetricName": "COMPLETION_STALL_CPI"
     },
     {
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
index 7d0de1a2860b..a771e4b6bec5 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
@@ -265,7 +265,7 @@
     "BriefDescription": "Load Missed L1, counted at finish time."
   },
   {
-    "EventCode": "0x400FA",
+    "EventCode": "0x500FA",
     "EventName": "PM_RUN_INST_CMPL",
     "BriefDescription": "Completed PowerPC instructions gated by the run latch."
   }
-- 
2.31.1

