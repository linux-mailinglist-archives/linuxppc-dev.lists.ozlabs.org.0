Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 854F37F6380
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 17:02:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fd4SdN9S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbjYY6Dyzz3dXf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 03:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fd4SdN9S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbjXf6JM2z3dL8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 03:01:37 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANFSBMV031778;
	Thu, 23 Nov 2023 16:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=RaxoUYUTxcRmgIFsQiRD/3jXhAp4sE+eQI/C5kR7aac=;
 b=fd4SdN9SdMbBqkKWV+Gbf41rU52fUlmLlC5g+Qy0rqoRjk1oqSJJyDtorwhUGFORX4dv
 WN0RqQp12Ds4lvNZXe4KTw05n7euvNQ+svLoilALIujdbRZ8SVJC+U58YwmEh8LIqe63
 TNIykwSvymTvyobRX7T8XcKsCGdHh9ONxDuG7Ra7tIa21GWCpxO9/4u+OQVqJA5lj8io
 pR8j2oU7AqOk/gPAM+5r1YjXVAfpP4D5JlZarSLhIwZQvKPSiN8z4JPfj9inCga2YbU7
 NxShkmjyIfuVHBkK0sS3sGB2PnycWsN9LHnj+eyBPu+L9ssSo5SbMhM7uynQzZsTgaYD ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uj9db8xn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 16:01:23 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ANFUPwL006391;
	Thu, 23 Nov 2023 16:01:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uj9db8xmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 16:01:23 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANFmv4N031483;
	Thu, 23 Nov 2023 16:01:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf8kp8243-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 16:01:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ANG1JYJ22348404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Nov 2023 16:01:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 688422004D;
	Thu, 23 Nov 2023 16:01:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D87E20040;
	Thu, 23 Nov 2023 16:01:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.34.234])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Nov 2023 16:01:16 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, james.clark@arm.com, namhyung@kernel.org
Subject: [PATCH] perf vendor events: Update datasource event name to fix duplicate events
Date: Thu, 23 Nov 2023 21:31:10 +0530
Message-Id: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -XtrAhc2GVsgwYVo8IFvSu9IEZ8UEoxd
X-Proofpoint-GUID: UFklTmMwwYNu3xh1K9OIM8-64fSHSyHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_12,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230116
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running "perf list" on powerpc fails with segfault
as below:

   ./perf list
   Segmentation fault (core dumped)

This happens because of duplicate events in the json list.
The powerpc Json event list contains some event with same
event name, but different event code. They are:
- PM_INST_FROM_L3MISS (Present in datasource and frontend)
- PM_MRK_DATA_FROM_L2MISS (Present in datasource and marked)
- PM_MRK_INST_FROM_L3MISS (Present in datasource and marked)
- PM_MRK_DATA_FROM_L3MISS (Present in datasource and marked)

pmu_events_table__num_events uses the value from
table_pmu->num_entries which includes duplicate events as
well. This causes issue during "perf list" and results in
segmentation fault.

Since both event codes are valid, append _DSRC to the Data
Source events (datasource.json), so that they would have a
unique name. Also add PM_DATA_FROM_L2MISS_DSRC and
PM_DATA_FROM_L3MISS_DSRC events. With the fix, perf list
works as expected.

Fixes: fc1435807533 ("perf vendor events power10: Update JSON/events")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../arch/powerpc/power10/datasource.json       | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
index 6b0356f2d301..0eeaaf1a95b8 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
@@ -99,6 +99,11 @@
     "EventName": "PM_INST_FROM_L2MISS",
     "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss."
   },
+  {
+    "EventCode": "0x0003C0000000C040",
+    "EventName": "PM_DATA_FROM_L2MISS_DSRC",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
+  },
   {
     "EventCode": "0x000380000010C040",
     "EventName": "PM_INST_FROM_L2MISS_ALL",
@@ -161,9 +166,14 @@
   },
   {
     "EventCode": "0x000780000000C040",
-    "EventName": "PM_INST_FROM_L3MISS",
+    "EventName": "PM_INST_FROM_L3MISS_DSRC",
     "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss."
   },
+  {
+    "EventCode": "0x0007C0000000C040",
+    "EventName": "PM_DATA_FROM_L3MISS_DSRC",
+    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss."
+  },
   {
     "EventCode": "0x000780000010C040",
     "EventName": "PM_INST_FROM_L3MISS_ALL",
@@ -981,7 +991,7 @@
   },
   {
     "EventCode": "0x0003C0000000C142",
-    "EventName": "PM_MRK_DATA_FROM_L2MISS",
+    "EventName": "PM_MRK_DATA_FROM_L2MISS_DSRC",
     "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
   },
   {
@@ -1046,12 +1056,12 @@
   },
   {
     "EventCode": "0x000780000000C142",
-    "EventName": "PM_MRK_INST_FROM_L3MISS",
+    "EventName": "PM_MRK_INST_FROM_L3MISS_DSRC",
     "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
   },
   {
     "EventCode": "0x0007C0000000C142",
-    "EventName": "PM_MRK_DATA_FROM_L3MISS",
+    "EventName": "PM_MRK_DATA_FROM_L3MISS_DSRC",
     "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
   },
   {
-- 
2.39.3

