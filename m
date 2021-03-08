Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7EA330AAD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 10:56:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvDJZ54n6z3dss
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 20:56:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tXgGSZf3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tXgGSZf3; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvDF50bHKz3dHb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 20:53:44 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so2673665pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 01:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fMyd3ExB+D3RYpMKi1qll2C4n+r32rcx5xoyAOb1F70=;
 b=tXgGSZf350UPOZVF2XD2RpCN7Snphp4RtOW/Pin2aGJVUu46ptxqg93SoQItKYtIh3
 Y8rWSUJLlXHGUCjLPQOXqsXvapGu9fbvR7qIS9lOBa3JG9i0qI9uGiV6rmD2SDitDTMl
 DcUF0hNE/O2mGtOal9yK/GVpfhX4jlDBeM2iW+kcHaVncceplZf4cOSUgYVu5P92B3Kp
 zd9pFcKTlYsqo1QsrcBDUPwY/NnO6OvzxlTE+Tn2Kj19xh3aAZw13aTcC1v2XKEVw6K9
 2y8cRkl2YfE19ct67n37HazB6dRNToF6JITrsUn+R9aufJDTAlq+nBDS5rhNuV7k//2W
 ceag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fMyd3ExB+D3RYpMKi1qll2C4n+r32rcx5xoyAOb1F70=;
 b=Vgwc7UvSuCHCIJoLt2CyZNatDMH0dqrnPihoRz6s+WNNC+8oM8v37GSxSSHkLyF/fl
 e92XTgdLS9iM3bDo1w51QwBjua7jXRLSghhEtH3aTMxgOcaOmRd+/WVpRBbipqbrdJrf
 gDxcysdm/v6Vn7oAiOXUpH6pMDQUHHzCLkkUZdqIg8CSqq9Zk/gqWszjD3uIdxFcKXVF
 nG4Ol/A3QH0sDr86VM/MrBHzlhD+XCz2eJ3DYyqoRMcu3+cddOBtp2KF8tjw0CYQv5RI
 rPP6mxXPwcV8/YWCPDS5+BBkriKobyrBTQog+rT0MZsITwZiGWsAuEX2IGaC3Vv3JeVu
 AnhA==
X-Gm-Message-State: AOAM530amBXDbN0cgAQz/mbDNwLP15wAS4eOuBs2GXsismokHi8dLZj1
 CxxGGR7c6Fpjbu4J9cc50vGz1sPcxPw=
X-Google-Smtp-Source: ABdhPJxRqb6SCh5nBs7edR4sF49rEzijfaldyvqyGDwqQVyVDDY4T52i/gtI2U0nXkln/y2t8GthlA==
X-Received: by 2002:a17:90b:1950:: with SMTP id
 nk16mr23821467pjb.140.1615197222271; 
 Mon, 08 Mar 2021 01:53:42 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 e63sm1326850pfe.208.2021.03.08.01.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:53:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 7/7] powerpc/64e/interrupt: Use new interrupt context
 tracking scheme
Date: Mon,  8 Mar 2021 19:52:44 +1000
Message-Id: <20210308095244.3195782-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210308095244.3195782-1-npiggin@gmail.com>
References: <20210308095244.3195782-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the new interrupt exit code, context tracking can be managed
more precisely, so remove the last of the 64e workarounds and switch
to the new context tracking code already used by 64s.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 28 ----------------------------
 arch/powerpc/kernel/interrupt.c      | 12 ------------
 2 files changed, 40 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index a57db901c16d..79c4f5596704 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -10,9 +10,6 @@
 #include <asm/runlatch.h>
 
 struct interrupt_state {
-#ifdef CONFIG_PPC_BOOK3E_64
-	enum ctx_state ctx_state;
-#endif
 };
 
 static inline void booke_restore_dbcr0(void)
@@ -33,9 +30,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
 		trace_hardirqs_off();
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-#endif
 
-#ifdef CONFIG_PPC_BOOK3S_64
 	if (user_mode(regs)) {
 		CT_WARN_ON(ct_state() != CONTEXT_USER);
 		user_exit_irqoff();
@@ -51,12 +46,6 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
 	}
 #endif
-
-#ifdef CONFIG_PPC_BOOK3E_64
-	state->ctx_state = exception_enter();
-	if (user_mode(regs))
-		account_cpu_user_entry();
-#endif
 }
 
 /*
@@ -75,23 +64,6 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
  */
 static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-#ifdef CONFIG_PPC_BOOK3E_64
-	exception_exit(state->ctx_state);
-#endif
-
-	/*
-	 * Book3S exits to user via interrupt_exit_user_prepare(), which does
-	 * context tracking, which is a cleaner way to handle PREEMPT=y
-	 * and avoid context entry/exit in e.g., preempt_schedule_irq()),
-	 * which is likely to be where the core code wants to end up.
-	 *
-	 * The above comment explains why we can't do the
-	 *
-	 *     if (user_mode(regs))
-	 *         user_exit_irqoff();
-	 *
-	 * sequence here.
-	 */
 }
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 44b62a97f021..02ba5afc6fb0 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -228,10 +228,6 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
-/* temporary hack for context tracking, removed in later patch */
-#include <linux/sched/debug.h>
-asmlinkage __visible void __sched schedule_user(void);
-
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -291,11 +287,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable();
 		if (ti_flags & _TIF_NEED_RESCHED) {
-#ifdef CONFIG_PPC_BOOK3E_64
-			schedule_user();
-#else
 			schedule();
-#endif
 		} else {
 			/*
 			 * SIGPENDING must restore signal handler function
@@ -391,11 +383,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable(); /* returning to user: may enable */
 		if (ti_flags & _TIF_NEED_RESCHED) {
-#ifdef CONFIG_PPC_BOOK3E_64
-			schedule_user();
-#else
 			schedule();
-#endif
 		} else {
 			if (ti_flags & _TIF_SIGPENDING)
 				ret |= _TIF_RESTOREALL;
-- 
2.23.0

