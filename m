Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AE774F443
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0ly347X2z3dGY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0ltw3r0hz3cB0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:59:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0ltZ3LBcz9sFH;
	Tue, 11 Jul 2023 17:59:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssfsION40TH2; Tue, 11 Jul 2023 17:59:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0ltZ2jBnz9sFB;
	Tue, 11 Jul 2023 17:59:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 592E08B77D;
	Tue, 11 Jul 2023 17:59:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZnFdXNuc5w0X; Tue, 11 Jul 2023 17:59:34 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CDB178B77B;
	Tue, 11 Jul 2023 17:59:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BFxV413695863
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 17:59:31 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BFxVVg3695862;
	Tue, 11 Jul 2023 17:59:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 6/9] powerpc/kuap: Use MMU_FTR_KUAP on all and refactor disabling kuap
Date: Tue, 11 Jul 2023 17:59:18 +0200
Message-ID: <6b3d7c977bad73378ea368bc6818e9c94ea95ab0.1689091022.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091022.git.christophe.leroy@csgroup.eu>
References: <cover.1689091022.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091151; l=6672; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Pqt4ataQNmqi54ocs8mx2vDSBBYVydLvUVBK9BYfKnU=; b=C94k+NIvcvun1Tayv0ocrHMR3PuRgqw/bTnuYX0GnU+S7czmHSq9Gml2SWGkoFrNga1KKa2RV EJunxWd0uJyCl00zVAsSb49HPxzI8NST/kP3m8BIoTG2+jeciv3HDvZ
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

All but book3s/64 use a static branch key for disabling kuap.
book3s/64 uses an mmu feature.

Refactor all targets to use MMU_FTR_KUAP like book3s/64.

For PPC32 that implies updating mmu features fixups once KUAP
has been initialised.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     |  9 ---------
 arch/powerpc/include/asm/book3s/64/kup.h     |  5 -----
 arch/powerpc/include/asm/kup.h               | 11 +++++++++++
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  9 ---------
 arch/powerpc/include/asm/nohash/kup-booke.h  |  8 --------
 arch/powerpc/kernel/cputable.c               |  4 ++++
 arch/powerpc/mm/book3s32/kuap.c              |  5 +----
 arch/powerpc/mm/init_32.c                    |  2 ++
 arch/powerpc/mm/nohash/kup.c                 |  6 +-----
 9 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 0da0dea76c47..4ca6122ef0e1 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -9,10 +9,6 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/jump_label.h>
-
-extern struct static_key_false disable_kuap_key;
-
 #ifdef CONFIG_PPC_KUAP
 
 #include <linux/sched.h>
@@ -20,11 +16,6 @@ extern struct static_key_false disable_kuap_key;
 #define KUAP_NONE	(~0UL)
 #define KUAP_ALL	(~1UL)
 
-static __always_inline bool kuap_is_disabled(void)
-{
-	return static_branch_unlikely(&disable_kuap_key);
-}
-
 static inline void kuap_lock_one(unsigned long addr)
 {
 	mtsr(mfsr(addr) | SR_KS, addr);
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 72fc4263ed26..a014f4d9a2aa 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -230,11 +230,6 @@ static inline u64 current_thread_iamr(void)
 
 #ifdef CONFIG_PPC_KUAP
 
-static __always_inline bool kuap_is_disabled(void)
-{
-	return !mmu_has_feature(MMU_FTR_KUAP);
-}
-
 static inline void kuap_user_restore(struct pt_regs *regs)
 {
 	bool restore_amr = false, restore_iamr = false;
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 24cde16c4fbe..bab161b609c1 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -6,6 +6,12 @@
 #define KUAP_WRITE	2
 #define KUAP_READ_WRITE	(KUAP_READ | KUAP_WRITE)
 
+#ifndef __ASSEMBLY__
+#include <linux/types.h>
+
+static __always_inline bool kuap_is_disabled(void);
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_64
 #include <asm/book3s/64/kup.h>
 #endif
@@ -41,6 +47,11 @@ void setup_kuep(bool disabled);
 
 #ifdef CONFIG_PPC_KUAP
 void setup_kuap(bool disabled);
+
+static __always_inline bool kuap_is_disabled(void)
+{
+	return !mmu_has_feature(MMU_FTR_KUAP);
+}
 #else
 static inline void setup_kuap(bool disabled) { }
 
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index a372cd822887..d0601859c45a 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -9,17 +9,8 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/jump_label.h>
-
 #include <asm/reg.h>
 
-extern struct static_key_false disable_kuap_key;
-
-static __always_inline bool kuap_is_disabled(void)
-{
-	return static_branch_unlikely(&disable_kuap_key);
-}
-
 static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	regs->kuap = mfspr(SPRN_MD_AP);
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 71182cbe20c3..8e4734c8fef1 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -13,18 +13,10 @@
 
 #else
 
-#include <linux/jump_label.h>
 #include <linux/sched.h>
 
 #include <asm/reg.h>
 
-extern struct static_key_false disable_kuap_key;
-
-static __always_inline bool kuap_is_disabled(void)
-{
-	return static_branch_unlikely(&disable_kuap_key);
-}
-
 static inline void __kuap_lock(void)
 {
 	mtspr(SPRN_PID, 0);
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 8a32bffefa5b..e97a0fd0ae90 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -75,6 +75,10 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
 		t->cpu_features |= old.cpu_features & CPU_FTR_PMAO_BUG;
 	}
 
+	/* Set kuap ON at startup, will be disabled later if cmdline has 'nosmap' */
+	if (IS_ENABLED(CONFIG_PPC_KUAP) && IS_ENABLED(CONFIG_PPC32))
+		t->mmu_features |= MMU_FTR_KUAP;
+
 	*PTRRELOC(&cur_cpu_spec) = &the_cpu_spec;
 
 	/*
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index 28676cabb005..24c1c686e6b9 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -3,9 +3,6 @@
 #include <asm/kup.h>
 #include <asm/smp.h>
 
-struct static_key_false disable_kuap_key;
-EXPORT_SYMBOL(disable_kuap_key);
-
 void kuap_lock_all_ool(void)
 {
 	kuap_lock_all();
@@ -30,7 +27,7 @@ void setup_kuap(bool disabled)
 		return;
 
 	if (disabled)
-		static_branch_enable(&disable_kuap_key);
+		cur_cpu_spec->mmu_features &= ~MMU_FTR_KUAP;
 	else
 		pr_info("Activating Kernel Userspace Access Protection\n");
 }
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index d4cc3749e621..d8adc452f431 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -126,6 +126,8 @@ void __init MMU_init(void)
 
 	setup_kup();
 
+	update_mmu_feature_fixups(MMU_FTR_KUAP);
+
 	/* Shortly after that, the entire linear mapping will be available */
 	memblock_set_current_limit(lowmem_end_addr);
 }
diff --git a/arch/powerpc/mm/nohash/kup.c b/arch/powerpc/mm/nohash/kup.c
index 552becf90e97..94ff82b9ae60 100644
--- a/arch/powerpc/mm/nohash/kup.c
+++ b/arch/powerpc/mm/nohash/kup.c
@@ -5,7 +5,6 @@
 
 #include <linux/export.h>
 #include <linux/init.h>
-#include <linux/jump_label.h>
 #include <linux/printk.h>
 #include <linux/smp.h>
 
@@ -13,16 +12,13 @@
 #include <asm/smp.h>
 
 #ifdef CONFIG_PPC_KUAP
-struct static_key_false disable_kuap_key;
-EXPORT_SYMBOL(disable_kuap_key);
-
 void setup_kuap(bool disabled)
 {
 	if (disabled) {
 		if (IS_ENABLED(CONFIG_40x))
 			disable_kuep = true;
 		if (smp_processor_id() == boot_cpuid)
-			static_branch_enable(&disable_kuap_key);
+			cur_cpu_spec->mmu_features &= ~MMU_FTR_KUAP;
 		return;
 	}
 
-- 
2.41.0

