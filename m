Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87D77B7A1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 13:32:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xa6eOxJ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPXL62JyMz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 21:31:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xa6eOxJ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPXGQ5bGMz3bXH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 21:28:46 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EBSClp020233;
	Mon, 14 Aug 2023 11:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LIb7s1Bc6Jj23soPD04tYIGhghgAABmo3nkvDm6J3Mw=;
 b=Xa6eOxJ6pvvm7XA+B7Q9OdCwEMETEGQzE8/7S9D75si++FeyyDG0ZQx0BVdfX7zlASMf
 dztaQsyIIo56Y66VOzlGFv+afh6WdbJgXK145PhwjIXHMhPczK09SSSiM60kPCeNY2Ze
 tx/R8Gi/qb+9MJgJEkjF7dfDc/J44dbiFhe6roxMvx3c7zKUnEqSllJ+Sywf+V7vtx8a
 8gELs0nNCD04SzEtlQkQHlv30wicbwHvVCs97TYVeyIaW98SloQYskmi1UAbPSYsDgqW
 ONeFFe/8vNWhatFiIV3zeMrEVgkYy2nPukdvCq3q9i4n/N6PjaRblmqjN/pHYcDXKOep 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfkdvg084-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:42 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37EBSJAI020408;
	Mon, 14 Aug 2023 11:28:41 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfkdvg07y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:41 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37E9aI5p013323;
	Mon, 14 Aug 2023 11:28:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sepmjbadk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37EBSbMI19727090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Aug 2023 11:28:37 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A53C320043;
	Mon, 14 Aug 2023 11:28:37 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF9C220040;
	Mon, 14 Aug 2023 11:28:34 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.123.95])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Aug 2023 11:28:34 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH 5/7] perf vendor events: Update JSON/events for power10 platform
Date: Mon, 14 Aug 2023 16:58:01 +0530
Message-Id: <20230814112803.1508296-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230814112803.1508296-1-kjain@linux.ibm.com>
References: <20230814112803.1508296-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 02jjMgMKAyBfXI6M85zdpkujhjpDKASR
X-Proofpoint-GUID: 0vHioFvPXcx4-5mlfHjTLUIQSRaLKRot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_06,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

Update JSON/events for power10 platform with additional events.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/frontend.json        | 25 +++++++++++++
 .../arch/powerpc/power10/marked.json          | 30 ++++++++++++++++
 .../arch/powerpc/power10/memory.json          | 10 ++++++
 .../arch/powerpc/power10/others.json          |  5 +++
 .../arch/powerpc/power10/pipeline.json        | 35 +++++++++++++++++++
 .../pmu-events/arch/powerpc/power10/pmc.json  |  5 +++
 .../arch/powerpc/power10/translation.json     |  5 +++
 7 files changed, 115 insertions(+)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
index dc0bb6c6338b..5977f5e64212 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
@@ -1,4 +1,14 @@
 [
+  {
+    "EventCode": "0x1D054",
+    "EventName": "PM_DTLB_HIT_2M",
+    "BriefDescription": "Data TLB hit (DERAT reload) page size 2M. Implies radix translation. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
+  },
+  {
+    "EventCode": "0x1D058",
+    "EventName": "PM_ITLB_HIT_64K",
+    "BriefDescription": "Instruction TLB hit (IERAT reload) page size 64K. When MMCR1[17]=0 this event counts only for demand misses. When MMCR1[17]=1 this event includes demand misses and prefetches."
+  },
   {
     "EventCode": "0x1F054",
     "EventName": "PM_DTLB_HIT",
@@ -44,6 +54,11 @@
     "EventName": "PM_ITLB_HIT_1G",
     "BriefDescription": "Instruction TLB hit (IERAT reload) page size 1G, which implies Radix Page Table translation is in use. When MMCR1[17]=0 this event counts only for demand misses. When MMCR1[17]=1 this event includes demand misses and prefetches."
   },
+  {
+    "EventCode": "0x3C05A",
+    "EventName": "PM_DTLB_HIT_64K",
+    "BriefDescription": "Data TLB hit (DERAT reload) page size 64K. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
+  },
   {
     "EventCode": "0x3E054",
     "EventName": "PM_LD_MISS_L1",
@@ -63,5 +78,15 @@
     "EventCode": "0x44056",
     "EventName": "PM_VECTOR_ST_CMPL",
     "BriefDescription": "Vector store instruction completed."
+  },
+  {
+    "EventCode": "0x4E054",
+    "EventName": "PM_DTLB_HIT_1G",
+    "BriefDescription": "Data TLB hit (DERAT reload) page size 1G. Implies radix translation. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
+  },
+  {
+    "EventCode": "0x400FC",
+    "EventName": "PM_ITLB_MISS",
+    "BriefDescription": "Instruction TLB reload (after a miss), all page sizes. Includes only demand misses."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/marked.json b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
index 913b6515b870..78f71a9eadfd 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/marked.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
@@ -19,6 +19,11 @@
     "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC1",
     "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[0:12]."
   },
+  {
+    "EventCode": "0x1D15C",
+    "EventName": "PM_MRK_DTLB_MISS_1G",
+    "BriefDescription": "Marked Data TLB reload (after a miss) page size 1G. Implies radix translation was used. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
+  },
   {
     "EventCode": "0x1F150",
     "EventName": "PM_MRK_ST_L2_CYC",
@@ -134,6 +139,11 @@
     "EventName": "PM_MRK_L2_RC_DONE",
     "BriefDescription": "L2 RC machine completed the transaction for the marked instruction."
   },
+  {
+    "EventCode": "0x3012E",
+    "EventName": "PM_MRK_DTLB_MISS_2M",
+    "BriefDescription": "Marked Data TLB reload (after a miss) page size 2M, which implies Radix Page Table translation was used. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
+  },
   {
     "EventCode": "0x30132",
     "EventName": "PM_MRK_VSU_FIN",
@@ -184,6 +194,16 @@
     "EventName": "PM_MRK_BR_MPRED_CMPL",
     "BriefDescription": "Marked Branch Mispredicted. Includes direction and target."
   },
+  {
+    "EventCode": "0x301E6",
+    "EventName": "PM_MRK_DERAT_MISS",
+    "BriefDescription": "Marked Erat Miss (Data TLB Access) All page sizes. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
+  },
+  {
+    "EventCode": "0x4010E",
+    "EventName": "PM_MRK_TLBIE_FIN",
+    "BriefDescription": "Marked TLBIE instruction finished. Includes TLBIE and TLBIEL instructions."
+  },
   {
     "EventCode": "0x40116",
     "EventName": "PM_MRK_LARX_FIN",
@@ -209,6 +229,11 @@
     "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC4",
     "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[45:57]."
   },
+  {
+    "EventCode": "0x4C15C",
+    "EventName": "PM_MRK_DERAT_MISS_1G",
+    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 1G for a marked instruction. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
+  },
   {
     "EventCode": "0x4C15E",
     "EventName": "PM_MRK_DTLB_MISS_64K",
@@ -229,6 +254,11 @@
     "EventName": "PM_MRK_INST_CMPL",
     "BriefDescription": "Marked instruction completed."
   },
+  {
+    "EventCode": "0x401E4",
+    "EventName": "PM_MRK_DTLB_MISS",
+    "BriefDescription": "The DPTEG required for the marked load/store instruction in execution was missing from the TLB. This event only counts for demand misses."
+  },
   {
     "EventCode": "0x401E6",
     "EventName": "PM_MRK_INST_FROM_L3MISS",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/memory.json b/tools/perf/pmu-events/arch/powerpc/power10/memory.json
index b95a547a704b..885262957beb 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/memory.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/memory.json
@@ -49,11 +49,21 @@
     "EventName": "PM_DTLB_MISS_4K",
     "BriefDescription": "Data TLB reload (after a miss) page size 4K. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   },
+  {
+    "EventCode": "0x2C05A",
+    "EventName": "PM_DERAT_MISS_1G",
+    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 1G. Implies radix translation. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
+  },
   {
     "EventCode": "0x200F6",
     "EventName": "PM_DERAT_MISS",
     "BriefDescription": "DERAT Reloaded to satisfy a DERAT miss. All page sizes are counted by this event. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   },
+  {
+    "EventCode": "0x34044",
+    "EventName": "PM_DERAT_MISS_PREF",
+    "BriefDescription": "DERAT miss (TLB access) while servicing a data prefetch."
+  },
   {
     "EventCode": "0x3C040",
     "EventName": "PM_XFER_FROM_SRC_PMC3",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
index f09c00c89322..0e21e7ba1959 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
@@ -14,6 +14,11 @@
     "EventName": "PM_DISP_SS0_2_INSTR_CYC",
     "BriefDescription": "Cycles in which Superslice 0 dispatches either 1 or 2 instructions."
   },
+  {
+    "EventCode": "0x1F05A",
+    "EventName": "PM_DISP_HELD_SYNC_CYC",
+    "BriefDescription": "Cycles dispatch is held because of a synchronizing instruction that requires the ICT to be empty before dispatch."
+  },
   {
     "EventCode": "0x10066",
     "EventName": "PM_ADJUNCT_CYC",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
index a8272a2f0517..21b23bb55d0d 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
@@ -34,6 +34,11 @@
     "EventName": "PM_IC_DEMAND_CYC",
     "BriefDescription": "Cycles in which an instruction reload is pending to satisfy a demand miss."
   },
+  {
+    "EventCode": "0x10028",
+    "EventName": "PM_NTC_FLUSH",
+    "BriefDescription": "The instruction was flushed after becoming next-to-complete (NTC)."
+  },
   {
     "EventCode": "0x10038",
     "EventName": "PM_DISP_STALL_TRANSLATION",
@@ -89,6 +94,11 @@
     "EventName": "PM_CMPL_STALL_LWSYNC",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a lwsync waiting to complete."
   },
+  {
+    "EventCode": "0x1F058",
+    "EventName": "PM_DISP_HELD_CYC",
+    "BriefDescription": "Cycles dispatch is held."
+  },
   {
     "EventCode": "0x10064",
     "EventName": "PM_DISP_STALL_IC_L2",
@@ -219,6 +229,16 @@
     "EventName": "PM_NTC_FIN",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline (NTC) finishes. Note that instructions can finish out of order, therefore not all the instructions that finish have a Next-to-complete status."
   },
+  {
+    "EventCode": "0x20066",
+    "EventName": "PM_DISP_HELD_OTHER_CYC",
+    "BriefDescription": "Cycles dispatch is held for any other reason."
+  },
+  {
+    "EventCode": "0x2006A",
+    "EventName": "PM_DISP_HELD_STF_MAPPER_CYC",
+    "BriefDescription": "Cycles dispatch is held because the STF mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR."
+  },
   {
     "EventCode": "0x30004",
     "EventName": "PM_DISP_STALL_FLUSH",
@@ -309,6 +329,11 @@
     "EventName": "PM_DISP_STALL_IC_L3",
     "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L3."
   },
+  {
+    "EventCode": "0x30060",
+    "EventName": "PM_DISP_HELD_XVFC_MAPPER_CYC",
+    "BriefDescription": "Cycles dispatch is held because the XVFC mapper/SRB was full."
+  },
   {
     "EventCode": "0x30066",
     "EventName": "PM_LSU_FIN",
@@ -414,6 +439,16 @@
     "EventName": "PM_IC_MISS_CMPL",
     "BriefDescription": "Non-speculative instruction cache miss, counted at completion."
   },
+  {
+    "EventCode": "0x40060",
+    "EventName": "PM_DISP_HELD_SCOREBOARD_CYC",
+    "BriefDescription": "Cycles dispatch is held while waiting on the Scoreboard. This event combines VSCR and FPSCR together."
+  },
+  {
+    "EventCode": "0x40062",
+    "EventName": "PM_DISP_HELD_RENAME_CYC",
+    "BriefDescription": "Cycles dispatch is held because the mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR and XVFC."
+  },
   {
     "EventCode": "0x400F2",
     "EventName": "PM_1PLUS_PPC_DISP",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
index 0a2bf56ee7c1..c606ae03cd27 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
@@ -39,6 +39,11 @@
     "EventName": "PM_PMC5_OVERFLOW",
     "BriefDescription": "The event selected for PMC5 caused the event counter to overflow."
   },
+  {
+    "EventCode": "0x1002A",
+    "EventName": "PM_PMC3_HELD_CYC",
+    "BriefDescription": "Cycles when the speculative counter for PMC3 is frozen."
+  },
   {
     "EventCode": "0x1F15E",
     "EventName": "PM_MRK_START_PROBE_NOP_CMPL",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/translation.json b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
index 170c9aeb30d8..ea73900d248a 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/translation.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
@@ -13,5 +13,10 @@
     "EventCode": "0x200FE",
     "EventName": "PM_DATA_FROM_L2MISS",
     "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
+  },
+  {
+    "EventCode": "0x300F0",
+    "EventName": "PM_ST_MISS_L1",
+    "BriefDescription": "Store Missed L1."
   }
 ]
-- 
2.39.3

