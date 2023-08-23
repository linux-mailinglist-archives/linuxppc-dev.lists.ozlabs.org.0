Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2A785220
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 09:58:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jdh8QdUw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVz994kQWz3c5T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 17:58:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jdh8QdUw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVz7C0l3lz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 17:56:22 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N7SAkh018439;
	Wed, 23 Aug 2023 07:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ORn7litIpstzuD0uULWjNNFDZSKEhy8vEiVXUQ3RoLo=;
 b=Jdh8QdUwfVZMzRb/cCAq3xclWaPA7WaWx5Qlu2fnPdD1cO8PnaJKprf10+xa2Sdf/2fd
 lVWTo+2RJXzBMaPM20Hasp2fOwcYkOIwN+l6WG7U0fn4BuNEpGkf8EhPMYgwqxgXCmZV
 Kg7GvvwLw/Qxpdu4KMs4QwwfZS3mcDMC4GcjFuArjXnu+jEaA9q5ifUH1SwfeDWZ4PTV
 PZbPczeJ5wmupGALOW5VnsHO6tqQXHZZynN4LqpPAYQ7O51i4vzArskuEGELdD3f1ZSj
 zW8zNptytVjtTNxbpmEn8aZT3yhvVbng/55M5bVi1blzle5Py+lbyg8CmablqBpOo7vU Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sndr7rwbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 07:56:16 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37N7uFRg012099;
	Wed, 23 Aug 2023 07:56:16 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sndr7rwb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 07:56:16 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37N76hOa004093;
	Wed, 23 Aug 2023 07:56:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn21rckyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 07:56:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37N7uBFX20644526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Aug 2023 07:56:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2131A20040;
	Wed, 23 Aug 2023 07:56:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C6AA20043;
	Wed, 23 Aug 2023 07:56:06 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.40.46])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Aug 2023 07:56:05 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH 2/2] perf vendor events: Update metric events for power10 platform
Date: Wed, 23 Aug 2023 13:25:43 +0530
Message-Id: <20230823075543.191126-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230823075543.191126-1-kjain@linux.ibm.com>
References: <20230823075543.191126-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VhLvyJqvoivGzm55TN2_x2N7EAU0QxJM
X-Proofpoint-ORIG-GUID: MXGWdanvkL8098TT0QmRY4qmISRdUGeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_05,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230068
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

Update JSON/events for power10 platform with additional metrics.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/metrics.json         | 388 ++++++++++++++++++
 1 file changed, 388 insertions(+)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
index 4d66b75c6ad5..a36621858ea3 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
@@ -434,6 +434,13 @@
         "MetricName": "L1_INST_MISS_RATE",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of completed instructions that were demand fetches that missed the L1 and L2 instruction cache",
+        "MetricExpr": "PM_INST_FROM_L2MISS * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "L2_INST_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of completed instructions that were demand fetches that reloaded from beyond the L3 icache",
         "MetricExpr": "PM_INST_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
@@ -466,6 +473,13 @@
         "MetricGroup": "General",
         "MetricName": "LOADS_PER_INST"
     },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded from the L2 per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_L2 * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L2_RATE",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of demand loads that reloaded from beyond the L2 per completed instruction",
         "MetricExpr": "PM_DATA_FROM_L2MISS / PM_RUN_INST_CMPL * 100",
@@ -473,6 +487,34 @@
         "MetricName": "DL1_RELOAD_FROM_L2_MISS_RATE",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded using modified data from another core's L2 or L3 on a remote chip, per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_RL2L3_MOD * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_RL2L3_MOD_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded using shared data from another core's L2 or L3 on a remote chip, per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_RL2L3_SHR * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_RL2L3_SHR_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded from the L3 per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_L3 * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L3_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded with data brought into the L3 by prefetch per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_L3_MEPF * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L3_MEPF_RATE",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of demand loads that reloaded from beyond the L3 per completed instruction",
         "MetricExpr": "PM_DATA_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
@@ -480,6 +522,66 @@
         "MetricName": "DL1_RELOAD_FROM_L3_MISS_RATE",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded using modified data from another core's L2 or L3 on a distant chip, per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_DL2L3_MOD * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_DL2L3_MOD_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded using shared data from another core's L2 or L3 on a distant chip, per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_DL2L3_SHR * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_DL2L3_SHR_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded from local memory per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_LMEM * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_LMEM_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded from remote memory per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_RMEM * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_RMEM_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded from distant memory per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_DMEM * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_DMEM_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of data reloads from local memory per data reloads from any memory",
+        "MetricExpr": "PM_DATA_FROM_LMEM * 100 / (PM_DATA_FROM_LMEM + PM_DATA_FROM_RMEM + PM_DATA_FROM_DMEM)",
+        "MetricGroup": "Memory",
+        "MetricName": "MEM_LOCALITY",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Number of data reloads from local memory per data reloads from remote memory",
+        "MetricExpr": "PM_DATA_FROM_LMEM / PM_DATA_FROM_RMEM",
+        "MetricGroup": "Memory",
+        "MetricName": "LD_LMEM_PER_LD_RMEM"
+    },
+    {
+        "BriefDescription": "Number of data reloads from local memory per data reloads from distant memory",
+        "MetricExpr": "PM_DATA_FROM_LMEM / PM_DATA_FROM_DMEM",
+        "MetricGroup": "Memory",
+        "MetricName": "LD_LMEM_PER_LD_DMEM"
+    },
+    {
+        "BriefDescription": "Number of data reloads from local memory per data reloads from distant and remote memory",
+        "MetricExpr": "PM_DATA_FROM_LMEM / (PM_DATA_FROM_DMEM + PM_DATA_FROM_RMEM)",
+        "MetricGroup": "Memory",
+        "MetricName": "LD_LMEM_PER_LD_MEM"
+    },
     {
         "BriefDescription": "Percentage of ITLB misses per completed run instruction",
         "MetricExpr": "PM_ITLB_MISS / PM_RUN_INST_CMPL * 100",
@@ -487,6 +589,12 @@
         "MetricName": "ITLB_MISS_RATE",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Number of data reloads from remote memory per data reloads from distant memory",
+        "MetricExpr": "PM_DATA_FROM_RMEM / PM_DATA_FROM_DMEM",
+        "MetricGroup": "Memory",
+        "MetricName": "LD_RMEM_PER_LD_DMEM"
+    },
     {
         "BriefDescription": "Percentage of DERAT misses with 4k page size per completed instruction",
         "MetricExpr": "PM_DERAT_MISS_4K / PM_RUN_INST_CMPL * 100",
@@ -501,6 +609,76 @@
         "MetricName": "DERAT_64K_MISS_RATE",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of ICache misses that were reloaded from the L2",
+        "MetricExpr": "PM_INST_FROM_L2 * 100 / PM_L1_ICACHE_MISS",
+        "MetricGroup": "Instruction_Stats",
+        "MetricName": "INST_FROM_L2",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of ICache misses that were reloaded from the L3",
+        "MetricExpr": "PM_INST_FROM_L3 * 100 / PM_L1_ICACHE_MISS",
+        "MetricGroup": "Instruction_Stats",
+        "MetricName": "INST_FROM_L3",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of ICache misses that were reloaded from local memory",
+        "MetricExpr": "PM_INST_FROM_LMEM * 100 / PM_L1_ICACHE_MISS",
+        "MetricGroup": "Instruction_Stats",
+        "MetricName": "INST_FROM_LMEM",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of ICache misses that were reloaded from remote memory",
+        "MetricExpr": "PM_INST_FROM_RMEM * 100 / PM_L1_ICACHE_MISS",
+        "MetricGroup": "Instruction_Stats",
+        "MetricName": "INST_FROM_RMEM",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of ICache misses that were reloaded from distant memory",
+        "MetricExpr": "PM_INST_FROM_DMEM * 100 / PM_L1_ICACHE_MISS",
+        "MetricGroup": "Instruction_Stats",
+        "MetricName": "INST_FROM_DMEM",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of ICache reloads from the L2 per completed instruction",
+        "MetricExpr": "PM_INST_FROM_L2 * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "INST_FROM_L2_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of ICache reloads from the L3 per completed instruction",
+        "MetricExpr": "PM_INST_FROM_L3 * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "INST_FROM_L3_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of ICache reloads from local memory per completed instruction",
+        "MetricExpr": "PM_INST_FROM_LMEM * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "INST_FROM_LMEM_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of ICache reloads from remote memory per completed instruction",
+        "MetricExpr": "PM_INST_FROM_RMEM * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "INST_FROM_RMEM_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of ICache reloads from distant memory per completed instruction",
+        "MetricExpr": "PM_INST_FROM_DMEM * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "INST_FROM_DMEM_RATE",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Average number of run cycles per completed instruction",
         "MetricExpr": "PM_RUN_CYC / PM_RUN_INST_CMPL",
@@ -607,6 +785,13 @@
         "MetricName": "DL1_MISS_RELOADS",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from the local L2",
+        "MetricExpr": "PM_DATA_FROM_L2 * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L2",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of demand load misses that reloaded from beyond the local L2",
         "MetricExpr": "PM_DATA_FROM_L2MISS / PM_LD_DEMAND_MISS_L1 * 100",
@@ -614,6 +799,13 @@
         "MetricName": "DL1_RELOAD_FROM_L2_MISS",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from the local L3",
+        "MetricExpr": "PM_DATA_FROM_L3 * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L3",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of demand load misses that reloaded from beyond the local L3",
         "MetricExpr": "PM_DATA_FROM_L3MISS / PM_LD_DEMAND_MISS_L1 * 100",
@@ -621,6 +813,188 @@
         "MetricName": "DL1_RELOAD_FROM_L3_MISS",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from the local L3 with modified data",
+        "MetricExpr": "PM_DATA_FROM_L3_MEPF * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L3_MEPF",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L2 on the same regent with modified data",
+        "MetricExpr": "PM_DATA_FROM_L21_REGENT_MOD * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L21_REGENT_MOD",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L2 on the same regent with shared data",
+        "MetricExpr": "PM_DATA_FROM_L21_REGENT_SHR * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L21_REGENT_SHR",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L2 on the same chip in a different regent with modified data",
+        "MetricExpr": "PM_DATA_FROM_L21_NON_REGENT_MOD * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L21_NON_REGENT_MOD",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L2 on the same chip in a different regent with shared data",
+        "MetricExpr": "PM_DATA_FROM_L21_NON_REGENT_SHR * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L21_NON_REGENT_SHR",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L3 on the same regent with modified data",
+        "MetricExpr": "PM_DATA_FROM_L31_REGENT_MOD * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L31_REGENT_MOD",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L3 on the same regent with shared data",
+        "MetricExpr": "PM_DATA_FROM_L31_REGENT_SHR * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L31_REGENT_SHR",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L3 on the same chip in a different regent with modified data",
+        "MetricExpr": "PM_DATA_FROM_L31_NON_REGENT_MOD * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L31_NON_REGENT_MOD",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L3 on the same chip in a different regent with shared data",
+        "MetricExpr": "PM_DATA_FROM_L31_NON_REGENT_SHR * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L31_NON_REGENT_SHR",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L2 on a remote chip with modified data",
+        "MetricExpr": "PM_DATA_FROM_RL2_MOD * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_RL2_MOD",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L2 on a remote chip with shared data",
+        "MetricExpr": "PM_DATA_FROM_RL2_SHR * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_RL2_SHR",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L3 on a remote chip with modified data",
+        "MetricExpr": "PM_DATA_FROM_RL3_MOD * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_RL3_MOD",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L3 on a remote chip with shared data",
+        "MetricExpr": "PM_DATA_FROM_RL3_SHR * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_RL3_SHR",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L2 on a distant chip with modified data",
+        "MetricExpr": "PM_DATA_FROM_DL2_MOD * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_DL2_MOD",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L2 on a distant chip with shared data",
+        "MetricExpr": "PM_DATA_FROM_DL2_SHR * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_DL2_SHR",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L3 on a distant chip with modified data",
+        "MetricExpr": "PM_DATA_FROM_DL3_MOD * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_DL3_MOD",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from another core's L3 on a distant chip with shared data",
+        "MetricExpr": "PM_DATA_FROM_DL3_SHR * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_DL3_SHR",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from the local chip's memory",
+        "MetricExpr": "PM_DATA_FROM_LMEM * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_LMEM",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from the local chip's OpenCAPI Cache",
+        "MetricExpr": "PM_DATA_FROM_L_OC_CACHE * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L_OC_CACHE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from the local chip's OpenCAPI memory",
+        "MetricExpr": "PM_DATA_FROM_L_OC_MEM * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L_OC_MEM",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from a remote chip's memory",
+        "MetricExpr": "PM_DATA_FROM_RMEM * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_RMEM",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from a remote chip's OpenCAPI Cache",
+        "MetricExpr": "PM_DATA_FROM_R_OC_CACHE * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_R_OC_CACHE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from a remote chip's OpenCAPI memory",
+        "MetricExpr": "PM_DATA_FROM_R_OC_MEM * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_R_OC_MEM",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from a distant chip's memory",
+        "MetricExpr": "PM_DATA_FROM_DMEM * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_DMEM",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from a distant chip's OpenCAPI Cache",
+        "MetricExpr": "PM_DATA_FROM_D_OC_CACHE * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_D_OC_CACHE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from a distant chip's OpenCAPI memory",
+        "MetricExpr": "PM_DATA_FROM_D_OC_MEM * 100 / PM_LD_DEMAND_MISS_L1",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_D_OC_MEM",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of cycles stalled due to the NTC instruction waiting for a load miss to resolve from a source beyond the local L2 and local L3",
         "MetricExpr": "DMISS_L3MISS_STALL_CPI / RUN_CPI * 100",
@@ -686,6 +1060,13 @@
         "MetricName": "DERAT_MISS_RELOAD",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of ICache misses that were reloaded from beyond the local L2",
+        "MetricExpr": "PM_INST_FROM_L2MISS * 100 / PM_L1_ICACHE_MISS",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "INST_FROM_L2_MISS",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of icache misses that were reloaded from beyond the local L3",
         "MetricExpr": "PM_INST_FROM_L3MISS / PM_L1_ICACHE_MISS * 100",
@@ -693,6 +1074,13 @@
         "MetricName": "INST_FROM_L3_MISS",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of ICache reloads from beyond the L2 per completed instruction",
+        "MetricExpr": "PM_INST_FROM_L2MISS * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "INST_FROM_L2_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of icache reloads from the beyond the L3 per completed instruction",
         "MetricExpr": "PM_INST_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
-- 
2.39.3

