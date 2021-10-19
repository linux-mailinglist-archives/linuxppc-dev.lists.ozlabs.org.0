Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA62432F91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:32:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQRk2xNDz3dpJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:32:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQPk4FRNz3cPP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:30:18 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPH1qqZz9sSq;
 Tue, 19 Oct 2021 09:29:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jbC-2c9jPIW; Tue, 19 Oct 2021 09:29:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP70Bv6z9sSp;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5C6E8B77E;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SW140AOcC3df; Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BA918B779;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7Tc1I3188426
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:39 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7Tcot3188425;
 Tue, 19 Oct 2021 09:29:38 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 07/22] powerpc/32s: Save content of sr0 to avoid 'mfsr'
Date: Tue, 19 Oct 2021 09:29:18 +0200
Message-Id: <b02baf2ed8f09bad910dfaeeb7353b2ae6830525.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628570; l=6500; s=20211009;
 h=from:subject:message-id; bh=IjtW0jnmN2CsgyTMQSJUpGmi8Te8USjw8DHA07uZXVI=;
 b=n/aYVIRedCOvtxERPgP9gbFP36PZ9gU/sIFKXloipiV1kauvle3+yEEmVAgwnC9oXGsgDCsUhYMq
 v4jXb54ODXVSFsCifQwldwAY4xZftL5AyCqVZv8f/54WTXGHIccM
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Calling 'mfsr' to get the content of segment registers is heavy,
in addition it requires clearing of the 'reserved' bits.

In order to avoid this operation, save it in mm context and in
thread struct.

The saved sr0 is the one used by kernel, this means that on
locking entry it can be used as is.

For unlocking, the only thing to do is to clear SR_NX.

This improves null_syscall selftest by 12 cycles, ie 4%.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/mmu-hash.h |  5 +++++
 arch/powerpc/include/asm/processor.h          |  9 +++++++++
 arch/powerpc/kernel/asm-offsets.c             |  1 +
 arch/powerpc/kernel/entry_32.S                |  8 +++-----
 arch/powerpc/mm/book3s32/kuap.c               |  5 ++++-
 arch/powerpc/mm/book3s32/kuep.c               |  1 +
 arch/powerpc/mm/book3s32/mmu_context.c        | 15 +++++++--------
 arch/powerpc/mm/mmu_context.c                 |  3 +++
 8 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index e2f7ccc13edb..7be27862329f 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -175,9 +175,14 @@ struct hash_pte {
 
 typedef struct {
 	unsigned long id;
+	unsigned long sr0;
 	void __user *vdso;
 } mm_context_t;
 
+#ifdef CONFIG_PPC_KUEP
+#define INIT_MM_CONTEXT(mm) .context.sr0 = SR_NX
+#endif
+
 void update_bats(void);
 static inline void cleanup_cpu_mmu_context(void) { }
 
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index f348e564f7dd..e64ec54398c6 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -157,6 +157,7 @@ struct thread_struct {
 #ifdef CONFIG_PPC_BOOK3S_32
 	unsigned long	r0, r3, r4, r5, r6, r8, r9, r11;
 	unsigned long	lr, ctr;
+	unsigned long	sr0;
 #endif
 #endif /* CONFIG_PPC32 */
 	/* Debug Registers */
@@ -276,6 +277,12 @@ struct thread_struct {
 #define SPEFSCR_INIT
 #endif
 
+#ifdef CONFIG_PPC_BOOK3S_32
+#define SR0_INIT	.sr0 = IS_ENABLED(CONFIG_PPC_KUEP) ? SR_NX : 0,
+#else
+#define SR0_INIT
+#endif
+
 #if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
 #define INIT_THREAD { \
 	.ksp = INIT_SP, \
@@ -283,6 +290,7 @@ struct thread_struct {
 	.kuap = ~0UL, /* KUAP_NONE */ \
 	.fpexc_mode = MSR_FE0 | MSR_FE1, \
 	SPEFSCR_INIT \
+	SR0_INIT \
 }
 #elif defined(CONFIG_PPC32)
 #define INIT_THREAD { \
@@ -290,6 +298,7 @@ struct thread_struct {
 	.pgdir = swapper_pg_dir, \
 	.fpexc_mode = MSR_FE0 | MSR_FE1, \
 	SPEFSCR_INIT \
+	SR0_INIT \
 }
 #else
 #define INIT_THREAD  { \
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index e563d3222d69..256aa669cf80 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -141,6 +141,7 @@ int main(void)
 	OFFSET(THR11, thread_struct, r11);
 	OFFSET(THLR, thread_struct, lr);
 	OFFSET(THCTR, thread_struct, ctr);
+	OFFSET(THSR0, thread_struct, sr0);
 #endif
 #ifdef CONFIG_SPE
 	OFFSET(THREAD_EVR0, thread_struct, evr[0]);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 4ba6a8c43475..cf3cc0e52d07 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -76,15 +76,13 @@ _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
 #if defined(CONFIG_PPC_KUEP) && defined(CONFIG_PPC_BOOK3S_32)
 	.globl	__kuep_lock
 __kuep_lock:
-	mfsr    r9,0
-	rlwinm  r9,r9,0,8,3
-	oris    r9,r9,SR_NX@h
+	lwz	r9, THREAD+THSR0(r2)
 	update_user_segments_by_4 r9, r10, r11, r12
 	blr
 
 __kuep_unlock:
-	mfsr    r9,0
-	rlwinm  r9,r9,0,8,2
+	lwz	r9, THREAD+THSR0(r2)
+	rlwinm  r9,r9,0,~SR_NX
 	update_user_segments_by_4 r9, r10, r11, r12
 	blr
 
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index 0f920f09af57..28676cabb005 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -20,8 +20,11 @@ EXPORT_SYMBOL(kuap_unlock_all_ool);
 
 void setup_kuap(bool disabled)
 {
-	if (!disabled)
+	if (!disabled) {
 		kuap_lock_all_ool();
+		init_mm.context.sr0 |= SR_KS;
+		current->thread.sr0 |= SR_KS;
+	}
 
 	if (smp_processor_id() != boot_cpuid)
 		return;
diff --git a/arch/powerpc/mm/book3s32/kuep.c b/arch/powerpc/mm/book3s32/kuep.c
index bac1420d028b..78fc48eee510 100644
--- a/arch/powerpc/mm/book3s32/kuep.c
+++ b/arch/powerpc/mm/book3s32/kuep.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <asm/code-patching.h>
 #include <asm/kup.h>
 #include <asm/smp.h>
 
diff --git a/arch/powerpc/mm/book3s32/mmu_context.c b/arch/powerpc/mm/book3s32/mmu_context.c
index e2708e387dc3..269a3eb25a73 100644
--- a/arch/powerpc/mm/book3s32/mmu_context.c
+++ b/arch/powerpc/mm/book3s32/mmu_context.c
@@ -69,6 +69,12 @@ EXPORT_SYMBOL_GPL(__init_new_context);
 int init_new_context(struct task_struct *t, struct mm_struct *mm)
 {
 	mm->context.id = __init_new_context();
+	mm->context.sr0 = CTX_TO_VSID(mm->context.id, 0);
+
+	if (!kuep_is_disabled())
+		mm->context.sr0 |= SR_NX;
+	if (!kuap_is_disabled())
+		mm->context.sr0 |= SR_KS;
 
 	return 0;
 }
@@ -108,20 +114,13 @@ void __init mmu_context_init(void)
 void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next, struct task_struct *tsk)
 {
 	long id = next->context.id;
-	unsigned long val;
 
 	if (id < 0)
 		panic("mm_struct %p has no context ID", next);
 
 	isync();
 
-	val = CTX_TO_VSID(id, 0);
-	if (!kuep_is_disabled())
-		val |= SR_NX;
-	if (!kuap_is_disabled())
-		val |= SR_KS;
-
-	update_user_segments(val);
+	update_user_segments(next->context.sr0);
 
 	if (IS_ENABLED(CONFIG_BDI_SWITCH))
 		abatron_pteptrs[1] = next->pgd;
diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index 74246536b832..e618d5442a28 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -18,6 +18,9 @@ static inline void switch_mm_pgdir(struct task_struct *tsk,
 {
 	/* 32-bit keeps track of the current PGDIR in the thread struct */
 	tsk->thread.pgdir = mm->pgd;
+#ifdef CONFIG_PPC_BOOK3S_32
+	tsk->thread.sr0 = mm->context.sr0;
+#endif
 }
 #elif defined(CONFIG_PPC_BOOK3E_64)
 static inline void switch_mm_pgdir(struct task_struct *tsk,
-- 
2.31.1

