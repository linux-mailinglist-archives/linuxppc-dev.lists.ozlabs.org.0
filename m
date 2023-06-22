Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DD3739F21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 12:59:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmy6f6cxwz3cjn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 20:59:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmy2T3vLZz3bYF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 20:55:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qmy220kTmz9sRt;
	Thu, 22 Jun 2023 12:55:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DN_Yv-bwXxxU; Thu, 22 Jun 2023 12:55:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qmy1w0FY4z9sRv;
	Thu, 22 Jun 2023 12:55:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F40508B763;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id UbFMWNmsP-iN; Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F7838B768;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35MAssSf2382571
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 12:54:54 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35MAsshO2382570;
	Thu, 22 Jun 2023 12:54:54 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 05/14] powerpc/kuap: KUAP enabling/disabling functions must be __always_inline
Date: Thu, 22 Jun 2023 12:54:27 +0200
Message-Id: <651a79379902dcdfbbed30244d7d555b90c4c999.1687430631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687430631.git.christophe.leroy@csgroup.eu>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687431271; l=17774; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=L8r3xBgXNsl4reNYL5RzipUL/enzeMqtOSUA4t0bcgs=; b=iaGBWfWfIxzPVfI7Td3KCjhnPR2USY3mZBt6PdgpzhKZTaIzo5iAu9llOvPN12DTqS6xHqOA/ k397FJNHazLA1nUN4MA3AsU+oDop9/ePiZtd/xWjcClK5mXuvAGDZyk
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

Objtool reports following warnings:

  arch/powerpc/kernel/signal_32.o: warning: objtool:
    __prevent_user_access.constprop.0+0x4 (.text+0x4):
    redundant UACCESS disable

  arch/powerpc/kernel/signal_32.o: warning: objtool: user_access_begin+0x2c
    (.text+0x4c): return with UACCESS enabled

  arch/powerpc/kernel/signal_32.o: warning: objtool: handle_rt_signal32+0x188
    (.text+0x360): call to __prevent_user_access.constprop.0() with UACCESS enabled

  arch/powerpc/kernel/signal_32.o: warning: objtool: handle_signal32+0x150
    (.text+0x4d4): call to __prevent_user_access.constprop.0() with UACCESS enabled

This is due to some KUAP enabling/disabling functions being outline
allthough they are marked inline. Use __always_inline instead.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     | 26 ++++++++++----------
 arch/powerpc/include/asm/book3s/64/kup.h     | 23 ++++++++---------
 arch/powerpc/include/asm/kup.h               | 16 ++++++------
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 20 +++++++--------
 arch/powerpc/include/asm/nohash/kup-booke.h  | 22 ++++++++---------
 arch/powerpc/include/asm/uaccess.h           |  6 ++---
 6 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 8da9997a67ba..41746a22c650 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -23,25 +23,25 @@ static __always_inline bool kuep_is_disabled(void)
 #define KUAP_NONE	(~0UL)
 #define KUAP_ALL	(~1UL)
 
-static inline void kuap_lock_one(unsigned long addr)
+static __always_inline void kuap_lock_one(unsigned long addr)
 {
 	mtsr(mfsr(addr) | SR_KS, addr);
 	isync();	/* Context sync required after mtsr() */
 }
 
-static inline void kuap_unlock_one(unsigned long addr)
+static __always_inline void kuap_unlock_one(unsigned long addr)
 {
 	mtsr(mfsr(addr) & ~SR_KS, addr);
 	isync();	/* Context sync required after mtsr() */
 }
 
-static inline void kuap_lock_all(void)
+static __always_inline void kuap_lock_all(void)
 {
 	update_user_segments(mfsr(0) | SR_KS);
 	isync();	/* Context sync required after mtsr() */
 }
 
-static inline void kuap_unlock_all(void)
+static __always_inline void kuap_unlock_all(void)
 {
 	update_user_segments(mfsr(0) & ~SR_KS);
 	isync();	/* Context sync required after mtsr() */
@@ -50,7 +50,7 @@ static inline void kuap_unlock_all(void)
 void kuap_lock_all_ool(void);
 void kuap_unlock_all_ool(void);
 
-static inline void kuap_lock_addr(unsigned long addr, bool ool)
+static __always_inline void kuap_lock_addr(unsigned long addr, bool ool)
 {
 	if (likely(addr != KUAP_ALL))
 		kuap_lock_one(addr);
@@ -60,7 +60,7 @@ static inline void kuap_lock_addr(unsigned long addr, bool ool)
 		kuap_lock_all_ool();
 }
 
-static inline void kuap_unlock(unsigned long addr, bool ool)
+static __always_inline void kuap_unlock(unsigned long addr, bool ool)
 {
 	if (likely(addr != KUAP_ALL))
 		kuap_unlock_one(addr);
@@ -70,7 +70,7 @@ static inline void kuap_unlock(unsigned long addr, bool ool)
 		kuap_unlock_all_ool();
 }
 
-static inline void __kuap_save_and_lock(struct pt_regs *regs)
+static __always_inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	unsigned long kuap = current->thread.kuap;
 
@@ -83,11 +83,11 @@ static inline void __kuap_save_and_lock(struct pt_regs *regs)
 }
 #define __kuap_save_and_lock __kuap_save_and_lock
 
-static inline void kuap_user_restore(struct pt_regs *regs)
+static __always_inline void kuap_user_restore(struct pt_regs *regs)
 {
 }
 
-static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
+static __always_inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 {
 	if (unlikely(kuap != KUAP_NONE)) {
 		current->thread.kuap = KUAP_NONE;
@@ -102,7 +102,7 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kua
 	kuap_unlock(regs->kuap, false);
 }
 
-static inline unsigned long __kuap_get_and_assert_locked(void)
+static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	unsigned long kuap = current->thread.kuap;
 
@@ -137,7 +137,7 @@ static __always_inline void __prevent_user_access(unsigned long dir)
 	kuap_lock_addr(kuap, true);
 }
 
-static inline unsigned long __prevent_user_access_return(void)
+static __always_inline unsigned long __prevent_user_access_return(void)
 {
 	unsigned long flags = current->thread.kuap;
 
@@ -149,7 +149,7 @@ static inline unsigned long __prevent_user_access_return(void)
 	return flags;
 }
 
-static inline void __restore_user_access(unsigned long flags)
+static __always_inline void __restore_user_access(unsigned long flags)
 {
 	if (flags != KUAP_NONE) {
 		current->thread.kuap = flags;
@@ -157,7 +157,7 @@ static inline void __restore_user_access(unsigned long flags)
 	}
 }
 
-static inline bool
+static __always_inline bool
 __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	unsigned long kuap = regs->kuap;
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index d44c4ee2e8c3..f33e064b9f5f 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -213,14 +213,14 @@ extern u64 __ro_after_init default_iamr;
  * access restrictions. Because of this ignore AMR value when accessing
  * userspace via kernel thread.
  */
-static inline u64 current_thread_amr(void)
+static __always_inline u64 current_thread_amr(void)
 {
 	if (current->thread.regs)
 		return current->thread.regs->amr;
 	return default_amr;
 }
 
-static inline u64 current_thread_iamr(void)
+static __always_inline u64 current_thread_iamr(void)
 {
 	if (current->thread.regs)
 		return current->thread.regs->iamr;
@@ -236,7 +236,7 @@ static __always_inline bool kuap_is_disabled(void)
 }
 #define kuap_is_disabled kuap_is_disabled
 
-static inline void kuap_user_restore(struct pt_regs *regs)
+static __always_inline void kuap_user_restore(struct pt_regs *regs)
 {
 	bool restore_amr = false, restore_iamr = false;
 	unsigned long amr, iamr;
@@ -275,7 +275,7 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 	 */
 }
 
-static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
+static __always_inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
 {
 	if (likely(regs->amr == amr))
 		return;
@@ -291,7 +291,7 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr
 	 */
 }
 
-static inline unsigned long __kuap_get_and_assert_locked(void)
+static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	unsigned long amr = mfspr(SPRN_AMR);
 
@@ -308,7 +308,7 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
  * because that would require an expensive read/modify write of the AMR.
  */
 
-static inline unsigned long get_kuap(void)
+static __always_inline unsigned long get_kuap(void)
 {
 	/*
 	 * We return AMR_KUAP_BLOCKED when we don't support KUAP because
@@ -338,7 +338,8 @@ static __always_inline void set_kuap(unsigned long value)
 	isync();
 }
 
-static inline bool __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+static __always_inline bool
+__bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	/*
 	 * For radix this will be a storage protection fault (DSISR_PROTFAULT).
@@ -381,12 +382,12 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 
 #else /* CONFIG_PPC_KUAP */
 
-static inline unsigned long get_kuap(void)
+static __always_inline unsigned long get_kuap(void)
 {
 	return AMR_KUAP_BLOCKED;
 }
 
-static inline void set_kuap(unsigned long value) { }
+static __always_inline void set_kuap(unsigned long value) { }
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
 					      unsigned long size, unsigned long dir)
@@ -401,7 +402,7 @@ static __always_inline void prevent_user_access(unsigned long dir)
 		do_uaccess_flush();
 }
 
-static inline unsigned long prevent_user_access_return(void)
+static __always_inline unsigned long prevent_user_access_return(void)
 {
 	unsigned long flags = get_kuap();
 
@@ -412,7 +413,7 @@ static inline unsigned long prevent_user_access_return(void)
 	return flags;
 }
 
-static inline void restore_user_access(unsigned long flags)
+static __always_inline void restore_user_access(unsigned long flags)
 {
 	set_kuap(flags);
 	if (static_branch_unlikely(&uaccess_flush_key) && flags == AMR_KUAP_BLOCKED)
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index a02340535efa..132f1c7e1064 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -59,14 +59,14 @@ static inline void setup_kuap(bool disabled) { }
 
 static __always_inline bool kuap_is_disabled(void) { return true; }
 
-static inline bool
+static __always_inline bool
 __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return false;
 }
 
-static inline void kuap_user_restore(struct pt_regs *regs) { }
-static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr) { }
+static __always_inline void kuap_user_restore(struct pt_regs *regs) { }
+static __always_inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr) { }
 
 /*
  * book3s/64/kup-radix.h defines these functions for the !KUAP case to flush
@@ -74,11 +74,11 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr
  * platforms.
  */
 #ifndef CONFIG_PPC_BOOK3S_64
-static inline void __allow_user_access(void __user *to, const void __user *from,
-				       unsigned long size, unsigned long dir) { }
-static inline void __prevent_user_access(unsigned long dir) { }
-static inline unsigned long __prevent_user_access_return(void) { return 0UL; }
-static inline void __restore_user_access(unsigned long flags) { }
+static __always_inline void __allow_user_access(void __user *to, const void __user *from,
+						unsigned long size, unsigned long dir) { }
+static __always_inline void __prevent_user_access(unsigned long dir) { }
+static __always_inline unsigned long __prevent_user_access_return(void) { return 0UL; }
+static __always_inline void __restore_user_access(unsigned long flags) { }
 #endif /* CONFIG_PPC_BOOK3S_64 */
 #endif /* CONFIG_PPC_KUAP */
 
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 1d53f38c5cd5..61067e4c8f22 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -13,24 +13,24 @@
 
 #include <asm/reg.h>
 
-static inline void __kuap_save_and_lock(struct pt_regs *regs)
+static __always_inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	regs->kuap = mfspr(SPRN_MD_AP);
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
 #define __kuap_save_and_lock __kuap_save_and_lock
 
-static inline void kuap_user_restore(struct pt_regs *regs)
+static __always_inline void kuap_user_restore(struct pt_regs *regs)
 {
 }
 
-static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
+static __always_inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 {
 	mtspr(SPRN_MD_AP, regs->kuap);
 }
 
 #ifdef CONFIG_PPC_KUAP_DEBUG
-static inline unsigned long __kuap_get_and_assert_locked(void)
+static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	WARN_ON_ONCE(mfspr(SPRN_MD_AP) >> 16 != MD_APG_KUAP >> 16);
 
@@ -39,18 +39,18 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 #define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 #endif
 
-static inline void __allow_user_access(void __user *to, const void __user *from,
-				       unsigned long size, unsigned long dir)
+static __always_inline void __allow_user_access(void __user *to, const void __user *from,
+						unsigned long size, unsigned long dir)
 {
 	mtspr(SPRN_MD_AP, MD_APG_INIT);
 }
 
-static inline void __prevent_user_access(unsigned long dir)
+static __always_inline void __prevent_user_access(unsigned long dir)
 {
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
 
-static inline unsigned long __prevent_user_access_return(void)
+static __always_inline unsigned long __prevent_user_access_return(void)
 {
 	unsigned long flags;
 
@@ -61,12 +61,12 @@ static inline unsigned long __prevent_user_access_return(void)
 	return flags;
 }
 
-static inline void __restore_user_access(unsigned long flags)
+static __always_inline void __restore_user_access(unsigned long flags)
 {
 	mtspr(SPRN_MD_AP, flags);
 }
 
-static inline bool
+static __always_inline bool
 __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return !((regs->kuap ^ MD_APG_KUAP) & 0xff000000);
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 07759ae9117b..416f3e0897d5 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -18,14 +18,14 @@
 
 #include <asm/reg.h>
 
-static inline void __kuap_lock(void)
+static __always_inline void __kuap_lock(void)
 {
 	mtspr(SPRN_PID, 0);
 	isync();
 }
 #define __kuap_lock __kuap_lock
 
-static inline void __kuap_save_and_lock(struct pt_regs *regs)
+static __always_inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	regs->kuap = mfspr(SPRN_PID);
 	mtspr(SPRN_PID, 0);
@@ -33,7 +33,7 @@ static inline void __kuap_save_and_lock(struct pt_regs *regs)
 }
 #define __kuap_save_and_lock __kuap_save_and_lock
 
-static inline void kuap_user_restore(struct pt_regs *regs)
+static __always_inline void kuap_user_restore(struct pt_regs *regs)
 {
 	if (kuap_is_disabled())
 		return;
@@ -43,7 +43,7 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 	/* Context synchronisation is performed by rfi */
 }
 
-static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
+static __always_inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 {
 	if (regs->kuap)
 		mtspr(SPRN_PID, current->thread.pid);
@@ -52,7 +52,7 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kua
 }
 
 #ifdef CONFIG_PPC_KUAP_DEBUG
-static inline unsigned long __kuap_get_and_assert_locked(void)
+static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	WARN_ON_ONCE(mfspr(SPRN_PID));
 
@@ -61,20 +61,20 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 #define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 #endif
 
-static inline void __allow_user_access(void __user *to, const void __user *from,
-				       unsigned long size, unsigned long dir)
+static __always_inline void __allow_user_access(void __user *to, const void __user *from,
+						unsigned long size, unsigned long dir)
 {
 	mtspr(SPRN_PID, current->thread.pid);
 	isync();
 }
 
-static inline void __prevent_user_access(unsigned long dir)
+static __always_inline void __prevent_user_access(unsigned long dir)
 {
 	mtspr(SPRN_PID, 0);
 	isync();
 }
 
-static inline unsigned long __prevent_user_access_return(void)
+static __always_inline unsigned long __prevent_user_access_return(void)
 {
 	unsigned long flags = mfspr(SPRN_PID);
 
@@ -84,7 +84,7 @@ static inline unsigned long __prevent_user_access_return(void)
 	return flags;
 }
 
-static inline void __restore_user_access(unsigned long flags)
+static __always_inline void __restore_user_access(unsigned long flags)
 {
 	if (flags) {
 		mtspr(SPRN_PID, current->thread.pid);
@@ -92,7 +92,7 @@ static inline void __restore_user_access(unsigned long flags)
 	}
 }
 
-static inline bool
+static __always_inline bool
 __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return !regs->kuap;
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index a2d255aa9627..fb725ec77926 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -386,7 +386,7 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
 extern long __copy_from_user_flushcache(void *dst, const void __user *src,
 		unsigned size);
 
-static __must_check inline bool user_access_begin(const void __user *ptr, size_t len)
+static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
 {
 	if (unlikely(!access_ok(ptr, len)))
 		return false;
@@ -401,7 +401,7 @@ static __must_check inline bool user_access_begin(const void __user *ptr, size_t
 #define user_access_save	prevent_user_access_return
 #define user_access_restore	restore_user_access
 
-static __must_check inline bool
+static __must_check __always_inline bool
 user_read_access_begin(const void __user *ptr, size_t len)
 {
 	if (unlikely(!access_ok(ptr, len)))
@@ -415,7 +415,7 @@ user_read_access_begin(const void __user *ptr, size_t len)
 #define user_read_access_begin	user_read_access_begin
 #define user_read_access_end		prevent_current_read_from_user
 
-static __must_check inline bool
+static __must_check __always_inline bool
 user_write_access_begin(const void __user *ptr, size_t len)
 {
 	if (unlikely(!access_ok(ptr, len)))
-- 
2.40.1

