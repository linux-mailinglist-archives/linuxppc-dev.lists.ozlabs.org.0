Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA98518AAD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 19:03:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt5r600qtz3bpR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 03:03:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zhd84acr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zhd84acr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt5qL66v1z308G
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 03:02:22 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243GwiZg025367;
 Tue, 3 May 2022 17:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=msdioapRihqlSoKhKh+q78mYSRPmLcTnHZMyHVDr77k=;
 b=Zhd84acrraMNlc3hh+qsjbFVMG2NHhU6TZHGknzUy/tdXkFfFpr3d0XcTJdGuWwse6IP
 966Kbz7c4qmr9cd4l2ESLL06ahp0+x2FL3HwGLbNtEQxc4CLSbEyqcAKamDjX7IX65lw
 izSxf4TZ/20WmjRVXU2Q/Y3TKd6+2lwxbkUiUJcwQBqAh6SuH9JLtixVNG1woPE/kAxy
 7MGiNVzGVAemjJYeY3V1frvek+u6IhMctiEMLyhTwP7ZP5bmCXpSn6+jisfs8lsMThTv
 hy4+I488ZlRAKFjy1lVVPsB8buA5J9VbxncVlAcYHXVZa5mNZE4rhdYMGLNgZERWvRYj fw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fu8cyr22k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 17:02:19 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 243Gpx4Y020110;
 Tue, 3 May 2022 17:02:19 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3frvr9tfgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 17:02:19 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 243H2IZf33030588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 May 2022 17:02:18 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 523842805C;
 Tue,  3 May 2022 17:02:18 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AD4D28058;
 Tue,  3 May 2022 17:02:18 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.181])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  3 May 2022 17:02:18 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 6DB3BAE6359; Tue,  3 May 2022 12:02:17 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Enable the DAWR on POWER9 DD2.3 and above
Date: Tue,  3 May 2022 12:01:52 -0500
Message-Id: <20220503170152.23412-1-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QNDYMy6zZ9XoqPVlTGt9R3L2KamDe7RH
X-Proofpoint-ORIG-GUID: QNDYMy6zZ9XoqPVlTGt9R3L2KamDe7RH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_07,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030111
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
Cc: Michael Neuling <mikey@neuling.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hardware bug in POWER9 preventing use of the DAWR was fixed in
DD2.3. Set the CPU_FTR_DAWR feature bit on these newer systems to start
using it again, and update the documentation accordingly.

The CPU features for DD2.3 are currently determined by "DD2.2 or later"
logic. In adding DD2.3 as a discrete case for the first time here, I'm
carrying the quirks of DD2.2 forward to keep all behavior outside of
this DAWR change the same. This leaves the assessment and potential
removal of those quirks on DD2.3 for later.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 Documentation/powerpc/dawr-power9.rst | 26 +++++++++++++++++---------
 arch/powerpc/include/asm/cputable.h   | 10 ++++++++--
 arch/powerpc/kernel/cputable.c        | 22 ++++++++++++++++++++--
 arch/powerpc/kernel/dt_cpu_ftrs.c     |  8 +++++++-
 4 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/Documentation/powerpc/dawr-power9.rst b/Documentation/powerpc/dawr-power9.rst
index e55ac6a24b97..310f2e0cea81 100644
--- a/Documentation/powerpc/dawr-power9.rst
+++ b/Documentation/powerpc/dawr-power9.rst
@@ -2,15 +2,23 @@
 DAWR issues on POWER9
 =====================
 
-On POWER9 the Data Address Watchpoint Register (DAWR) can cause a checkstop
-if it points to cache inhibited (CI) memory. Currently Linux has no way to
-distinguish CI memory when configuring the DAWR, so (for now) the DAWR is
-disabled by this commit::
-
-    commit 9654153158d3e0684a1bdb76dbababdb7111d5a0
-    Author: Michael Neuling <mikey@neuling.org>
-    Date:   Tue Mar 27 15:37:24 2018 +1100
-    powerpc: Disable DAWR in the base POWER9 CPU features
+On older POWER9 processors, the Data Address Watchpoint Register (DAWR) can
+cause a checkstop if it points to cache inhibited (CI) memory. Currently Linux
+has no way to distinguish CI memory when configuring the DAWR, so on affected
+systems, the DAWR is disabled.
+
+Affected processor revisions
+============================
+
+This issue is only present on processors prior to v2.3. The revision can be
+found in /proc/cpuinfo::
+
+    processor       : 0
+    cpu             : POWER9, altivec supported
+    clock           : 3800.000000MHz
+    revision        : 2.3 (pvr 004e 1203)
+
+On a system with the issue, the DAWR is disabled as detailed below.
 
 Technical Details:
 ==================
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index e85c849214a2..978a4450d190 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -440,6 +440,10 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_POWER9_DD2_2 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
 			       CPU_FTR_P9_TM_HV_ASSIST | \
 			       CPU_FTR_P9_TM_XER_SO_BUG)
+#define CPU_FTRS_POWER9_DD2_3 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
+			       CPU_FTR_P9_TM_HV_ASSIST | \
+			       CPU_FTR_P9_TM_XER_SO_BUG | \
+			       CPU_FTR_DAWR)
 #define CPU_FTRS_POWER10 (CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | CPU_FTR_ARCH_206 |\
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
@@ -469,14 +473,16 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_POSSIBLE	\
 	    (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
 	     CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
-	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
+	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | \
+	     CPU_FTRS_POWER9_DD2_3 | CPU_FTRS_POWER10)
 #else
 #define CPU_FTRS_POSSIBLE	\
 	    (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
 	     CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
 	     CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
 	     CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
-	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
+	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | \
+	     CPU_FTRS_POWER9_DD2_3 | CPU_FTRS_POWER10)
 #endif /* CONFIG_CPU_LITTLE_ENDIAN */
 #endif
 #else
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index ae0fdef0ac11..0134249a4ca8 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -487,11 +487,29 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check_early	= __machine_check_early_realmode_p9,
 		.platform		= "power9",
 	},
-	{	/* Power9 DD2.2 or later */
+	{	/* Power9 DD2.2 */
+		.pvr_mask		= 0xffffefff,
+		.pvr_value		= 0x004e0202,
+		.cpu_name		= "POWER9 (raw)",
+		.cpu_features		= CPU_FTRS_POWER9_DD2_2,
+		.cpu_user_features	= COMMON_USER_POWER9,
+		.cpu_user_features2	= COMMON_USER2_POWER9,
+		.mmu_features		= MMU_FTRS_POWER9,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.oprofile_cpu_type	= "ppc64/power9",
+		.cpu_setup		= __setup_cpu_power9,
+		.cpu_restore		= __restore_cpu_power9,
+		.machine_check_early	= __machine_check_early_realmode_p9,
+		.platform		= "power9",
+	},
+	{	/* Power9 DD2.3 or later */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x004e0000,
 		.cpu_name		= "POWER9 (raw)",
-		.cpu_features		= CPU_FTRS_POWER9_DD2_2,
+		.cpu_features		= CPU_FTRS_POWER9_DD2_3,
 		.cpu_user_features	= COMMON_USER_POWER9,
 		.cpu_user_features2	= COMMON_USER2_POWER9,
 		.mmu_features		= MMU_FTRS_POWER9,
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 7d1b2c4a4891..972497d53953 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -774,20 +774,26 @@ static __init void cpufeatures_cpu_quirks(void)
 	if ((version & 0xffffefff) == 0x004e0200) {
 		/* DD2.0 has no feature flag */
 		cur_cpu_spec->cpu_features |= CPU_FTR_P9_RADIX_PREFETCH_BUG;
+		cur_cpu_spec->cpu_features &= ~(CPU_FTR_DAWR);
 	} else if ((version & 0xffffefff) == 0x004e0201) {
 		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
 		cur_cpu_spec->cpu_features |= CPU_FTR_P9_RADIX_PREFETCH_BUG;
+		cur_cpu_spec->cpu_features &= ~(CPU_FTR_DAWR);
 	} else if ((version & 0xffffefff) == 0x004e0202) {
 		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_HV_ASSIST;
 		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_XER_SO_BUG;
 		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
+		cur_cpu_spec->cpu_features &= ~(CPU_FTR_DAWR);
+	} else if ((version & 0xffffefff) == 0x004e0203) {
+		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_HV_ASSIST;
+		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_XER_SO_BUG;
+		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
 	} else if ((version & 0xffff0000) == 0x004e0000) {
 		/* DD2.1 and up have DD2_1 */
 		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
 	}
 
 	if ((version & 0xffff0000) == 0x004e0000) {
-		cur_cpu_spec->cpu_features &= ~(CPU_FTR_DAWR);
 		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TIDR;
 	}
 
-- 
2.27.0

