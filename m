Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F51177B7A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 13:32:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QFY0PHkO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPXMD2Fq9z3dG7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 21:32:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QFY0PHkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPXGS23hPz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 21:28:47 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EBL8rH012275;
	Mon, 14 Aug 2023 11:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ee+zpHmspv+mMMm0P3MEYccCInqKwfOze40rb6tkvpQ=;
 b=QFY0PHkOkhmS3qVQsj6nss35VmyUeQScE95hriF6ATA68Rva0vNOCWW4NZSKH4xEMoz0
 0IZrFtLS3Pwwk3l5bbUDHo/zee0QGtoCZqqZygOTOGzkUElU08WXKYHO1RN4fUw8YDX1
 q2/MlBE2Tn7uTK/KHgJrozRk+Ly/uvf1dKyR6gvjBu3c/NC1LHJbabRq44G1UmBULp3F
 U6dOO9BEQbIvhjJEg6gqIHbe6lqXFJUl26V0aYpw//nZnhMoYW7y68EhQfLMzUVlYUpC
 ax7kPK3zxOR9XGhL7zoR5XpcX1LOShPRdh/M8eNfZ6yk4Bh1vL0eo7hdKiVdehFU0B6m rA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfkak04xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:40 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37EBNDHV017508;
	Mon, 14 Aug 2023 11:28:39 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfkak04xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:39 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37EAEQZ2002421;
	Mon, 14 Aug 2023 11:28:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sendmus74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37EBSYgE3801644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Aug 2023 11:28:34 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68F7F2004E;
	Mon, 14 Aug 2023 11:28:34 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5705120040;
	Mon, 14 Aug 2023 11:28:31 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.123.95])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Aug 2023 11:28:31 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH 4/7] perf vendor events: Move JSON/events to appropriate files for power10 platform
Date: Mon, 14 Aug 2023 16:58:00 +0530
Message-Id: <20230814112803.1508296-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230814112803.1508296-1-kjain@linux.ibm.com>
References: <20230814112803.1508296-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q7sa4WYIRDU4vel24RHAum7PlBDn0zVW
X-Proofpoint-GUID: 8p7eGFKCvaBELUm5AiPEBSIZT1m0k16A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_06,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

Move some of the power10 JSON/events to appropriate files.

Fixes: 32daa5d7899e ("perf vendor events: Initial JSON/events list for power10 platform")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/cache.json           |  45 ----
 .../arch/powerpc/power10/floating_point.json  |  67 +++++
 .../arch/powerpc/power10/frontend.json        | 180 -------------
 .../arch/powerpc/power10/marked.json          | 186 ++++++++++---
 .../arch/powerpc/power10/memory.json          |  85 ------
 .../arch/powerpc/power10/others.json          | 192 ++------------
 .../arch/powerpc/power10/pipeline.json        | 247 ++++++++++++++----
 .../pmu-events/arch/powerpc/power10/pmc.json  | 193 +++++++++++++-
 .../arch/powerpc/power10/translation.json     |  35 ---
 9 files changed, 616 insertions(+), 614 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/floating_point.json

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/cache.json b/tools/perf/pmu-events/arch/powerpc/power10/cache.json
index 9cb929bb64af..839ae26945fb 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/cache.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/cache.json
@@ -1,54 +1,9 @@
 [
-  {
-    "EventCode": "0x1003C",
-    "EventName": "PM_EXEC_STALL_DMISS_L2L3",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from either the local L2 or local L3."
-  },
-  {
-    "EventCode": "0x1E054",
-    "EventName": "PM_EXEC_STALL_DMISS_L21_L31",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from another core's L2 or L3 on the same chip."
-  },
-  {
-    "EventCode": "0x34054",
-    "EventName": "PM_EXEC_STALL_DMISS_L2L3_NOCONFLICT",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local L2 or local L3, without a dispatch conflict."
-  },
-  {
-    "EventCode": "0x34056",
-    "EventName": "PM_EXEC_STALL_LOAD_FINISH",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was finishing a load after its data was reloaded from a data source beyond the local L1; cycles in which the LSU was processing an L1-hit; cycles in which the next-to-finish (NTF) instruction merged with another load in the LMQ; cycles in which the NTF instruction is waiting for a data reload for a load miss, but the data comes back with a non-NTF instruction."
-  },
-  {
-    "EventCode": "0x3006C",
-    "EventName": "PM_RUN_CYC_SMT2_MODE",
-    "BriefDescription": "Cycles when this thread's run latch is set and the core is in SMT2 mode."
-  },
   {
     "EventCode": "0x300F4",
     "EventName": "PM_RUN_INST_CMPL_CONC",
     "BriefDescription": "PowerPC instruction completed by this thread when all threads in the core had the run-latch set."
   },
-  {
-    "EventCode": "0x4C016",
-    "EventName": "PM_EXEC_STALL_DMISS_L2L3_CONFLICT",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local L2 or local L3, with a dispatch conflict."
-  },
-  {
-    "EventCode": "0x4D014",
-    "EventName": "PM_EXEC_STALL_LOAD",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a load instruction executing in the Load Store Unit."
-  },
-  {
-    "EventCode": "0x4D016",
-    "EventName": "PM_EXEC_STALL_PTESYNC",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a PTESYNC instruction executing in the Load Store Unit."
-  },
-  {
-    "EventCode": "0x401EA",
-    "EventName": "PM_THRESH_EXC_128",
-    "BriefDescription": "Threshold counter exceeded a value of 128."
-  },
   {
     "EventCode": "0x400F6",
     "EventName": "PM_BR_MPRED_CMPL",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json b/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json
new file mode 100644
index 000000000000..e816cd10c129
--- /dev/null
+++ b/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json
@@ -0,0 +1,67 @@
+[
+  {
+    "EventCode": "0x100F4",
+    "EventName": "PM_FLOP_CMPL",
+    "BriefDescription": "Floating Point Operations Completed. Includes any type. It counts once for each 1, 2, 4 or 8 flop instruction. Use PM_1|2|4|8_FLOP_CMPL events to count flops."
+  },
+  {
+    "EventCode": "0x45050",
+    "EventName": "PM_1FLOP_CMPL",
+    "BriefDescription": "One floating point instruction completed (fadd, fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg)."
+  },
+  {
+    "EventCode": "0x45052",
+    "EventName": "PM_4FLOP_CMPL",
+    "BriefDescription": "Four floating point instruction completed (fadd, fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg)."
+  },
+  {
+    "EventCode": "0x45054",
+    "EventName": "PM_FMA_CMPL",
+    "BriefDescription": "Two floating point instruction completed (FMA class of instructions: fmadd, fnmadd, fmsub, fnmsub). Scalar instructions only."
+  },
+  {
+    "EventCode": "0x45056",
+    "EventName": "PM_SCALAR_FLOP_CMPL",
+    "BriefDescription": "Scalar floating point instruction completed."
+  },
+  {
+    "EventCode": "0x4505A",
+    "EventName": "PM_SP_FLOP_CMPL",
+    "BriefDescription": "Single Precision floating point instruction completed."
+  },
+  {
+    "EventCode": "0x4505C",
+    "EventName": "PM_MATH_FLOP_CMPL",
+    "BriefDescription": "Math floating point instruction completed."
+  },
+  {
+    "EventCode": "0x4D052",
+    "EventName": "PM_2FLOP_CMPL",
+    "BriefDescription": "Double Precision vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg completed."
+  },
+  {
+    "EventCode": "0x4D054",
+    "EventName": "PM_8FLOP_CMPL",
+    "BriefDescription": "Four Double Precision vector instruction completed."
+  },
+  {
+    "EventCode": "0x4D056",
+    "EventName": "PM_NON_FMA_FLOP_CMPL",
+    "BriefDescription": "Non FMA instruction completed."
+  },
+  {
+    "EventCode": "0x4D058",
+    "EventName": "PM_VECTOR_FLOP_CMPL",
+    "BriefDescription": "Vector floating point instruction completed."
+  },
+  {
+    "EventCode": "0x4D05A",
+    "EventName": "PM_NON_MATH_FLOP_CMPL",
+    "BriefDescription": "Non Math instruction completed."
+  },
+  {
+    "EventCode": "0x4D05C",
+    "EventName": "PM_DPP_FLOP_CMPL",
+    "BriefDescription": "Double-Precision or Quad-Precision instruction completed."
+  }
+]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
index 61e9e0222c87..dc0bb6c6338b 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
@@ -1,64 +1,9 @@
 [
-  {
-    "EventCode": "0x10004",
-    "EventName": "PM_EXEC_STALL_TRANSLATION",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline suffered a TLB miss or ERAT miss and waited for it to resolve."
-  },
-  {
-    "EventCode": "0x10006",
-    "EventName": "PM_DISP_STALL_HELD_OTHER_CYC",
-    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch for any other reason."
-  },
-  {
-    "EventCode": "0x10010",
-    "EventName": "PM_PMC4_OVERFLOW",
-    "BriefDescription": "The event selected for PMC4 caused the event counter to overflow."
-  },
-  {
-    "EventCode": "0x10020",
-    "EventName": "PM_PMC4_REWIND",
-    "BriefDescription": "The speculative event selected for PMC4 rewinds and the counter for PMC4 is not charged."
-  },
-  {
-    "EventCode": "0x10038",
-    "EventName": "PM_DISP_STALL_TRANSLATION",
-    "BriefDescription": "Cycles when dispatch was stalled for this thread because the MMU was handling a translation miss."
-  },
-  {
-    "EventCode": "0x1003A",
-    "EventName": "PM_DISP_STALL_BR_MPRED_IC_L2",
-    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L2 after suffering a branch mispredict."
-  },
-  {
-    "EventCode": "0x1D05E",
-    "EventName": "PM_DISP_STALL_HELD_HALT_CYC",
-    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because of power management."
-  },
-  {
-    "EventCode": "0x1E050",
-    "EventName": "PM_DISP_STALL_HELD_STF_MAPPER_CYC",
-    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because the STF mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR."
-  },
   {
     "EventCode": "0x1F054",
     "EventName": "PM_DTLB_HIT",
     "BriefDescription": "The PTE required by the instruction was resident in the TLB (data TLB access). When MMCR1[16]=0 this event counts only demand hits. When MMCR1[16]=1 this event includes demand and prefetch. Applies to both HPT and RPT."
   },
-  {
-    "EventCode": "0x10064",
-    "EventName": "PM_DISP_STALL_IC_L2",
-    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L2."
-  },
-  {
-    "EventCode": "0x101E8",
-    "EventName": "PM_THRESH_EXC_256",
-    "BriefDescription": "Threshold counter exceeded a count of 256."
-  },
-  {
-    "EventCode": "0x101EC",
-    "EventName": "PM_THRESH_MET",
-    "BriefDescription": "Threshold exceeded."
-  },
   {
     "EventCode": "0x100F2",
     "EventName": "PM_1PLUS_PPC_CMPL",
@@ -69,56 +14,6 @@
     "EventName": "PM_IERAT_MISS",
     "BriefDescription": "IERAT Reloaded to satisfy an IERAT miss. All page sizes are counted by this event. This event only counts instruction demand access."
   },
-  {
-    "EventCode": "0x100F8",
-    "EventName": "PM_DISP_STALL_CYC",
-    "BriefDescription": "Cycles the ICT has no itags assigned to this thread (no instructions were dispatched during these cycles)."
-  },
-  {
-    "EventCode": "0x20006",
-    "EventName": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC",
-    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch due to Issue queue full. Includes issue queue and branch queue."
-  },
-  {
-    "EventCode": "0x20114",
-    "EventName": "PM_MRK_L2_RC_DISP",
-    "BriefDescription": "Marked instruction RC dispatched in L2."
-  },
-  {
-    "EventCode": "0x2C010",
-    "EventName": "PM_EXEC_STALL_LSU",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in the Load Store Unit. This does not include simple fixed point instructions."
-  },
-  {
-    "EventCode": "0x2C016",
-    "EventName": "PM_DISP_STALL_IERAT_ONLY_MISS",
-    "BriefDescription": "Cycles when dispatch was stalled while waiting to resolve an instruction ERAT miss."
-  },
-  {
-    "EventCode": "0x2C01E",
-    "EventName": "PM_DISP_STALL_BR_MPRED_IC_L3",
-    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L3 after suffering a branch mispredict."
-  },
-  {
-    "EventCode": "0x2D01A",
-    "EventName": "PM_DISP_STALL_IC_MISS",
-    "BriefDescription": "Cycles when dispatch was stalled for this thread due to an instruction cache miss."
-  },
-  {
-    "EventCode": "0x2E018",
-    "EventName": "PM_DISP_STALL_FETCH",
-    "BriefDescription": "Cycles when dispatch was stalled for this thread because Fetch was being held."
-  },
-  {
-    "EventCode": "0x2E01A",
-    "EventName": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC",
-    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because the XVFC mapper/SRB was full."
-  },
-  {
-    "EventCode": "0x2C142",
-    "EventName": "PM_MRK_XFER_FROM_SRC_PMC2",
-    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[15:27]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
-  },
   {
     "EventCode": "0x24050",
     "EventName": "PM_IOPS_DISP",
@@ -134,11 +29,6 @@
     "EventName": "PM_BR_TAKEN_CMPL",
     "BriefDescription": "Branch Taken instruction completed."
   },
-  {
-    "EventCode": "0x30004",
-    "EventName": "PM_DISP_STALL_FLUSH",
-    "BriefDescription": "Cycles when dispatch was stalled because of a flush that happened to an instruction(s) that was not yet next-to-complete (NTC). PM_EXEC_STALL_NTC_FLUSH only includes instructions that were flushed after becoming NTC."
-  },
   {
     "EventCode": "0x3000A",
     "EventName": "PM_DISP_STALL_ITLB_MISS",
@@ -149,56 +39,16 @@
     "EventName": "PM_FLUSH_COMPLETION",
     "BriefDescription": "The instruction that was next to complete (oldest in the pipeline) did not complete because it suffered a flush."
   },
-  {
-    "EventCode": "0x30014",
-    "EventName": "PM_EXEC_STALL_STORE",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a store instruction executing in the Load Store Unit."
-  },
-  {
-    "EventCode": "0x30018",
-    "EventName": "PM_DISP_STALL_HELD_SCOREBOARD_CYC",
-    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch while waiting on the Scoreboard. This event combines VSCR and FPSCR together."
-  },
-  {
-    "EventCode": "0x30026",
-    "EventName": "PM_EXEC_STALL_STORE_MISS",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a store whose cache line was not resident in the L1 and was waiting for allocation of the missing line into the L1."
-  },
-  {
-    "EventCode": "0x3012A",
-    "EventName": "PM_MRK_L2_RC_DONE",
-    "BriefDescription": "L2 RC machine completed the transaction for the marked instruction."
-  },
   {
     "EventCode": "0x3F046",
     "EventName": "PM_ITLB_HIT_1G",
     "BriefDescription": "Instruction TLB hit (IERAT reload) page size 1G, which implies Radix Page Table translation is in use. When MMCR1[17]=0 this event counts only for demand misses. When MMCR1[17]=1 this event includes demand misses and prefetches."
   },
-  {
-    "EventCode": "0x34058",
-    "EventName": "PM_DISP_STALL_BR_MPRED_ICMISS",
-    "BriefDescription": "Cycles when dispatch was stalled after a mispredicted branch resulted in an instruction cache miss."
-  },
-  {
-    "EventCode": "0x3D05C",
-    "EventName": "PM_DISP_STALL_HELD_RENAME_CYC",
-    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because the mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR and XVFC."
-  },
-  {
-    "EventCode": "0x3E052",
-    "EventName": "PM_DISP_STALL_IC_L3",
-    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L3."
-  },
   {
     "EventCode": "0x3E054",
     "EventName": "PM_LD_MISS_L1",
     "BriefDescription": "Load missed L1, counted at finish time. LMQ merges are not included in this count. i.e. if a load instruction misses on an address that is already allocated on the LMQ, this event will not increment for that load). Note that this count is per slice, so if a load spans multiple slices this event will increment multiple times for a single load."
   },
-  {
-    "EventCode": "0x301EA",
-    "EventName": "PM_THRESH_EXC_1024",
-    "BriefDescription": "Threshold counter exceeded a value of 1024."
-  },
   {
     "EventCode": "0x300FA",
     "EventName": "PM_INST_FROM_L3MISS",
@@ -209,36 +59,6 @@
     "EventName": "PM_ISSUE_KILL",
     "BriefDescription": "Cycles in which an instruction or group of instructions were cancelled after being issued. This event increments once per occurrence, regardless of how many instructions are included in the issue group."
   },
-  {
-    "EventCode": "0x40116",
-    "EventName": "PM_MRK_LARX_FIN",
-    "BriefDescription": "Marked load and reserve instruction (LARX) finished. LARX and STCX are instructions used to acquire a lock."
-  },
-  {
-    "EventCode": "0x4C010",
-    "EventName": "PM_DISP_STALL_BR_MPRED_IC_L3MISS",
-    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from sources beyond the local L3 after suffering a mispredicted branch."
-  },
-  {
-    "EventCode": "0x4D01E",
-    "EventName": "PM_DISP_STALL_BR_MPRED",
-    "BriefDescription": "Cycles when dispatch was stalled for this thread due to a mispredicted branch."
-  },
-  {
-    "EventCode": "0x4E010",
-    "EventName": "PM_DISP_STALL_IC_L3MISS",
-    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from any source beyond the local L3."
-  },
-  {
-    "EventCode": "0x4E01A",
-    "EventName": "PM_DISP_STALL_HELD_CYC",
-    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch for any reason."
-  },
-  {
-    "EventCode": "0x4003C",
-    "EventName": "PM_DISP_STALL_HELD_SYNC_CYC",
-    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch."
-  },
   {
     "EventCode": "0x44056",
     "EventName": "PM_VECTOR_ST_CMPL",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/marked.json b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
index f2436fc5537c..913b6515b870 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/marked.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
@@ -1,14 +1,29 @@
 [
-  {
-    "EventCode": "0x1002C",
-    "EventName": "PM_LD_PREFETCH_CACHE_LINE_MISS",
-    "BriefDescription": "The L1 cache was reloaded with a line that fulfills a prefetch request."
-  },
   {
     "EventCode": "0x10132",
     "EventName": "PM_MRK_INST_ISSUED",
     "BriefDescription": "Marked instruction issued. Note that stores always get issued twice, the address gets issued to the LSU and the data gets issued to the VSU. Also, issues can sometimes get killed/cancelled and cause multiple sequential issues for the same instruction."
   },
+  {
+    "EventCode": "0x10134",
+    "EventName": "PM_MRK_ST_DONE_L2",
+    "BriefDescription": "Marked store completed in L2."
+  },
+  {
+    "EventCode": "0x1C142",
+    "EventName": "PM_MRK_XFER_FROM_SRC_PMC1",
+    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[0:12]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
+  },
+  {
+    "EventCode": "0x1C144",
+    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC1",
+    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[0:12]."
+  },
+  {
+    "EventCode": "0x1F150",
+    "EventName": "PM_MRK_ST_L2_CYC",
+    "BriefDescription": "Cycles from L2 RC dispatch to L2 RC completion."
+  },
   {
     "EventCode": "0x101E0",
     "EventName": "PM_MRK_INST_DISP",
@@ -20,9 +35,39 @@
     "BriefDescription": "Marked Branch Taken instruction completed."
   },
   {
-    "EventCode": "0x2C01C",
-    "EventName": "PM_EXEC_STALL_DMISS_OFF_CHIP",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from a remote chip."
+    "EventCode": "0x101E4",
+    "EventName": "PM_MRK_L1_ICACHE_MISS",
+    "BriefDescription": "Marked instruction suffered an instruction cache miss."
+  },
+  {
+    "EventCode": "0x101EA",
+    "EventName": "PM_MRK_L1_RELOAD_VALID",
+    "BriefDescription": "Marked demand reload."
+  },
+  {
+    "EventCode": "0x20114",
+    "EventName": "PM_MRK_L2_RC_DISP",
+    "BriefDescription": "Marked instruction RC dispatched in L2."
+  },
+  {
+    "EventCode": "0x2011C",
+    "EventName": "PM_MRK_NTF_CYC",
+    "BriefDescription": "Cycles in which the marked instruction is the oldest in the pipeline (next-to-finish or next-to-complete)."
+  },
+  {
+    "EventCode": "0x20130",
+    "EventName": "PM_MRK_INST_DECODED",
+    "BriefDescription": "An instruction was marked at decode time. Random Instruction Sampling (RIS) only."
+  },
+  {
+    "EventCode": "0x20132",
+    "EventName": "PM_MRK_DFU_ISSUE",
+    "BriefDescription": "The marked instruction was a decimal floating point operation issued to the VSU. Measured at issue time."
+  },
+  {
+    "EventCode": "0x20134",
+    "EventName": "PM_MRK_FXU_ISSUE",
+    "BriefDescription": "The marked instruction was a fixed point operation issued to the VSU. Measured at issue time."
   },
   {
     "EventCode": "0x20138",
@@ -34,6 +79,16 @@
     "EventName": "PM_MRK_BRU_FIN",
     "BriefDescription": "Marked Branch instruction finished."
   },
+  {
+    "EventCode": "0x2013C",
+    "EventName": "PM_MRK_FX_LSU_FIN",
+    "BriefDescription": "The marked instruction was simple fixed point that was issued to the store unit. Measured at finish time."
+  },
+  {
+    "EventCode": "0x2C142",
+    "EventName": "PM_MRK_XFER_FROM_SRC_PMC2",
+    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[15:27]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
+  },
   {
     "EventCode": "0x2C144",
     "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC2",
@@ -55,15 +110,50 @@
     "BriefDescription": "A marked branch completed. All branches are included."
   },
   {
-    "EventCode": "0x200FD",
-    "EventName": "PM_L1_ICACHE_MISS",
-    "BriefDescription": "Demand instruction cache miss."
+    "EventCode": "0x2D154",
+    "EventName": "PM_MRK_DERAT_MISS_64K",
+    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 64K for a marked instruction. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
+  },
+  {
+    "EventCode": "0x201E0",
+    "EventName": "PM_MRK_DATA_FROM_MEMORY",
+    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss for a marked load."
+  },
+  {
+    "EventCode": "0x201E2",
+    "EventName": "PM_MRK_LD_MISS_L1",
+    "BriefDescription": "Marked demand data load miss counted at finish time."
+  },
+  {
+    "EventCode": "0x201E4",
+    "EventName": "PM_MRK_DATA_FROM_L3MISS",
+    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss for a marked load."
+  },
+  {
+    "EventCode": "0x3012A",
+    "EventName": "PM_MRK_L2_RC_DONE",
+    "BriefDescription": "L2 RC machine completed the transaction for the marked instruction."
+  },
+  {
+    "EventCode": "0x30132",
+    "EventName": "PM_MRK_VSU_FIN",
+    "BriefDescription": "VSU marked instruction finished. Excludes simple FX instructions issued to the Store Unit."
   },
   {
     "EventCode": "0x34146",
     "EventName": "PM_MRK_LD_CMPL",
     "BriefDescription": "Marked load instruction completed."
   },
+  {
+    "EventCode": "0x3C142",
+    "EventName": "PM_MRK_XFER_FROM_SRC_PMC3",
+    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[30:42]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
+  },
+  {
+    "EventCode": "0x3C144",
+    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC3",
+    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[30:42]."
+  },
   {
     "EventCode": "0x3E158",
     "EventName": "PM_MRK_STCX_FAIL",
@@ -75,9 +165,19 @@
     "BriefDescription": "Marked store instruction finished."
   },
   {
-    "EventCode": "0x30068",
-    "EventName": "PM_L1_ICACHE_RELOADED_PREF",
-    "BriefDescription": "Counts all instruction cache prefetch reloads (includes demand turned into prefetch)."
+    "EventCode": "0x3F150",
+    "EventName": "PM_MRK_ST_DRAIN_CYC",
+    "BriefDescription": "Cycles in which the marked store drained from the core to the L2."
+  },
+  {
+    "EventCode": "0x30162",
+    "EventName": "PM_MRK_ISSUE_DEPENDENT_LOAD",
+    "BriefDescription": "The marked instruction was dependent on a load. It is eligible for issue kill."
+  },
+  {
+    "EventCode": "0x301E2",
+    "EventName": "PM_MRK_ST_CMPL",
+    "BriefDescription": "Marked store completed and sent to nest. Note that this count excludes cache-inhibited stores."
   },
   {
     "EventCode": "0x301E4",
@@ -85,39 +185,44 @@
     "BriefDescription": "Marked Branch Mispredicted. Includes direction and target."
   },
   {
-    "EventCode": "0x300F6",
-    "EventName": "PM_LD_DEMAND_MISS_L1",
-    "BriefDescription": "The L1 cache was reloaded with a line that fulfills a demand miss request. Counted at reload time, before finish."
+    "EventCode": "0x40116",
+    "EventName": "PM_MRK_LARX_FIN",
+    "BriefDescription": "Marked load and reserve instruction (LARX) finished. LARX and STCX are instructions used to acquire a lock."
+  },
+  {
+    "EventCode": "0x40132",
+    "EventName": "PM_MRK_LSU_FIN",
+    "BriefDescription": "LSU marked instruction finish."
   },
   {
-    "EventCode": "0x300FE",
-    "EventName": "PM_DATA_FROM_L3MISS",
-    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss."
+    "EventCode": "0x44146",
+    "EventName": "PM_MRK_STCX_CORE_CYC",
+    "BriefDescription": "Cycles spent in the core portion of a marked STCX instruction. It starts counting when the instruction is decoded and stops counting when it drains into the L2."
   },
   {
-    "EventCode": "0x40012",
-    "EventName": "PM_L1_ICACHE_RELOADED_ALL",
-    "BriefDescription": "Counts all instruction cache reloads includes demand, prefetch, prefetch turned into demand and demand turned into prefetch."
+    "EventCode": "0x4C142",
+    "EventName": "PM_MRK_XFER_FROM_SRC_PMC4",
+    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[45:57]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
   },
   {
-    "EventCode": "0x40134",
-    "EventName": "PM_MRK_INST_TIMEO",
-    "BriefDescription": "Marked instruction finish timeout (instruction was lost)."
+    "EventCode": "0x4C144",
+    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC4",
+    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[45:57]."
   },
   {
-    "EventCode": "0x4505A",
-    "EventName": "PM_SP_FLOP_CMPL",
-    "BriefDescription": "Single Precision floating point instruction completed."
+    "EventCode": "0x4C15E",
+    "EventName": "PM_MRK_DTLB_MISS_64K",
+    "BriefDescription": "Marked Data TLB reload (after a miss) page size 64K. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   },
   {
-    "EventCode": "0x4D058",
-    "EventName": "PM_VECTOR_FLOP_CMPL",
-    "BriefDescription": "Vector floating point instruction completed."
+    "EventCode": "0x4E15E",
+    "EventName": "PM_MRK_INST_FLUSHED",
+    "BriefDescription": "The marked instruction was flushed."
   },
   {
-    "EventCode": "0x4D05A",
-    "EventName": "PM_NON_MATH_FLOP_CMPL",
-    "BriefDescription": "Non Math instruction completed."
+    "EventCode": "0x40164",
+    "EventName": "PM_MRK_DERAT_MISS_2M",
+    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 2M for a marked instruction. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   },
   {
     "EventCode": "0x401E0",
@@ -125,8 +230,13 @@
     "BriefDescription": "Marked instruction completed."
   },
   {
-    "EventCode": "0x400FE",
-    "EventName": "PM_DATA_FROM_MEMORY",
-    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss."
+    "EventCode": "0x401E6",
+    "EventName": "PM_MRK_INST_FROM_L3MISS",
+    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x401E8",
+    "EventName": "PM_MRK_DATA_FROM_L2MISS",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/memory.json b/tools/perf/pmu-events/arch/powerpc/power10/memory.json
index c4c10ca98cad..b95a547a704b 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/memory.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/memory.json
@@ -1,24 +1,9 @@
 [
-  {
-    "EventCode": "0x1000A",
-    "EventName": "PM_PMC3_REWIND",
-    "BriefDescription": "The speculative event selected for PMC3 rewinds and the counter for PMC3 is not charged."
-  },
   {
     "EventCode": "0x1C040",
     "EventName": "PM_XFER_FROM_SRC_PMC1",
     "BriefDescription": "The processor's L1 data cache was reloaded from the source specified in MMCR3[0:12]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
   },
-  {
-    "EventCode": "0x1C142",
-    "EventName": "PM_MRK_XFER_FROM_SRC_PMC1",
-    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[0:12]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
-  },
-  {
-    "EventCode": "0x1C144",
-    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC1",
-    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[0:12]."
-  },
   {
     "EventCode": "0x1C056",
     "EventName": "PM_DERAT_MISS_4K",
@@ -34,26 +19,11 @@
     "EventName": "PM_DTLB_MISS_2M",
     "BriefDescription": "Data TLB reload (after a miss) page size 2M. Implies radix translation was used. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   },
-  {
-    "EventCode": "0x1E056",
-    "EventName": "PM_EXEC_STALL_STORE_PIPE",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in the store unit. This does not include cycles spent handling store misses, PTESYNC instructions or TLBIE instructions."
-  },
-  {
-    "EventCode": "0x1F150",
-    "EventName": "PM_MRK_ST_L2_CYC",
-    "BriefDescription": "Cycles from L2 RC dispatch to L2 RC completion."
-  },
   {
     "EventCode": "0x10062",
     "EventName": "PM_LD_L3MISS_PEND_CYC",
     "BriefDescription": "Cycles in which an L3 miss was pending for this thread."
   },
-  {
-    "EventCode": "0x20010",
-    "EventName": "PM_PMC1_OVERFLOW",
-    "BriefDescription": "The event selected for PMC1 caused the event counter to overflow."
-  },
   {
     "EventCode": "0x2001A",
     "EventName": "PM_ITLB_HIT",
@@ -79,36 +49,16 @@
     "EventName": "PM_DTLB_MISS_4K",
     "BriefDescription": "Data TLB reload (after a miss) page size 4K. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   },
-  {
-    "EventCode": "0x2D154",
-    "EventName": "PM_MRK_DERAT_MISS_64K",
-    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 64K for a marked instruction. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
-  },
   {
     "EventCode": "0x200F6",
     "EventName": "PM_DERAT_MISS",
     "BriefDescription": "DERAT Reloaded to satisfy a DERAT miss. All page sizes are counted by this event. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   },
-  {
-    "EventCode": "0x30016",
-    "EventName": "PM_EXEC_STALL_DERAT_DTLB_MISS",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline suffered a TLB miss and waited for it resolve."
-  },
   {
     "EventCode": "0x3C040",
     "EventName": "PM_XFER_FROM_SRC_PMC3",
     "BriefDescription": "The processor's L1 data cache was reloaded from the source specified in MMCR3[30:42]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
   },
-  {
-    "EventCode": "0x3C142",
-    "EventName": "PM_MRK_XFER_FROM_SRC_PMC3",
-    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[30:42]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
-  },
-  {
-    "EventCode": "0x3C144",
-    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC3",
-    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[30:42]."
-  },
   {
     "EventCode": "0x3C054",
     "EventName": "PM_DERAT_MISS_16M",
@@ -124,21 +74,11 @@
     "EventName": "PM_LARX_FIN",
     "BriefDescription": "Load and reserve instruction (LARX) finished. LARX and STCX are instructions used to acquire a lock."
   },
-  {
-    "EventCode": "0x301E2",
-    "EventName": "PM_MRK_ST_CMPL",
-    "BriefDescription": "Marked store completed and sent to nest. Note that this count excludes cache-inhibited stores."
-  },
   {
     "EventCode": "0x300FC",
     "EventName": "PM_DTLB_MISS",
     "BriefDescription": "The DPTEG required for the load/store instruction in execution was missing from the TLB. This event only counts for demand misses."
   },
-  {
-    "EventCode": "0x4D02C",
-    "EventName": "PM_PMC1_REWIND",
-    "BriefDescription": "The speculative event selected for PMC1 rewinds and the counter for PMC1 is not charged."
-  },
   {
     "EventCode": "0x4003E",
     "EventName": "PM_LD_CMPL",
@@ -149,16 +89,6 @@
     "EventName": "PM_XFER_FROM_SRC_PMC4",
     "BriefDescription": "The processor's L1 data cache was reloaded from the source specified in MMCR3[45:57]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
   },
-  {
-    "EventCode": "0x4C142",
-    "EventName": "PM_MRK_XFER_FROM_SRC_PMC4",
-    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[45:57]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
-  },
-  {
-    "EventCode": "0x4C144",
-    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC4",
-    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[45:57]."
-  },
   {
     "EventCode": "0x4C056",
     "EventName": "PM_DTLB_MISS_16M",
@@ -168,20 +98,5 @@
     "EventCode": "0x4C05A",
     "EventName": "PM_DTLB_MISS_1G",
     "BriefDescription": "Data TLB reload (after a miss) page size 1G. Implies radix translation was used. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
-  },
-  {
-    "EventCode": "0x4C15E",
-    "EventName": "PM_MRK_DTLB_MISS_64K",
-    "BriefDescription": "Marked Data TLB reload (after a miss) page size 64K. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
-  },
-  {
-    "EventCode": "0x4D056",
-    "EventName": "PM_NON_FMA_FLOP_CMPL",
-    "BriefDescription": "Non FMA instruction completed."
-  },
-  {
-    "EventCode": "0x40164",
-    "EventName": "PM_MRK_DERAT_MISS_2M",
-    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 2M for a marked instruction. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
index 17c5424ef1ac..f09c00c89322 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
@@ -1,23 +1,8 @@
 [
   {
-    "EventCode": "0x10016",
-    "EventName": "PM_VSU0_ISSUE",
-    "BriefDescription": "VSU instruction issued to VSU pipe 0."
-  },
-  {
-    "EventCode": "0x1001C",
-    "EventName": "PM_ULTRAVISOR_INST_CMPL",
-    "BriefDescription": "PowerPC instruction completed while the thread was in ultravisor state."
-  },
-  {
-    "EventCode": "0x100F0",
-    "EventName": "PM_CYC",
-    "BriefDescription": "Processor cycles."
-  },
-  {
-    "EventCode": "0x10134",
-    "EventName": "PM_MRK_ST_DONE_L2",
-    "BriefDescription": "Marked store completed in L2."
+    "EventCode": "0x1002C",
+    "EventName": "PM_LD_PREFETCH_CACHE_LINE_MISS",
+    "BriefDescription": "The L1 cache was reloaded with a line that fulfills a prefetch request."
   },
   {
     "EventCode": "0x1505E",
@@ -34,36 +19,11 @@
     "EventName": "PM_ADJUNCT_CYC",
     "BriefDescription": "Cycles in which the thread is in Adjunct state. MSR[S HV PR] bits = 011."
   },
-  {
-    "EventCode": "0x101E4",
-    "EventName": "PM_MRK_L1_ICACHE_MISS",
-    "BriefDescription": "Marked instruction suffered an instruction cache miss."
-  },
-  {
-    "EventCode": "0x101EA",
-    "EventName": "PM_MRK_L1_RELOAD_VALID",
-    "BriefDescription": "Marked demand reload."
-  },
-  {
-    "EventCode": "0x100F4",
-    "EventName": "PM_FLOP_CMPL",
-    "BriefDescription": "Floating Point Operations Completed. Includes any type. It counts once for each 1, 2, 4 or 8 flop instruction. Use PM_1|2|4|8_FLOP_CMPL events to count flops."
-  },
-  {
-    "EventCode": "0x100FA",
-    "EventName": "PM_RUN_LATCH_ANY_THREAD_CYC",
-    "BriefDescription": "Cycles when at least one thread has the run latch set."
-  },
   {
     "EventCode": "0x100FC",
     "EventName": "PM_LD_REF_L1",
     "BriefDescription": "All L1 D cache load references counted at finish, gated by reject. In P9 and earlier this event counted only cacheable loads but in P10 both cacheable and non-cacheable loads are included."
   },
-  {
-    "EventCode": "0x2000C",
-    "EventName": "PM_RUN_LATCH_ALL_THREADS_CYC",
-    "BriefDescription": "Cycles when the run latch is set for all threads."
-  },
   {
     "EventCode": "0x2E010",
     "EventName": "PM_ADJUNCT_INST_CMPL",
@@ -74,26 +34,6 @@
     "EventName": "PM_STCX_FIN",
     "BriefDescription": "Conditional store instruction (STCX) finished. LARX and STCX are instructions used to acquire a lock."
   },
-  {
-    "EventCode": "0x20130",
-    "EventName": "PM_MRK_INST_DECODED",
-    "BriefDescription": "An instruction was marked at decode time. Random Instruction Sampling (RIS) only."
-  },
-  {
-    "EventCode": "0x20132",
-    "EventName": "PM_MRK_DFU_ISSUE",
-    "BriefDescription": "The marked instruction was a decimal floating point operation issued to the VSU. Measured at issue time."
-  },
-  {
-    "EventCode": "0x20134",
-    "EventName": "PM_MRK_FXU_ISSUE",
-    "BriefDescription": "The marked instruction was a fixed point operation issued to the VSU. Measured at issue time."
-  },
-  {
-    "EventCode": "0x2505C",
-    "EventName": "PM_VSU_ISSUE",
-    "BriefDescription": "At least one VSU instruction was issued to one of the VSU pipes. Up to 4 per cycle. Includes fixed point operations."
-  },
   {
     "EventCode": "0x2F054",
     "EventName": "PM_DISP_SS1_2_INSTR_CYC",
@@ -104,40 +44,15 @@
     "EventName": "PM_DISP_SS1_4_INSTR_CYC",
     "BriefDescription": "Cycles in which Superslice 1 dispatches either 3 or 4 instructions."
   },
-  {
-    "EventCode": "0x2006C",
-    "EventName": "PM_RUN_CYC_SMT4_MODE",
-    "BriefDescription": "Cycles when this thread's run latch is set and the core is in SMT4 mode."
-  },
-  {
-    "EventCode": "0x201E0",
-    "EventName": "PM_MRK_DATA_FROM_MEMORY",
-    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss for a marked load."
-  },
-  {
-    "EventCode": "0x201E4",
-    "EventName": "PM_MRK_DATA_FROM_L3MISS",
-    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
-  },
-  {
-    "EventCode": "0x201E8",
-    "EventName": "PM_THRESH_EXC_512",
-    "BriefDescription": "Threshold counter exceeded a value of 512."
-  },
   {
     "EventCode": "0x200F2",
     "EventName": "PM_INST_DISP",
     "BriefDescription": "PowerPC instruction dispatched."
   },
   {
-    "EventCode": "0x30132",
-    "EventName": "PM_MRK_VSU_FIN",
-    "BriefDescription": "VSU marked instruction finished. Excludes simple FX instructions issued to the Store Unit."
-  },
-  {
-    "EventCode": "0x30038",
-    "EventName": "PM_EXEC_STALL_DMISS_LMEM",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local memory, local OpenCAPI cache, or local OpenCAPI memory."
+    "EventCode": "0x200FD",
+    "EventName": "PM_L1_ICACHE_MISS",
+    "BriefDescription": "Demand instruction cache miss."
   },
   {
     "EventCode": "0x3F04A",
@@ -149,11 +64,6 @@
     "EventName": "PM_PRIVILEGED_INST_CMPL",
     "BriefDescription": "PowerPC instruction completed while the thread was in Privileged state."
   },
-  {
-    "EventCode": "0x3F150",
-    "EventName": "PM_MRK_ST_DRAIN_CYC",
-    "BriefDescription": "Cycles in which the marked store drained from the core to the L2."
-  },
   {
     "EventCode": "0x3F054",
     "EventName": "PM_DISP_SS0_4_INSTR_CYC",
@@ -165,103 +75,43 @@
     "BriefDescription": "Cycles in which Superslice 0 dispatches either 5, 6, 7 or 8 instructions."
   },
   {
-    "EventCode": "0x30162",
-    "EventName": "PM_MRK_ISSUE_DEPENDENT_LOAD",
-    "BriefDescription": "The marked instruction was dependent on a load. It is eligible for issue kill."
-  },
-  {
-    "EventCode": "0x40114",
-    "EventName": "PM_MRK_START_PROBE_NOP_DISP",
-    "BriefDescription": "Marked Start probe nop dispatched. Instruction AND R0,R0,R0."
-  },
-  {
-    "EventCode": "0x4001C",
-    "EventName": "PM_VSU_FIN",
-    "BriefDescription": "VSU instruction finished."
-  },
-  {
-    "EventCode": "0x4C01A",
-    "EventName": "PM_EXEC_STALL_DMISS_OFF_NODE",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from a distant chip."
-  },
-  {
-    "EventCode": "0x4D012",
-    "EventName": "PM_PMC3_SAVED",
-    "BriefDescription": "The conditions for the speculative event selected for PMC3 are met and PMC3 is charged."
-  },
-  {
-    "EventCode": "0x4D022",
-    "EventName": "PM_HYPERVISOR_INST_CMPL",
-    "BriefDescription": "PowerPC instruction completed while the thread was in hypervisor state."
-  },
-  {
-    "EventCode": "0x4D026",
-    "EventName": "PM_ULTRAVISOR_CYC",
-    "BriefDescription": "Cycles when the thread is in Ultravisor state. MSR[S HV PR]=110."
+    "EventCode": "0x30068",
+    "EventName": "PM_L1_ICACHE_RELOADED_PREF",
+    "BriefDescription": "Counts all instruction cache prefetch reloads (includes demand turned into prefetch)."
   },
   {
-    "EventCode": "0x4D028",
-    "EventName": "PM_PRIVILEGED_CYC",
-    "BriefDescription": "Cycles when the thread is in Privileged state. MSR[S HV PR]=x00."
+    "EventCode": "0x300F6",
+    "EventName": "PM_LD_DEMAND_MISS_L1",
+    "BriefDescription": "The L1 cache was reloaded with a line that fulfills a demand miss request. Counted at reload time, before finish."
   },
   {
-    "EventCode": "0x40030",
-    "EventName": "PM_INST_FIN",
-    "BriefDescription": "Instruction finished."
+    "EventCode": "0x300FE",
+    "EventName": "PM_DATA_FROM_L3MISS",
+    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss."
   },
   {
-    "EventCode": "0x44146",
-    "EventName": "PM_MRK_STCX_CORE_CYC",
-    "BriefDescription": "Cycles spent in the core portion of a marked STCX instruction. It starts counting when the instruction is decoded and stops counting when it drains into the L2."
+    "EventCode": "0x40012",
+    "EventName": "PM_L1_ICACHE_RELOADED_ALL",
+    "BriefDescription": "Counts all instruction cache reloads includes demand, prefetch, prefetch turned into demand and demand turned into prefetch."
   },
   {
     "EventCode": "0x44054",
     "EventName": "PM_VECTOR_LD_CMPL",
     "BriefDescription": "Vector load instruction completed."
   },
-  {
-    "EventCode": "0x45054",
-    "EventName": "PM_FMA_CMPL",
-    "BriefDescription": "Two floating point instruction completed (FMA class of instructions: fmadd, fnmadd, fmsub, fnmsub). Scalar instructions only."
-  },
-  {
-    "EventCode": "0x45056",
-    "EventName": "PM_SCALAR_FLOP_CMPL",
-    "BriefDescription": "Scalar floating point instruction completed."
-  },
-  {
-    "EventCode": "0x4505C",
-    "EventName": "PM_MATH_FLOP_CMPL",
-    "BriefDescription": "Math floating point instruction completed."
-  },
   {
     "EventCode": "0x4D05E",
     "EventName": "PM_BR_CMPL",
     "BriefDescription": "A branch completed. All branches are included."
   },
-  {
-    "EventCode": "0x4E15E",
-    "EventName": "PM_MRK_INST_FLUSHED",
-    "BriefDescription": "The marked instruction was flushed."
-  },
-  {
-    "EventCode": "0x401E6",
-    "EventName": "PM_MRK_INST_FROM_L3MISS",
-    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
-  },
-  {
-    "EventCode": "0x401E8",
-    "EventName": "PM_MRK_DATA_FROM_L2MISS",
-    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
-  },
   {
     "EventCode": "0x400F0",
     "EventName": "PM_LD_DEMAND_MISS_L1_FIN",
     "BriefDescription": "Load missed L1, counted at finish time."
   },
   {
-    "EventCode": "0x500FA",
-    "EventName": "PM_RUN_INST_CMPL",
-    "BriefDescription": "PowerPC instruction completed while the run latch is set."
+    "EventCode": "0x400FE",
+    "EventName": "PM_DATA_FROM_MEMORY",
+    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
index 799893c56f32..a8272a2f0517 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
@@ -1,8 +1,13 @@
 [
   {
-    "EventCode": "0x100FE",
-    "EventName": "PM_INST_CMPL",
-    "BriefDescription": "PowerPC instruction completed."
+    "EventCode": "0x10004",
+    "EventName": "PM_EXEC_STALL_TRANSLATION",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline suffered a TLB miss or ERAT miss and waited for it to resolve."
+  },
+  {
+    "EventCode": "0x10006",
+    "EventName": "PM_DISP_STALL_HELD_OTHER_CYC",
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch for any other reason."
   },
   {
     "EventCode": "0x1000C",
@@ -30,14 +35,19 @@
     "BriefDescription": "Cycles in which an instruction reload is pending to satisfy a demand miss."
   },
   {
-    "EventCode": "0x10022",
-    "EventName": "PM_PMC2_SAVED",
-    "BriefDescription": "The conditions for the speculative event selected for PMC2 are met and PMC2 is charged."
+    "EventCode": "0x10038",
+    "EventName": "PM_DISP_STALL_TRANSLATION",
+    "BriefDescription": "Cycles when dispatch was stalled for this thread because the MMU was handling a translation miss."
   },
   {
-    "EventCode": "0x10024",
-    "EventName": "PM_PMC5_OVERFLOW",
-    "BriefDescription": "The event selected for PMC5 caused the event counter to overflow."
+    "EventCode": "0x1003A",
+    "EventName": "PM_DISP_STALL_BR_MPRED_IC_L2",
+    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L2 after suffering a branch mispredict."
+  },
+  {
+    "EventCode": "0x1003C",
+    "EventName": "PM_EXEC_STALL_DMISS_L2L3",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from either the local L2 or local L3."
   },
   {
     "EventCode": "0x10058",
@@ -54,11 +64,36 @@
     "EventName": "PM_DERAT_MISS_2M",
     "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 2M. Implies radix translation. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   },
+  {
+    "EventCode": "0x1D05E",
+    "EventName": "PM_DISP_STALL_HELD_HALT_CYC",
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because of power management."
+  },
+  {
+    "EventCode": "0x1E050",
+    "EventName": "PM_DISP_STALL_HELD_STF_MAPPER_CYC",
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because the STF mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR."
+  },
+  {
+    "EventCode": "0x1E054",
+    "EventName": "PM_EXEC_STALL_DMISS_L21_L31",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from another core's L2 or L3 on the same chip."
+  },
+  {
+    "EventCode": "0x1E056",
+    "EventName": "PM_EXEC_STALL_STORE_PIPE",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in the store unit. This does not include cycles spent handling store misses, PTESYNC instructions or TLBIE instructions."
+  },
   {
     "EventCode": "0x1E05A",
     "EventName": "PM_CMPL_STALL_LWSYNC",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a lwsync waiting to complete."
   },
+  {
+    "EventCode": "0x10064",
+    "EventName": "PM_DISP_STALL_IC_L2",
+    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L2."
+  },
   {
     "EventCode": "0x10068",
     "EventName": "PM_BR_FIN",
@@ -70,9 +105,9 @@
     "BriefDescription": "Simple fixed point instruction issued to the store unit. Measured at finish time."
   },
   {
-    "EventCode": "0x1006C",
-    "EventName": "PM_RUN_CYC_ST_MODE",
-    "BriefDescription": "Cycles when the run latch is set and the core is in ST mode."
+    "EventCode": "0x100F8",
+    "EventName": "PM_DISP_STALL_CYC",
+    "BriefDescription": "Cycles the ICT has no itags assigned to this thread (no instructions were dispatched during these cycles)."
   },
   {
     "EventCode": "0x20004",
@@ -80,69 +115,114 @@
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was dispatched but not issued yet."
   },
   {
-    "EventCode": "0x2000A",
-    "EventName": "PM_HYPERVISOR_CYC",
-    "BriefDescription": "Cycles when the thread is in Hypervisor state. MSR[S HV PR]=010."
+    "EventCode": "0x20006",
+    "EventName": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC",
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch due to Issue queue full. Includes issue queue and branch queue."
   },
   {
     "EventCode": "0x2000E",
     "EventName": "PM_LSU_LD1_FIN",
     "BriefDescription": "LSU Finished an internal operation in LD1 port."
   },
+  {
+    "EventCode": "0x2C010",
+    "EventName": "PM_EXEC_STALL_LSU",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in the Load Store Unit. This does not include simple fixed point instructions."
+  },
   {
     "EventCode": "0x2C014",
     "EventName": "PM_CMPL_STALL_SPECIAL",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline required special handling before completing."
   },
+  {
+    "EventCode": "0x2C016",
+    "EventName": "PM_DISP_STALL_IERAT_ONLY_MISS",
+    "BriefDescription": "Cycles when dispatch was stalled while waiting to resolve an instruction ERAT miss."
+  },
   {
     "EventCode": "0x2C018",
     "EventName": "PM_EXEC_STALL_DMISS_L3MISS",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from a source beyond the local L2 or local L3."
   },
+  {
+    "EventCode": "0x2C01C",
+    "EventName": "PM_EXEC_STALL_DMISS_OFF_CHIP",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from a remote chip."
+  },
+  {
+    "EventCode": "0x2C01E",
+    "EventName": "PM_DISP_STALL_BR_MPRED_IC_L3",
+    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L3 after suffering a branch mispredict."
+  },
   {
     "EventCode": "0x2D010",
     "EventName": "PM_LSU_ST1_FIN",
     "BriefDescription": "LSU Finished an internal operation in ST1 port."
   },
+  {
+    "EventCode": "0x10016",
+    "EventName": "PM_VSU0_ISSUE",
+    "BriefDescription": "VSU instruction issued to VSU pipe 0."
+  },
   {
     "EventCode": "0x2D012",
     "EventName": "PM_VSU1_ISSUE",
     "BriefDescription": "VSU instruction issued to VSU pipe 1."
   },
+  {
+    "EventCode": "0x2505C",
+    "EventName": "PM_VSU_ISSUE",
+    "BriefDescription": "At least one VSU instruction was issued to one of the VSU pipes. Up to 4 per cycle. Includes fixed point operations."
+  },
+  {
+    "EventCode": "0x4001C",
+    "EventName": "PM_VSU_FIN",
+    "BriefDescription": "VSU instruction finished."
+  },
   {
     "EventCode": "0x2D018",
     "EventName": "PM_EXEC_STALL_VSU",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in the VSU (includes FXU, VSU, CRU)."
   },
+  {
+    "EventCode": "0x2D01A",
+    "EventName": "PM_DISP_STALL_IC_MISS",
+    "BriefDescription": "Cycles when dispatch was stalled for this thread due to an instruction cache miss."
+  },
   {
     "EventCode": "0x2D01C",
     "EventName": "PM_CMPL_STALL_STCX",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a stcx waiting for resolution from the nest before completing."
   },
+  {
+    "EventCode": "0x2E018",
+    "EventName": "PM_DISP_STALL_FETCH",
+    "BriefDescription": "Cycles when dispatch was stalled for this thread because Fetch was being held."
+  },
+  {
+    "EventCode": "0x2E01A",
+    "EventName": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC",
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because the XVFC mapper/SRB was full."
+  },
+  {
+    "EventCode": "0x2E01C",
+    "EventName": "PM_EXEC_STALL_TLBIE",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a TLBIE instruction executing in the Load Store Unit."
+  },
   {
     "EventCode": "0x2E01E",
     "EventName": "PM_EXEC_STALL_NTC_FLUSH",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in any unit before it was flushed. Note that if the flush of the oldest instruction happens after finish, the cycles from dispatch to issue will be included in PM_DISP_STALL and the cycles from issue to finish will be included in PM_EXEC_STALL and its corresponding children. This event will also count cycles when the previous next-to-finish (NTF) instruction is still completing and the new NTF instruction is stalled at dispatch."
   },
-  {
-    "EventCode": "0x2013C",
-    "EventName": "PM_MRK_FX_LSU_FIN",
-    "BriefDescription": "The marked instruction was simple fixed point that was issued to the store unit. Measured at finish time."
-  },
   {
     "EventCode": "0x2405A",
     "EventName": "PM_NTC_FIN",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline (NTC) finishes. Note that instructions can finish out of order, therefore not all the instructions that finish have a Next-to-complete status."
   },
   {
-    "EventCode": "0x201E2",
-    "EventName": "PM_MRK_LD_MISS_L1",
-    "BriefDescription": "Marked demand data load miss counted at finish time."
-  },
-  {
-    "EventCode": "0x200F4",
-    "EventName": "PM_RUN_CYC",
-    "BriefDescription": "Processor cycles gated by the run latch."
+    "EventCode": "0x30004",
+    "EventName": "PM_DISP_STALL_FLUSH",
+    "BriefDescription": "Cycles when dispatch was stalled because of a flush that happened to an instruction(s) that was not yet next-to-complete (NTC). PM_EXEC_STALL_NTC_FLUSH only includes instructions that were flushed after becoming NTC."
   },
   {
     "EventCode": "0x30008",
@@ -150,24 +230,29 @@
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting to finish in one of the execution units (BRU, LSU, VSU). Only cycles between issue and finish are counted in this category."
   },
   {
-    "EventCode": "0x3001A",
-    "EventName": "PM_LSU_ST2_FIN",
-    "BriefDescription": "LSU Finished an internal operation in ST2 port."
+    "EventCode": "0x30014",
+    "EventName": "PM_EXEC_STALL_STORE",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a store instruction executing in the Load Store Unit."
   },
   {
-    "EventCode": "0x30020",
-    "EventName": "PM_PMC2_REWIND",
-    "BriefDescription": "The speculative event selected for PMC2 rewinds and the counter for PMC2 is not charged."
+    "EventCode": "0x30016",
+    "EventName": "PM_EXEC_STALL_DERAT_DTLB_MISS",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline suffered a TLB miss and waited for it resolve."
   },
   {
-    "EventCode": "0x30022",
-    "EventName": "PM_PMC4_SAVED",
-    "BriefDescription": "The conditions for the speculative event selected for PMC4 are met and PMC4 is charged."
+    "EventCode": "0x30018",
+    "EventName": "PM_DISP_STALL_HELD_SCOREBOARD_CYC",
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch while waiting on the Scoreboard. This event combines VSCR and FPSCR together."
+  },
+  {
+    "EventCode": "0x3001A",
+    "EventName": "PM_LSU_ST2_FIN",
+    "BriefDescription": "LSU Finished an internal operation in ST2 port."
   },
   {
-    "EventCode": "0x30024",
-    "EventName": "PM_PMC6_OVERFLOW",
-    "BriefDescription": "The event selected for PMC6 caused the event counter to overflow."
+    "EventCode": "0x30026",
+    "EventName": "PM_EXEC_STALL_STORE_MISS",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a store whose cache line was not resident in the L1 and was waiting for allocation of the missing line into the L1."
   },
   {
     "EventCode": "0x30028",
@@ -179,6 +264,11 @@
     "EventName": "PM_EXEC_STALL_SIMPLE_FX",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a simple fixed point instruction executing in the Load Store Unit."
   },
+  {
+    "EventCode": "0x30038",
+    "EventName": "PM_EXEC_STALL_DMISS_LMEM",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local memory, local OpenCAPI cache, or local OpenCAPI memory."
+  },
   {
     "EventCode": "0x3003A",
     "EventName": "PM_CMPL_STALL_EXCEPTION",
@@ -194,6 +284,31 @@
     "EventName": "PM_TLBIE_FIN",
     "BriefDescription": "TLBIE instruction finished in the LSU. Two TLBIEs can finish each cycle. All will be counted."
   },
+  {
+    "EventCode": "0x34054",
+    "EventName": "PM_EXEC_STALL_DMISS_L2L3_NOCONFLICT",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local L2 or local L3, without a dispatch conflict."
+  },
+  {
+    "EventCode": "0x34056",
+    "EventName": "PM_EXEC_STALL_LOAD_FINISH",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was finishing a load after its data was reloaded from a data source beyond the local L1; cycles in which the LSU was processing an L1-hit; cycles in which the next-to-finish (NTF) instruction merged with another load in the LMQ; cycles in which the NTF instruction is waiting for a data reload for a load miss, but the data comes back with a non-NTF instruction."
+  },
+  {
+    "EventCode": "0x34058",
+    "EventName": "PM_DISP_STALL_BR_MPRED_ICMISS",
+    "BriefDescription": "Cycles when dispatch was stalled after a mispredicted branch resulted in an instruction cache miss."
+  },
+  {
+    "EventCode": "0x3D05C",
+    "EventName": "PM_DISP_STALL_HELD_RENAME_CYC",
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because the mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR and XVFC."
+  },
+  {
+    "EventCode": "0x3E052",
+    "EventName": "PM_DISP_STALL_IC_L3",
+    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L3."
+  },
   {
     "EventCode": "0x30066",
     "EventName": "PM_LSU_FIN",
@@ -210,25 +325,45 @@
     "BriefDescription": "Cycles in which both instructions in the ICT entry pair show as finished. These are the cycles between finish and completion for the oldest pair of instructions in the pipeline."
   },
   {
-    "EventCode": "0x40010",
-    "EventName": "PM_PMC3_OVERFLOW",
-    "BriefDescription": "The event selected for PMC3 caused the event counter to overflow."
+    "EventCode": "0x4C010",
+    "EventName": "PM_DISP_STALL_BR_MPRED_IC_L3MISS",
+    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from sources beyond the local L3 after suffering a mispredicted branch."
   },
   {
     "EventCode": "0x4C012",
     "EventName": "PM_EXEC_STALL_DERAT_ONLY_MISS",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline suffered an ERAT miss and waited for it resolve."
   },
+  {
+    "EventCode": "0x4C016",
+    "EventName": "PM_EXEC_STALL_DMISS_L2L3_CONFLICT",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local L2 or local L3, with a dispatch conflict."
+  },
   {
     "EventCode": "0x4C018",
     "EventName": "PM_CMPL_STALL",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline cannot complete because the thread was blocked for any reason."
   },
+  {
+    "EventCode": "0x4C01A",
+    "EventName": "PM_EXEC_STALL_DMISS_OFF_NODE",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from a distant chip."
+  },
   {
     "EventCode": "0x4C01E",
     "EventName": "PM_LSU_ST3_FIN",
     "BriefDescription": "LSU Finished an internal operation in ST3 port."
   },
+  {
+    "EventCode": "0x4D014",
+    "EventName": "PM_EXEC_STALL_LOAD",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a load instruction executing in the Load Store Unit."
+  },
+  {
+    "EventCode": "0x4D016",
+    "EventName": "PM_EXEC_STALL_PTESYNC",
+    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a PTESYNC instruction executing in the Load Store Unit."
+  },
   {
     "EventCode": "0x4D018",
     "EventName": "PM_EXEC_STALL_BRU",
@@ -244,31 +379,41 @@
     "EventName": "PM_EXEC_STALL_TLBIEL",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a TLBIEL instruction executing in the Load Store Unit. TLBIEL instructions have lower overhead than TLBIE instructions because they don't get set to the nest."
   },
+  {
+    "EventCode": "0x4D01E",
+    "EventName": "PM_DISP_STALL_BR_MPRED",
+    "BriefDescription": "Cycles when dispatch was stalled for this thread due to a mispredicted branch."
+  },
+  {
+    "EventCode": "0x4E010",
+    "EventName": "PM_DISP_STALL_IC_L3MISS",
+    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from any source beyond the local L3."
+  },
   {
     "EventCode": "0x4E012",
     "EventName": "PM_EXEC_STALL_UNKNOWN",
     "BriefDescription": "Cycles in which the oldest instruction in the pipeline completed without an ntf_type pulse. The ntf_pulse was missed by the ISU because the next-to-finish (NTF) instruction finishes and completions came too close together."
   },
+  {
+    "EventCode": "0x4E01A",
+    "EventName": "PM_DISP_STALL_HELD_CYC",
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch for any reason."
+  },
   {
     "EventCode": "0x4D020",
     "EventName": "PM_VSU3_ISSUE",
     "BriefDescription": "VSU instruction was issued to VSU pipe 3."
   },
   {
-    "EventCode": "0x40132",
-    "EventName": "PM_MRK_LSU_FIN",
-    "BriefDescription": "LSU marked instruction finish."
+    "EventCode": "0x4003C",
+    "EventName": "PM_DISP_STALL_HELD_SYNC_CYC",
+    "BriefDescription": "Cycles in which the next-to-complete (NTC) instruction is held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch."
   },
   {
     "EventCode": "0x45058",
     "EventName": "PM_IC_MISS_CMPL",
     "BriefDescription": "Non-speculative instruction cache miss, counted at completion."
   },
-  {
-    "EventCode": "0x4D052",
-    "EventName": "PM_2FLOP_CMPL",
-    "BriefDescription": "Double Precision vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg completed."
-  },
   {
     "EventCode": "0x400F2",
     "EventName": "PM_1PLUS_PPC_DISP",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
index 364fedbfb490..0a2bf56ee7c1 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
@@ -1,22 +1,197 @@
 [
+  {
+    "EventCode": "0x100FE",
+    "EventName": "PM_INST_CMPL",
+    "BriefDescription": "PowerPC instruction completed."
+  },
+  {
+    "EventCode": "0x1000A",
+    "EventName": "PM_PMC3_REWIND",
+    "BriefDescription": "The speculative event selected for PMC3 rewinds and the counter for PMC3 is not charged."
+  },
+  {
+    "EventCode": "0x10010",
+    "EventName": "PM_PMC4_OVERFLOW",
+    "BriefDescription": "The event selected for PMC4 caused the event counter to overflow."
+  },
+  {
+    "EventCode": "0x1001C",
+    "EventName": "PM_ULTRAVISOR_INST_CMPL",
+    "BriefDescription": "PowerPC instruction completed while the thread was in ultravisor state."
+  },
+  {
+    "EventCode": "0x100F0",
+    "EventName": "PM_CYC",
+    "BriefDescription": "Processor cycles."
+  },
+  {
+    "EventCode": "0x10020",
+    "EventName": "PM_PMC4_REWIND",
+    "BriefDescription": "The speculative event selected for PMC4 rewinds and the counter for PMC4 is not charged."
+  },
+  {
+    "EventCode": "0x10022",
+    "EventName": "PM_PMC2_SAVED",
+    "BriefDescription": "The conditions for the speculative event selected for PMC2 are met and PMC2 is charged."
+  },
+  {
+    "EventCode": "0x10024",
+    "EventName": "PM_PMC5_OVERFLOW",
+    "BriefDescription": "The event selected for PMC5 caused the event counter to overflow."
+  },
+  {
+    "EventCode": "0x1F15E",
+    "EventName": "PM_MRK_START_PROBE_NOP_CMPL",
+    "BriefDescription": "Marked Start probe nop (AND R0,R0,R0) completed."
+  },
+  {
+    "EventCode": "0x1006C",
+    "EventName": "PM_RUN_CYC_ST_MODE",
+    "BriefDescription": "Cycles when the run latch is set and the core is in ST mode."
+  },
+  {
+    "EventCode": "0x101E8",
+    "EventName": "PM_THRESH_EXC_256",
+    "BriefDescription": "Threshold counter exceeded a count of 256."
+  },
+  {
+    "EventCode": "0x101EC",
+    "EventName": "PM_THRESH_MET",
+    "BriefDescription": "Threshold exceeded."
+  },
+  {
+    "EventCode": "0x100FA",
+    "EventName": "PM_RUN_LATCH_ANY_THREAD_CYC",
+    "BriefDescription": "Cycles when at least one thread has the run latch set."
+  },
+  {
+    "EventCode": "0x2000A",
+    "EventName": "PM_HYPERVISOR_CYC",
+    "BriefDescription": "Cycles when the thread is in Hypervisor state. MSR[S HV PR]=010."
+  },
+  {
+    "EventCode": "0x2000C",
+    "EventName": "PM_RUN_LATCH_ALL_THREADS_CYC",
+    "BriefDescription": "Cycles when the run latch is set for all threads."
+  },
+  {
+    "EventCode": "0x20010",
+    "EventName": "PM_PMC1_OVERFLOW",
+    "BriefDescription": "The event selected for PMC1 caused the event counter to overflow."
+  },
+  {
+    "EventCode": "0x2006C",
+    "EventName": "PM_RUN_CYC_SMT4_MODE",
+    "BriefDescription": "Cycles when this thread's run latch is set and the core is in SMT4 mode."
+  },
+  {
+    "EventCode": "0x201E6",
+    "EventName": "PM_THRESH_EXC_32",
+    "BriefDescription": "Threshold counter exceeded a value of 32."
+  },
+  {
+    "EventCode": "0x201E8",
+    "EventName": "PM_THRESH_EXC_512",
+    "BriefDescription": "Threshold counter exceeded a value of 512."
+  },
+  {
+    "EventCode": "0x200F4",
+    "EventName": "PM_RUN_CYC",
+    "BriefDescription": "Processor cycles gated by the run latch."
+  },
+  {
+    "EventCode": "0x30010",
+    "EventName": "PM_PMC2_OVERFLOW",
+    "BriefDescription": "The event selected for PMC2 caused the event counter to overflow."
+  },
+  {
+    "EventCode": "0x30020",
+    "EventName": "PM_PMC2_REWIND",
+    "BriefDescription": "The speculative event selected for PMC2 rewinds and the counter for PMC2 is not charged."
+  },
+  {
+    "EventCode": "0x30022",
+    "EventName": "PM_PMC4_SAVED",
+    "BriefDescription": "The conditions for the speculative event selected for PMC4 are met and PMC4 is charged."
+  },
+  {
+    "EventCode": "0x30024",
+    "EventName": "PM_PMC6_OVERFLOW",
+    "BriefDescription": "The event selected for PMC6 caused the event counter to overflow."
+  },
+  {
+    "EventCode": "0x3006C",
+    "EventName": "PM_RUN_CYC_SMT2_MODE",
+    "BriefDescription": "Cycles when this thread's run latch is set and the core is in SMT2 mode."
+  },
   {
     "EventCode": "0x301E8",
     "EventName": "PM_THRESH_EXC_64",
     "BriefDescription": "Threshold counter exceeded a value of 64."
   },
   {
-    "EventCode": "0x45050",
-    "EventName": "PM_1FLOP_CMPL",
-    "BriefDescription": "One floating point instruction completed (fadd, fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg)."
+    "EventCode": "0x301EA",
+    "EventName": "PM_THRESH_EXC_1024",
+    "BriefDescription": "Threshold counter exceeded a value of 1024."
+  },
+  {
+    "EventCode": "0x40010",
+    "EventName": "PM_PMC3_OVERFLOW",
+    "BriefDescription": "The event selected for PMC3 caused the event counter to overflow."
+  },
+  {
+    "EventCode": "0x40114",
+    "EventName": "PM_MRK_START_PROBE_NOP_DISP",
+    "BriefDescription": "Marked Start probe nop dispatched. Instruction AND R0,R0,R0."
+  },
+  {
+    "EventCode": "0x4D010",
+    "EventName": "PM_PMC1_SAVED",
+    "BriefDescription": "The conditions for the speculative event selected for PMC1 are met and PMC1 is charged."
+  },
+  {
+    "EventCode": "0x4D012",
+    "EventName": "PM_PMC3_SAVED",
+    "BriefDescription": "The conditions for the speculative event selected for PMC3 are met and PMC3 is charged."
+  },
+  {
+    "EventCode": "0x4D022",
+    "EventName": "PM_HYPERVISOR_INST_CMPL",
+    "BriefDescription": "PowerPC instruction completed while the thread was in hypervisor state."
+  },
+  {
+    "EventCode": "0x4D026",
+    "EventName": "PM_ULTRAVISOR_CYC",
+    "BriefDescription": "Cycles when the thread is in Ultravisor state. MSR[S HV PR]=110."
+  },
+  {
+    "EventCode": "0x4D028",
+    "EventName": "PM_PRIVILEGED_CYC",
+    "BriefDescription": "Cycles when the thread is in Privileged state. MSR[S HV PR]=x00."
+  },
+  {
+    "EventCode": "0x4D02C",
+    "EventName": "PM_PMC1_REWIND",
+    "BriefDescription": "The speculative event selected for PMC1 rewinds and the counter for PMC1 is not charged."
+  },
+  {
+    "EventCode": "0x40030",
+    "EventName": "PM_INST_FIN",
+    "BriefDescription": "Instruction finished."
+  },
+  {
+    "EventCode": "0x40134",
+    "EventName": "PM_MRK_INST_TIMEO",
+    "BriefDescription": "Marked instruction finish timeout (instruction was lost)."
   },
   {
-    "EventCode": "0x45052",
-    "EventName": "PM_4FLOP_CMPL",
-    "BriefDescription": "Four floating point instruction completed (fadd, fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg)."
+    "EventCode": "0x401EA",
+    "EventName": "PM_THRESH_EXC_128",
+    "BriefDescription": "Threshold counter exceeded a value of 128."
   },
   {
-    "EventCode": "0x4D054",
-    "EventName": "PM_8FLOP_CMPL",
-    "BriefDescription": "Four Double Precision vector instruction completed."
+    "EventCode": "0x400FA",
+    "EventName": "PM_RUN_INST_CMPL",
+    "BriefDescription": "PowerPC instruction completed while the run latch is set."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/translation.json b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
index 961e2491e73f..170c9aeb30d8 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/translation.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
@@ -1,29 +1,9 @@
 [
-  {
-    "EventCode": "0x1F15E",
-    "EventName": "PM_MRK_START_PROBE_NOP_CMPL",
-    "BriefDescription": "Marked Start probe nop (AND R0,R0,R0) completed."
-  },
   {
     "EventCode": "0x20018",
     "EventName": "PM_ST_FWD",
     "BriefDescription": "Store forwards that finished."
   },
-  {
-    "EventCode": "0x2011C",
-    "EventName": "PM_MRK_NTF_CYC",
-    "BriefDescription": "Cycles in which the marked instruction is the oldest in the pipeline (next-to-finish or next-to-complete)."
-  },
-  {
-    "EventCode": "0x2E01C",
-    "EventName": "PM_EXEC_STALL_TLBIE",
-    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a TLBIE instruction executing in the Load Store Unit."
-  },
-  {
-    "EventCode": "0x201E6",
-    "EventName": "PM_THRESH_EXC_32",
-    "BriefDescription": "Threshold counter exceeded a value of 32."
-  },
   {
     "EventCode": "0x200F0",
     "EventName": "PM_ST_CMPL",
@@ -33,20 +13,5 @@
     "EventCode": "0x200FE",
     "EventName": "PM_DATA_FROM_L2MISS",
     "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
-  },
-  {
-    "EventCode": "0x30010",
-    "EventName": "PM_PMC2_OVERFLOW",
-    "BriefDescription": "The event selected for PMC2 caused the event counter to overflow."
-  },
-  {
-    "EventCode": "0x4D010",
-    "EventName": "PM_PMC1_SAVED",
-    "BriefDescription": "The conditions for the speculative event selected for PMC1 are met and PMC1 is charged."
-  },
-  {
-    "EventCode": "0x4D05C",
-    "EventName": "PM_DPP_FLOP_CMPL",
-    "BriefDescription": "Double-Precision or Quad-Precision instruction completed."
   }
 ]
-- 
2.39.3

