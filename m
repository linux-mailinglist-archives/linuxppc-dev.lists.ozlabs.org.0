Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE00B2C5A0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 18:06:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chkft6btHzDrDl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 04:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FoP7YyFT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChkQS2SGyzDrNm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 03:55:12 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQGXa87033154; Thu, 26 Nov 2020 11:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=8IlTL/2mn96t6VtATHig5YqXBUH0liydxpHzhpVCjjE=;
 b=FoP7YyFTcgBRnGkee3R+j6pcTfuQI9fDqmz9XYUErqnWe0BqaOMVswGc+I/qinQ8jKJQ
 UetCG//RBoHnXB0okusOq0aHS27xR7aQtpzn4Ri7IqpsFeZYG4EDL3SFtVYyMUUsYAfF
 jUmHDn6CAEGsdBA1eHRFGUySrMlOgJ6lQT1Pjeq10H2v+LKTNjinC3hpG2xhC9y7otm7
 X9nv0wfCrWvGUKSIJjw+4ilRM0ayo92MvFFdoBX4X2JoXwWfzoylNlXlFKiHkavEPDs9
 sqrawY02y1rK2VFQXRdyQA/9DWQ0qPVzq7Mmfs4e1HrGHPVo2Uy0NAgiU58qqWhrxuYi tg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 352dp6cmjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 11:55:07 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQGqgFT013905;
 Thu, 26 Nov 2020 16:55:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 352drkg2y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 16:55:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AQGt2od61342152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 16:55:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDD344C044;
 Thu, 26 Nov 2020 16:55:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B704E4C046;
 Thu, 26 Nov 2020 16:55:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.231.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 16:55:01 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 5/7] powerpc/perf: Fix to update generic event codes for
 power10
Date: Thu, 26 Nov 2020 11:54:42 -0500
Message-Id: <1606409684-1589-6-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_06:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=1 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260101
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

Fix the event code for events: branch-instructions (to PM_BR_FIN),
branch-misses (to PM_MPRED_BR_FIN) and cache-misses (to
PM_LD_DEMAND_MISS_L1_FIN) for power10 PMU. Update the
list of generic events with this modified event code.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/power10-events-list.h |  3 +++
 arch/powerpc/perf/power10-pmu.c         | 15 +++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/perf/power10-events-list.h b/arch/powerpc/perf/power10-events-list.h
index 60c1b81..abd778f 100644
--- a/arch/powerpc/perf/power10-events-list.h
+++ b/arch/powerpc/perf/power10-events-list.h
@@ -15,6 +15,9 @@
 EVENT(PM_RUN_INST_CMPL,				0x500fa);
 EVENT(PM_BR_CMPL,                               0x4d05e);
 EVENT(PM_BR_MPRED_CMPL,                         0x400f6);
+EVENT(PM_BR_FIN,				0x2f04a);
+EVENT(PM_MPRED_BR_FIN,				0x3e098);
+EVENT(PM_LD_DEMAND_MISS_L1_FIN,			0x400f0);
 
 /* All L1 D cache load references counted at finish, gated by reject */
 EVENT(PM_LD_REF_L1,				0x100fc);
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index bc3d4dd..a02da69 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -114,6 +114,9 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 GENERIC_EVENT_ATTR(cache-misses,		PM_LD_MISS_L1);
 GENERIC_EVENT_ATTR(mem-loads,			MEM_LOADS);
 GENERIC_EVENT_ATTR(mem-stores,			MEM_STORES);
+GENERIC_EVENT_ATTR(branch-instructions,		PM_BR_FIN);
+GENERIC_EVENT_ATTR(branch-misses,		PM_MPRED_BR_FIN);
+GENERIC_EVENT_ATTR(cache-misses,		PM_LD_DEMAND_MISS_L1_FIN);
 
 CACHE_EVENT_ATTR(L1-dcache-load-misses,		PM_LD_MISS_L1);
 CACHE_EVENT_ATTR(L1-dcache-loads,		PM_LD_REF_L1);
@@ -157,10 +160,10 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 static struct attribute *power10_events_attr[] = {
 	GENERIC_EVENT_PTR(PM_RUN_CYC),
 	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
-	GENERIC_EVENT_PTR(PM_BR_CMPL),
-	GENERIC_EVENT_PTR(PM_BR_MPRED_CMPL),
+	GENERIC_EVENT_PTR(PM_BR_FIN),
+	GENERIC_EVENT_PTR(PM_MPRED_BR_FIN),
 	GENERIC_EVENT_PTR(PM_LD_REF_L1),
-	GENERIC_EVENT_PTR(PM_LD_MISS_L1),
+	GENERIC_EVENT_PTR(PM_LD_DEMAND_MISS_L1_FIN),
 	GENERIC_EVENT_PTR(MEM_LOADS),
 	GENERIC_EVENT_PTR(MEM_STORES),
 	CACHE_EVENT_PTR(PM_LD_MISS_L1),
@@ -259,10 +262,10 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 static int power10_generic_events[] = {
 	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
 	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
-	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_CMPL,
-	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_BR_MPRED_CMPL,
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_FIN,
+	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_MPRED_BR_FIN,
 	[PERF_COUNT_HW_CACHE_REFERENCES] =		PM_LD_REF_L1,
-	[PERF_COUNT_HW_CACHE_MISSES] =			PM_LD_MISS_L1,
+	[PERF_COUNT_HW_CACHE_MISSES] =			PM_LD_DEMAND_MISS_L1_FIN,
 };
 
 static u64 power10_bhrb_filter_map(u64 branch_sample_type)
-- 
1.8.3.1

