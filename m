Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907E739F07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 12:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmy3Z0cZyz3bfS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 20:56:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmy271lltz30PL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 20:55:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qmy1s3TkFz9sRh;
	Thu, 22 Jun 2023 12:54:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAljZoVwo4TH; Thu, 22 Jun 2023 12:54:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qmy1q6KgVz9sRl;
	Thu, 22 Jun 2023 12:54:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D1EFA8B763;
	Thu, 22 Jun 2023 12:54:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Z9p6vaLOO-Pf; Thu, 22 Jun 2023 12:54:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 77D678B767;
	Thu, 22 Jun 2023 12:54:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35MAsmib2382524
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 12:54:48 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35MAsmaL2382523;
	Thu, 22 Jun 2023 12:54:48 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 02/14] powerpc/kuap: Avoid useless jump_label on empty function
Date: Thu, 22 Jun 2023 12:54:24 +0200
Message-Id: <49907feaae8275375ce09aa43e739c1aaa89d331.1687430631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687430631.git.christophe.leroy@csgroup.eu>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687431271; l=8514; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=4zoL5f/NDaOiSGKHw9EM0Ia9dxzFYlOXgNWIOe1S0DA=; b=ZSPVW1vH2nl5dTiEN1zaExDg4JdkEK9xpstSTbwa0LbpzkczjgITOU28lAa81sZWwVA/Y+Kop 8GiWP+CVWVxBbx8ydtdGIIuL1uXHqRXT90mLW4c2Kt6Og2ChVIRiRZk
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

Disassembly of interrupt_enter_prepare() shows a pointless nop
before the mftb

  c000abf0 <interrupt_enter_prepare>:
  c000abf0:       81 23 00 84     lwz     r9,132(r3)
  c000abf4:       71 29 40 00     andi.   r9,r9,16384
  c000abf8:       41 82 00 28     beq-    c000ac20 <interrupt_enter_prepare+0x30>
  c000abfc: ===>  60 00 00 00     nop	<====
  c000ac00:       7d 0c 42 e6     mftb    r8
  c000ac04:       80 e2 00 08     lwz     r7,8(r2)
  c000ac08:       81 22 00 28     lwz     r9,40(r2)
  c000ac0c:       91 02 00 24     stw     r8,36(r2)
  c000ac10:       7d 29 38 50     subf    r9,r9,r7
  c000ac14:       7d 29 42 14     add     r9,r9,r8
  c000ac18:       91 22 00 08     stw     r9,8(r2)
  c000ac1c:       4e 80 00 20     blr
  c000ac20:       60 00 00 00     nop
  c000ac24:       7d 5a c2 a6     mfmd_ap r10
  c000ac28:       3d 20 de 00     lis     r9,-8704
  c000ac2c:       91 43 00 b0     stw     r10,176(r3)
  c000ac30:       7d 3a c3 a6     mtspr   794,r9
  c000ac34:       4e 80 00 20     blr

That comes from the call to kuap_loc(), allthough __kuap_lock() is an
empty function on the 8xx.

To avoid that, only perform kuap_is_disabled() check when there is
something to do with __kuap_lock().

Do the same with __kuap_save_and_lock() and
__kuap_get_and_assert_locked().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: Add back comment about __kupa_lock() not needed on 64s
---
 arch/powerpc/include/asm/book3s/32/kup.h     |  6 ++---
 arch/powerpc/include/asm/book3s/64/kup.h     | 10 ++------
 arch/powerpc/include/asm/kup.h               | 25 ++++++++++----------
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 11 ++++-----
 arch/powerpc/include/asm/nohash/kup-booke.h  |  8 +++++--
 5 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 678f9c9d89b6..466a19cfb4df 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -77,10 +77,6 @@ static inline void kuap_unlock(unsigned long addr, bool ool)
 		kuap_unlock_all_ool();
 }
 
-static inline void __kuap_lock(void)
-{
-}
-
 static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	unsigned long kuap = current->thread.kuap;
@@ -92,6 +88,7 @@ static inline void __kuap_save_and_lock(struct pt_regs *regs)
 	current->thread.kuap = KUAP_NONE;
 	kuap_lock_addr(kuap, false);
 }
+#define __kuap_save_and_lock __kuap_save_and_lock
 
 static inline void kuap_user_restore(struct pt_regs *regs)
 {
@@ -120,6 +117,7 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 
 	return kuap;
 }
+#define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 
 static __always_inline void __allow_user_access(void __user *to, const void __user *from,
 						u32 size, unsigned long dir)
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 84c09e546115..2a7bd3ecc556 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -298,15 +298,9 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 		WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
 	return amr;
 }
+#define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 
-/* Do nothing, book3s/64 does that in ASM */
-static inline void __kuap_lock(void)
-{
-}
-
-static inline void __kuap_save_and_lock(struct pt_regs *regs)
-{
-}
+/* __kuap_lock() not required, book3s/64 does that in ASM */
 
 /*
  * We support individually allowing read or write, but we don't support nesting
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index d751ddd08110..0a4e07175612 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -52,16 +52,9 @@ __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 	return false;
 }
 
-static inline void __kuap_lock(void) { }
-static inline void __kuap_save_and_lock(struct pt_regs *regs) { }
 static inline void kuap_user_restore(struct pt_regs *regs) { }
 static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr) { }
 
-static inline unsigned long __kuap_get_and_assert_locked(void)
-{
-	return 0;
-}
-
 /*
  * book3s/64/kup-radix.h defines these functions for the !KUAP case to flush
  * the L1D cache after user accesses. Only include the empty stubs for other
@@ -87,27 +80,32 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 
 static __always_inline void kuap_assert_locked(void)
 {
+#if defined(CONFIG_PPC_KUAP_DEBUG) && defined(__kuap_get_and_assert_locked)
 	if (kuap_is_disabled())
 		return;
 
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
-		__kuap_get_and_assert_locked();
+	__kuap_get_and_assert_locked();
+#endif
 }
 
 static __always_inline void kuap_lock(void)
 {
+#ifdef __kuap_lock
 	if (kuap_is_disabled())
 		return;
 
 	__kuap_lock();
+#endif
 }
 
 static __always_inline void kuap_save_and_lock(struct pt_regs *regs)
 {
+#ifdef __kuap_save_and_lock
 	if (kuap_is_disabled())
 		return;
 
 	__kuap_save_and_lock(regs);
+#endif
 }
 
 static __always_inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
@@ -120,10 +118,11 @@ static __always_inline void kuap_kernel_restore(struct pt_regs *regs, unsigned l
 
 static __always_inline unsigned long kuap_get_and_assert_locked(void)
 {
-	if (kuap_is_disabled())
-		return 0;
-
-	return __kuap_get_and_assert_locked();
+#ifdef __kuap_get_and_assert_locked
+	if (!kuap_is_disabled())
+		return __kuap_get_and_assert_locked();
+#endif
+	return 0;
 }
 
 #ifndef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 8579210f2a6a..a372cd822887 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -20,15 +20,12 @@ static __always_inline bool kuap_is_disabled(void)
 	return static_branch_unlikely(&disable_kuap_key);
 }
 
-static inline void __kuap_lock(void)
-{
-}
-
 static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	regs->kuap = mfspr(SPRN_MD_AP);
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
+#define __kuap_save_and_lock __kuap_save_and_lock
 
 static inline void kuap_user_restore(struct pt_regs *regs)
 {
@@ -39,13 +36,15 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kua
 	mtspr(SPRN_MD_AP, regs->kuap);
 }
 
+#ifdef CONFIG_PPC_KUAP_DEBUG
 static inline unsigned long __kuap_get_and_assert_locked(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
-		WARN_ON_ONCE(mfspr(SPRN_MD_AP) >> 16 != MD_APG_KUAP >> 16);
+	WARN_ON_ONCE(mfspr(SPRN_MD_AP) >> 16 != MD_APG_KUAP >> 16);
 
 	return 0;
 }
+#define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
+#endif
 
 static inline void __allow_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir)
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 823c5a3a96d8..71182cbe20c3 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -30,6 +30,7 @@ static inline void __kuap_lock(void)
 	mtspr(SPRN_PID, 0);
 	isync();
 }
+#define __kuap_lock __kuap_lock
 
 static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
@@ -37,6 +38,7 @@ static inline void __kuap_save_and_lock(struct pt_regs *regs)
 	mtspr(SPRN_PID, 0);
 	isync();
 }
+#define __kuap_save_and_lock __kuap_save_and_lock
 
 static inline void kuap_user_restore(struct pt_regs *regs)
 {
@@ -56,13 +58,15 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kua
 	/* Context synchronisation is performed by rfi */
 }
 
+#ifdef CONFIG_PPC_KUAP_DEBUG
 static inline unsigned long __kuap_get_and_assert_locked(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
-		WARN_ON_ONCE(mfspr(SPRN_PID));
+	WARN_ON_ONCE(mfspr(SPRN_PID));
 
 	return 0;
 }
+#define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
+#endif
 
 static inline void __allow_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir)
-- 
2.40.1

