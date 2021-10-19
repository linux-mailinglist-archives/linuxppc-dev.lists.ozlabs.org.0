Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 484E1432FC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:38:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQbC32mtz3fr8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:38:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQR51bMqz3cXt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:31:29 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPb1Llcz9sT7;
 Tue, 19 Oct 2021 09:30:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2Aax1AhBfue; Tue, 19 Oct 2021 09:30:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP80PNWz9sT8;
 Tue, 19 Oct 2021 09:29:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 025EC8B77A;
 Tue, 19 Oct 2021 09:29:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 11T11eacPypZ; Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 191E68B778;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7TdBe3188434
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:39 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7Td9l3188433;
 Tue, 19 Oct 2021 09:29:39 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 09/22] powerpc/kuap: Add a generic intermediate layer
Date: Tue, 19 Oct 2021 09:29:20 +0200
Message-Id: <eaef143a8dae7288cd34565ffa7b49c16aee1ec3.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628570; l=11871; s=20211009;
 h=from:subject:message-id; bh=di/wY4HUly26KSZ4e5zU26e4tcdSRlmZRwbXwM6I+TY=;
 b=8wpo7lnTKN6tbPVr9BiYsgcNpoT0qGjMzjjxj8hGwnv9K6OsMOJMDSSs4lt68yRnOAo7kylV0WbM
 hk0syW15C0KtfX3y2t1bEwwIVkJmsyZc6qugYQBO29anzWxog41F
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

Make the following functions generic to all platforms.
- bad_kuap_fault()
- kuap_assert_locked()
- kuap_save_and_lock() (PPC32 only)
- kuap_kernel_restore()
- kuap_get_and_assert_locked()

And for all platforms except book3s/64
- allow_user_access()
- prevent_user_access()
- prevent_user_access_return()
- restore_user_access()

Prepend __ in front of the name of platform specific ones.

For now the generic just calls the platform specific, but
next patch will move redundant parts of specific functions
into the generic one.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     | 22 +++---
 arch/powerpc/include/asm/book3s/64/kup.h     | 10 ++-
 arch/powerpc/include/asm/kup.h               | 71 +++++++++++++++++---
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 20 +++---
 4 files changed, 86 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index e3db5ed4b255..9e9b2692070c 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -77,7 +77,7 @@ static inline void kuap_unlock(unsigned long addr, bool ool)
 		kuap_unlock_all_ool();
 }
 
-static inline void kuap_save_and_lock(struct pt_regs *regs)
+static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	unsigned long kuap = current->thread.kuap;
 
@@ -96,7 +96,7 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 {
 }
 
-static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
+static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 {
 	if (kuap_is_disabled())
 		return;
@@ -114,7 +114,7 @@ static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 	kuap_unlock(regs->kuap, false);
 }
 
-static inline unsigned long kuap_get_and_assert_locked(void)
+static inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	unsigned long kuap = current->thread.kuap;
 
@@ -126,13 +126,13 @@ static inline unsigned long kuap_get_and_assert_locked(void)
 	return kuap;
 }
 
-static inline void kuap_assert_locked(void)
+static inline void __kuap_assert_locked(void)
 {
-	kuap_get_and_assert_locked();
+	__kuap_get_and_assert_locked();
 }
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      u32 size, unsigned long dir)
+static __always_inline void __allow_user_access(void __user *to, const void __user *from,
+						u32 size, unsigned long dir)
 {
 	if (kuap_is_disabled())
 		return;
@@ -146,7 +146,7 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 	kuap_unlock_one((__force u32)to);
 }
 
-static __always_inline void prevent_user_access(unsigned long dir)
+static __always_inline void __prevent_user_access(unsigned long dir)
 {
 	u32 kuap = current->thread.kuap;
 
@@ -162,7 +162,7 @@ static __always_inline void prevent_user_access(unsigned long dir)
 	kuap_lock(kuap, true);
 }
 
-static inline unsigned long prevent_user_access_return(void)
+static inline unsigned long __prevent_user_access_return(void)
 {
 	unsigned long flags = current->thread.kuap;
 
@@ -177,7 +177,7 @@ static inline unsigned long prevent_user_access_return(void)
 	return flags;
 }
 
-static inline void restore_user_access(unsigned long flags)
+static inline void __restore_user_access(unsigned long flags)
 {
 	if (kuap_is_disabled())
 		return;
@@ -189,7 +189,7 @@ static inline void restore_user_access(unsigned long flags)
 }
 
 static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+__bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	unsigned long kuap = regs->kuap;
 
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 170339969b7c..03d61c5205a4 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -268,8 +268,7 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 	 */
 }
 
-static inline void kuap_kernel_restore(struct pt_regs *regs,
-					   unsigned long amr)
+static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
 {
 	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
 		if (unlikely(regs->amr != amr)) {
@@ -287,7 +286,7 @@ static inline void kuap_kernel_restore(struct pt_regs *regs,
 	 */
 }
 
-static inline unsigned long kuap_get_and_assert_locked(void)
+static inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
 		unsigned long amr = mfspr(SPRN_AMR);
@@ -298,7 +297,7 @@ static inline unsigned long kuap_get_and_assert_locked(void)
 	return 0;
 }
 
-static inline void kuap_assert_locked(void)
+static inline void __kuap_assert_locked(void)
 {
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
@@ -339,8 +338,7 @@ static inline void set_kuap(unsigned long value)
 	isync();
 }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
-				  bool is_write)
+static inline bool __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	if (!mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		return false;
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index fa8513b7acca..f2a6fdb45d33 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -41,17 +41,17 @@ void setup_kuap(bool disabled);
 static inline void setup_kuap(bool disabled) { }
 
 static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+__bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return false;
 }
 
-static inline void kuap_assert_locked(void) { }
-static inline void kuap_save_and_lock(struct pt_regs *regs) { }
+static inline void __kuap_assert_locked(void) { }
+static inline void __kuap_save_and_lock(struct pt_regs *regs) { }
 static inline void kuap_user_restore(struct pt_regs *regs) { }
-static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long amr) { }
+static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr) { }
 
-static inline unsigned long kuap_get_and_assert_locked(void)
+static inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	return 0;
 }
@@ -62,14 +62,65 @@ static inline unsigned long kuap_get_and_assert_locked(void)
  * platforms.
  */
 #ifndef CONFIG_PPC_BOOK3S_64
-static inline void allow_user_access(void __user *to, const void __user *from,
-				     unsigned long size, unsigned long dir) { }
-static inline void prevent_user_access(unsigned long dir) { }
-static inline unsigned long prevent_user_access_return(void) { return 0UL; }
-static inline void restore_user_access(unsigned long flags) { }
+static inline void __allow_user_access(void __user *to, const void __user *from,
+				       unsigned long size, unsigned long dir) { }
+static inline void __prevent_user_access(unsigned long dir) { }
+static inline unsigned long __prevent_user_access_return(void) { return 0UL; }
+static inline void __restore_user_access(unsigned long flags) { }
 #endif /* CONFIG_PPC_BOOK3S_64 */
 #endif /* CONFIG_PPC_KUAP */
 
+static __always_inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+{
+	return __bad_kuap_fault(regs, address, is_write);
+}
+
+static __always_inline void kuap_assert_locked(void)
+{
+	__kuap_assert_locked();
+}
+
+#ifdef CONFIG_PPC32
+static __always_inline void kuap_save_and_lock(struct pt_regs *regs)
+{
+	__kuap_save_and_lock(regs);
+}
+#endif
+
+static __always_inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
+{
+	__kuap_kernel_restore(regs, amr);
+}
+
+static __always_inline unsigned long kuap_get_and_assert_locked(void)
+{
+	return __kuap_get_and_assert_locked();
+}
+
+#ifndef CONFIG_PPC_BOOK3S_64
+static __always_inline void allow_user_access(void __user *to, const void __user *from,
+				     unsigned long size, unsigned long dir)
+{
+	__allow_user_access(to, from, size, dir);
+}
+
+static __always_inline void prevent_user_access(unsigned long dir)
+{
+	__prevent_user_access(dir);
+}
+
+static __always_inline unsigned long prevent_user_access_return(void)
+{
+	return __prevent_user_access_return();
+}
+
+static __always_inline void restore_user_access(unsigned long flags)
+{
+	__restore_user_access(flags);
+}
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
 static __always_inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
 	barrier_nospec();
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 882a0bc7887a..a5db84164afd 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -20,7 +20,7 @@ static __always_inline bool kuap_is_disabled(void)
 	return static_branch_unlikely(&disable_kuap_key);
 }
 
-static inline void kuap_save_and_lock(struct pt_regs *regs)
+static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	if (kuap_is_disabled())
 		return;
@@ -33,7 +33,7 @@ static inline void kuap_user_restore(struct pt_regs *regs)
 {
 }
 
-static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
+static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 {
 	if (kuap_is_disabled())
 		return;
@@ -41,7 +41,7 @@ static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
 	mtspr(SPRN_MD_AP, regs->kuap);
 }
 
-static inline unsigned long kuap_get_and_assert_locked(void)
+static inline unsigned long __kuap_get_and_assert_locked(void)
 {
 	unsigned long kuap;
 
@@ -56,14 +56,14 @@ static inline unsigned long kuap_get_and_assert_locked(void)
 	return kuap;
 }
 
-static inline void kuap_assert_locked(void)
+static inline void __kuap_assert_locked(void)
 {
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && !kuap_is_disabled())
 		kuap_get_and_assert_locked();
 }
 
-static inline void allow_user_access(void __user *to, const void __user *from,
-				     unsigned long size, unsigned long dir)
+static inline void __allow_user_access(void __user *to, const void __user *from,
+				       unsigned long size, unsigned long dir)
 {
 	if (kuap_is_disabled())
 		return;
@@ -71,7 +71,7 @@ static inline void allow_user_access(void __user *to, const void __user *from,
 	mtspr(SPRN_MD_AP, MD_APG_INIT);
 }
 
-static inline void prevent_user_access(unsigned long dir)
+static inline void __prevent_user_access(unsigned long dir)
 {
 	if (kuap_is_disabled())
 		return;
@@ -79,7 +79,7 @@ static inline void prevent_user_access(unsigned long dir)
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
 
-static inline unsigned long prevent_user_access_return(void)
+static inline unsigned long __prevent_user_access_return(void)
 {
 	unsigned long flags;
 
@@ -93,7 +93,7 @@ static inline unsigned long prevent_user_access_return(void)
 	return flags;
 }
 
-static inline void restore_user_access(unsigned long flags)
+static inline void __restore_user_access(unsigned long flags)
 {
 	if (kuap_is_disabled())
 		return;
@@ -102,7 +102,7 @@ static inline void restore_user_access(unsigned long flags)
 }
 
 static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+__bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	if (kuap_is_disabled())
 		return false;
-- 
2.31.1

