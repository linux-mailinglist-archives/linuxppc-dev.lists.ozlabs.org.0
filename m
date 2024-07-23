Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5C939928
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 07:28:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dx3X7FaR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSlzR0YY9z3cY9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 15:28:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dx3X7FaR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSlyj024Rz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 15:27:24 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46N5JoXO021534;
	Tue, 23 Jul 2024 05:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=pp1; bh=Gmxy5Hy9ATZQby7fJNyLXzfxHU
	I5hGx5niU1mpaoH8c=; b=dx3X7FaR1i66n2fJ7Q8MVI3JSdUR48LZl2iYQPwBA/
	c1A7fqfaj1egth0YqlJwjjkYBwLjXEwzeskXmpQ36uqaU/HUTGiTpE5dKhmLtqDv
	hWcrLHATXEqln2cw3G/C66IWJqSbhm9J37felW5MKKrbwL+xAghWHodv3rjUXHbV
	DDkOCa8UtqdceaTXHF8Ei8tLFub9G4IZUWTAKmlZdtgZMYzy3dg+qipje3+DmzLc
	Leje/BrYZg6eGb4UU2LM9zznBP4CVkq9osQfYadBY9/xu76hOzJkdZzkCHN90xKw
	56VGIDJQzoSHsGGusAPBd3ZfFV8/iyosSutKctQY8poA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40j3rvr93w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 05:27:18 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46N5RHf2002835;
	Tue, 23 Jul 2024 05:27:17 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40j3rvr93s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 05:27:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46N29caD006216;
	Tue, 23 Jul 2024 05:22:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 40gqjuaan3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 05:22:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46N5MBpj51708184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2024 05:22:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 396102004B;
	Tue, 23 Jul 2024 05:22:11 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A81F620049;
	Tue, 23 Jul 2024 05:22:08 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com (unknown [9.171.50.160])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 Jul 2024 05:22:08 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH] perf vendor events power10: Update JSON/events
Date: Tue, 23 Jul 2024 10:51:54 +0530
Message-Id: <20240723052154.96202-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dbAI5542PSoACt6k0C5jm2VQ0a9O2Z1b
X-Proofpoint-GUID: TJkjPiKLGrGZQWPwJqrCiESoFhFK7tad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230038
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update JSON/events for power10 platform with additional events.
Also move PM_VECTOR_LD_CMPL event from others.json to
frontend.json file.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/frontend.json        |   5 +
 .../arch/powerpc/power10/others.json          | 100 +++++++++++++++++-
 2 files changed, 100 insertions(+), 5 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
index 5977f5e64212..53660c279286 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
@@ -74,6 +74,11 @@
     "EventName": "PM_ISSUE_KILL",
     "BriefDescription": "Cycles in which an instruction or group of instructions were cancelled after being issued. This event increments once per occurrence, regardless of how many instructions are included in the issue group."
   },
+  {
+    "EventCode": "0x44054",
+    "EventName": "PM_VECTOR_LD_CMPL",
+    "BriefDescription": "Vector load instruction completed."
+  },
   {
     "EventCode": "0x44056",
     "EventName": "PM_VECTOR_ST_CMPL",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
index fcf8a8ebe7bd..53ca610152fa 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
@@ -94,11 +94,6 @@
     "EventName": "PM_L1_ICACHE_RELOADED_ALL",
     "BriefDescription": "Counts all instruction cache reloads includes demand, prefetch, prefetch turned into demand and demand turned into prefetch."
   },
-  {
-    "EventCode": "0x44054",
-    "EventName": "PM_VECTOR_LD_CMPL",
-    "BriefDescription": "Vector load instruction completed."
-  },
   {
     "EventCode": "0x4D05E",
     "EventName": "PM_BR_CMPL",
@@ -108,5 +103,100 @@
     "EventCode": "0x400F0",
     "EventName": "PM_LD_DEMAND_MISS_L1_FIN",
     "BriefDescription": "Load missed L1, counted at finish time."
+  },
+  {
+    "EventCode": "0x00000038BC",
+    "EventName": "PM_ISYNC_CMPL",
+    "BriefDescription": "Isync completion count per thread."
+  },
+  {
+    "EventCode": "0x000000C088",
+    "EventName": "PM_LD0_32B_FIN",
+    "BriefDescription": "256-bit load finished in the LD0 load execution unit."
+  },
+  {
+    "EventCode": "0x000000C888",
+    "EventName": "PM_LD1_32B_FIN",
+    "BriefDescription": "256-bit load finished in the LD1 load execution unit."
+  },
+  {
+    "EventCode": "0x000000C090",
+    "EventName": "PM_LD0_UNALIGNED_FIN",
+    "BriefDescription": "Load instructions in LD0 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline using the load gather buffer. This typically adds about 10 cycles to the latency of the instruction. This includes loads that cross the 128 byte boundary, octword loads that are not aligned, and a special forward progress case of a load that does not hit in the L1 and crosses the 32 byte boundary and is launched NTC. Counted at finish time."
+  },
+  {
+    "EventCode": "0x000000C890",
+    "EventName": "PM_LD1_UNALIGNED_FIN",
+    "BriefDescription": "Load instructions in LD1 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline using the load gather buffer. This typically adds about 10 cycles to the latency of the instruction. This includes loads that cross the 128 byte boundary, octword loads that are not aligned, and a special forward progress case of a load that does not hit in the L1 and crosses the 32 byte boundary and is launched NTC. Counted at finish time."
+  },
+  {
+    "EventCode": "0x000000C0A4",
+    "EventName": "PM_ST0_UNALIGNED_FIN",
+    "BriefDescription": "Store instructions in ST0 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline. This typically adds about 10 cycles to the latency of the instruction. This only includes stores that cross the 128 byte boundary. Counted at finish time."
+  },
+  {
+    "EventCode": "0x000000C8A4",
+    "EventName": "PM_ST1_UNALIGNED_FIN",
+    "BriefDescription": "Store instructions in ST1 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline. This typically adds about 10 cycles to the latency of the instruction. This only includes stores that cross the 128 byte boundary. Counted at finish time."
+  },
+  {
+    "EventCode": "0x000000C8B8",
+    "EventName": "PM_STCX_SUCCESS_CMPL",
+    "BriefDescription": "STCX instructions that completed successfully. Specifically, counts only when a pass status is returned from the nest."
+  },
+  {
+    "EventCode": "0x000000D0B4",
+    "EventName": "PM_DC_PREF_STRIDED_CONF",
+    "BriefDescription": "A demand load referenced a line in an active strided prefetch stream. The stream could have been allocated through the hardware prefetch mechanism or through software."
+  },
+  {
+    "EventCode": "0x000000F880",
+    "EventName": "PM_SNOOP_TLBIE_CYC",
+    "BriefDescription": "Cycles in which TLBIE snoops are executed in the LSU."
+  },
+  {
+    "EventCode": "0x000000F084",
+    "EventName": "PM_SNOOP_TLBIE_CACHE_WALK_CYC",
+    "BriefDescription": "TLBIE snoop cycles in which the data cache is being walked."
+  },
+  {
+    "EventCode": "0x000000F884",
+    "EventName": "PM_SNOOP_TLBIE_WAIT_ST_CYC",
+    "BriefDescription": "TLBIE snoop cycles in which older stores are still draining."
+  },
+  {
+    "EventCode": "0x000000F088",
+    "EventName": "PM_SNOOP_TLBIE_WAIT_LD_CYC",
+    "BriefDescription": "TLBIE snoop cycles in which older loads are still draining."
+  },
+  {
+    "EventCode": "0x000000F08C",
+    "EventName": "PM_SNOOP_TLBIE_WAIT_MMU_CYC",
+    "BriefDescription": "TLBIE snoop cycles in which the Load-Store unit is waiting for the MMU to finish invalidation."
+  },
+  {
+    "EventCode": "0x0000004884",
+    "EventName": "PM_NO_FETCH_IBUF_FULL_CYC",
+    "BriefDescription": "Cycles in which no instructions are fetched because there is no room in the instruction buffers."
+  },
+  {
+    "EventCode": "0x00000048B4",
+    "EventName": "PM_BR_TKN_UNCOND_FIN",
+    "BriefDescription": "An unconditional branch finished. All unconditional branches are taken."
+  },
+  {
+    "EventCode": "0x0B0000016080",
+    "EventName": "PM_L2_TLBIE_SLBIE_START",
+    "BriefDescription": "NCU Master received a TLBIE/SLBIEG/SLBIAG operation from the core. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
+  },
+  {
+    "EventCode": "0x0B0000016880",
+    "EventName": "PM_L2_TLBIE_SLBIE_DELAY",
+    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG command was held in a hottemp condition by the NCU Master. Multiply this count by 1000 to obtain the total number of cycles. This can be divided by PM_L2_TLBIE_SLBIE_SENT to obtain the average time a TLBIE/SLBIEG/SLBIAG command was held. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
+  },
+  {
+    "EventCode": "0x0B0000026880",
+    "EventName": "PM_L2_SNP_TLBIE_SLBIE_DELAY",
+    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG that targets this thread's LPAR was in flight while in a hottemp condition. Multiply this count by 1000 to obtain the total number of cycles. This can be divided by PM_L2_SNP_TLBIE_SLBIE_START to obtain the overall efficiency. Note: ’inflight’ means SnpTLB has been sent to core(ie doesn’t include when SnpTLB is in NCU waiting to be launched serially behind different SnpTLB). The NCU Snooper gets in a ’hottemp’ delay window when it detects it is above its TLBIE/SLBIE threshold for process SnpTLBIE/SLBIE with this core. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
   }
 ]
-- 
2.43.0

