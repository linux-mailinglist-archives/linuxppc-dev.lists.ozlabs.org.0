Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF47423E31
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 14:51:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPZ822TFhz3cCN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPZ534SFHz3c54
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 23:48:39 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HPZ4T0wL5z9sWg;
 Wed,  6 Oct 2021 14:48:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqxEuLm0EU_c; Wed,  6 Oct 2021 14:48:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HPZ4M41yVz9sW1;
 Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6FC818B77E;
 Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id s5iktsO5hlpc; Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.229])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D8B98B788;
 Wed,  6 Oct 2021 14:48:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 196Clppg579416
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 6 Oct 2021 14:47:52 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 196ChsrQ579289;
 Wed, 6 Oct 2021 14:43:54 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 09/15] powerpc/kuap: Prepare for supporting KUAP on
 BOOK3E/64
Date: Wed,  6 Oct 2021 14:43:42 +0200
Message-Id: <0ced530e0d438741f934861eb77d8c437576d1b0.1633523837.git.christophe.leroy@csgroup.eu>
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
index 6690a41900f2..bf7e59f3d17f 100644
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
index 92b70e18d888..cb9d4a13a9a5 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -91,7 +91,6 @@ static __always_inline void kuap_assert_locked(void)
 		__kuap_get_and_assert_locked();
 }
 
-#ifdef CONFIG_PPC32
 static __always_inline void kuap_lock(void)
 {
 	if (kuap_is_disabled())
@@ -107,7 +106,6 @@ static __always_inline void kuap_save_and_lock(struct pt_regs *regs)
 
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

