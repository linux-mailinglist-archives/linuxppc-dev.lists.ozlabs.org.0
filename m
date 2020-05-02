Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7AB1C251D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 14:13:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Dp194nTczDqY0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 22:13:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DmvQ5sgRzDr7J
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:23:14 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 042B1iRJ111570; Sat, 2 May 2020 07:23:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s28dexkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:23:08 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 042BN8Ft005291;
 Sat, 2 May 2020 07:23:08 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s28dexkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:23:08 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 042BK8Sa013034;
 Sat, 2 May 2020 11:23:07 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 30s0g6ayrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 11:23:07 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 042BN5al26214716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 2 May 2020 11:23:05 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE1497805C;
 Sat,  2 May 2020 11:23:05 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E42478060;
 Sat,  2 May 2020 11:23:03 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.206])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat,  2 May 2020 11:23:02 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 07/28] powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP to
 MMU_FTR_KUAP
Date: Sat,  2 May 2020 16:52:08 +0530
Message-Id: <20200502112229.545331-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502112229.545331-1-aneesh.kumar@linux.ibm.com>
References: <20200502112229.545331-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-02_06:2020-05-01,
 2020-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005020095
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next set of patches adds support for kuap with hash translation.
In preparation for that rename/move kuap related functions to
non radix names.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 18 +++++++++---------
 arch/powerpc/include/asm/mmu.h           |  6 +++---
 arch/powerpc/mm/book3s64/pkeys.c         |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 21008cc7af6f..f4fb651f5850 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -24,7 +24,7 @@
 	mtspr	SPRN_AMR, \gpr2
 	/* No isync required, see kuap_restore_amr() */
 998:
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
 #endif
 .endm
 
@@ -36,7 +36,7 @@
 	sldi	\gpr2, \gpr2, AMR_KUAP_SHIFT
 999:	tdne	\gpr1, \gpr2
 	EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
 #endif
 .endm
 
@@ -56,7 +56,7 @@
 	mtspr	SPRN_AMR, \gpr2
 	isync
 99:
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
 #endif
 .endm
 
@@ -69,7 +69,7 @@
 
 static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
 {
-	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
+	if (mmu_has_feature(MMU_FTR_KUAP)) {
 		if (unlikely(regs->kuap != amr)) {
 			isync();
 			mtspr(SPRN_AMR, regs->kuap);
@@ -84,7 +84,7 @@ static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
 
 static inline unsigned long kuap_get_and_check_amr(void)
 {
-	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
+	if (mmu_has_feature(MMU_FTR_KUAP)) {
 		unsigned long amr = mfspr(SPRN_AMR);
 		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
 			WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
@@ -95,7 +95,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
 
 static inline void kuap_check_amr(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
 }
 
@@ -106,7 +106,7 @@ static inline void kuap_check_amr(void)
 
 static inline unsigned long get_kuap(void)
 {
-	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (!early_mmu_has_feature(MMU_FTR_KUAP))
 		return 0;
 
 	return mfspr(SPRN_AMR);
@@ -114,7 +114,7 @@ static inline unsigned long get_kuap(void)
 
 static inline void set_kuap(unsigned long value)
 {
-	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (!early_mmu_has_feature(MMU_FTR_KUAP))
 		return;
 
 	/*
@@ -164,7 +164,7 @@ static inline void restore_user_access(unsigned long flags)
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
-	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
+	return WARN(mmu_has_feature(MMU_FTR_KUAP) &&
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index b26af5aac5a6..a7cc2b83836f 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -112,7 +112,7 @@
 /*
  * Supports KUAP (key 0 controlling userspace addresses) on radix
  */
-#define MMU_FTR_RADIX_KUAP		ASM_CONST(0x80000000)
+#define MMU_FTR_KUAP			ASM_CONST(0x80000000)
 
 /* MMU feature bit sets for various CPUs */
 #define MMU_FTRS_DEFAULT_HPTE_ARCH_V2	\
@@ -174,10 +174,10 @@ enum {
 #endif
 #ifdef CONFIG_PPC_RADIX_MMU
 		MMU_FTR_TYPE_RADIX |
+#endif /* CONFIG_PPC_RADIX_MMU */
 #ifdef CONFIG_PPC_KUAP
-		MMU_FTR_RADIX_KUAP |
+	MMU_FTR_KUAP |
 #endif /* CONFIG_PPC_KUAP */
-#endif /* CONFIG_PPC_RADIX_MMU */
 #ifdef CONFIG_PPC_MEM_KEYS
 	MMU_FTR_PKEY |
 #endif
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index b6ea4fec787b..7498c9a8ef74 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -227,7 +227,7 @@ void __init setup_kuap(bool disabled)
 
 	if (smp_processor_id() == boot_cpuid) {
 		pr_info("Activating Kernel Userspace Access Prevention\n");
-		cur_cpu_spec->mmu_features |= MMU_FTR_RADIX_KUAP;
+		cur_cpu_spec->mmu_features |= MMU_FTR_KUAP;
 	}
 
 	/* Make sure userspace can't change the AMR */
-- 
2.26.2

