Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F92DA8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 04:54:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sq4W36y3zDqNC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 12:54:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=maddy@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sq2z6hHzzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 12:52:59 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3T2iBF1119776
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 22:52:55 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s5c9umuqb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 22:52:55 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.vnet.ibm.com>;
 Mon, 29 Apr 2019 03:52:54 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Apr 2019 03:52:52 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3T2qpHl52297966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 02:52:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6A3CA4040;
 Mon, 29 Apr 2019 02:52:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5AABA4053;
 Mon, 29 Apr 2019 02:52:50 +0000 (GMT)
Received: from SrihariSrinidhi.in.ibm.com (unknown [9.77.213.89])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Apr 2019 02:52:50 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/2] powerpc/perf: init pmu from core-book3s
Date: Mon, 29 Apr 2019 08:22:47 +0530
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19042902-0028-0000-0000-000003684BD9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042902-0029-0000-0000-00002427AAFE
Message-Id: <1556506368-29329-1-git-send-email-maddy@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904290021
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currenty pmu driver file for each ppc64 generation processor
has a __init call in itself. Refactor the code by moving the
__init call to core-books.c. This also clean's up compat mode
pmu driver registration.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
---
Changelog v1:
- Added "internal.h" file and moved the extern definitions to that file

 arch/powerpc/perf/core-book3s.c | 28 ++++++++++++++++++++++++++++
 arch/powerpc/perf/internal.h    | 16 ++++++++++++++++
 arch/powerpc/perf/power5+-pmu.c |  4 +---
 arch/powerpc/perf/power5-pmu.c  |  4 +---
 arch/powerpc/perf/power6-pmu.c  |  4 +---
 arch/powerpc/perf/power7-pmu.c  |  4 +---
 arch/powerpc/perf/power8-pmu.c  |  3 +--
 arch/powerpc/perf/power9-pmu.c  |  3 +--
 arch/powerpc/perf/ppc970-pmu.c  |  4 +---
 9 files changed, 51 insertions(+), 19 deletions(-)
 create mode 100644 arch/powerpc/perf/internal.h

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index b0723002a396..a96f9420139c 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -22,6 +22,10 @@
 #include <asm/ptrace.h>
 #include <asm/code-patching.h>
 
+#ifdef CONFIG_PPC64
+#include "internal.h"
+#endif
+
 #define BHRB_MAX_ENTRIES	32
 #define BHRB_TARGET		0x0000000000000002
 #define BHRB_PREDICTION		0x0000000000000001
@@ -2294,3 +2298,27 @@ int register_power_pmu(struct power_pmu *pmu)
 			  power_pmu_prepare_cpu, NULL);
 	return 0;
 }
+
+#ifdef CONFIG_PPC64
+static int __init init_ppc64_pmu(void)
+{
+	/* run through all the pmu drivers one at a time */
+	if (!init_power5_pmu())
+		return 0;
+	else if (!init_power5p_pmu())
+		return 0;
+	else if (!init_power6_pmu())
+		return 0;
+	else if (!init_power7_pmu())
+		return 0;
+	else if (!init_power8_pmu())
+		return 0;
+	else if (!init_power9_pmu())
+		return 0;
+	else if (!init_ppc970_pmu())
+		return 0;
+	else
+		return -ENODEV;
+}
+early_initcall(init_ppc64_pmu);
+#endif
diff --git a/arch/powerpc/perf/internal.h b/arch/powerpc/perf/internal.h
new file mode 100644
index 000000000000..e54d524d4283
--- /dev/null
+++ b/arch/powerpc/perf/internal.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright 2019 Madhavan Srinivasan, IBM Corporation.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+extern int init_ppc970_pmu(void);
+extern int init_power5_pmu(void);
+extern int init_power5p_pmu(void);
+extern int init_power6_pmu(void);
+extern int init_power7_pmu(void);
+extern int init_power8_pmu(void);
+extern int init_power9_pmu(void);
diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
index 0526dac66007..9aa803504cb2 100644
--- a/arch/powerpc/perf/power5+-pmu.c
+++ b/arch/powerpc/perf/power5+-pmu.c
@@ -677,7 +677,7 @@ static struct power_pmu power5p_pmu = {
 	.cache_events		= &power5p_cache_events,
 };
 
-static int __init init_power5p_pmu(void)
+int init_power5p_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5+")
@@ -686,5 +686,3 @@ static int __init init_power5p_pmu(void)
 
 	return register_power_pmu(&power5p_pmu);
 }
-
-early_initcall(init_power5p_pmu);
diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
index 4dc99f9f7962..30cb13d081a9 100644
--- a/arch/powerpc/perf/power5-pmu.c
+++ b/arch/powerpc/perf/power5-pmu.c
@@ -618,7 +618,7 @@ static struct power_pmu power5_pmu = {
 	.flags			= PPMU_HAS_SSLOT,
 };
 
-static int __init init_power5_pmu(void)
+int init_power5_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5"))
@@ -626,5 +626,3 @@ static int __init init_power5_pmu(void)
 
 	return register_power_pmu(&power5_pmu);
 }
-
-early_initcall(init_power5_pmu);
diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
index 9c9d646b68a1..80ec48632cfe 100644
--- a/arch/powerpc/perf/power6-pmu.c
+++ b/arch/powerpc/perf/power6-pmu.c
@@ -540,7 +540,7 @@ static struct power_pmu power6_pmu = {
 	.cache_events		= &power6_cache_events,
 };
 
-static int __init init_power6_pmu(void)
+int init_power6_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power6"))
@@ -548,5 +548,3 @@ static int __init init_power6_pmu(void)
 
 	return register_power_pmu(&power6_pmu);
 }
-
-early_initcall(init_power6_pmu);
diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
index 6dbae9884ec4..bb6efd5d2530 100644
--- a/arch/powerpc/perf/power7-pmu.c
+++ b/arch/powerpc/perf/power7-pmu.c
@@ -445,7 +445,7 @@ static struct power_pmu power7_pmu = {
 	.cache_events		= &power7_cache_events,
 };
 
-static int __init init_power7_pmu(void)
+int init_power7_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power7"))
@@ -456,5 +456,3 @@ static int __init init_power7_pmu(void)
 
 	return register_power_pmu(&power7_pmu);
 }
-
-early_initcall(init_power7_pmu);
diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
index d12a2db26353..bcc3409a06de 100644
--- a/arch/powerpc/perf/power8-pmu.c
+++ b/arch/powerpc/perf/power8-pmu.c
@@ -379,7 +379,7 @@ static struct power_pmu power8_pmu = {
 	.bhrb_nr		= 32,
 };
 
-static int __init init_power8_pmu(void)
+int init_power8_pmu(void)
 {
 	int rc;
 
@@ -399,4 +399,3 @@ static int __init init_power8_pmu(void)
 
 	return 0;
 }
-early_initcall(init_power8_pmu);
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index 030544e35959..3a31ac6f4805 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -437,7 +437,7 @@ static struct power_pmu power9_pmu = {
 	.bhrb_nr		= 32,
 };
 
-static int __init init_power9_pmu(void)
+int init_power9_pmu(void)
 {
 	int rc = 0;
 	unsigned int pvr = mfspr(SPRN_PVR);
@@ -467,4 +467,3 @@ static int __init init_power9_pmu(void)
 
 	return 0;
 }
-early_initcall(init_power9_pmu);
diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
index 8b6a8a36fa38..1d3370914022 100644
--- a/arch/powerpc/perf/ppc970-pmu.c
+++ b/arch/powerpc/perf/ppc970-pmu.c
@@ -490,7 +490,7 @@ static struct power_pmu ppc970_pmu = {
 	.flags			= PPMU_NO_SIPR | PPMU_NO_CONT_SAMPLING,
 };
 
-static int __init init_ppc970_pmu(void)
+int init_ppc970_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/970")
@@ -499,5 +499,3 @@ static int __init init_ppc970_pmu(void)
 
 	return register_power_pmu(&ppc970_pmu);
 }
-
-early_initcall(init_ppc970_pmu);
-- 
2.7.4

