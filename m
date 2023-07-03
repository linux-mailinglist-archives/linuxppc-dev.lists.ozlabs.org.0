Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B1C7457BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 10:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvfmC3Tsxz3cgG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 18:51:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvfjJ1Gwtz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 18:48:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qvfhz51pwz9sFj;
	Mon,  3 Jul 2023 10:48:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiAjR4TFuCs7; Mon,  3 Jul 2023 10:48:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qvfhs4hfJz9sFf;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A5A78B822;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QRai1C29sF-P; Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 684C38B81A;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 3638mQK61103955
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 3 Jul 2023 10:48:26 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 3638mQil1103954;
	Mon, 3 Jul 2023 10:48:26 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 5/9] powerpc/kuap: MMU_FTR_BOOK3S_KUAP becomes MMU_FTR_KUAP
Date: Mon,  3 Jul 2023 10:48:09 +0200
Message-ID: <d2fa7cc459785999f903f60d4064946fc580c9f3.1688373335.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1688373335.git.christophe.leroy@csgroup.eu>
References: <cover.1688373335.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688374084; l=5595; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=+oAxwI9DAE5ntKeqFQadLRZTDbqmOCTS1lBhUW7f9qY=; b=l3Fn2U7GFJgZoDYbUxhu5NyA00zddV8z8aVMwl/Igdqd0tC9GHkDvFBHvTqsMstEonPuZ9dSB 2qjbjGThLwuC2psreewH+tg7LfEp4d/nYOhT3l9cspLRM/8f2G+5elK
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

In order to reuse MMU_FTR_BOOK3S_KUAP for other targets than BOOK3S,
rename it MMU_FTR_KUAP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hash-pkey.h |  2 +-
 arch/powerpc/include/asm/book3s/64/kup.h       | 18 +++++++++---------
 arch/powerpc/include/asm/mmu.h                 |  4 ++--
 arch/powerpc/kernel/syscall.c                  |  2 +-
 arch/powerpc/mm/book3s64/pkeys.c               |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-pkey.h b/arch/powerpc/include/asm/book3s/64/hash-pkey.h
index f1e60d579f6c..6c5564c4fae4 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-pkey.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-pkey.h
@@ -24,7 +24,7 @@ static inline u64 pte_to_hpte_pkey_bits(u64 pteflags, unsigned long flags)
 		    ((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
 		    ((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL));
 
-	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP) ||
+	if (mmu_has_feature(MMU_FTR_KUAP) ||
 	    mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
 		if ((pte_pkey == 0) && (flags & HPTE_USE_KERNEL_KEY))
 			return HASH_DEFAULT_KERNEL_KEY;
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 2a7bd3ecc556..72fc4263ed26 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -31,7 +31,7 @@
 	mfspr	\gpr2, SPRN_AMR
 	cmpd	\gpr1, \gpr2
 	beq	99f
-	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_BOOK3S_KUAP, 68)
+	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_KUAP, 68)
 
 	isync
 	mtspr	SPRN_AMR, \gpr1
@@ -78,7 +78,7 @@
 	 * No need to restore IAMR when returning to kernel space.
 	 */
 100:
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 67)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
 #endif
 .endm
 
@@ -91,7 +91,7 @@
 	LOAD_REG_IMMEDIATE(\gpr2, AMR_KUAP_BLOCKED)
 999:	tdne	\gpr1, \gpr2
 	EMIT_WARN_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 67)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
 #endif
 .endm
 #endif
@@ -130,7 +130,7 @@
 	 */
 	BEGIN_MMU_FTR_SECTION_NESTED(68)
 	b	100f  // skip_save_amr
-	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_BOOK3S_KUAP, 68)
+	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_KUAP, 68)
 
 	/*
 	 * if pkey is disabled and we are entering from userspace
@@ -166,7 +166,7 @@
 	mtspr	SPRN_AMR, \gpr2
 	isync
 102:
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 69)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 69)
 
 	/*
 	 * if entering from kernel we don't need save IAMR
@@ -232,7 +232,7 @@ static inline u64 current_thread_iamr(void)
 
 static __always_inline bool kuap_is_disabled(void)
 {
-	return !mmu_has_feature(MMU_FTR_BOOK3S_KUAP);
+	return !mmu_has_feature(MMU_FTR_KUAP);
 }
 
 static inline void kuap_user_restore(struct pt_regs *regs)
@@ -243,7 +243,7 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
-	if (!mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
+	if (!mmu_has_feature(MMU_FTR_KUAP)) {
 		amr = mfspr(SPRN_AMR);
 		if (amr != regs->amr)
 			restore_amr = true;
@@ -317,7 +317,7 @@ static inline unsigned long get_kuap(void)
 	 * This has no effect in terms of actually blocking things on hash,
 	 * so it doesn't break anything.
 	 */
-	if (!mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
+	if (!mmu_has_feature(MMU_FTR_KUAP))
 		return AMR_KUAP_BLOCKED;
 
 	return mfspr(SPRN_AMR);
@@ -325,7 +325,7 @@ static inline unsigned long get_kuap(void)
 
 static __always_inline void set_kuap(unsigned long value)
 {
-	if (!mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
+	if (!mmu_has_feature(MMU_FTR_KUAP))
 		return;
 
 	/*
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 94b981152667..82af2e2c5eca 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -33,7 +33,7 @@
  * key 0 controlling userspace addresses on radix
  * Key 3 on hash
  */
-#define MMU_FTR_BOOK3S_KUAP		ASM_CONST(0x00000200)
+#define MMU_FTR_KUAP		ASM_CONST(0x00000200)
 
 /*
  * Supports KUEP feature
@@ -188,7 +188,7 @@ enum {
 #endif /* CONFIG_PPC_RADIX_MMU */
 #endif
 #ifdef CONFIG_PPC_KUAP
-	MMU_FTR_BOOK3S_KUAP |
+	MMU_FTR_KUAP |
 #endif /* CONFIG_PPC_KUAP */
 #ifdef CONFIG_PPC_MEM_KEYS
 	MMU_FTR_PKEY |
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 18b9d325395f..77fedb190c93 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -46,7 +46,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 		iamr = mfspr(SPRN_IAMR);
 		regs->amr  = amr;
 		regs->iamr = iamr;
-		if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
+		if (mmu_has_feature(MMU_FTR_KUAP)) {
 			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
 			flush_needed = true;
 		}
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 1d2675ab6711..125733962033 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -291,7 +291,7 @@ void setup_kuap(bool disabled)
 
 	if (smp_processor_id() == boot_cpuid) {
 		pr_info("Activating Kernel Userspace Access Prevention\n");
-		cur_cpu_spec->mmu_features |= MMU_FTR_BOOK3S_KUAP;
+		cur_cpu_spec->mmu_features |= MMU_FTR_KUAP;
 	}
 
 	/*
-- 
2.41.0

