Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36368426DC4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 17:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQss20wlVz3cX9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 02:42:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQsqG41Brz30Qx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 02:41:14 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HQsq05nKRz9sSf;
 Fri,  8 Oct 2021 17:41:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHOPbcXi_jfH; Fri,  8 Oct 2021 17:41:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HQspx4L08z9sS8;
 Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DF7A8B763;
 Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Sulsuqp-jDzj; Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.75])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC8CE8B78F;
 Fri,  8 Oct 2021 17:40:56 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 198FenQp1129676
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 8 Oct 2021 17:40:49 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 198Fenxx1129675;
 Fri, 8 Oct 2021 17:40:49 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 09/16] powerpc/kuap: Prepare for supporting KUAP on
 BOOK3E/64
Date: Fri,  8 Oct 2021 17:40:37 +0200
Message-Id: <4b67460f6820694ab54ca29028a6972e1d113bb7.1633707305.git.christophe.leroy@csgroup.eu>
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

Also call kuap_lock() and kuap_save_and_lock() from
interrupt functions with CONFIG_PPC64.

For book3s/64 we keep them empty as it is done in assembly.

Also do the locked assert when switching task unless it is
book3s/64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 9 +++++++++
 arch/powerpc/include/asm/interrupt.h     | 2 ++
 arch/powerpc/include/asm/kup.h           | 2 --
 arch/powerpc/kernel/process.c            | 6 +++---
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 503828709d55..69fcf63eec94 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -298,6 +298,15 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 	return amr;
 }
 
+/* Do nothing, book3s/64 does that in ASM */
+static inline void __kuap_lock(void)
+{
+}
+
+static inline void __kuap_save_and_lock(struct pt_regs *regs)
+{
+}
+
 /*
  * We support individually allowing read or write, but we don't support nesting
  * because that would require an expensive read/modify write of the AMR.
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index ae719e200c80..cd78dbca49e5 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -154,12 +154,14 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
 	if (user_mode(regs)) {
+		kuap_lock();
 		CT_WARN_ON(ct_state() != CONTEXT_USER);
 		user_exit_irqoff();
 
 		account_cpu_user_entry();
 		account_stolen_time();
 	} else {
+		kuap_save_and_lock(regs);
 		/*
 		 * CT_WARN_ON comes here via program_check_exception,
 		 * so avoid recursion.
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 2e0c2df21b3b..0cafcf8319cd 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -94,7 +94,6 @@ static __always_inline void kuap_assert_locked(void)
 		__kuap_get_and_assert_locked();
 }
 
-#ifdef CONFIG_PPC32
 static __always_inline void kuap_lock(void)
 {
 	if (kuap_is_disabled())
@@ -110,7 +109,6 @@ static __always_inline void kuap_save_and_lock(struct pt_regs *regs)
 
 	__kuap_save_and_lock(regs);
 }
-#endif
 
 static __always_inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
 {
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 50436b52c213..2c637740c0c2 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1281,9 +1281,9 @@ struct task_struct *__switch_to(struct task_struct *prev,
 
 	set_return_regs_changed(); /* _switch changes stack (and regs) */
 
-#ifdef CONFIG_PPC32
-	kuap_assert_locked();
-#endif
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		kuap_assert_locked();
+
 	last = _switch(old_thread, new_thread);
 
 	/*
-- 
2.31.1

