Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB0F3F4D5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 17:22:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtbZG0gK4z3c6N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 01:21:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtbY06810z2yJG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 01:20:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GtbXr1NF9z9sVN;
 Mon, 23 Aug 2021 17:20:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJVD9jWR5y9k; Mon, 23 Aug 2021 17:20:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GtbXq6xjVz9sT2;
 Mon, 23 Aug 2021 17:20:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD4538B7B3;
 Mon, 23 Aug 2021 17:20:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wKp50bCM43qQ; Mon, 23 Aug 2021 17:20:43 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A03BB8B7AF;
 Mon, 23 Aug 2021 17:20:43 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 90F296BC76; Mon, 23 Aug 2021 15:20:43 +0000 (UTC)
Message-Id: <5c42e3516eea33cb820e43912cebc9e11fbc22d5.1629731144.git.christophe.leroy@csgroup.eu>
In-Reply-To: <343d06ab9ea7b8b6358308753ec1e8fa7e3d4f11.1629731144.git.christophe.leroy@csgroup.eu>
References: <343d06ab9ea7b8b6358308753ec1e8fa7e3d4f11.1629731144.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 2/2] powerpc/32s: Save content of sr0 to avoid 'mfsr'
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Aug 2021 15:20:43 +0000 (UTC)
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

Capability to deactive KUEP at boot time is re-enabled by this patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Simplified patching implied by simplified preceding patch
---
 arch/powerpc/include/asm/book3s/32/kup.h      |  2 ++
 arch/powerpc/include/asm/book3s/32/mmu-hash.h |  1 +
 arch/powerpc/include/asm/processor.h          |  1 +
 arch/powerpc/kernel/entry_32.S                | 11 +++++----
 arch/powerpc/mm/book3s32/kuap.c               |  5 +++-
 arch/powerpc/mm/book3s32/kuep.c               | 24 ++++++++++++-------
 arch/powerpc/mm/book3s32/mmu_context.c        | 15 ++++++------
 arch/powerpc/mm/mmu_context.c                 |  3 +++
 8 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index f159efd04ebc..f03fe357471f 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -14,6 +14,8 @@
 extern struct static_key_false disable_kuap_key;
 extern struct static_key_false disable_kuep_key;
 
+extern s32 patch__kuep_lock, patch__kuep_unlock;
+
 static __always_inline bool kuap_is_disabled(void)
 {
 	return !IS_ENABLED(CONFIG_PPC_KUAP) || static_branch_unlikely(&disable_kuap_key);
diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index e2f7ccc13edb..ecc148c1e795 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -175,6 +175,7 @@ struct hash_pte {
 
 typedef struct {
 	unsigned long id;
+	unsigned long sr0;
 	void __user *vdso;
 } mm_context_t;
 
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index f348e564f7dd..4b13f94a4f42 100644
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
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 14269313d5dd..784be0a0dd9d 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -33,6 +33,7 @@
 #include <asm/kup.h>
 #include <asm/bug.h>
 #include <asm/interrupt.h>
+#include <asm/code-patching-asm.h>
 
 #include "head_32.h"
 
@@ -76,17 +77,17 @@ _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
 #if defined(CONFIG_PPC_KUEP) && defined(CONFIG_PPC_BOOK3S_32)
 	.globl	__kuep_lock
 __kuep_lock:
-	mfsr    r9,0
-	rlwinm  r9,r9,0,8,3
-	oris    r9,r9,SR_NX@h
+0:	blr	/* lwz	r9, current->thread.sr0(r2) */
 	update_user_segments_by_4 r9, r10, r11, r12
 	blr
+	patch_site	0b, patch__kuep_lock
 
 __kuep_unlock:
-	mfsr    r9,0
-	rlwinm  r9,r9,0,8,2
+0:	blr	/* lwz	r9, current->thread.sr0(r2) */
+	rlwinm  r9,r9,0,~SR_NX
 	update_user_segments_by_4 r9, r10, r11, r12
 	blr
+	patch_site	0b, patch__kuep_unlock
 
 .macro	kuep_lock
 	bl	__kuep_lock
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
index 45c9967f9aef..0be25492b42d 100644
--- a/arch/powerpc/mm/book3s32/kuep.c
+++ b/arch/powerpc/mm/book3s32/kuep.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <asm/code-patching.h>
 #include <asm/kup.h>
 #include <asm/smp.h>
 
@@ -7,19 +8,26 @@ struct static_key_false disable_kuep_key;
 
 void setup_kuep(bool disabled)
 {
-	if (disabled) {
-		pr_info("KUEP cannot be disabled for the time being\n");
-		disabled = false;
-	}
+	u32 insn;
 
-	if (!disabled)
-		update_user_segments(mfsr(0) | SR_NX);
+	if (!disabled) {
+		init_mm.context.sr0 |= SR_NX;
+		current->thread.sr0 |= SR_NX;
+		update_user_segments(init_mm.context.sr0);
+	}
 
 	if (smp_processor_id() != boot_cpuid)
 		return;
 
 	if (disabled)
 		static_branch_enable(&disable_kuep_key);
-	else
-		pr_info("Activating Kernel Userspace Execution Prevention\n");
+
+	if (disabled)
+		return;
+
+	insn = PPC_RAW_LWZ(_R9, _R2, offsetof(struct task_struct, thread.sr0));
+	patch_instruction_site(&patch__kuep_lock, ppc_inst(insn));
+	patch_instruction_site(&patch__kuep_unlock, ppc_inst(insn));
+
+	pr_info("Activating Kernel Userspace Execution Prevention\n");
 }
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
2.25.0

