Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 332602C5A39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 18:07:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chkhy5jdJzDrQc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 04:07:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HiRjmECS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChkQV1dwKzDrNv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 03:55:14 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQG2nSA039345; Thu, 26 Nov 2020 11:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=QFcTojpBM9C2BVtfORWhclRAHqVBA36gsFzyKrOjfjU=;
 b=HiRjmECS/bG9FWPzGK8ZOZpQgxIKzH7jdGGKTdvpm6GsISZiXfazlduwbKYN1CXD6Vu8
 CNnWKTCKwsI/aeOXmLiMTB9FmCjvQUyicRsoiuG+imwIgAIk1BcdMqDV+Wm1BGyuqfLe
 brDVTXywPbdLsJNgKJILTimYb6i68qXbAmspyaMq72qq3UmC/uO/+Oc6FMD3TwbHOlzM
 edutU978WfJxia0pJ9ODt+YDoJx4Rq+AUh4Rg8JIXOndZ998BTkz5IIr+4XmOgTZOmM/
 7nf1hrnZ9trK+mEPyP/iyO1kt6Aoxptsw18B61CDLnjw7iT3Nm50aORNwR65Qya1K4H2 hA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352ex5tbhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 11:55:09 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQGrxiI002895;
 Thu, 26 Nov 2020 16:55:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 351pca0n83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 16:55:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQGt4lR59376086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 16:55:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E8274C044;
 Thu, 26 Nov 2020 16:55:04 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A4924C040;
 Thu, 26 Nov 2020 16:55:03 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.231.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 16:55:02 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 6/7] powerpc/perf: Fix to update cache events with l2l3
 events in power10
Date: Thu, 26 Nov 2020 11:54:43 -0500
Message-Id: <1606409684-1589-7-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_06:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=1
 lowpriorityscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260097
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Export l2l3 events (PM_L2_ST_MISS and PM_L2_ST) and LLC-prefetches
(PM_L3_PF_MISS_L3) via sysfs, and also add these to list of
cache_events.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/power10-events-list.h |  6 ++++++
 arch/powerpc/perf/power10-pmu.c         | 12 +++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/power10-events-list.h b/arch/powerpc/perf/power10-events-list.h
index abd778f..e45dafe 100644
--- a/arch/powerpc/perf/power10-events-list.h
+++ b/arch/powerpc/perf/power10-events-list.h
@@ -39,6 +39,12 @@
 EVENT(PM_DATA_FROM_L3,				0x01340000001c040);
 /* Demand LD - L3 Miss (not L2 hit and not L3 hit) */
 EVENT(PM_DATA_FROM_L3MISS,			0x300fe);
+/* All successful D-side store dispatches for this thread */
+EVENT(PM_L2_ST,					0x010000046080);
+/* All successful D-side store dispatches for this thread that were L2 Miss */
+EVENT(PM_L2_ST_MISS,				0x26880);
+/* Total HW L3 prefetches(Load+store) */
+EVENT(PM_L3_PF_MISS_L3,				0x100000016080);
 /* Data PTEG reload */
 EVENT(PM_DTLB_MISS,				0x300fc);
 /* ITLB Reloaded */
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index a02da69..79e0206 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -127,6 +127,9 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 CACHE_EVENT_ATTR(L1-icache-prefetches,		PM_IC_PREF_REQ);
 CACHE_EVENT_ATTR(LLC-load-misses,		PM_DATA_FROM_L3MISS);
 CACHE_EVENT_ATTR(LLC-loads,			PM_DATA_FROM_L3);
+CACHE_EVENT_ATTR(LLC-prefetches,		PM_L3_PF_MISS_L3);
+CACHE_EVENT_ATTR(LLC-store-misses,		PM_L2_ST_MISS);
+CACHE_EVENT_ATTR(LLC-stores,			PM_L2_ST);
 CACHE_EVENT_ATTR(branch-load-misses,		PM_BR_MPRED_CMPL);
 CACHE_EVENT_ATTR(branch-loads,			PM_BR_CMPL);
 CACHE_EVENT_ATTR(dTLB-load-misses,		PM_DTLB_MISS);
@@ -175,6 +178,9 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 	CACHE_EVENT_PTR(PM_IC_PREF_REQ),
 	CACHE_EVENT_PTR(PM_DATA_FROM_L3MISS),
 	CACHE_EVENT_PTR(PM_DATA_FROM_L3),
+	CACHE_EVENT_PTR(PM_L3_PF_MISS_L3),
+	CACHE_EVENT_PTR(PM_L2_ST_MISS),
+	CACHE_EVENT_PTR(PM_L2_ST),
 	CACHE_EVENT_PTR(PM_BR_MPRED_CMPL),
 	CACHE_EVENT_PTR(PM_BR_CMPL),
 	CACHE_EVENT_PTR(PM_DTLB_MISS),
@@ -460,11 +466,11 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
 			[C(RESULT_MISS)] = PM_DATA_FROM_L3MISS,
 		},
 		[C(OP_WRITE)] = {
-			[C(RESULT_ACCESS)] = -1,
-			[C(RESULT_MISS)] = -1,
+			[C(RESULT_ACCESS)] = PM_L2_ST,
+			[C(RESULT_MISS)] = PM_L2_ST_MISS,
 		},
 		[C(OP_PREFETCH)] = {
-			[C(RESULT_ACCESS)] = -1,
+			[C(RESULT_ACCESS)] = PM_L3_PF_MISS_L3,
 			[C(RESULT_MISS)] = 0,
 		},
 	},
-- 
1.8.3.1

