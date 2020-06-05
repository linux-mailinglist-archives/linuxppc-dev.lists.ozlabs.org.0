Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DDB1EF2D7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 10:11:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49db2V56hHzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 18:11:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dZkL3sxJzDqvV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 17:57:30 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0557W7FW059164; Fri, 5 Jun 2020 03:57:25 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31f9dfn57w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 03:57:25 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0557oqjS014769;
 Fri, 5 Jun 2020 07:57:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 31bf483nxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 07:57:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0557vKxd47055070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Jun 2020 07:57:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 890844C058;
 Fri,  5 Jun 2020 07:57:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D5DA4C040;
 Fri,  5 Jun 2020 07:57:19 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.85.92.6])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Jun 2020 07:57:19 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 5/7] powerpc/perf: Update Power PMU cache_events to u64 type
Date: Fri,  5 Jun 2020 03:57:08 -0400
Message-Id: <1591343830-8286-6-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591343830-8286-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1591343830-8286-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_01:2020-06-04,
 2020-06-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=1 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 malwarescore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006050053
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
Cc: mikey@linux.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Events of type PERF_TYPE_HW_CACHE was described for Power PMU
as: int (*cache_events)[type][op][result];

where type, op, result values unpacked from the event attribute config
value is used to generate the raw event code at runtime.

So far the event code values which used to create these cache-related
events were within 32 bit and `int` type worked. In power10,
some of the event codes are of 64-bit value and hence update the
Power PMU cache_events to `u64` type in `power_pmu` struct.
Also propagate this change to existing all PMU driver code paths
which are using ppmu->cache_events.

Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h | 2 +-
 arch/powerpc/perf/core-book3s.c              | 2 +-
 arch/powerpc/perf/generic-compat-pmu.c       | 2 +-
 arch/powerpc/perf/mpc7450-pmu.c              | 2 +-
 arch/powerpc/perf/power5+-pmu.c              | 2 +-
 arch/powerpc/perf/power5-pmu.c               | 2 +-
 arch/powerpc/perf/power6-pmu.c               | 2 +-
 arch/powerpc/perf/power7-pmu.c               | 2 +-
 arch/powerpc/perf/power8-pmu.c               | 2 +-
 arch/powerpc/perf/power9-pmu.c               | 2 +-
 arch/powerpc/perf/ppc970-pmu.c               | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 895aeaa..cb207f8 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -47,7 +47,7 @@ struct power_pmu {
 	const struct attribute_group	**attr_groups;
 	int		n_generic;
 	int		*generic_events;
-	int		(*cache_events)[PERF_COUNT_HW_CACHE_MAX]
+	u64		(*cache_events)[PERF_COUNT_HW_CACHE_MAX]
 			       [PERF_COUNT_HW_CACHE_OP_MAX]
 			       [PERF_COUNT_HW_CACHE_RESULT_MAX];
 
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 9db72cd..6de81d1 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1818,7 +1818,7 @@ static void hw_perf_event_destroy(struct perf_event *event)
 static int hw_perf_cache_event(u64 config, u64 *eventp)
 {
 	unsigned long type, op, result;
-	int ev;
+	u64 ev;
 
 	if (!ppmu->cache_events)
 		return -EINVAL;
diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
index 5e5a54d..eb8a6aaf 100644
--- a/arch/powerpc/perf/generic-compat-pmu.c
+++ b/arch/powerpc/perf/generic-compat-pmu.c
@@ -101,7 +101,7 @@ enum {
  * 0 means not supported, -1 means nonsensical, other values
  * are event codes.
  */
-static int generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static u64 generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[ C(L1D) ] = {
 		[ C(OP_READ) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 4d5ef92..cf1eb89 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -354,7 +354,7 @@ static void mpc7450_disable_pmc(unsigned int pmc, unsigned long mmcr[])
  * 0 means not supported, -1 means nonsensical, other values
  * are event codes.
  */
-static int mpc7450_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static u64 mpc7450_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0,		0x225	},
 		[C(OP_WRITE)] = {	0,		0x227	},
diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
index f857454..9252281 100644
--- a/arch/powerpc/perf/power5+-pmu.c
+++ b/arch/powerpc/perf/power5+-pmu.c
@@ -618,7 +618,7 @@ static void power5p_disable_pmc(unsigned int pmc, unsigned long mmcr[])
  * 0 means not supported, -1 means nonsensical, other values
  * are event codes.
  */
-static int power5p_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static u64 power5p_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0x1c10a8,	0x3c1088	},
 		[C(OP_WRITE)] = {	0x2c10a8,	0xc10c3		},
diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
index da52eca..3b36630 100644
--- a/arch/powerpc/perf/power5-pmu.c
+++ b/arch/powerpc/perf/power5-pmu.c
@@ -560,7 +560,7 @@ static void power5_disable_pmc(unsigned int pmc, unsigned long mmcr[])
  * 0 means not supported, -1 means nonsensical, other values
  * are event codes.
  */
-static int power5_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static u64 power5_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0x4c1090,	0x3c1088	},
 		[C(OP_WRITE)] = {	0x3c1090,	0xc10c3		},
diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
index 3929cac..540b78d 100644
--- a/arch/powerpc/perf/power6-pmu.c
+++ b/arch/powerpc/perf/power6-pmu.c
@@ -481,7 +481,7 @@ static void p6_disable_pmc(unsigned int pmc, unsigned long mmcr[])
  * are event codes.
  * The "DTLB" and "ITLB" events relate to the DERAT and IERAT.
  */
-static int power6_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static u64 power6_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0x280030,	0x80080		},
 		[C(OP_WRITE)] = {	0x180032,	0x80088		},
diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
index a137813..2b7f375 100644
--- a/arch/powerpc/perf/power7-pmu.c
+++ b/arch/powerpc/perf/power7-pmu.c
@@ -332,7 +332,7 @@ static void power7_disable_pmc(unsigned int pmc, unsigned long mmcr[])
  * 0 means not supported, -1 means nonsensical, other values
  * are event codes.
  */
-static int power7_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static u64 power7_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0xc880,		0x400f0	},
 		[C(OP_WRITE)] = {	0,		0x300f0	},
diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
index 3a5fcc2..5282e84 100644
--- a/arch/powerpc/perf/power8-pmu.c
+++ b/arch/powerpc/perf/power8-pmu.c
@@ -253,7 +253,7 @@ static void power8_config_bhrb(u64 pmu_bhrb_filter)
  * 0 means not supported, -1 means nonsensical, other values
  * are event codes.
  */
-static int power8_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static u64 power8_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[ C(L1D) ] = {
 		[ C(OP_READ) ] = {
 			[ C(RESULT_ACCESS) ] = PM_LD_REF_L1,
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index 08c3ef7..05dae38 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -310,7 +310,7 @@ static void power9_config_bhrb(u64 pmu_bhrb_filter)
  * 0 means not supported, -1 means nonsensical, other values
  * are event codes.
  */
-static int power9_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static u64 power9_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[ C(L1D) ] = {
 		[ C(OP_READ) ] = {
 			[ C(RESULT_ACCESS) ] = PM_LD_REF_L1,
diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
index 4035d93..2970d1e 100644
--- a/arch/powerpc/perf/ppc970-pmu.c
+++ b/arch/powerpc/perf/ppc970-pmu.c
@@ -432,7 +432,7 @@ static void p970_disable_pmc(unsigned int pmc, unsigned long mmcr[])
  * 0 means not supported, -1 means nonsensical, other values
  * are event codes.
  */
-static int ppc970_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static u64 ppc970_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0x8810,		0x3810	},
 		[C(OP_WRITE)] = {	0x7810,		0x813	},
-- 
1.8.3.1

