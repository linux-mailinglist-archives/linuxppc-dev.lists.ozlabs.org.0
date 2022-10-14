Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 041BE5FF06E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:36:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MppqS5pCjz3fTT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:36:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r8/gE7dG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r8/gE7dG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mpp4j1n0Jz3fGZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 01:03:00 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EDpC3G007925;
	Fri, 14 Oct 2022 14:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ARxS9sOeM9KjqrTSV0mxmj0aVKR4LJU9MCyfokqo740=;
 b=r8/gE7dGwp1az6YEab3TjCLWd7LbqGAqSiXljJXY7NvdK0F7AJlYnI0rg5MooKFzlLOl
 GhqPhxvKTH25sKP5EoPsnPwrTDCIxdVomiNM/Si5bDDi57JSx3Ax83P1eoFb/o4s2zgL
 rLqrTFbUqiA4PDMPpIZPkTxM71eBq6XkIaMy3kJaNPY0deK/iy7JeMqnNBb4ZnEMy0RV
 2PZo3D0YxPaqEG9EZyO9c9nR54D0GVMobju10qkc12FwJLTgB/rYImBKBw/4LJoq27xQ
 dgiv+8AicBGeGW+R9RddnBDZ9MUqmENDJNMRzdU0DmVHXutLa4dzoIiRAUOIKYepb6ht bw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k790y0d1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 14:02:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EDoiN0006215;
	Fri, 14 Oct 2022 14:02:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3k30fjhdc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 14:02:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29EE2YrJ21103036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Oct 2022 14:02:34 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8283911C04C;
	Fri, 14 Oct 2022 14:02:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E5B5411C058;
	Fri, 14 Oct 2022 14:02:29 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.11.83])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 14 Oct 2022 14:02:29 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH] powerpc/perf: Fix hv-24x7 metric events for power10
Date: Fri, 14 Oct 2022 19:32:20 +0530
Message-Id: <20221014140220.122251-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3s_dW_83kZov0D5NYX6LVdNLxAgrPwa5
X-Proofpoint-ORIG-GUID: 3s_dW_83kZov0D5NYX6LVdNLxAgrPwa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140079
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Testcase stat_all_metrics.sh fails in powerpc:

90: perf all metrics test : FAILED!

The testcase "stat_all_metrics.sh" verifies perf stat
result for all the metric events present in perf list.
It runs perf metric events with various commands and
expects non-empty metric result.

Incase of powerpc:hv-24x7 events, some of the event count can
be 0 based on system configuration. And if that event used as
denominator in divide equation, it can cause divide by 0
error. The current nest_metric.json file creating divide by 0
issue for some of the metric events, which results in failure
of the "stat_all_metrics.sh" test case.

Most of the metrics events have cycles or an event which
expect to have a larger value as denominator, so adding 1
to the denominator of the metric expression as a fix.

Result in powerpc box after this patch changes:

90: perf all metrics test : Ok

Fixes: a3cbcadfdfc3 ("perf vendor events power10: Adds 24x7 nest
metric events for power10 platform")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/nest_metrics.json    | 72 +++++++++----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
index 8ba3e81c9808..fe050d44374b 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
@@ -1,13 +1,13 @@
 [
     {
       "MetricName": "VEC_GROUP_PUMP_RETRY_RATIO_P01",
-      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_VG_PUMP01\\,chip\\=?@) * 100",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP01\\,chip\\=?@ / (1 + hv_24x7@PM_PB_VG_PUMP01\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "VEC_GROUP_PUMP_RETRY_RATIO_P23",
-      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_VG_PUMP23\\,chip\\=?@) * 100",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP23\\,chip\\=?@ / (1 + hv_24x7@PM_PB_VG_PUMP23\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
@@ -61,13 +61,13 @@
     },
     {
       "MetricName": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P01",
-      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_RNS_PUMP01\\,chip\\=?@) * 100",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP01\\,chip\\=?@ / (1 + hv_24x7@PM_PB_RNS_PUMP01\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P23",
-      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_RNS_PUMP23\\,chip\\=?@) * 100",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP23\\,chip\\=?@ / (1 + hv_24x7@PM_PB_RNS_PUMP23\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
@@ -151,193 +151,193 @@
     },
     {
       "MetricName": "XLINK0_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK1_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK2_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK3_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK4_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK5_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK6_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK7_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK0_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK1_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK2_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK3_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK4_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK5_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK6_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "XLINK7_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK0_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK1_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK2_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK3_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK4_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK5_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK6_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK7_OUT_TOTAL_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK0_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK1_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK2_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK3_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK4_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK5_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK6_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
     {
       "MetricName": "ALINK7_OUT_DATA_UTILIZATION",
-      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_DATA\\,chip\\=?@) / (1 + hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
       "ScaleUnit": "1.063%",
       "AggregationMode": "PerChip"
     },
-- 
2.31.1

