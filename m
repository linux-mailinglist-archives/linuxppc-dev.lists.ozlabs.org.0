Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 098AE3B42CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 14:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBFvG6Dj2z3c2S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 22:00:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sfhXW8pj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sfhXW8pj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBFtZ2jbgz2xYs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 22:00:05 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15PBYK9W125458; Fri, 25 Jun 2021 08:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nyNpYSBdSEZ5aQq85x/2GnmZ69Crp7CAsGxbkZmLNZk=;
 b=sfhXW8pjL3wtEi43fsWp4OfmwoJgdBhyWsZpaniyb00F2Orrlnkt0ju2VXDD7rB/XC8U
 TMYqqreFhVLfpCXrS71MC+/NT6JVUKMzmglszse3gigOpXeRT0Gubj3+WUs67qPLtOce
 W6z60o7kVTdsR8g1aRvc2aguLGiurIGhAbfPD4+ujgAlH7/+NlKUKeYcXobQ/593cwlX
 S8RomlHVnvhpNg2gKh2ut1qsNpcFKinjO5LPe+6i9aGdyn0x/vq/2SGfIlAbX+vfnwpe
 4YOVUXM/UiHC2xrGI+yYKpixouNpl5wk29kTFJx5WFHve78ZiP5dw4SHErBPaRq/Nkoz 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39dd7hbdv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 08:00:01 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15PBZRZn130805;
 Fri, 25 Jun 2021 08:00:01 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39dd7hbdt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 08:00:00 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15PBwBTO019549;
 Fri, 25 Jun 2021 11:59:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3997uhhp7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 11:59:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15PBxsHx14352742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 11:59:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDA6CAE056;
 Fri, 25 Jun 2021 11:59:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E012EAE045;
 Fri, 25 Jun 2021 11:59:51 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.34.49])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Jun 2021 11:59:51 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH] perf vendor events power10: Adds 24x7 nest metric events for
 power10 platform
Date: Fri, 25 Jun 2021 17:29:48 +0530
Message-Id: <20210625115948.99579-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6TKaL054wzVUOYB3FSs6y3qwbZ7_PXqc
X-Proofpoint-GUID: 2Hn2uV8r_gMtvTvEg8zRa6KNS1PaFzfr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-25_04:2021-06-25,
 2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106250063
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 maddy@linux.vnet.ibm.com, pc@us.ibm.com, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch adds 24x7 nest metric events for POWER10.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/nest_metrics.json    | 491 ++++++++++++++++++
 1 file changed, 491 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
new file mode 100644
index 000000000000..b79046cd8b09
--- /dev/null
+++ b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
@@ -0,0 +1,491 @@
+[
+    {
+      "MetricName": "VEC_GROUP_PUMP_RETRY_RATIO_P01",
+      "BriefDescription": "VEC_GROUP_PUMP_RETRY_RATIO_P01",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_VG_PUMP01\\,chip\\=?@) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "VEC_GROUP_PUMP_RETRY_RATIO_P23",
+      "BriefDescription": "VEC_GROUP_PUMP_RETRY_RATIO_P23",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_VG_PUMP23\\,chip\\=?@) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "LOCAL_NODE_PUMP_RETRY_RATIO_P01",
+      "BriefDescription": "LOCAL_NODE_PUMP_RETRY_RATIO_P01",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_LNS_PUMP01\\,chip\\=?@) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "LOCAL_NODE_PUMP_RETRY_RATIO_P23",
+      "BriefDescription": "LOCAL_NODE_PUMP_RETRY_RATIO_P23",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_LNS_PUMP23\\,chip\\=?@) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "GROUP_PUMP_RETRY_RATIO_P01",
+      "BriefDescription": "GROUP_PUMP_RETRY_RATIO_P01",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_GROUP_PUMP01\\,chip\\=?@) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "GROUP_PUMP_RETRY_RATIO_P23",
+      "BriefDescription": "GROUP_PUMP_RETRY_RATIO_P23",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_GROUP_PUMP23\\,chip\\=?@) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_GROUP_PUMPS_P01",
+      "BriefDescription": "TOTAL_GROUP_PUMPS_P01(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_GROUP_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_GROUP_PUMPS_P23",
+      "BriefDescription": "TOTAL_GROUP_PUMPS_P23(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_GROUP_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_GROUP_PUMPS_RETRIES_P01",
+      "BriefDescription": "TOTAL_GROUP_PUMPS_RETRIES_P01(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_GROUP_PUMPS_RETRIES_P23",
+      "BriefDescription": "TOTAL_GROUP_PUMPS_RETRIES_P23(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P01",
+      "BriefDescription": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P01",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_RNS_PUMP01\\,chip\\=?@) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P23",
+      "BriefDescription": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P23",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_RNS_PUMP23\\,chip\\=?@) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_P01",
+      "BriefDescription": "TOTAL_VECTOR_GROUP_PUMPS_P01(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_P23",
+      "BriefDescription": "TOTAL_VECTOR_GROUP_PUMPS_P23(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_P01",
+      "BriefDescription": "TOTAL_LOCAL_NODE_PUMPS_P01(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_LNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_P23",
+      "BriefDescription": "TOTAL_LOCAL_NODE_PUMPS_P23(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_LNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P01",
+      "BriefDescription": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P01(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P23",
+      "BriefDescription": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P23(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01",
+      "BriefDescription": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P23",
+      "BriefDescription": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P23(PER-CYC)",
+      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_REMOTE_NODE_PUMPS_P01",
+      "BriefDescription": "TOTAL_REMOTE_NODE_PUMPS_P01",
+      "MetricExpr": "(hv_24x7@PM_PB_RNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_REMOTE_NODE_PUMPS_P23",
+      "BriefDescription": "TOTAL_REMOTE_NODE_PUMPS_P23",
+      "MetricExpr": "(hv_24x7@PM_PB_RNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_NEAR_NODE_PUMPS_P01",
+      "BriefDescription": "TOTAL_NEAR_NODE_PUMPS_P01",
+      "MetricExpr": "(hv_24x7@PM_PB_NNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_NEAR_NODE_PUMPS_P23",
+      "BriefDescription": "TOTAL_NEAR_NODE_PUMPS_P23",
+      "MetricExpr": "(hv_24x7@PM_PB_NNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
+      "ScaleUnit": "4",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_INT_PB_BW",
+      "BriefDescription": "TOTAL_INT_PB_BW",
+      "MetricExpr": "(hv_24x7@PM_PB_INT_DATA_XFER\\,chip\\=?@)",
+      "ScaleUnit": "2.09MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK0_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "XLINK0_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK1_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "XLINK1_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK2_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "XLINK2_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK3_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "XLINK3_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK4_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "XLINK4_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK5_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "XLINK5_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK6_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "XLINK6_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK7_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "XLINK7_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK0_OUT_DATA_UTILIZATION",
+      "BriefDescription": "XLINK0_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK1_OUT_DATA_UTILIZATION",
+      "BriefDescription": "XLINK1_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK2_OUT_DATA_UTILIZATION",
+      "BriefDescription": "XLINK2_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK3_OUT_DATA_UTILIZATION",
+      "BriefDescription": "XLINK3_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK4_OUT_DATA_UTILIZATION",
+      "BriefDescription": "XLINK4_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK5_OUT_DATA_UTILIZATION",
+      "BriefDescription": "XLINK5_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK6_OUT_DATA_UTILIZATION",
+      "BriefDescription": "XLINK6_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "XLINK7_OUT_DATA_UTILIZATION",
+      "BriefDescription": "XLINK7_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK0_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "ALINK0_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK1_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "ALINK1_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK2_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "ALINK2_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK3_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "ALINK3_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK4_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "ALINK4_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK5_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "ALINK5_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK6_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "ALINK6_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK7_OUT_TOTAL_UTILIZATION",
+      "BriefDescription": "ALINK7_OUT_TOTAL_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK0_OUT_DATA_UTILIZATION",
+      "BriefDescription": "ALINK0_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK1_OUT_DATA_UTILIZATION",
+      "BriefDescription": "ALINK1_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK2_OUT_DATA_UTILIZATION",
+      "BriefDescription": "ALINK2_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK3_OUT_DATA_UTILIZATION",
+      "BriefDescription": "ALINK3_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK4_OUT_DATA_UTILIZATION",
+      "BriefDescription": "ALINK4_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK5_OUT_DATA_UTILIZATION",
+      "BriefDescription": "ALINK5_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK6_OUT_DATA_UTILIZATION",
+      "BriefDescription": "ALINK6_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "ALINK7_OUT_DATA_UTILIZATION",
+      "BriefDescription": "ALINK7_OUT_DATA_UTILIZATION",
+      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
+      "ScaleUnit": "1.063%",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI1",
+      "BriefDescription": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI1",
+      "MetricExpr": "(hv_24x7@PM_PCI1_32B_INOUT\\,chip\\=?@)",
+      "ScaleUnit": "3.28e-2MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI0",
+      "BriefDescription": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI0",
+      "MetricExpr": "(hv_24x7@PM_PCI0_32B_INOUT\\,chip\\=?@)",
+      "ScaleUnit": "3.28e-2MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_MCS_READ_BW_MC0_CHAN01",
+      "BriefDescription": "TOTAL_MCS_READ_BW_MC0_CHAN01",
+      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@)",
+      "ScaleUnit": "5.24e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_MCS_READ_BW_MC1_CHAN01",
+      "BriefDescription": "TOTAL_MCS_READ_BW_MC1_CHAN01",
+      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@)",
+      "ScaleUnit": "5.24e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_MCS_READ_BW_MC2_CHAN01",
+      "BriefDescription": "TOTAL_MCS_READ_BW_MC2_CHAN01",
+      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@)",
+      "ScaleUnit": "5.24e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_MCS_READ_BW_MC3_CHAN01",
+      "BriefDescription": "TOTAL_MCS_READ_BW_MC3_CHAN01",
+      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@)",
+      "ScaleUnit": "5.24e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_MCS_WRITE_BW_MC0_CHAN01",
+      "BriefDescription": "TOTAL_MCS_WRITE_BW_MC0_CHAN01",
+      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@)",
+      "ScaleUnit": "2.6e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_MCS_WRITE_BW_MC1_CHAN01",
+      "BriefDescription": "TOTAL_MCS_WRITE_BW_MC1_CHAN01",
+      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@)",
+      "ScaleUnit": "2.6e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_MCS_WRITE_BW_MC2_CHAN01",
+      "BriefDescription": "TOTAL_MCS_WRITE_BW_MC2_CHAN01",
+      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@)",
+      "ScaleUnit": "2.6e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricName": "TOTAL_MCS_WRITE_BW_MC3_CHAN01",
+      "BriefDescription": "TOTAL_MCS_WRITE_BW_MC3_CHAN01",
+      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@)",
+      "ScaleUnit": "2.6e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@)",
+      "MetricName": "Memory_RD_BW_Chip",
+      "MetricGroup": "Memory_BW",
+      "ScaleUnit": "5.24e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@ )",
+      "MetricName": "Memory_WR_BW_Chip",
+      "MetricGroup": "Memory_BW",
+      "ScaleUnit": "2.6e-1MB",
+      "AggregationMode": "PerChip"
+    },
+    {
+      "MetricExpr": "(hv_24x7@PM_PAU_CYC\\,chip\\=?@ )",
+      "MetricName": "PowerBUS_Frequency",
+      "ScaleUnit": "2.56e-7GHz",
+      "AggregationMode": "PerChip"
+    }
+]
-- 
2.27.0

