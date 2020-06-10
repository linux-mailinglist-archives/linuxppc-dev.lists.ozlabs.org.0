Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C801F523B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 12:28:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hjrf5JVVzDqfX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 20:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hj3X3rFrzDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 19:53:12 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A9XXoq088117; Wed, 10 Jun 2020 05:53:07 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31j4up4t48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 05:53:07 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A9j2h6011770;
 Wed, 10 Jun 2020 09:53:06 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 31hygycgsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 09:53:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A9r5RF49742136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 09:53:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B4C0112064;
 Wed, 10 Jun 2020 09:53:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B19BD112062;
 Wed, 10 Jun 2020 09:53:03 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.180.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 09:53:03 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 19/41] powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP to
 MMU_FTR_KUAP
Date: Wed, 10 Jun 2020 15:21:42 +0530
Message-Id: <20200610095204.608183-20-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
References: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_04:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 cotscore=-2147483648 mlxlogscore=999 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006100070
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
 bauerman@linux.ibm.com
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
index bbac8b47df13..476bcd7b0e8b 100644
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
-	if (mmu_has_feature(MMU_FTR_RADIX_KUAP) && unlikely(regs->kuap != amr)) {
+	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
 		isync();
 		mtspr(SPRN_AMR, regs->kuap);
 		/*
@@ -82,7 +82,7 @@ static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
 
 static inline unsigned long kuap_get_and_check_amr(void)
 {
-	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
+	if (mmu_has_feature(MMU_FTR_KUAP)) {
 		unsigned long amr = mfspr(SPRN_AMR);
 		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
 			WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
@@ -93,7 +93,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
 
 static inline void kuap_check_amr(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
 }
 
@@ -104,7 +104,7 @@ static inline void kuap_check_amr(void)
 
 static inline unsigned long get_kuap(void)
 {
-	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (!early_mmu_has_feature(MMU_FTR_KUAP))
 		return 0;
 
 	return mfspr(SPRN_AMR);
@@ -112,7 +112,7 @@ static inline unsigned long get_kuap(void)
 
 static inline void set_kuap(unsigned long value)
 {
-	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (!early_mmu_has_feature(MMU_FTR_KUAP))
 		return;
 
 	/*
@@ -162,7 +162,7 @@ static inline void restore_user_access(unsigned long flags)
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
-	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
+	return WARN(mmu_has_feature(MMU_FTR_KUAP) &&
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 94435f85e3bc..14d7e6803453 100644
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
@@ -175,10 +175,10 @@ enum {
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

