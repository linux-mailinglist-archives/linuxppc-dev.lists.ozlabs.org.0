Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C17AD77B796
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 13:29:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oDPw2xDj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPXH8564Pz3cC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 21:29:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oDPw2xDj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPXGD6hC3z2xps
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 21:28:36 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EBLIT8019026;
	Mon, 14 Aug 2023 11:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aBabsxwCcb7MNFRKTWR6lUNPsoMDu4roz0rOPHmwjtY=;
 b=oDPw2xDjH6Rh5IUal4VNvrqyjgjkU8Wm5scP1/S04L+XC1BOWWBEaGclKo0PxwdnJS4P
 D/i4fKm59+mX486bnYQlB6479TgwgfOufDzu2amIxkZEW3J5RaOIrUJ0azFIFQCjGuVD
 3c6HrV0qf+cdQK6gV/TBvytIgLIiq3qgpqF10/w4D3hPL/xFOvtOY8Kqm2CpPTZVAWQM
 Xn233JcO552iUXemYZp9fPeJV0ajkMiiOxmbdDgpINA3FxVUBnKx0m2Z4LBnu8Kgvaih
 Tz/emQeaLQkho02qYXJNOvkzyEZIhwhwL8MT9J2rtG3oqp0/nA8eAilT13UxNS1nBR8f sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfjykgpdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:30 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37EB7FF3027033;
	Mon, 14 Aug 2023 11:28:29 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfjykgpda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:29 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37EB0b3W007861;
	Mon, 14 Aug 2023 11:28:28 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3senwjukda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:28 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37EBSOFQ62783994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Aug 2023 11:28:24 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EBDE20043;
	Mon, 14 Aug 2023 11:28:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6ABAA2004D;
	Mon, 14 Aug 2023 11:28:21 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.123.95])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Aug 2023 11:28:21 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH 1/7] perf vendor events: Update the JSON/events descriptions for power10 platform
Date: Mon, 14 Aug 2023 16:57:57 +0530
Message-Id: <20230814112803.1508296-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3v2GpQ9kWkhJzvOyzOq3HoVniL7XZjT5
X-Proofpoint-ORIG-GUID: Vfifj9rDUrMrjScmykfLPsR3SBRM6fqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_06,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140102
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
Cc: irogers@google.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the description for some of the JSON/events for power10 platform.

Fixes: 32daa5d7899e ("perf vendor events: Initial JSON/events list for power10 platform")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/cache.json           |  4 +-
 .../arch/powerpc/power10/frontend.json        | 30 ++++++------
 .../arch/powerpc/power10/marked.json          | 20 ++++----
 .../arch/powerpc/power10/memory.json          |  6 +--
 .../arch/powerpc/power10/others.json          | 48 +++++++++----------
 .../arch/powerpc/power10/pipeline.json        | 20 ++++----
 .../pmu-events/arch/powerpc/power10/pmc.json  |  4 +-
 .../arch/powerpc/power10/translation.json     |  6 +--
 8 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/cache.json b/tools/perf/pmu-events/arch/powerpc/power10/cache.json
index 605be14f441c..9cb929bb64af 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/cache.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/cache.json
@@ -17,7 +17,7 @@
   {
     "EventCode": "0x34056",
     "EventName": "PM_EXEC_STALL_LOAD_FINISH",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was finishing a load after its data was reloaded from a data source beyond the local L1; cycles in which the LSU was processing an L1-hit; cycles in which the NTF instruction merged with another load in the LMQ; cycles in which the NTF instruction is waiting for a data reload for a load miss, but the data comes back with a non-NTF instruction."
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was finishing a load after its data was reloaded from a data source beyond the local L1; cycles in which the LSU was processing an L1-hit; cycles in which the next-to-finish (NTF) instruction merged with another load in the LMQ; cycles in which the NTF instruction is waiting for a data reload for a load miss, but the data comes back with a non-NTF instruction."
   },
   {
     "EventCode": "0x3006C",
@@ -27,7 +27,7 @@
   {
     "EventCode": "0x300F4",
     "EventName": "PM_RUN_INST_CMPL_CONC",
-    "BriefDescription": "PowerPC instructions completed by this thread when all threads in the core had the run-latch set."
+    "BriefDescription": "PowerPC instruction completed by this thread when all threads in the core had the run-latch set."
   },
   {
     "EventCode": "0x4C016",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
index 558f9530f54e..61e9e0222c87 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
@@ -7,7 +7,7 @@
   {
     "EventCode": "0x10006",
     "EventName": "PM_DISP_STALL_HELD_OTHER_CYC",
-    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch for any other reason."
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch for any other reason."
   },
   {
     "EventCode": "0x10010",
@@ -32,12 +32,12 @@
   {
     "EventCode": "0x1D05E",
     "EventName": "PM_DISP_STALL_HELD_HALT_CYC",
-    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because of power management."
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because of power management."
   },
   {
     "EventCode": "0x1E050",
     "EventName": "PM_DISP_STALL_HELD_STF_MAPPER_CYC",
-    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because the STF mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR."
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because the STF mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR."
   },
   {
     "EventCode": "0x1F054",
@@ -67,7 +67,7 @@
   {
     "EventCode": "0x100F6",
     "EventName": "PM_IERAT_MISS",
-    "BriefDescription": "IERAT Reloaded to satisfy an IERAT miss. All page sizes are counted by this event."
+    "BriefDescription": "IERAT Reloaded to satisfy an IERAT miss. All page sizes are counted by this event. This event only counts instruction demand access."
   },
   {
     "EventCode": "0x100F8",
@@ -77,7 +77,7 @@
   {
     "EventCode": "0x20006",
     "EventName": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC",
-    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch due to Issue queue full. Includes issue queue and branch queue."
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch due to Issue queue full. Includes issue queue and branch queue."
   },
   {
     "EventCode": "0x20114",
@@ -102,7 +102,7 @@
   {
     "EventCode": "0x2D01A",
     "EventName": "PM_DISP_STALL_IC_MISS",
-    "BriefDescription": "Cycles when dispatch was stalled for this thread due to an Icache Miss."
+    "BriefDescription": "Cycles when dispatch was stalled for this thread due to an instruction cache miss."
   },
   {
     "EventCode": "0x2E018",
@@ -112,7 +112,7 @@
   {
     "EventCode": "0x2E01A",
     "EventName": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC",
-    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because the XVFC mapper/SRB was full."
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because the XVFC mapper/SRB was full."
   },
   {
     "EventCode": "0x2C142",
@@ -137,7 +137,7 @@
   {
     "EventCode": "0x30004",
     "EventName": "PM_DISP_STALL_FLUSH",
-    "BriefDescription": "Cycles when dispatch was stalled because of a flush that happened to an instruction(s) that was not yet NTC. PM_EXEC_STALL_NTC_FLUSH only includes instructions that were flushed after becoming NTC."
+    "BriefDescription": "Cycles when dispatch was stalled because of a flush that happened to an instruction(s) that was not yet next-to-complete (NTC). PM_EXEC_STALL_NTC_FLUSH only includes instructions that were flushed after becoming NTC."
   },
   {
     "EventCode": "0x3000A",
@@ -157,7 +157,7 @@
   {
     "EventCode": "0x30018",
     "EventName": "PM_DISP_STALL_HELD_SCOREBOARD_CYC",
-    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch while waiting on the Scoreboard. This event combines VSCR and FPSCR together."
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch while waiting on the Scoreboard. This event combines VSCR and FPSCR together."
   },
   {
     "EventCode": "0x30026",
@@ -182,7 +182,7 @@
   {
     "EventCode": "0x3D05C",
     "EventName": "PM_DISP_STALL_HELD_RENAME_CYC",
-    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because the mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR and XVFC."
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because the mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR and XVFC."
   },
   {
     "EventCode": "0x3E052",
@@ -192,7 +192,7 @@
   {
     "EventCode": "0x3E054",
     "EventName": "PM_LD_MISS_L1",
-    "BriefDescription": "Load Missed L1, counted at execution time (can be greater than loads finished). LMQ merges are not included in this count. i.e. if a load instruction misses on an address that is already allocated on the LMQ, this event will not increment for that load). Note that this count is per slice, so if a load spans multiple slices this event will increment multiple times for a single load."
+    "BriefDescription": "Load missed L1, counted at finish time. LMQ merges are not included in this count. i.e. if a load instruction misses on an address that is already allocated on the LMQ, this event will not increment for that load). Note that this count is per slice, so if a load spans multiple slices this event will increment multiple times for a single load."
   },
   {
     "EventCode": "0x301EA",
@@ -202,7 +202,7 @@
   {
     "EventCode": "0x300FA",
     "EventName": "PM_INST_FROM_L3MISS",
-    "BriefDescription": "The processor's instruction cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss."
+    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss."
   },
   {
     "EventCode": "0x40006",
@@ -232,16 +232,16 @@
   {
     "EventCode": "0x4E01A",
     "EventName": "PM_DISP_STALL_HELD_CYC",
-    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch for any reason."
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch for any reason."
   },
   {
     "EventCode": "0x4003C",
     "EventName": "PM_DISP_STALL_HELD_SYNC_CYC",
-    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch."
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch."
   },
   {
     "EventCode": "0x44056",
     "EventName": "PM_VECTOR_ST_CMPL",
-    "BriefDescription": "Vector store instructions completed."
+    "BriefDescription": "Vector store instruction completed."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/marked.json b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
index 58b5dfe3a273..131f8d0e8831 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/marked.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
@@ -62,7 +62,7 @@
   {
     "EventCode": "0x200FD",
     "EventName": "PM_L1_ICACHE_MISS",
-    "BriefDescription": "Demand iCache Miss."
+    "BriefDescription": "Demand instruction cache miss."
   },
   {
     "EventCode": "0x30130",
@@ -72,7 +72,7 @@
   {
     "EventCode": "0x34146",
     "EventName": "PM_MRK_LD_CMPL",
-    "BriefDescription": "Marked loads completed."
+    "BriefDescription": "Marked load instruction completed."
   },
   {
     "EventCode": "0x3E158",
@@ -82,12 +82,12 @@
   {
     "EventCode": "0x3E15A",
     "EventName": "PM_MRK_ST_FIN",
-    "BriefDescription": "The marked instruction was a store of any kind."
+    "BriefDescription": "Marked store instruction finished."
   },
   {
     "EventCode": "0x30068",
     "EventName": "PM_L1_ICACHE_RELOADED_PREF",
-    "BriefDescription": "Counts all Icache prefetch reloads ( includes demand turned into prefetch)."
+    "BriefDescription": "Counts all instruction cache prefetch reloads (includes demand turned into prefetch)."
   },
   {
     "EventCode": "0x301E4",
@@ -102,12 +102,12 @@
   {
     "EventCode": "0x300FE",
     "EventName": "PM_DATA_FROM_L3MISS",
-    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss."
+    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss."
   },
   {
     "EventCode": "0x40012",
     "EventName": "PM_L1_ICACHE_RELOADED_ALL",
-    "BriefDescription": "Counts all Icache reloads includes demand, prefetch, prefetch turned into demand and demand turned into prefetch."
+    "BriefDescription": "Counts all instruction cache reloads includes demand, prefetch, prefetch turned into demand and demand turned into prefetch."
   },
   {
     "EventCode": "0x40134",
@@ -117,22 +117,22 @@
   {
     "EventCode": "0x4505A",
     "EventName": "PM_SP_FLOP_CMPL",
-    "BriefDescription": "Single Precision floating point instructions completed."
+    "BriefDescription": "Single Precision floating point instruction completed."
   },
   {
     "EventCode": "0x4D058",
     "EventName": "PM_VECTOR_FLOP_CMPL",
-    "BriefDescription": "Vector floating point instructions completed."
+    "BriefDescription": "Vector floating point instruction completed."
   },
   {
     "EventCode": "0x4D05A",
     "EventName": "PM_NON_MATH_FLOP_CMPL",
-    "BriefDescription": "Non Math instructions completed."
+    "BriefDescription": "Non Math instruction completed."
   },
   {
     "EventCode": "0x401E0",
     "EventName": "PM_MRK_INST_CMPL",
-    "BriefDescription": "marked instruction completed."
+    "BriefDescription": "Marked instruction completed."
   },
   {
     "EventCode": "0x400FE",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/memory.json b/tools/perf/pmu-events/arch/powerpc/power10/memory.json
index 843b51f531e9..c4c10ca98cad 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/memory.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/memory.json
@@ -47,7 +47,7 @@
   {
     "EventCode": "0x10062",
     "EventName": "PM_LD_L3MISS_PEND_CYC",
-    "BriefDescription": "Cycles L3 miss was pending for this thread."
+    "BriefDescription": "Cycles in which an L3 miss was pending for this thread."
   },
   {
     "EventCode": "0x20010",
@@ -132,7 +132,7 @@
   {
     "EventCode": "0x300FC",
     "EventName": "PM_DTLB_MISS",
-    "BriefDescription": "The DPTEG required for the load/store instruction in execution was missing from the TLB. It includes pages of all sizes for demand and prefetch activity."
+    "BriefDescription": "The DPTEG required for the load/store instruction in execution was missing from the TLB. This event only counts for demand misses."
   },
   {
     "EventCode": "0x4D02C",
@@ -142,7 +142,7 @@
   {
     "EventCode": "0x4003E",
     "EventName": "PM_LD_CMPL",
-    "BriefDescription": "Loads completed."
+    "BriefDescription": "Load instruction completed."
   },
   {
     "EventCode": "0x4C040",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
index a771e4b6bec5..a5319cdba89b 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
@@ -2,12 +2,12 @@
   {
     "EventCode": "0x10016",
     "EventName": "PM_VSU0_ISSUE",
-    "BriefDescription": "VSU instructions issued to VSU pipe 0."
+    "BriefDescription": "VSU instruction issued to VSU pipe 0."
   },
   {
     "EventCode": "0x1001C",
     "EventName": "PM_ULTRAVISOR_INST_CMPL",
-    "BriefDescription": "PowerPC instructions that completed while the thread was in ultravisor state."
+    "BriefDescription": "PowerPC instruction completed while the thread was in ultravisor state."
   },
   {
     "EventCode": "0x100F0",
@@ -17,12 +17,12 @@
   {
     "EventCode": "0x10134",
     "EventName": "PM_MRK_ST_DONE_L2",
-    "BriefDescription": "Marked stores completed in L2 (RC machine done)."
+    "BriefDescription": "Marked store completed in L2."
   },
   {
     "EventCode": "0x1505E",
     "EventName": "PM_LD_HIT_L1",
-    "BriefDescription": "Loads that finished without experiencing an L1 miss."
+    "BriefDescription": "Load finished without experiencing an L1 miss."
   },
   {
     "EventCode": "0x1F056",
@@ -42,7 +42,7 @@
   {
     "EventCode": "0x101E4",
     "EventName": "PM_MRK_L1_ICACHE_MISS",
-    "BriefDescription": "Marked Instruction suffered an icache Miss."
+    "BriefDescription": "Marked instruction suffered an instruction cache miss."
   },
   {
     "EventCode": "0x101EA",
@@ -72,7 +72,7 @@
   {
     "EventCode": "0x2E010",
     "EventName": "PM_ADJUNCT_INST_CMPL",
-    "BriefDescription": "PowerPC instructions that completed while the thread is in Adjunct state."
+    "BriefDescription": "PowerPC instruction completed while the thread was in Adjunct state."
   },
   {
     "EventCode": "0x2E014",
@@ -122,7 +122,7 @@
   {
     "EventCode": "0x201E4",
     "EventName": "PM_MRK_DATA_FROM_L3MISS",
-    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss for a marked load."
+    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
   },
   {
     "EventCode": "0x201E8",
@@ -132,17 +132,17 @@
   {
     "EventCode": "0x200F2",
     "EventName": "PM_INST_DISP",
-    "BriefDescription": "PowerPC instructions dispatched."
+    "BriefDescription": "PowerPC instruction dispatched."
   },
   {
     "EventCode": "0x30132",
     "EventName": "PM_MRK_VSU_FIN",
-    "BriefDescription": "VSU marked instructions finished. Excludes simple FX instructions issued to the Store Unit."
+    "BriefDescription": "VSU marked instruction finished. Excludes simple FX instructions issued to the Store Unit."
   },
   {
     "EventCode": "0x30038",
     "EventName": "PM_EXEC_STALL_DMISS_LMEM",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local memory, local OpenCapp cache, or local OpenCapp memory."
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local memory, local OpenCAPI cache, or local OpenCAPI memory."
   },
   {
     "EventCode": "0x3F04A",
@@ -152,12 +152,12 @@
   {
     "EventCode": "0x3405A",
     "EventName": "PM_PRIVILEGED_INST_CMPL",
-    "BriefDescription": "PowerPC Instructions that completed while the thread is in Privileged state."
+    "BriefDescription": "PowerPC instruction completed while the thread was in Privileged state."
   },
   {
     "EventCode": "0x3F150",
     "EventName": "PM_MRK_ST_DRAIN_CYC",
-    "BriefDescription": "cycles to drain st from core to L2."
+    "BriefDescription": "Cycles in which the marked store drained from the core to the L2."
   },
   {
     "EventCode": "0x3F054",
@@ -182,7 +182,7 @@
   {
     "EventCode": "0x4001C",
     "EventName": "PM_VSU_FIN",
-    "BriefDescription": "VSU instructions finished."
+    "BriefDescription": "VSU instruction finished."
   },
   {
     "EventCode": "0x4C01A",
@@ -197,7 +197,7 @@
   {
     "EventCode": "0x4D022",
     "EventName": "PM_HYPERVISOR_INST_CMPL",
-    "BriefDescription": "PowerPC instructions that completed while the thread is in hypervisor state."
+    "BriefDescription": "PowerPC instruction completed while the thread was in hypervisor state."
   },
   {
     "EventCode": "0x4D026",
@@ -212,32 +212,32 @@
   {
     "EventCode": "0x40030",
     "EventName": "PM_INST_FIN",
-    "BriefDescription": "Instructions finished."
+    "BriefDescription": "Instruction finished."
   },
   {
     "EventCode": "0x44146",
     "EventName": "PM_MRK_STCX_CORE_CYC",
-    "BriefDescription": "Cycles spent in the core portion of a marked Stcx instruction. It starts counting when the instruction is decoded and stops counting when it drains into the L2."
+    "BriefDescription": "Cycles spent in the core portion of a marked STCX instruction. It starts counting when the instruction is decoded and stops counting when it drains into the L2."
   },
   {
     "EventCode": "0x44054",
     "EventName": "PM_VECTOR_LD_CMPL",
-    "BriefDescription": "Vector load instructions completed."
+    "BriefDescription": "Vector load instruction completed."
   },
   {
     "EventCode": "0x45054",
     "EventName": "PM_FMA_CMPL",
-    "BriefDescription": "Two floating point instructions completed (FMA class of instructions: fmadd, fnmadd, fmsub, fnmsub). Scalar instructions only."
+    "BriefDescription": "Two floating point instruction completed (FMA class of instructions: fmadd, fnmadd, fmsub, fnmsub). Scalar instructions only."
   },
   {
     "EventCode": "0x45056",
     "EventName": "PM_SCALAR_FLOP_CMPL",
-    "BriefDescription": "Scalar floating point instructions completed."
+    "BriefDescription": "Scalar floating point instruction completed."
   },
   {
     "EventCode": "0x4505C",
     "EventName": "PM_MATH_FLOP_CMPL",
-    "BriefDescription": "Math floating point instructions completed."
+    "BriefDescription": "Math floating point instruction completed."
   },
   {
     "EventCode": "0x4D05E",
@@ -252,21 +252,21 @@
   {
     "EventCode": "0x401E6",
     "EventName": "PM_MRK_INST_FROM_L3MISS",
-    "BriefDescription": "The processor's instruction cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss for a marked instruction."
+    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
   },
   {
     "EventCode": "0x401E8",
     "EventName": "PM_MRK_DATA_FROM_L2MISS",
-    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1 or L2 due to a demand miss for a marked load."
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
   },
   {
     "EventCode": "0x400F0",
     "EventName": "PM_LD_DEMAND_MISS_L1_FIN",
-    "BriefDescription": "Load Missed L1, counted at finish time."
+    "BriefDescription": "Load missed L1, counted at finish time."
   },
   {
     "EventCode": "0x500FA",
     "EventName": "PM_RUN_INST_CMPL",
-    "BriefDescription": "Completed PowerPC instructions gated by the run latch."
+    "BriefDescription": "PowerPC instruction completed while the run latch is set."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
index b8aded6045fa..449f57e8ba6a 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
@@ -2,7 +2,7 @@
   {
     "EventCode": "0x100FE",
     "EventName": "PM_INST_CMPL",
-    "BriefDescription": "PowerPC instructions completed."
+    "BriefDescription": "PowerPC instruction completed."
   },
   {
     "EventCode": "0x1000C",
@@ -12,7 +12,7 @@
   {
     "EventCode": "0x1000E",
     "EventName": "PM_MMA_ISSUED",
-    "BriefDescription": "MMA instructions issued."
+    "BriefDescription": "MMA instruction issued."
   },
   {
     "EventCode": "0x10012",
@@ -107,7 +107,7 @@
   {
     "EventCode": "0x2D012",
     "EventName": "PM_VSU1_ISSUE",
-    "BriefDescription": "VSU instructions issued to VSU pipe 1."
+    "BriefDescription": "VSU instruction issued to VSU pipe 1."
   },
   {
     "EventCode": "0x2D018",
@@ -122,7 +122,7 @@
   {
     "EventCode": "0x2E01E",
     "EventName": "PM_EXEC_STALL_NTC_FLUSH",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in any unit before it was flushed. Note that if the flush of the oldest instruction happens after finish, the cycles from dispatch to issue will be included in PM_DISP_STALL and the cycles from issue to finish will be included in PM_EXEC_STALL and its corresponding children. This event will also count cycles when the previous NTF instruction is still completing and the new NTF instruction is stalled at dispatch."
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in any unit before it was flushed. Note that if the flush of the oldest instruction happens after finish, the cycles from dispatch to issue will be included in PM_DISP_STALL and the cycles from issue to finish will be included in PM_EXEC_STALL and its corresponding children. This event will also count cycles when the previous next-to-finish (NTF) instruction is still completing and the new NTF instruction is stalled at dispatch."
   },
   {
     "EventCode": "0x2013C",
@@ -137,7 +137,7 @@
   {
     "EventCode": "0x201E2",
     "EventName": "PM_MRK_LD_MISS_L1",
-    "BriefDescription": "Marked DL1 Demand Miss counted at finish time."
+    "BriefDescription": "Marked demand data load miss counted at finish time."
   },
   {
     "EventCode": "0x200F4",
@@ -172,7 +172,7 @@
   {
     "EventCode": "0x30028",
     "EventName": "PM_CMPL_STALL_MEM_ECC",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for the non-speculative finish of either a stcx waiting for its result or a load waiting for non-critical sectors of data and ECC."
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for the non-speculative finish of either a STCX waiting for its result or a load waiting for non-critical sectors of data and ECC."
   },
   {
     "EventCode": "0x30036",
@@ -187,12 +187,12 @@
   {
     "EventCode": "0x3F044",
     "EventName": "PM_VSU2_ISSUE",
-    "BriefDescription": "VSU instructions issued to VSU pipe 2."
+    "BriefDescription": "VSU instruction issued to VSU pipe 2."
   },
   {
     "EventCode": "0x30058",
     "EventName": "PM_TLBIE_FIN",
-    "BriefDescription": "TLBIE instructions finished in the LSU. Two TLBIEs can finish each cycle. All will be counted."
+    "BriefDescription": "TLBIE instruction finished in the LSU. Two TLBIEs can finish each cycle. All will be counted."
   },
   {
     "EventCode": "0x3D058",
@@ -252,7 +252,7 @@
   {
     "EventCode": "0x4E012",
     "EventName": "PM_EXEC_STALL_UNKNOWN",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline completed without an ntf_type pulse. The ntf_pulse was missed by the ISU because the NTF finishes and completions came too close together."
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline completed without an ntf_type pulse. The ntf_pulse was missed by the ISU because the next-to-finish (NTF) instruction finishes and completions came too close together."
   },
   {
     "EventCode": "0x4D020",
@@ -267,7 +267,7 @@
   {
     "EventCode": "0x45058",
     "EventName": "PM_IC_MISS_CMPL",
-    "BriefDescription": "Non-speculative icache miss, counted at completion."
+    "BriefDescription": "Non-speculative instruction cache miss, counted at completion."
   },
   {
     "EventCode": "0x4D050",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
index b5d1bd39cfb2..364fedbfb490 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
@@ -12,11 +12,11 @@
   {
     "EventCode": "0x45052",
     "EventName": "PM_4FLOP_CMPL",
-    "BriefDescription": "Four floating point instructions completed (fadd, fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg)."
+    "BriefDescription": "Four floating point instruction completed (fadd, fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg)."
   },
   {
     "EventCode": "0x4D054",
     "EventName": "PM_8FLOP_CMPL",
-    "BriefDescription": "Four Double Precision vector instructions completed."
+    "BriefDescription": "Four Double Precision vector instruction completed."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/translation.json b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
index db3766dca07c..3e47b804a0a8 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/translation.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
@@ -17,7 +17,7 @@
   {
     "EventCode": "0x2011C",
     "EventName": "PM_MRK_NTF_CYC",
-    "BriefDescription": "Cycles during which the marked instruction is the oldest in the pipeline (NTF or NTC)."
+    "BriefDescription": "Cycles in which the marked instruction is the oldest in the pipeline (next-to-finish or next-to-complete)."
   },
   {
     "EventCode": "0x2E01C",
@@ -37,7 +37,7 @@
   {
     "EventCode": "0x200FE",
     "EventName": "PM_DATA_FROM_L2MISS",
-    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1 or L2 due to a demand miss."
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
   },
   {
     "EventCode": "0x30010",
@@ -52,6 +52,6 @@
   {
     "EventCode": "0x4D05C",
     "EventName": "PM_DPP_FLOP_CMPL",
-    "BriefDescription": "Double-Precision or Quad-Precision instructions completed."
+    "BriefDescription": "Double-Precision or Quad-Precision instruction completed."
   }
 ]
-- 
2.39.3

