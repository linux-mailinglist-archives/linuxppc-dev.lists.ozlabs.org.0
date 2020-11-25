Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70B2C3877
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:24:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgq7h0Jh9zDqbv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:24:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TC7eeqTz; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgpzM55BfzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:17:03 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP52n9I075645; Wed, 25 Nov 2020 00:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JNOkGLwP4dvye6CV2O4BIM0HSdy7TlfjSKkhd0xe1qs=;
 b=TC7eeqTzHmLOJm3/pt/hInqhvmXzQ0NJsDRwhuNxgrwcXcPLYTcM5+x8LF7ZwQQ/1HZT
 JnNND+0RGhwWcgRH2oyK6B6AC41bOwolcBAwv8MT8XjMo5rP5ohWW5SFn1Bpe+Dagflf
 EYMjVn4RW8EBcSynVrbLWwarUqMjAWB8Qf4BLjlZ5y7ihdtQtMs/+tgznnXrlEgO3FEq
 arAuM7ZYbcZYTGvu/Zw6HdpTAzGFbQEmAfM3EUdAW9T07AB8m4qIO/1T4EZrMYgslouW
 crNfEJVPqMfTkNqYXeC1UlDk0kWjTUsV2JRliT3aPdHAhKH4B78Anr39cSy1x8a624lE 9A== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350vbvxw8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 00:16:58 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP5ClbW018130;
 Wed, 25 Nov 2020 05:16:58 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 34xth94vfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:16:58 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP5Gv7O26935758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 05:16:57 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD036124054;
 Wed, 25 Nov 2020 05:16:57 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7F9B124053;
 Wed, 25 Nov 2020 05:16:55 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.195.3])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 05:16:55 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 03/22] powerpc/book3s64/kuap/kuep: Make KUAP and KUEP a
 subfeature of PPC_MEM_KEYS
Date: Wed, 25 Nov 2020 10:46:15 +0530
Message-Id: <20201125051634.509286-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_07:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240121
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
 .../powerpc/include/asm/book3s/64/kup-radix.h |  4 ++--
 arch/powerpc/include/asm/book3s/64/mmu.h      |  2 +-
 arch/powerpc/include/asm/ptrace.h             |  7 +++++-
 arch/powerpc/kernel/asm-offsets.c             |  3 +++
 arch/powerpc/mm/book3s64/Makefile             |  2 +-
 arch/powerpc/mm/book3s64/pkeys.c              | 24 ++++++++++++-------
 arch/powerpc/platforms/Kconfig.cputype        |  5 ++++
 7 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 28716e2f13e3..68eaa2fac3ab 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -16,7 +16,7 @@
 #ifdef CONFIG_PPC_KUAP
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
 	mfspr	\gpr1, SPRN_AMR
-	ld	\gpr2, STACK_REGS_KUAP(r1)
+	ld	\gpr2, STACK_REGS_AMR(r1)
 	cmpd	\gpr1, \gpr2
 	beq	998f
 	isync
@@ -48,7 +48,7 @@
 	bne	\msr_pr_cr, 99f
 	.endif
 	mfspr	\gpr1, SPRN_AMR
-	std	\gpr1, STACK_REGS_KUAP(r1)
+	std	\gpr1, STACK_REGS_AMR(r1)
 	li	\gpr2, (AMR_KUAP_BLOCKED >> AMR_KUAP_SHIFT)
 	sldi	\gpr2, \gpr2, AMR_KUAP_SHIFT
 	cmpd	\use_cr, \gpr1, \gpr2
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index e0b52940e43c..a2a015066bae 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -199,7 +199,7 @@ extern int mmu_io_psize;
 void mmu_early_init_devtree(void);
 void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
-#ifdef CONFIG_PPC_MEM_KEYS
+#ifdef CONFIG_PPC_PKEY
 void pkey_early_init_devtree(void);
 #else
 static inline void pkey_early_init_devtree(void) {}
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index e2c778c176a3..e7f1caa007a4 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -53,9 +53,14 @@ struct pt_regs
 #ifdef CONFIG_PPC64
 			unsigned long ppr;
 #endif
+			union {
 #ifdef CONFIG_PPC_KUAP
-			unsigned long kuap;
+				unsigned long kuap;
 #endif
+#ifdef CONFIG_PPC_PKEY
+				unsigned long amr;
+#endif
+			};
 		};
 		unsigned long __pad[2];	/* Maintain 16 byte interrupt stack alignment */
 	};
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index c2722ff36e98..418a0b314a33 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -354,6 +354,9 @@ int main(void)
 	STACK_PT_REGS_OFFSET(_PPR, ppr);
 #endif /* CONFIG_PPC64 */
 
+#ifdef CONFIG_PPC_PKEY
+	STACK_PT_REGS_OFFSET(STACK_REGS_AMR, amr);
+#endif
 #ifdef CONFIG_PPC_KUAP
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
index c194c4ae8bc7..f255e8f32155 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -395,6 +395,11 @@ config PPC_KUAP_DEBUG
 	  Add extra debugging for Kernel Userspace Access Protection (KUAP)
 	  If you're unsure, say N.
 
+config PPC_PKEY
+	def_bool y
+	depends on PPC_BOOK3S_64
+	depends on PPC_MEM_KEYS || PPC_KUAP || PPC_KUEP
+
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	def_bool y
 	depends on PPC_BOOK3S_64 && HUGETLB_PAGE && MIGRATION
-- 
2.28.0

