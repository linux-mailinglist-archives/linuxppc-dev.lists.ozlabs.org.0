Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A55AD7457B6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 10:50:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvflg4Q36z3cYS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 18:50:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvfjC735cz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 18:48:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qvfhy03FCz9sFg;
	Mon,  3 Jul 2023 10:48:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VUhJEb5_N68q; Mon,  3 Jul 2023 10:48:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qvfhs4hjbz9sFj;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B0C28B823;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id pxhR1CoTxnqj; Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B7B08B77D;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 3638mQCQ1103963
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 3 Jul 2023 10:48:26 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 3638mQld1103962;
	Mon, 3 Jul 2023 10:48:26 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 7/9] powerpc/kuap: Simplify KUAP lock/unlock on BOOK3S/32
Date: Mon,  3 Jul 2023 10:48:11 +0200
Message-ID: <1897c2f40448bb0dfc0f0be978cd10f74ef577ba.1688373335.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1688373335.git.christophe.leroy@csgroup.eu>
References: <cover.1688373335.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688374084; l=7750; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/19je7eNycqdcKZa7ad8wOoIcXq4DodoPt9t8vnNw1A=; b=uUi20fBtcM+rojZ2h2DtrO2lqFL0W9tJkZhRg1EVkxJgbHaNkfhlwLz84zlDZOlKER0CB81di 6EQimxkk7e5A8V0RJDhDtsaXddNYRrl9DyY7MgcevZBaRcu7ItFpNd4
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

On book3s/32 KUAP is performed at segment level. At the moment,
when enabling userspace access, only current segment is modified.
Then if a write is performed on another user segment, a fault is
taken and all other user segments get enabled for userspace
access. This then require special attention when disabling
userspace access.

Having a userspace write access crossing a segment boundary is
unlikely. Having a userspace write access crossing a segment boundary
back and forth is even more unlikely. So, instead of enabling
userspace access on all segments when a write fault occurs, just
change which segment has userspace access enabled in order to
eliminate the case when more than one segment has userspace access
enabled. That simplifies userspace access deactivation.

There is however a corner case which is even more unlikely but has
to be handled anyway: an unaligned access which is crossing a
segment boundary. That would definitely require at least having
userspace access enabled on the two segments. To avoid complicating
the likely case for a so unlikely happening, handle such situation
like an alignment exception and emulate the store.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 71 ++++++++----------------
 arch/powerpc/include/asm/bug.h           |  1 +
 arch/powerpc/kernel/traps.c              |  2 +-
 arch/powerpc/mm/book3s32/kuap.c          | 15 +----
 4 files changed, 26 insertions(+), 63 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 4ca6122ef0e1..5d4f787244d5 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -14,55 +14,19 @@
 #include <linux/sched.h>
 
 #define KUAP_NONE	(~0UL)
-#define KUAP_ALL	(~1UL)
 
-static inline void kuap_lock_one(unsigned long addr)
+static inline void uaccess_end_32s(unsigned long addr)
 {
 	mtsr(mfsr(addr) | SR_KS, addr);
 	isync();	/* Context sync required after mtsr() */
 }
 
-static inline void kuap_unlock_one(unsigned long addr)
+static inline void uaccess_begin_32s(unsigned long addr)
 {
 	mtsr(mfsr(addr) & ~SR_KS, addr);
 	isync();	/* Context sync required after mtsr() */
 }
 
-static inline void kuap_lock_all(void)
-{
-	update_user_segments(mfsr(0) | SR_KS);
-	isync();	/* Context sync required after mtsr() */
-}
-
-static inline void kuap_unlock_all(void)
-{
-	update_user_segments(mfsr(0) & ~SR_KS);
-	isync();	/* Context sync required after mtsr() */
-}
-
-void kuap_lock_all_ool(void);
-void kuap_unlock_all_ool(void);
-
-static inline void kuap_lock_addr(unsigned long addr, bool ool)
-{
-	if (likely(addr != KUAP_ALL))
-		kuap_lock_one(addr);
-	else if (!ool)
-		kuap_lock_all();
-	else
-		kuap_lock_all_ool();
-}
-
-static inline void kuap_unlock(unsigned long addr, bool ool)
-{
-	if (likely(addr != KUAP_ALL))
-		kuap_unlock_one(addr);
-	else if (!ool)
-		kuap_unlock_all();
-	else
-		kuap_unlock_all_ool();
-}
-
 static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	unsigned long kuap = current->thread.kuap;
@@ -72,7 +36,7 @@ static inline void __kuap_save_and_lock(struct pt_regs *regs)
 		return;
 
 	current->thread.kuap = KUAP_NONE;
-	kuap_lock_addr(kuap, false);
+	uaccess_end_32s(kuap);
 }
 #define __kuap_save_and_lock __kuap_save_and_lock
 
@@ -84,7 +48,7 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kua
 {
 	if (unlikely(kuap != KUAP_NONE)) {
 		current->thread.kuap = KUAP_NONE;
-		kuap_lock_addr(kuap, false);
+		uaccess_end_32s(kuap);
 	}
 
 	if (likely(regs->kuap == KUAP_NONE))
@@ -92,7 +56,7 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kua
 
 	current->thread.kuap = regs->kuap;
 
-	kuap_unlock(regs->kuap, false);
+	uaccess_begin_32s(regs->kuap);
 }
 
 static inline unsigned long __kuap_get_and_assert_locked(void)
@@ -114,7 +78,7 @@ static __always_inline void __allow_user_access(void __user *to, const void __us
 		return;
 
 	current->thread.kuap = (__force u32)to;
-	kuap_unlock_one((__force u32)to);
+	uaccess_begin_32s((__force u32)to);
 }
 
 static __always_inline void __prevent_user_access(unsigned long dir)
@@ -127,7 +91,7 @@ static __always_inline void __prevent_user_access(unsigned long dir)
 		return;
 
 	current->thread.kuap = KUAP_NONE;
-	kuap_lock_addr(kuap, true);
+	uaccess_end_32s(kuap);
 }
 
 static inline unsigned long __prevent_user_access_return(void)
@@ -136,7 +100,7 @@ static inline unsigned long __prevent_user_access_return(void)
 
 	if (flags != KUAP_NONE) {
 		current->thread.kuap = KUAP_NONE;
-		kuap_lock_addr(flags, true);
+		uaccess_end_32s(flags);
 	}
 
 	return flags;
@@ -146,7 +110,7 @@ static inline void __restore_user_access(unsigned long flags)
 {
 	if (flags != KUAP_NONE) {
 		current->thread.kuap = flags;
-		kuap_unlock(flags, true);
+		uaccess_begin_32s(flags);
 	}
 }
 
@@ -155,14 +119,23 @@ __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	unsigned long kuap = regs->kuap;
 
-	if (!is_write || kuap == KUAP_ALL)
+	if (!is_write)
 		return false;
 	if (kuap == KUAP_NONE)
 		return true;
 
-	/* If faulting address doesn't match unlocked segment, unlock all */
-	if ((kuap ^ address) & 0xf0000000)
-		regs->kuap = KUAP_ALL;
+	/*
+	 * If faulting address doesn't match unlocked segment, change segment.
+	 * In case of unaligned store crossing two segments, emulate store.
+	 */
+	if ((kuap ^ address) & 0xf0000000) {
+		if (!(kuap & 0x0fffffff) && address > kuap - 4 && fix_alignment(regs)) {
+			regs_add_return_ip(regs, 4);
+			emulate_single_step(regs);
+		} else {
+			regs->kuap = address;
+		}
+	}
 
 	return false;
 }
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index ef42adb44aa3..492530adecc2 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -163,6 +163,7 @@ __label_warn_on:						\
 struct pt_regs;
 void hash__do_page_fault(struct pt_regs *);
 void bad_page_fault(struct pt_regs *, int);
+void emulate_single_step(struct pt_regs *regs);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
 extern void die(const char *, struct pt_regs *, long);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index e59ec6d32d37..ab95105c69ca 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1158,7 +1158,7 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
  * pretend we got a single-step exception.  This was pointed out
  * by Kumar Gala.  -- paulus
  */
-static void emulate_single_step(struct pt_regs *regs)
+void emulate_single_step(struct pt_regs *regs)
 {
 	if (single_stepping(regs))
 		__single_step_exception(regs);
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index 24c1c686e6b9..3a8815555a48 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -3,22 +3,11 @@
 #include <asm/kup.h>
 #include <asm/smp.h>
 
-void kuap_lock_all_ool(void)
-{
-	kuap_lock_all();
-}
-EXPORT_SYMBOL(kuap_lock_all_ool);
-
-void kuap_unlock_all_ool(void)
-{
-	kuap_unlock_all();
-}
-EXPORT_SYMBOL(kuap_unlock_all_ool);
-
 void setup_kuap(bool disabled)
 {
 	if (!disabled) {
-		kuap_lock_all_ool();
+		update_user_segments(mfsr(0) | SR_KS);
+		isync();        /* Context sync required after mtsr() */
 		init_mm.context.sr0 |= SR_KS;
 		current->thread.sr0 |= SR_KS;
 	}
-- 
2.41.0

