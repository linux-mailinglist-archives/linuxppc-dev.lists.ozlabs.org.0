Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B05253C7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:16:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcTvY3kJqzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:16:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nZllnXpH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTln05fMzDqNw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:12 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R42QPt112782; Thu, 27 Aug 2020 00:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NCZv9iosMSmk6Xt90AGnm502OwPn6BGoGpX5q58as1w=;
 b=nZllnXpHUu2JOS8pFDcDn6lv2Trbbh/lWEbfjW8t2JCJCkFB2pNb/zwyzTwFZEQNBuwt
 Df1iqf9klO4CK+7PuY8V4q2dFLsaKiDwMB3az2JNHhRXHV3FMkF/Ut4/uA3ANZ7brFDU
 jzRYpdnohInZ71O3yRCbAvDsky7/n1F5hVF7bN02538rqhFSRPv/vXY+k1+8mGRZntV2
 VkiDYL8XOHILkV7aGwYZGK+WOJfXrAfm7aeF00VLMww2CAUNpavHWGEcxDZkdWr7yE8d
 2CDS7fGQldQM4rikPSzEYDLiv9wBgynq+064AGiwxmQf71hX3DukVwglTVP4RU3g5t+W ng== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33658m8d59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:08 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R48YxM014175;
 Thu, 27 Aug 2020 04:10:07 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 332utr70u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:07 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4A6Rj14483738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:06 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA72E28059;
 Thu, 27 Aug 2020 04:10:06 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40C6E28058;
 Thu, 27 Aug 2020 04:10:05 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:04 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 03/23] powerpc/book3s64/kuap/kuep: Make KUAP and KUEP a
 subfeature of PPC_MEM_KEYS
Date: Thu, 27 Aug 2020 09:39:11 +0530
Message-Id: <20200827040931.297759-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270028
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next set of patches adds support for kuap with hash translation.
Hence make KUAP a BOOK3S_64 feature. Also make it a subfeature of
PPC_MEM_KEYS. Hash translation is going to use pkeys to support
KUAP/KUEP. Adding this dependency reduces the code complexity and
enables us to move some of the initialization code to pkeys.c

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../powerpc/include/asm/book3s/64/kup-radix.h | 33 +++++++++++--------
 arch/powerpc/include/asm/book3s/64/mmu.h      |  2 +-
 arch/powerpc/include/asm/ptrace.h             |  2 +-
 arch/powerpc/kernel/asm-offsets.c             |  2 +-
 arch/powerpc/mm/book3s64/Makefile             |  2 +-
 arch/powerpc/mm/book3s64/pkeys.c              | 24 +++++++++-----
 arch/powerpc/platforms/Kconfig.cputype        |  4 +++
 7 files changed, 42 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 3ee1ec60be84..19a8e640a4e5 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -61,7 +61,7 @@
 
 #else /* !__ASSEMBLY__ */
 
-#ifdef CONFIG_PPC_KUAP
+#ifdef CONFIG_PPC_PKEY
 
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
@@ -96,6 +96,24 @@ static inline void kuap_check_amr(void)
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
 }
 
+#else /* CONFIG_PPC_PKEY */
+
+static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
+{
+}
+
+static inline void kuap_check_amr(void)
+{
+}
+
+static inline unsigned long kuap_get_and_check_amr(void)
+{
+	return 0;
+}
+#endif /* CONFIG_PPC_PKEY */
+
+
+#ifdef CONFIG_PPC_KUAP
 /*
  * We support individually allowing read or write, but we don't support nesting
  * because that would require an expensive read/modify write of the AMR.
@@ -165,19 +183,6 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
-#else /* CONFIG_PPC_KUAP */
-static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
-{
-}
-
-static inline void kuap_check_amr(void)
-{
-}
-
-static inline unsigned long kuap_get_and_check_amr(void)
-{
-	return 0;
-}
 #endif /* CONFIG_PPC_KUAP */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 55442d45c597..381146afaf80 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -214,7 +214,7 @@ extern int mmu_io_psize;
 void mmu_early_init_devtree(void);
 void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
-#ifdef CONFIG_PPC_MEM_KEYS
+#ifdef CONFIG_PPC_PKEY
 void pkey_early_init_devtree(void);
 #else
 static inline void pkey_early_init_devtree(void) {}
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 155a197c0aa1..5f62ce579a8b 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -53,7 +53,7 @@ struct pt_regs
 #ifdef CONFIG_PPC64
 			unsigned long ppr;
 #endif
-#ifdef CONFIG_PPC_KUAP
+#ifdef CONFIG_PPC_PKEY
 			unsigned long kuap;
 #endif
 		};
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8711c2164b45..63548992b5ab 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -353,7 +353,7 @@ int main(void)
 	STACK_PT_REGS_OFFSET(_PPR, ppr);
 #endif /* CONFIG_PPC64 */
 
-#ifdef CONFIG_PPC_KUAP
+#ifdef CONFIG_PPC_PKEY
 	STACK_PT_REGS_OFFSET(STACK_REGS_KUAP, kuap);
 #endif
 
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index fd393b8be14f..1b56d3af47d4 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -17,7 +17,7 @@ endif
 obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += hash_hugepage.o
 obj-$(CONFIG_PPC_SUBPAGE_PROT)	+= subpage_prot.o
 obj-$(CONFIG_SPAPR_TCE_IOMMU)	+= iommu_api.o
-obj-$(CONFIG_PPC_MEM_KEYS)	+= pkeys.o
+obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
 
 # Instrumenting the SLB fault path can lead to duplicate SLB entries
 KCOV_INSTRUMENT_slb.o := n
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index b1d091a97611..7dc71f85683d 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -89,12 +89,14 @@ static int scan_pkey_feature(void)
 		}
 	}
 
+#ifdef CONFIG_PPC_MEM_KEYS
 	/*
 	 * Adjust the upper limit, based on the number of bits supported by
 	 * arch-neutral code.
 	 */
 	pkeys_total = min_t(int, pkeys_total,
 			    ((ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT) + 1));
+#endif
 	return pkeys_total;
 }
 
@@ -102,6 +104,7 @@ void __init pkey_early_init_devtree(void)
 {
 	int pkeys_total, i;
 
+#ifdef CONFIG_PPC_MEM_KEYS
 	/*
 	 * We define PKEY_DISABLE_EXECUTE in addition to the arch-neutral
 	 * generic defines for PKEY_DISABLE_ACCESS and PKEY_DISABLE_WRITE.
@@ -117,7 +120,7 @@ void __init pkey_early_init_devtree(void)
 	BUILD_BUG_ON(__builtin_clzl(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT) +
 		     __builtin_popcountl(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT)
 				!= (sizeof(u64) * BITS_PER_BYTE));
-
+#endif
 	/*
 	 * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
 	 */
@@ -223,14 +226,6 @@ void __init pkey_early_init_devtree(void)
 	return;
 }
 
-void pkey_mm_init(struct mm_struct *mm)
-{
-	if (!mmu_has_feature(MMU_FTR_PKEY))
-		return;
-	mm_pkey_allocation_map(mm) = initial_allocation_mask;
-	mm->context.execute_only_pkey = execute_only_key;
-}
-
 static inline u64 read_amr(void)
 {
 	return mfspr(SPRN_AMR);
@@ -257,6 +252,15 @@ static inline void write_iamr(u64 value)
 	mtspr(SPRN_IAMR, value);
 }
 
+#ifdef CONFIG_PPC_MEM_KEYS
+void pkey_mm_init(struct mm_struct *mm)
+{
+	if (!mmu_has_feature(MMU_FTR_PKEY))
+		return;
+	mm_pkey_allocation_map(mm) = initial_allocation_mask;
+	mm->context.execute_only_pkey = execute_only_key;
+}
+
 static inline void init_amr(int pkey, u8 init_bits)
 {
 	u64 new_amr_bits = (((u64)init_bits & 0x3UL) << pkeyshift(pkey));
@@ -445,3 +449,5 @@ void arch_dup_pkeys(struct mm_struct *oldmm, struct mm_struct *mm)
 	mm_pkey_allocation_map(mm) = mm_pkey_allocation_map(oldmm);
 	mm->context.execute_only_pkey = oldmm->context.execute_only_pkey;
 }
+
+#endif /* CONFIG_PPC_MEM_KEYS */
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 87737ec86d39..59d773c244ec 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -402,6 +402,10 @@ config PPC_KUAP_DEBUG
 	  Add extra debugging for Kernel Userspace Access Protection (KUAP)
 	  If you're unsure, say N.
 
+config PPC_PKEY
+	def_bool y
+	depends on PPC_MEM_KEYS || PPC_KUAP || PPC_KUEP
+
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	def_bool y
 	depends on PPC_BOOK3S_64 && HUGETLB_PAGE && MIGRATION
-- 
2.26.2

