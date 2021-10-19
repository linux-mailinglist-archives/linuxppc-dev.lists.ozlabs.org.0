Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D556F432F77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:30:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQQG3cDNz3cjs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:30:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQPS4ggSz2yg1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:30:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPD3C0Hz9sTG;
 Tue, 19 Oct 2021 09:29:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eD8eDPgN60Zf; Tue, 19 Oct 2021 09:29:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP66fckz9sSP;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CEA1F8B763;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id q5L3S-iUZYyj; Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E7DD8B774;
 Tue, 19 Oct 2021 09:29:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7TdKn3188446
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:39 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7TdFU3188445;
 Tue, 19 Oct 2021 09:29:39 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 12/22] powerpc/kuap: Add kuap_lock()
Date: Tue, 19 Oct 2021 09:29:23 +0200
Message-Id: <4437e2deb9f6f549f7089d45e9c6f96a7e77905a.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628571; l=4983; s=20211009;
 h=from:subject:message-id; bh=OG06PsA20KVkD3ydwaNJ+DNWXgByRWfXgPBTd695G8I=;
 b=Ve6/JbxRpT+GV1ucOYAUFYxjj3WyuJEtjaflB32+W4MRPaR0M9smPvC2DaVvMDuE9GaM0HxjqVoV
 77mHgci+AFFWFRI6t3K1y1qElY6IoIgVMfStLSj3NVXGEEs23Llm
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

Add kuap_lock() and call it when entering interrupts from user.

It is called kuap_lock() as it is similar to kuap_save_and_lock()
without the save.

However book3s/32 already have a kuap_lock(). Rename it
kuap_lock_addr().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     | 14 +++++++++-----
 arch/powerpc/include/asm/interrupt.h         |  5 ++++-
 arch/powerpc/include/asm/kup.h               |  9 +++++++++
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  4 ++++
 arch/powerpc/kernel/interrupt.c              |  2 ++
 5 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index bc245e9f0bcc..678f9c9d89b6 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -57,7 +57,7 @@ static inline void kuap_unlock_all(void)
 void kuap_lock_all_ool(void);
 void kuap_unlock_all_ool(void);
 
-static inline void kuap_lock(unsigned long addr, bool ool)
+static inline void kuap_lock_addr(unsigned long addr, bool ool)
 {
 	if (likely(addr != KUAP_ALL))
 		kuap_lock_one(addr);
@@ -77,6 +77,10 @@ static inline void kuap_unlock(unsigned long addr, bool ool)
 		kuap_unlock_all_ool();
 }
 
+static inline void __kuap_lock(void)
+{
+}
+
 static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	unsigned long kuap = current->thread.kuap;
@@ -86,7 +90,7 @@ static inline void __kuap_save_and_lock(struct pt_regs *regs)
 		return;
 
 	current->thread.kuap = KUAP_NONE;
-	kuap_lock(kuap, false);
+	kuap_lock_addr(kuap, false);
 }
 
 static inline void kuap_user_restore(struct pt_regs *regs)
@@ -97,7 +101,7 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kua
 {
 	if (unlikely(kuap != KUAP_NONE)) {
 		current->thread.kuap = KUAP_NONE;
-		kuap_lock(kuap, false);
+		kuap_lock_addr(kuap, false);
 	}
 
 	if (likely(regs->kuap == KUAP_NONE))
@@ -139,7 +143,7 @@ static __always_inline void __prevent_user_access(unsigned long dir)
 		return;
 
 	current->thread.kuap = KUAP_NONE;
-	kuap_lock(kuap, true);
+	kuap_lock_addr(kuap, true);
 }
 
 static inline unsigned long __prevent_user_access_return(void)
@@ -148,7 +152,7 @@ static inline unsigned long __prevent_user_access_return(void)
 
 	if (flags != KUAP_NONE) {
 		current->thread.kuap = KUAP_NONE;
-		kuap_lock(flags, true);
+		kuap_lock_addr(flags, true);
 	}
 
 	return flags;
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 3bbca1fbbe1e..ae719e200c80 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -140,9 +140,12 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		trace_hardirqs_off();
 
 	if (user_mode(regs))
-		account_cpu_user_entry();
+		kuap_lock();
 	else
 		kuap_save_and_lock(regs);
+
+	if (user_mode(regs))
+		account_cpu_user_entry();
 #endif
 
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 5d3c1e8060f9..34574a7455ce 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -49,6 +49,7 @@ __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 }
 
 static inline void __kuap_assert_locked(void) { }
+static inline void __kuap_lock(void) { }
 static inline void __kuap_save_and_lock(struct pt_regs *regs) { }
 static inline void kuap_user_restore(struct pt_regs *regs) { }
 static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long amr) { }
@@ -91,6 +92,14 @@ static __always_inline void kuap_assert_locked(void)
 }
 
 #ifdef CONFIG_PPC32
+static __always_inline void kuap_lock(void)
+{
+	if (kuap_is_disabled())
+		return;
+
+	__kuap_lock();
+}
+
 static __always_inline void kuap_save_and_lock(struct pt_regs *regs)
 {
 	if (kuap_is_disabled())
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 37fe4b32b658..c44d97751723 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -20,6 +20,10 @@ static __always_inline bool kuap_is_disabled(void)
 	return static_branch_unlikely(&disable_kuap_key);
 }
 
+static inline void __kuap_lock(void)
+{
+}
+
 static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	regs->kuap = mfspr(SPRN_MD_AP);
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 0d12aa66e1f9..dc56a514df0a 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -81,6 +81,8 @@ notrace long system_call_exception(long r3, long r4, long r5,
 {
 	syscall_fn f;
 
+	kuap_lock();
+
 	regs->orig_gpr3 = r3;
 
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-- 
2.31.1

