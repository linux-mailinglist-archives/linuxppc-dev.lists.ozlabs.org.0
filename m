Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2639D426DFB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 17:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQsvz0jHNz3dsV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 02:45:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQsqj6LkYz3c9K
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 02:41:37 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HQsq60vVVz9sT2;
 Fri,  8 Oct 2021 17:41:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxraE1jivyfG; Fri,  8 Oct 2021 17:41:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HQspx6bYkz9sSn;
 Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C78438B78F;
 Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uLrXlfZxwwYI; Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.75])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C66DB8B78C;
 Fri,  8 Oct 2021 17:40:56 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 198Fem961129656
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 8 Oct 2021 17:40:48 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 198Femlt1129655;
 Fri, 8 Oct 2021 17:40:48 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 04/16] powerpc/kuap: Check KUAP activation in generic
 functions
Date: Fri,  8 Oct 2021 17:40:32 +0200
Message-Id: <20bdff208e64d1c6830c47e0e8a5506f07ce8fa7.1633707305.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633707305.git.christophe.leroy@csgroup.eu>
References: <cover.1633707305.git.christophe.leroy@csgroup.eu>
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

Today, every platform checks that KUAP is not de-activated
before doing the real job.

Move the verification out of platform specific functions.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Added missing check in bad_kuap_fault()
---
 arch/powerpc/include/asm/book3s/32/kup.h     | 34 +++-------------
 arch/powerpc/include/asm/book3s/64/kup.h     | 41 ++++++++++----------
 arch/powerpc/include/asm/kup.h               | 29 ++++++++++++++
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 28 +------------
 4 files changed, 56 insertions(+), 76 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 8f04602dffff..f1617ba85068 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -16,11 +16,6 @@ extern struct static_key_false disable_kuep_key;
 
 extern s32 patch__kuep_lock, patch__kuep_unlock;
 
-static __always_inline bool kuap_is_disabled(void)
-{
-	return !IS_ENABLED(CONFIG_PPC_KUAP) || static_branch_unlikely(&disable_kuap_key);
-}
-
 static __always_inline bool kuep_is_disabled(void)
 {
 	return !IS_ENABLED(CONFIG_PPC_KUEP) || static_branch_unlikely(&disable_kuep_key);
@@ -33,6 +28,11 @@ static __always_inline bool kuep_is_disabled(void)
 #define KUAP_NONE	(~0UL)
 #define KUAP_ALL	(~1UL)
 
+static __always_inline bool kuap_is_disabled(void)
+{
+	return static_branch_unlikely(&disable_kuap_key);
+}
+
 static inline void kuap_lock_one(unsigned long addr)
 {
 	mtsr(mfsr(addr) | SR_KS, addr);
@@ -84,9 +84,6 @@ static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	unsigned long kuap = current->thread.kuap;
 
-	if (kuap_is_disabled())
-		return;
-
 	regs->kuap = kuap;
 	if (unlikely(kuap == KUAP_NONE))
 		return;
@@ -101,9 +98,6 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 
 static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 {
-	if (kuap_is_disabled())
-		return;
-
 	if (unlikely(kuap != KUAP_NONE)) {
 		current->thread.kuap = KUAP_NONE;
 		kuap_lock(kuap, false);
@@ -121,9 +115,6 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	unsigned long kuap = current->thread.kuap;
 
-	if (kuap_is_disabled())
-		return KUAP_NONE;
-
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && kuap != KUAP_NONE);
 
 	return kuap;
@@ -137,9 +128,6 @@ static inline void __kuap_assert_locked(void)
 static __always_inline void __allow_user_access(void __user *to, const void __user *from,
 						u32 size, unsigned long dir)
 {
-	if (kuap_is_disabled())
-		return;
-
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
 	if (!(dir & KUAP_WRITE))
@@ -153,9 +141,6 @@ static __always_inline void __prevent_user_access(unsigned long dir)
 {
 	u32 kuap = current->thread.kuap;
 
-	if (kuap_is_disabled())
-		return;
-
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
 	if (!(dir & KUAP_WRITE))
@@ -169,9 +154,6 @@ static inline unsigned long __prevent_user_access_return(void)
 {
 	unsigned long flags = current->thread.kuap;
 
-	if (kuap_is_disabled())
-		return KUAP_NONE;
-
 	if (flags != KUAP_NONE) {
 		current->thread.kuap = KUAP_NONE;
 		kuap_lock(flags, true);
@@ -182,9 +164,6 @@ static inline unsigned long __prevent_user_access_return(void)
 
 static inline void __restore_user_access(unsigned long flags)
 {
-	if (kuap_is_disabled())
-		return;
-
 	if (flags != KUAP_NONE) {
 		current->thread.kuap = flags;
 		kuap_unlock(flags, true);
@@ -196,9 +175,6 @@ __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	unsigned long kuap = regs->kuap;
 
-	if (kuap_is_disabled())
-		return false;
-
 	if (!is_write || kuap == KUAP_ALL)
 		return false;
 	if (kuap == KUAP_NONE)
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 03d61c5205a4..9f2099790658 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -229,6 +229,11 @@ static inline u64 current_thread_iamr(void)
 
 #ifdef CONFIG_PPC_KUAP
 
+static __always_inline bool kuap_is_disabled(void)
+{
+	return !mmu_has_feature(MMU_FTR_BOOK3S_KUAP);
+}
+
 static inline void kuap_user_restore(struct pt_regs *regs)
 {
 	bool restore_amr = false, restore_iamr = false;
@@ -270,36 +275,32 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 
 static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
 {
-	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
-		if (unlikely(regs->amr != amr)) {
-			isync();
-			mtspr(SPRN_AMR, regs->amr);
-			/*
-			 * No isync required here because we are about to rfi
-			 * back to previous context before any user accesses
-			 * would be made, which is a CSI.
-			 */
-		}
-	}
+	if (likely(regs->amr == amr))
+		return;
+
+	isync();
+	mtspr(SPRN_AMR, regs->amr);
 	/*
+	 * No isync required here because we are about to rfi
+	 * back to previous context before any user accesses
+	 * would be made, which is a CSI.
+	 *
 	 * No need to restore IAMR when returning to kernel space.
 	 */
 }
 
 static inline unsigned long __kuap_get_and_assert_locked(void)
 {
-	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
-		unsigned long amr = mfspr(SPRN_AMR);
-		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
-			WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
-		return amr;
-	}
-	return 0;
+	unsigned long amr = mfspr(SPRN_AMR);
+
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
+		WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
+	return amr;
 }
 
 static inline void __kuap_assert_locked(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
 }
 
@@ -340,8 +341,6 @@ static inline void set_kuap(unsigned long value)
 
 static inline bool __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
-	if (!mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
-		return false;
 	/*
 	 * For radix this will be a storage protection fault (DSISR_PROTFAULT).
 	 * For hash this will be a key fault (DSISR_KEYFAULT)
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 3dbd3f77b413..ea70e6f1df1e 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -43,6 +43,8 @@ void setup_kuap(bool disabled);
 #else
 static inline void setup_kuap(bool disabled) { }
 
+static __always_inline bool kuap_is_disabled(void) { return true; }
+
 static inline bool
 __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
@@ -76,28 +78,43 @@ static inline void __restore_user_access(unsigned long flags) { }
 static __always_inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
+	if (kuap_is_disabled())
+		return false;
+
 	return __bad_kuap_fault(regs, address, is_write);
 }
 
 static __always_inline void kuap_assert_locked(void)
 {
+	if (kuap_is_disabled())
+		return;
+
 	__kuap_assert_locked();
 }
 
 #ifdef CONFIG_PPC32
 static __always_inline void kuap_save_and_lock(struct pt_regs *regs)
 {
+	if (kuap_is_disabled())
+		return;
+
 	__kuap_save_and_lock(regs);
 }
 #endif
 
 static __always_inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
 {
+	if (kuap_is_disabled())
+		return;
+
 	__kuap_kernel_restore(regs, amr);
 }
 
 static __always_inline unsigned long kuap_get_and_assert_locked(void)
 {
+	if (kuap_is_disabled())
+		return 0;
+
 	return __kuap_get_and_assert_locked();
 }
 
@@ -105,21 +122,33 @@ static __always_inline unsigned long kuap_get_and_assert_locked(void)
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
 				     unsigned long size, unsigned long dir)
 {
+	if (kuap_is_disabled())
+		return;
+
 	__allow_user_access(to, from, size, dir);
 }
 
 static __always_inline void prevent_user_access(unsigned long dir)
 {
+	if (kuap_is_disabled())
+		return;
+
 	__prevent_user_access(dir);
 }
 
 static __always_inline unsigned long prevent_user_access_return(void)
 {
+	if (kuap_is_disabled())
+		return 0;
+
 	return __prevent_user_access_return();
 }
 
 static __always_inline void restore_user_access(unsigned long flags)
 {
+	if (kuap_is_disabled())
+		return;
+
 	__restore_user_access(flags);
 }
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index a5db84164afd..74f15c386476 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -22,9 +22,6 @@ static __always_inline bool kuap_is_disabled(void)
 
 static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
-	if (kuap_is_disabled())
-		return;
-
 	regs->kuap = mfspr(SPRN_MD_AP);
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
@@ -35,9 +32,6 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 
 static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 {
-	if (kuap_is_disabled())
-		return;
-
 	mtspr(SPRN_MD_AP, regs->kuap);
 }
 
@@ -45,9 +39,6 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	unsigned long kuap;
 
-	if (kuap_is_disabled())
-		return MD_APG_INIT;
-
 	kuap = mfspr(SPRN_MD_AP);
 
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
@@ -58,24 +49,18 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 
 static inline void __kuap_assert_locked(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && !kuap_is_disabled())
-		kuap_get_and_assert_locked();
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
+		__kuap_get_and_assert_locked();
 }
 
 static inline void __allow_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir)
 {
-	if (kuap_is_disabled())
-		return;
-
 	mtspr(SPRN_MD_AP, MD_APG_INIT);
 }
 
 static inline void __prevent_user_access(unsigned long dir)
 {
-	if (kuap_is_disabled())
-		return;
-
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
 
@@ -83,9 +68,6 @@ static inline unsigned long __prevent_user_access_return(void)
 {
 	unsigned long flags;
 
-	if (kuap_is_disabled())
-		return MD_APG_INIT;
-
 	flags = mfspr(SPRN_MD_AP);
 
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
@@ -95,18 +77,12 @@ static inline unsigned long __prevent_user_access_return(void)
 
 static inline void __restore_user_access(unsigned long flags)
 {
-	if (kuap_is_disabled())
-		return;
-
 	mtspr(SPRN_MD_AP, flags);
 }
 
 static inline bool
 __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
-	if (kuap_is_disabled())
-		return false;
-
 	return !((regs->kuap ^ MD_APG_KUAP) & 0xff000000);
 }
 
-- 
2.31.1

