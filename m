Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8217B7457A2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 10:49:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvfjw37HHz3bcS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 18:49:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvfhz29ftz3bNm
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 18:48:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qvfht2Krvz9sFl;
	Mon,  3 Jul 2023 10:48:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFt__gNmFExW; Mon,  3 Jul 2023 10:48:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qvfhs4dcsz9sFY;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A2CB8B81F;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QTwWyeTuseav; Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B7D28B77E;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 3638mReh1103972
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 3 Jul 2023 10:48:27 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 3638mRCt1103971;
	Mon, 3 Jul 2023 10:48:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 9/9] powerpc/kuap: Use ASM feature fixups instead of static branches
Date: Mon,  3 Jul 2023 10:48:13 +0200
Message-ID: <2c30423f3963bf8e13e2cb4ae9af337c5cf704a8.1688373335.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1688373335.git.christophe.leroy@csgroup.eu>
References: <cover.1688373335.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688374084; l=10074; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=M3Dc0TliNzKOaNzBxD5nEDH5NIpmE0TGTq/Vp/i6IP8=; b=jFkUNFSxhHs+K65yAuyEH92MZNKUIqamJlwYFZkFakwNZkbBxUjzprJmjvyhahgZygDQmmwXL TvYjo9rUvJiBIIcUu9CDFys9KuGomVhGeB8i180AyqX6M1rqxJEgQSk
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

To avoid a useless nop on top of every uaccess enable/disable and
make life easier for objtool, replace static branches by ASM feature
fixups that will nop KUAP enabling instructions out in the unlikely
case KUAP is disabled at boottime.

Leave it as is on book3s/64 for now, it will be handled later when
objtool is activated on PPC64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     | 34 +++++++++++----
 arch/powerpc/include/asm/kup.h               | 45 +++-----------------
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 30 +++++++++----
 arch/powerpc/include/asm/nohash/kup-booke.h  | 38 ++++++++++-------
 arch/powerpc/mm/nohash/kup.c                 |  2 +-
 5 files changed, 75 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index f40a210bf1bb..73d02815f52d 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -17,14 +17,30 @@
 
 static __always_inline void uaccess_end_32s(unsigned long addr)
 {
-	mtsr(mfsr(addr) | SR_KS, addr);
-	isync();	/* Context sync required after mtsr() */
+	unsigned long tmp;
+
+	asm volatile(ASM_MMU_FTR_IFSET(
+		"mfsrin %0, %1;"
+		"oris %0, %0, %2;"
+		"mtsrin %0, %1;"
+		"isync", "", %3)
+		: "=&r"(tmp)
+		: "r"(addr), "i"(SR_KS >> 16), "i"(MMU_FTR_KUAP)
+		: "memory");
 }
 
 static __always_inline void uaccess_begin_32s(unsigned long addr)
 {
-	mtsr(mfsr(addr) & ~SR_KS, addr);
-	isync();	/* Context sync required after mtsr() */
+	unsigned long tmp;
+
+	asm volatile(ASM_MMU_FTR_IFSET(
+		"mfsrin %0, %1;"
+		"rlwinm %0, %0, 0, %2;"
+		"mtsrin %0, %1;"
+		"isync", "", %3)
+		: "=&r"(tmp)
+		: "r"(addr), "i"(~SR_KS), "i"(MMU_FTR_KUAP)
+		: "memory");
 }
 
 static __always_inline void __kuap_save_and_lock(struct pt_regs *regs)
@@ -69,8 +85,8 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 }
 #define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 
-static __always_inline void __allow_user_access(void __user *to, const void __user *from,
-						u32 size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, const void __user *from,
+					      u32 size, unsigned long dir)
 {
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
@@ -81,7 +97,7 @@ static __always_inline void __allow_user_access(void __user *to, const void __us
 	uaccess_begin_32s((__force u32)to);
 }
 
-static __always_inline void __prevent_user_access(unsigned long dir)
+static __always_inline void prevent_user_access(unsigned long dir)
 {
 	u32 kuap = current->thread.kuap;
 
@@ -94,7 +110,7 @@ static __always_inline void __prevent_user_access(unsigned long dir)
 	uaccess_end_32s(kuap);
 }
 
-static __always_inline unsigned long __prevent_user_access_return(void)
+static __always_inline unsigned long prevent_user_access_return(void)
 {
 	unsigned long flags = current->thread.kuap;
 
@@ -106,7 +122,7 @@ static __always_inline unsigned long __prevent_user_access_return(void)
 	return flags;
 }
 
-static __always_inline void __restore_user_access(unsigned long flags)
+static __always_inline void restore_user_access(unsigned long flags)
 {
 	if (flags != KUAP_NONE) {
 		current->thread.kuap = flags;
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 77adb9cd2da5..ad7e8c5aec3f 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -72,11 +72,11 @@ static __always_inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned
  * platforms.
  */
 #ifndef CONFIG_PPC_BOOK3S_64
-static __always_inline void __allow_user_access(void __user *to, const void __user *from,
-						unsigned long size, unsigned long dir) { }
-static __always_inline void __prevent_user_access(unsigned long dir) { }
-static __always_inline unsigned long __prevent_user_access_return(void) { return 0UL; }
-static __always_inline void __restore_user_access(unsigned long flags) { }
+static __always_inline void allow_user_access(void __user *to, const void __user *from,
+					      unsigned long size, unsigned long dir) { }
+static __always_inline void prevent_user_access(unsigned long dir) { }
+static __always_inline unsigned long prevent_user_access_return(void) { return 0UL; }
+static __always_inline void restore_user_access(unsigned long flags) { }
 #endif /* CONFIG_PPC_BOOK3S_64 */
 #endif /* CONFIG_PPC_KUAP */
 
@@ -132,41 +132,6 @@ static __always_inline void kuap_assert_locked(void)
 		kuap_get_and_assert_locked();
 }
 
-#ifndef CONFIG_PPC_BOOK3S_64
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-				     unsigned long size, unsigned long dir)
-{
-	if (kuap_is_disabled())
-		return;
-
-	__allow_user_access(to, from, size, dir);
-}
-
-static __always_inline void prevent_user_access(unsigned long dir)
-{
-	if (kuap_is_disabled())
-		return;
-
-	__prevent_user_access(dir);
-}
-
-static __always_inline unsigned long prevent_user_access_return(void)
-{
-	if (kuap_is_disabled())
-		return 0;
-
-	return __prevent_user_access_return();
-}
-
-static __always_inline void restore_user_access(unsigned long flags)
-{
-	if (kuap_is_disabled())
-		return;
-
-	__restore_user_access(flags);
-}
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
 static __always_inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
 	barrier_nospec();
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index e231b3afed98..46bc5925e5fd 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -37,31 +37,43 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 #define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 #endif
 
-static __always_inline void __allow_user_access(void __user *to, const void __user *from,
-						unsigned long size, unsigned long dir)
+static __always_inline void uaccess_begin_8xx(unsigned long val)
 {
-	mtspr(SPRN_MD_AP, MD_APG_INIT);
+	asm(ASM_MMU_FTR_IFSET("mtspr %0, %1", "", %2) : :
+	    "i"(SPRN_MD_AP), "r"(val), "i"(MMU_FTR_KUAP) : "memory");
 }
 
-static __always_inline void __prevent_user_access(unsigned long dir)
+static __always_inline void uaccess_end_8xx(void)
 {
-	mtspr(SPRN_MD_AP, MD_APG_KUAP);
+	asm(ASM_MMU_FTR_IFSET("mtspr %0, %1", "", %2) : :
+	    "i"(SPRN_MD_AP), "r"(MD_APG_KUAP), "i"(MMU_FTR_KUAP) : "memory");
+}
+
+static __always_inline void allow_user_access(void __user *to, const void __user *from,
+					      unsigned long size, unsigned long dir)
+{
+	uaccess_begin_8xx(MD_APG_INIT);
 }
 
-static __always_inline unsigned long __prevent_user_access_return(void)
+static __always_inline void prevent_user_access(unsigned long dir)
+{
+	uaccess_end_8xx();
+}
+
+static __always_inline unsigned long prevent_user_access_return(void)
 {
 	unsigned long flags;
 
 	flags = mfspr(SPRN_MD_AP);
 
-	mtspr(SPRN_MD_AP, MD_APG_KUAP);
+	uaccess_end_8xx();
 
 	return flags;
 }
 
-static __always_inline void __restore_user_access(unsigned long flags)
+static __always_inline void restore_user_access(unsigned long flags)
 {
-	mtspr(SPRN_MD_AP, flags);
+	uaccess_begin_8xx(flags);
 }
 
 static __always_inline bool
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 98780a2d3dcd..0c7c3258134c 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -3,6 +3,7 @@
 #define _ASM_POWERPC_KUP_BOOKE_H_
 
 #include <asm/bug.h>
+#include <asm/mmu.h>
 
 #ifdef CONFIG_PPC_KUAP
 
@@ -60,35 +61,42 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 #define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 #endif
 
-static __always_inline void __allow_user_access(void __user *to, const void __user *from,
-						unsigned long size, unsigned long dir)
+static __always_inline void uaccess_begin_booke(unsigned long val)
 {
-	mtspr(SPRN_PID, current->thread.pid);
-	isync();
+	asm(ASM_MMU_FTR_IFSET("mtspr %0, %1; isync", "", %2) : :
+	    "i"(SPRN_PID), "r"(val), "i"(MMU_FTR_KUAP) : "memory");
 }
 
-static __always_inline void __prevent_user_access(unsigned long dir)
+static __always_inline void uaccess_end_booke(void)
 {
-	mtspr(SPRN_PID, 0);
-	isync();
+	asm(ASM_MMU_FTR_IFSET("mtspr %0, %1; isync", "", %2) : :
+	    "i"(SPRN_PID), "r"(0), "i"(MMU_FTR_KUAP) : "memory");
+}
+
+static __always_inline void allow_user_access(void __user *to, const void __user *from,
+					      unsigned long size, unsigned long dir)
+{
+	uaccess_begin_booke(current->thread.pid);
 }
 
-static __always_inline unsigned long __prevent_user_access_return(void)
+static __always_inline void prevent_user_access(unsigned long dir)
+{
+	uaccess_end_booke();
+}
+
+static __always_inline unsigned long prevent_user_access_return(void)
 {
 	unsigned long flags = mfspr(SPRN_PID);
 
-	mtspr(SPRN_PID, 0);
-	isync();
+	uaccess_end_booke();
 
 	return flags;
 }
 
-static __always_inline void __restore_user_access(unsigned long flags)
+static __always_inline void restore_user_access(unsigned long flags)
 {
-	if (flags) {
-		mtspr(SPRN_PID, current->thread.pid);
-		isync();
-	}
+	if (flags)
+		uaccess_begin_booke(current->thread.pid);
 }
 
 static __always_inline bool
diff --git a/arch/powerpc/mm/nohash/kup.c b/arch/powerpc/mm/nohash/kup.c
index 94ff82b9ae60..e1f7de2e54ec 100644
--- a/arch/powerpc/mm/nohash/kup.c
+++ b/arch/powerpc/mm/nohash/kup.c
@@ -24,6 +24,6 @@ void setup_kuap(bool disabled)
 
 	pr_info("Activating Kernel Userspace Access Protection\n");
 
-	__prevent_user_access(KUAP_READ_WRITE);
+	prevent_user_access(KUAP_READ_WRITE);
 }
 #endif
-- 
2.41.0

