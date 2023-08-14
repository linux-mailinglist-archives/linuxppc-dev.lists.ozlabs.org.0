Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C82277B7AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 13:34:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CYJ4gB/k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPXPG03cZz3dF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 21:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CYJ4gB/k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPXGX5qLWz30fk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 21:28:52 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EBJWV7018237;
	Mon, 14 Aug 2023 11:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gMyBgLO2CU0fA+gfUcG9J3s+0wrxAjRFgXnZhASoqDw=;
 b=CYJ4gB/kf0ayEswpVaDqM3TWqQ9qE0w7w+NxjRtqfV9pBZjSqucOkDT0aXJaJz2NEdaL
 jE8MpWlaWKdD9iaeEKkVSUfRch69ELdFTA22UWVwFAsix1OJGP6Hom9syCw3vEfHhjLm
 rcGbNp/tsF9Aii1MahBTclv40zsw1hyOL0p4E1ePXNpfhaZY2aLcp5UXYdIkhm/y0crA
 rYo+zb6NAmnyOo/DdqI6dNOZsjDBbpaRKSvCPCE6rq0mNvj/aCRPnINtKXVc8WWs7KDd
 91ja6UGULTLehz1KDfNzOPdkwVpB9uJA9cM8flM7suWwNHwAYJAiLGIlTkhZnSueDO+0 JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfka085y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:47 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37EBSlXF018073;
	Mon, 14 Aug 2023 11:28:47 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfka085y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:47 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37E9e9BU001119;
	Mon, 14 Aug 2023 11:28:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3semsxv3g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:46 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37EBShun57147826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Aug 2023 11:28:43 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AB8A2004B;
	Mon, 14 Aug 2023 11:28:43 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A87120040;
	Mon, 14 Aug 2023 11:28:41 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.123.95])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Aug 2023 11:28:40 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH 7/7] perf vendor events: Update metric events for power10 platform
Date: Mon, 14 Aug 2023 16:58:03 +0530
Message-Id: <20230814112803.1508296-7-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230814112803.1508296-1-kjain@linux.ibm.com>
References: <20230814112803.1508296-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A0EWowN_CmBv5SbI9Fky90DsfJ0ANBDj
X-Proofpoint-GUID: otQjnqakThQbhy8ZerDkkR3dmvGkUtD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_06,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 suspectscore=0 impostorscore=0 malwarescore=0
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

Update JSON/events for power10 platform with additional metrics.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/metrics.json         | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
index 182369076d95..4d66b75c6ad5 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
@@ -24,6 +24,12 @@
         "MetricGroup": "CPI",
         "MetricName": "DISPATCH_STALL_FLUSH_CPI"
     },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because Fetch was being held,  so there was nothing in the pipeline for this thread",
+        "MetricExpr": "PM_DISP_STALL_FETCH / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCH_STALL_FETCH_CPI"
+    },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because the MMU was handling a translation miss",
         "MetricExpr": "PM_DISP_STALL_TRANSLATION / PM_RUN_INST_CMPL",
@@ -394,6 +400,13 @@
         "MetricName": "L1_LD_MISS_RATE",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of completed instructions that were stores that missed the L1",
+        "MetricExpr": "PM_ST_MISS_L1 * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "Others",
+        "MetricName": "L1_ST_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of completed instructions when the DPTEG required for the load/store instruction in execution was missing from the TLB",
         "MetricExpr": "PM_DTLB_MISS / PM_RUN_INST_CMPL * 100",
@@ -467,6 +480,13 @@
         "MetricName": "DL1_RELOAD_FROM_L3_MISS_RATE",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of ITLB misses per completed run instruction",
+        "MetricExpr": "PM_ITLB_MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "General",
+        "MetricName": "ITLB_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "Percentage of DERAT misses with 4k page size per completed instruction",
         "MetricExpr": "PM_DERAT_MISS_4K / PM_RUN_INST_CMPL * 100",
@@ -622,6 +642,13 @@
         "MetricName": "DERAT_16M_MISS_RATE",
         "ScaleUnit": "1%"
     },
+    {
+        "BriefDescription": "Percentage of DERAT misses with 1G page size per completed run instruction",
+        "MetricExpr": "PM_DERAT_MISS_1G * 100 / PM_RUN_INST_CMPL",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_1G_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
     {
         "BriefDescription": "DERAT miss ratio for 4K page size",
         "MetricExpr": "PM_DERAT_MISS_4K / PM_DERAT_MISS",
@@ -640,6 +667,12 @@
         "MetricGroup": "Translation",
         "MetricName": "DERAT_16M_MISS_RATIO"
     },
+    {
+        "BriefDescription": "DERAT miss ratio for 1G page size",
+        "MetricExpr": "PM_DERAT_MISS_1G / PM_DERAT_MISS",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_1G_MISS_RATIO"
+    },
     {
         "BriefDescription": "DERAT miss ratio for 64K page size",
         "MetricExpr": "PM_DERAT_MISS_64K / PM_DERAT_MISS",
-- 
2.39.3

