Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D865B250A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 19:42:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNmfp3tZwz3f2d
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 03:42:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNmZh2mntz3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 03:39:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MNmYs6Mqyz9smF;
	Thu,  8 Sep 2022 19:38:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnvOoN8bgZs2; Thu,  8 Sep 2022 19:38:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MNmYg2y38z9smJ;
	Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6156A8B792;
	Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id I7ploFj6Hcea; Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.247])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CF5418B7A7;
	Thu,  8 Sep 2022 19:38:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 288HcDuG3449201
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Sep 2022 19:38:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 288HcDmW3449200;
	Thu, 8 Sep 2022 19:38:13 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 15/19] powerpc: Remove CONFIG_PPC_BOOK3E_MMU
Date: Thu,  8 Sep 2022 19:37:48 +0200
Message-Id: <ef6b5fd87e905d5cf22b95d5de790d7113f9e54f.1662658653.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
References: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662658668; l=7287; s=20211009; h=from:subject:message-id; bh=fglMNwb9ZiTrG/In6Xy+k4f2DXnfnFluk74gsP3+QVY=; b=3j9Ba8GsPOA9/mNlDyhIl3HfmJ7VbKWPxRQXkzd//72UUq3ZNJBRc8CUZvNGoajA30VQ8W0sZAOt GEupBwFtDgrMW1Gqs5tIc6CT8RY9Z4u04IBx6Ue1dGt4x/bhVA/w
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_PPC_BOOK3E_MMU is redundant with CONFIG_PPC_E500.

Remove it.

Also rename mmu-book3e.h to mmu-e500.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../include/asm/nohash/{mmu-book3e.h => mmu-e500.h}       | 0
 arch/powerpc/include/asm/nohash/mmu.h                     | 4 ++--
 arch/powerpc/kernel/cpu_setup_e500.S                      | 2 +-
 arch/powerpc/kernel/entry_32.S                            | 2 +-
 arch/powerpc/kernel/head_booke.h                          | 4 ++--
 arch/powerpc/kernel/kvm.c                                 | 8 ++++----
 arch/powerpc/kvm/e500.h                                   | 2 +-
 arch/powerpc/mm/nohash/tlb.c                              | 4 ++--
 arch/powerpc/mm/ptdump/Makefile                           | 2 +-
 arch/powerpc/platforms/Kconfig.cputype                    | 4 ----
 10 files changed, 14 insertions(+), 18 deletions(-)
 rename arch/powerpc/include/asm/nohash/{mmu-book3e.h => mmu-e500.h} (100%)

diff --git a/arch/powerpc/include/asm/nohash/mmu-book3e.h b/arch/powerpc/include/asm/nohash/mmu-e500.h
similarity index 100%
rename from arch/powerpc/include/asm/nohash/mmu-book3e.h
rename to arch/powerpc/include/asm/nohash/mmu-e500.h
diff --git a/arch/powerpc/include/asm/nohash/mmu.h b/arch/powerpc/include/asm/nohash/mmu.h
index edc793e5f08f..e264be219fdb 100644
--- a/arch/powerpc/include/asm/nohash/mmu.h
+++ b/arch/powerpc/include/asm/nohash/mmu.h
@@ -8,9 +8,9 @@
 #elif defined(CONFIG_44x)
 /* 44x-style software loaded TLB */
 #include <asm/nohash/32/mmu-44x.h>
-#elif defined(CONFIG_PPC_BOOK3E_MMU)
+#elif defined(CONFIG_PPC_E500)
 /* Freescale Book-E software loaded TLB or Book-3e (ISA 2.06+) MMU */
-#include <asm/nohash/mmu-book3e.h>
+#include <asm/nohash/mmu-e500.h>
 #elif defined (CONFIG_PPC_8xx)
 /* Motorola/Freescale 8xx software loaded TLB */
 #include <asm/nohash/32/mmu-8xx.h>
diff --git a/arch/powerpc/kernel/cpu_setup_e500.S b/arch/powerpc/kernel/cpu_setup_e500.S
index 058336079069..2ab25161b0ad 100644
--- a/arch/powerpc/kernel/cpu_setup_e500.S
+++ b/arch/powerpc/kernel/cpu_setup_e500.S
@@ -12,7 +12,7 @@
 #include <asm/processor.h>
 #include <asm/cputable.h>
 #include <asm/ppc_asm.h>
-#include <asm/nohash/mmu-book3e.h>
+#include <asm/nohash/mmu-e500.h>
 #include <asm/asm-offsets.h>
 #include <asm/mpc85xx.h>
 
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index e6d5fe3a8585..2b5b0677d36c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -488,7 +488,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	mtspr	SPRN_##exc_lvl_srr0,r9;					\
 	mtspr	SPRN_##exc_lvl_srr1,r10;
 
-#if defined(CONFIG_PPC_BOOK3E_MMU)
+#if defined(CONFIG_PPC_E500)
 #ifdef CONFIG_PHYS_64BIT
 #define	RESTORE_MAS7							\
 	lwz	r11,MAS7(r1);						\
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 1047dc053b47..1cb9d0f7cbf2 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -242,7 +242,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 
 
 .macro SAVE_MMU_REGS
-#ifdef CONFIG_PPC_BOOK3E_MMU
+#ifdef CONFIG_PPC_E500
 	mfspr	r0,SPRN_MAS0
 	stw	r0,MAS0(r1)
 	mfspr	r0,SPRN_MAS1
@@ -257,7 +257,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	mfspr	r0,SPRN_MAS7
 	stw	r0,MAS7(r1)
 #endif /* CONFIG_PHYS_64BIT */
-#endif /* CONFIG_PPC_BOOK3E_MMU */
+#endif /* CONFIG_PPC_E500 */
 #ifdef CONFIG_44x
 	mfspr	r0,SPRN_MMUCR
 	stw	r0,MMUCR(r1)
diff --git a/arch/powerpc/kernel/kvm.c b/arch/powerpc/kernel/kvm.c
index 6568823cf306..5b3c093611ba 100644
--- a/arch/powerpc/kernel/kvm.c
+++ b/arch/powerpc/kernel/kvm.c
@@ -455,7 +455,7 @@ static void __init kvm_check_ins(u32 *inst, u32 features)
 		kvm_patch_ins_lwz(inst, magic_var(dsisr), inst_rt);
 		break;
 
-#ifdef CONFIG_PPC_BOOK3E_MMU
+#ifdef CONFIG_PPC_E500
 	case KVM_INST_MFSPR(SPRN_MAS0):
 		if (features & KVM_MAGIC_FEAT_MAS0_TO_SPRG7)
 			kvm_patch_ins_lwz(inst, magic_var(mas0), inst_rt);
@@ -484,7 +484,7 @@ static void __init kvm_check_ins(u32 *inst, u32 features)
 		if (features & KVM_MAGIC_FEAT_MAS0_TO_SPRG7)
 			kvm_patch_ins_lwz(inst, magic_var(mas7_3), inst_rt);
 		break;
-#endif /* CONFIG_PPC_BOOK3E_MMU */
+#endif /* CONFIG_PPC_E500 */
 
 	case KVM_INST_MFSPR(SPRN_SPRG4):
 #ifdef CONFIG_BOOKE
@@ -557,7 +557,7 @@ static void __init kvm_check_ins(u32 *inst, u32 features)
 	case KVM_INST_MTSPR(SPRN_DSISR):
 		kvm_patch_ins_stw(inst, magic_var(dsisr), inst_rt);
 		break;
-#ifdef CONFIG_PPC_BOOK3E_MMU
+#ifdef CONFIG_PPC_E500
 	case KVM_INST_MTSPR(SPRN_MAS0):
 		if (features & KVM_MAGIC_FEAT_MAS0_TO_SPRG7)
 			kvm_patch_ins_stw(inst, magic_var(mas0), inst_rt);
@@ -586,7 +586,7 @@ static void __init kvm_check_ins(u32 *inst, u32 features)
 		if (features & KVM_MAGIC_FEAT_MAS0_TO_SPRG7)
 			kvm_patch_ins_stw(inst, magic_var(mas7_3), inst_rt);
 		break;
-#endif /* CONFIG_PPC_BOOK3E_MMU */
+#endif /* CONFIG_PPC_E500 */
 
 	case KVM_INST_MTSPR(SPRN_SPRG4):
 		if (features & KVM_MAGIC_FEAT_MAS0_TO_SPRG7)
diff --git a/arch/powerpc/kvm/e500.h b/arch/powerpc/kvm/e500.h
index c3ef751465fb..6d0d329cbb35 100644
--- a/arch/powerpc/kvm/e500.h
+++ b/arch/powerpc/kvm/e500.h
@@ -17,7 +17,7 @@
 #define KVM_E500_H
 
 #include <linux/kvm_host.h>
-#include <asm/nohash/mmu-book3e.h>
+#include <asm/nohash/mmu-e500.h>
 #include <asm/tlb.h>
 #include <asm/cputhreads.h>
 
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index fcb1e5ae5c55..fac59fbd475a 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -49,7 +49,7 @@
  * other sizes not listed here.   The .ind field is only used on MMUs that have
  * indirect page table entries.
  */
-#if defined(CONFIG_PPC_BOOK3E_MMU) || defined(CONFIG_PPC_8xx)
+#if defined(CONFIG_PPC_E500) || defined(CONFIG_PPC_8xx)
 #ifdef CONFIG_PPC_E500
 struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 	[MMU_PAGE_4K] = {
@@ -142,7 +142,7 @@ static inline int mmu_get_tsize(int psize)
 	/* This isn't used on !Book3E for now */
 	return 0;
 }
-#endif /* CONFIG_PPC_BOOK3E_MMU */
+#endif /* CONFIG_PPC_E500 */
 
 /* The variables below are currently only used on 64-bit Book3E
  * though this will probably be made common with other nohash
diff --git a/arch/powerpc/mm/ptdump/Makefile b/arch/powerpc/mm/ptdump/Makefile
index b533caaf0910..dc896d2874f3 100644
--- a/arch/powerpc/mm/ptdump/Makefile
+++ b/arch/powerpc/mm/ptdump/Makefile
@@ -4,7 +4,7 @@ obj-y	+= ptdump.o
 
 obj-$(CONFIG_4xx)		+= shared.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
-obj-$(CONFIG_PPC_BOOK3E_MMU)	+= shared.o
+obj-$(CONFIG_PPC_E500)		+= shared.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= shared.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= book3s64.o
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 32c60ad8f45d..1746d19d058f 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -466,10 +466,6 @@ config PPC_MMU_NOHASH
 	def_bool y
 	depends on !PPC_BOOK3S
 
-config PPC_BOOK3E_MMU
-	def_bool y
-	depends on PPC_85xx || PPC_BOOK3E_64
-
 config PPC_HAVE_PMU_SUPPORT
 	bool
 
-- 
2.37.1

