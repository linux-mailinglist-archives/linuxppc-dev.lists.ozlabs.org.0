Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 966E9423E11
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 14:48:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPZ503NjBz3bjR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:48:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPZ4V605Yz2yJv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 23:48:08 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HPZ4M1cscz9sVY;
 Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9R9jOIl5PsX0; Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HPZ4M0Tb8z9sTH;
 Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ED0D08B796;
 Wed,  6 Oct 2021 14:48:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ELUFEOYu3ty2; Wed,  6 Oct 2021 14:48:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.229])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 868EF8B763;
 Wed,  6 Oct 2021 14:48:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 196Clppq579416
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 6 Oct 2021 14:47:52 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 196ChsDr579290;
 Wed, 6 Oct 2021 14:43:54 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 10/15] powerpc: Add KUAP support for BOOKE and 40x
Date: Wed,  6 Oct 2021 14:43:43 +0200
Message-Id: <15e564cee3f8c4b6a854d6dc5ffac5a4ff7358d1.1633523837.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633523837.git.christophe.leroy@csgroup.eu>
References: <cover.1633523837.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
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

On booke/40x we don't have segments like book3s/32.
On booke/40x we don't have access protection groups like 8xx.

Use the PID register to provide user access protection.
Kernel address space can be accessed with any PID.
User address space has to be accessed with the PID of the user.
User PID is always not null.

Everytime the kernel is entered, set PID register to 0 and
restore PID register when returning to user.

Everytime kernel needs to access user data, PID is restored
for the access.

In TLB miss handlers, check the PID and bail out to data storage
exception when PID is 0 and accessed address is in user space.

Note that also forbids execution of user text by kernel except
when user access is unlocked. But this shouldn't be a problem
as the kernel is not supposed to ever run user text.

This patch prepares the infrastructure but the real activation of KUAP
is done by following patches for each processor type one by one.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/kup.h              |   4 +
 arch/powerpc/include/asm/nohash/kup-booke.h | 110 ++++++++++++++++++++
 arch/powerpc/include/asm/processor.h        |   3 +
 arch/powerpc/kernel/process.c               |   3 +
 arch/powerpc/mm/mmu_context.c               |   6 ++
 arch/powerpc/mm/nohash/mmu_context.c        |   6 +-
 6 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/nohash/kup-booke.h

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index cb9d4a13a9a5..0dd68e97a375 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -14,6 +14,10 @@
 #include <asm/nohash/32/kup-8xx.h>
 #endif
 
+#ifdef CONFIG_BOOKE_OR_40x
+#include <asm/nohash/kup-booke.h>
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_32
 #include <asm/book3s/32/kup.h>
 #endif
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
new file mode 100644
index 000000000000..49bb41ed0816
--- /dev/null
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_KUP_BOOKE_H_
+#define _ASM_POWERPC_KUP_BOOKE_H_
+
+#include <asm/bug.h>
+
+#ifdef CONFIG_PPC_KUAP
+
+#ifdef __ASSEMBLY__
+
+.macro kuap_check_amr	gpr1, gpr2
+.endm
+
+#else
+
+#include <linux/jump_label.h>
+#include <linux/sched.h>
+
+#include <asm/reg.h>
+
+extern struct static_key_false disable_kuap_key;
+
+static __always_inline bool kuap_is_disabled(void)
+{
+	return static_branch_unlikely(&disable_kuap_key);
+}
+
+static inline void __kuap_lock(void)
+{
+	mtspr(SPRN_PID, 0);
+	isync();
+}
+
+static inline void __kuap_save_and_lock(struct pt_regs *regs)
+{
+	regs->kuap = mfspr(SPRN_PID);
+	mtspr(SPRN_PID, 0);
+	isync();
+}
+
+static inline void kuap_user_restore(struct pt_regs *regs)
+{
+	if (kuap_is_disabled())
+		return;
+
+	mtspr(SPRN_PID, current->thread.pid);
+
+	/* Context synchronisation is performed by rfi */
+}
+
+static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
+{
+	if (regs->kuap)
+		mtspr(SPRN_PID, current->thread.pid);
+
+	/* Context synchronisation is performed by rfi */
+}
+
+static inline unsigned long __kuap_get_and_assert_locked(void)
+{
+	unsigned long kuap = mfspr(SPRN_PID);
+
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
+		WARN_ON_ONCE(kuap);
+
+	return kuap;
+}
+
+static inline void __allow_user_access(void __user *to, const void __user *from,
+				       unsigned long size, unsigned long dir)
+{
+	mtspr(SPRN_PID, current->thread.pid);
+	isync();
+}
+
+static inline void __prevent_user_access(unsigned long dir)
+{
+	mtspr(SPRN_PID, 0);
+	isync();
+}
+
+static inline unsigned long __prevent_user_access_return(void)
+{
+	unsigned long flags = mfspr(SPRN_PID);
+
+	mtspr(SPRN_PID, 0);
+	isync();
+
+	return flags;
+}
+
+static inline void __restore_user_access(unsigned long flags)
+{
+	if (flags) {
+		mtspr(SPRN_PID, current->thread.pid);
+		isync();
+	}
+}
+
+static inline bool
+__bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+{
+	return !regs->kuap;
+}
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* CONFIG_PPC_KUAP */
+
+#endif /* _ASM_POWERPC_KUP_BOOKE_H_ */
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 4b13f94a4f42..2748ae867dbd 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -160,6 +160,9 @@ struct thread_struct {
 	unsigned long	sr0;
 #endif
 #endif /* CONFIG_PPC32 */
+#if defined(CONFIG_BOOKE_OR_40x) && defined(CONFIG_PPC_KUAP)
+	unsigned long	pid;	/* value written in PID reg. at interrupt exit */
+#endif
 	/* Debug Registers */
 	struct debug_reg debug;
 #ifdef CONFIG_PPC_FPU_REGS
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 2c637740c0c2..b22d70681a21 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1767,6 +1767,9 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 #if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
 	p->thread.kuap = KUAP_NONE;
 #endif
+#if defined(CONFIG_BOOKE_OR_40x) && defined(CONFIG_PPC_KUAP)
+	p->thread.pid = MMU_NO_CONTEXT;
+#endif
 
 	setup_ksp_vsid(p, sp);
 
diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index e618d5442a28..735c36f26388 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -21,6 +21,9 @@ static inline void switch_mm_pgdir(struct task_struct *tsk,
 #ifdef CONFIG_PPC_BOOK3S_32
 	tsk->thread.sr0 = mm->context.sr0;
 #endif
+#if defined(CONFIG_BOOKE_OR_40x) && defined(CONFIG_PPC_KUAP)
+	tsk->thread.pid = mm->context.id;
+#endif
 }
 #elif defined(CONFIG_PPC_BOOK3E_64)
 static inline void switch_mm_pgdir(struct task_struct *tsk,
@@ -28,6 +31,9 @@ static inline void switch_mm_pgdir(struct task_struct *tsk,
 {
 	/* 64-bit Book3E keeps track of current PGD in the PACA */
 	get_paca()->pgd = mm->pgd;
+#ifdef CONFIG_PPC_KUAP
+	tsk->thread.pid = mm->context.id;
+#endif
 }
 #else
 static inline void switch_mm_pgdir(struct task_struct *tsk,
diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index 44b2b5e7cabe..85b048f04c56 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -33,6 +33,7 @@
 #include <asm/mmu_context.h>
 #include <asm/tlbflush.h>
 #include <asm/smp.h>
+#include <asm/kup.h>
 
 #include <mm/mmu_decl.h>
 
@@ -217,7 +218,7 @@ static void set_context(unsigned long id, pgd_t *pgd)
 
 		/* sync */
 		mb();
-	} else {
+	} else if (kuap_is_disabled()) {
 		if (IS_ENABLED(CONFIG_40x))
 			mb();	/* sync */
 
@@ -305,6 +306,9 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 	if (IS_ENABLED(CONFIG_BDI_SWITCH))
 		abatron_pteptrs[1] = next->pgd;
 	set_context(id, next->pgd);
+#if defined(CONFIG_BOOKE_OR_40x) && defined(CONFIG_PPC_KUAP)
+	tsk->thread.pid = id;
+#endif
 	raw_spin_unlock(&context_lock);
 }
 
-- 
2.31.1

