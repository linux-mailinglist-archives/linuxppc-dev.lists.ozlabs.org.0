Return-Path: <linuxppc-dev+bounces-562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E8960110
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 07:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtGRP6lRWz2yN2;
	Tue, 27 Aug 2024 15:33:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724736801;
	cv=none; b=AFNCuMoqpwPcUULfTchSXz2FGgiH4RZ/0/2TuF2mpbroi/6tCILVwjCzyDjGavCUiVcF4JNTHVoSygLBKcVxZaEQdGIjRn2bu4uDrrKvvtPZsg4iG60WAgRzMGfRXC6tUaXt8HxOisye5u6gXAsGGAsXJlzIccaEMSbBFf9d2oMowMRh/ao3up1GwqcdIYQJiB00zRzkdaQ/y4uRjMYLqRdIebR30BHDpbmzkaSWpODZVf9a+AH2gc0UbFMqbIh6eK/oY+4tKNbiLsvcQWiLT8Ye3BcXvecHuCtP+P+aSuQkDM9vOzNREt3C3ldJmibajtm5nakcKX4NGwT1AdeRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724736801; c=relaxed/relaxed;
	bh=2oM5tNMaqV9tNItNwpMb48saOy4fHdOqQvszVOZpA+I=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=kMICdYIf/pxwomcBxgoO44EyfwWAHik/Hu2IkAl1jPsLjFX3xZ0X79p8/FG29WnlSMs0r8aC9jnWygCns2M/ByRHMCpPA/lO3MmHrwG7srwozC/7ihwuvn8z+RTMrF5ylNoEX+/B52ajvJI+98oON1raEHQ49o2+22aI4+38aPtnVx5r7KjEJoXW4WO1vzhEMZhqraTtF+mUI4OpJ/g/jUeP0LlVopKVpCBo815spCL/s46QbJhfVgiAo5Gpu1GpO0o68knLV9RJzodP4cNybYP9XxvwFu3oJ4qVfvR3jmyc5iT/MDjn9edw8JTOKC4BA4MUcORN66K4RhhAngP0qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eV9LhhMY; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eV9LhhMY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtGRP4Ch2z2xtN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 15:33:20 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R1tKOm014300;
	Tue, 27 Aug 2024 05:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=2oM5tNMaqV9tNItNwpMb48saOy
	4fHdOqQvszVOZpA+I=; b=eV9LhhMYJEjB83J3KJLdNdy93DiHV4LyZmwdywH5I3
	gWdW/jn/UXVEN/dslQVNSSGf/ebrIEpuOhfKnldMU2glNAKGNLXS0rMOaNNT+Yqm
	JD2WNkSYeNN+MX+KQRJ88NBfoJ/Ys5lXaBrKeOOFxSZIIoQFER5QVLIR9oHqbj4Y
	myu7919ml9slXmX9qhr+K/wlBdApPHMXKRQXvdcilhdTETSOMmr47oc2/ZbUBpqE
	CDb4gZMsLnefHU5bL4d/k/peOUP1ecQ54BkSbOZzYJR1w0I7tYN6Ng5HzG+sjoFS
	TNKrzHJ0W0l2peSHJ8lr++BAvjvjPvG0eShh/V7C72SQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417h66hwwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:33:16 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47R5UjX2020962;
	Tue, 27 Aug 2024 05:33:16 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417h66hww9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:33:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47R2keAq003161;
	Tue, 27 Aug 2024 05:33:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 417tupsbdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:33:11 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47R5X7BY56361378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Aug 2024 05:33:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE6BE2004B;
	Tue, 27 Aug 2024 05:33:07 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BCEF20040;
	Tue, 27 Aug 2024 05:33:02 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.ustream.lldns.net (unknown [9.200.51.96])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Aug 2024 05:33:01 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, irogers@google.com
Cc: namhyung@kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        hbathini@linux.ibm.com, disgoel@linux.vnet.ibm.com
Subject: [PATCH 1/3] perf vendor events power10: Update JSON/events
Date: Tue, 27 Aug 2024 11:02:04 +0530
Message-ID: <20240827053206.538814-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x2kWkoMjCuWyL5D5xWTb2ll3ih95xh45
X-Proofpoint-ORIG-GUID: w8N5UCKotcyEbtZli9t8G7EJu4BUBD3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_04,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270039

Update JSON/events for power10 platform with additional events.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/datasource.json      | 25 +++++++++++++++++++
 .../arch/powerpc/power10/frontend.json        | 10 ++++++++
 .../pmu-events/arch/powerpc/power10/pmc.json  |  5 ++++
 3 files changed, 40 insertions(+)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
index 0eeaaf1a95b8..283284745d9c 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
@@ -14,6 +14,31 @@
     "EventName": "PM_DATA_FROM_MEMORY",
     "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss."
   },
+  {
+    "EventCode": "0x0000004080",
+    "EventName": "PM_INST_FROM_L1",
+    "BriefDescription": "An instruction fetch hit in the L1. Each fetch group contains 8 instructions. The same line can hit 4 times if 32 sequential instructions are fetched."
+  },
+  {
+    "EventCode": "0x000000026080",
+    "EventName": "PM_L2_LD_MISS",
+    "BriefDescription": "All successful D-Side Load dispatches for this thread that missed in the L2. Since the event happens in a 2:1 clock domain and is time-sliced across all 4 threads, the event count should be multiplied by 2."
+  },
+  {
+    "EventCode": "0x000000026880",
+    "EventName": "PM_L2_ST_MISS",
+    "BriefDescription": "All successful D-Side Store dispatches for this thread that missed in the L2. Since the event happens in a 2:1 clock domain and is time-sliced across all 4 threads, the event count should be multiplied by 2."
+  },
+  {
+    "EventCode": "0x010000046880",
+    "EventName": "PM_L2_ST_HIT",
+    "BriefDescription": "All successful D-side store dispatches for this thread that were L2 hits. Since the event happens in a 2:1 clock domain and is time-sliced across all 4 threads, the event count should be multiplied by 2."
+  },
+  {
+    "EventCode": "0x000000036880",
+    "EventName": "PM_L2_INST_MISS",
+    "BriefDescription": "All successful instruction (demand and prefetch) dispatches for this thread that missed in the L2. Since the event happens in a 2:1 clock domain and is time-sliced across all 4 threads, the event count should be multiplied by 2."
+  },
   {
     "EventCode": "0x000300000000C040",
     "EventName": "PM_INST_FROM_L2",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
index 53660c279286..456971f60814 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
@@ -93,5 +93,15 @@
     "EventCode": "0x400FC",
     "EventName": "PM_ITLB_MISS",
     "BriefDescription": "Instruction TLB reload (after a miss), all page sizes. Includes only demand misses."
+  },
+  {
+    "EventCode": "0x00000040B8",
+    "EventName": "PM_PRED_BR_TKN_COND_DIR",
+    "BriefDescription": "A conditional branch finished with correctly predicted direction. Resolved taken."
+  },
+  {
+    "EventCode": "0x00000048B8",
+    "EventName": "PM_PRED_BR_NTKN_COND_DIR",
+    "BriefDescription": "A conditional branch finished with correctly predicted direction. Resolved not taken."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
index 0e0253d0e757..04732698d9b2 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
@@ -104,6 +104,11 @@
     "EventName": "PM_RUN_CYC",
     "BriefDescription": "Processor cycles gated by the run latch."
   },
+  {
+    "EventCode": "0x200F8",
+    "EventName": "PM_EXT_INT",
+    "BriefDescription": "Cycles an external interrupt was active."
+  },
   {
     "EventCode": "0x30010",
     "EventName": "PM_PMC2_OVERFLOW",
-- 
2.43.5


