Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A399B33D21B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 11:45:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F091W4pvyz3cmH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 21:45:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PTDmzI9G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PTDmzI9G; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F08yB26H9z30Gd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 21:42:58 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id a188so8533424pfb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mPi6ooyp+9wgTq2W6XA8eMkBMyITmYel8jyNXdL2nGk=;
 b=PTDmzI9GXuk3hPG2/zTH+bbmuqsn5swPFOlS3vZ7AJ9XgABaIe+2qrLGtKFqYzBNj2
 1Oa8TPt9QGegcwkHGZPeXm53joB9kyk1IFi6w46+PrAvdaniGzyoAFa292ZTgrQhfyQ/
 EBPLRf2N8ipmuc1Thysu0IoWqjKGvh72KppoIxpj9K9XpufDBlpO6y10/5y04dT1ZHCS
 xCdgzc0m12Oimn815KvEaGEeiGw4LCmWXGOqcMBNCTE62LKGxoJUJAILzLPBE4tvw2wn
 FZ1MbKnJZ25SwcOiDkg36uvH3/suv867j/w7o/moZOrUIAlvvdUOkX9F9ACw1BFSfGEW
 z2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mPi6ooyp+9wgTq2W6XA8eMkBMyITmYel8jyNXdL2nGk=;
 b=W68+X+K6rnJHm1cYAOFYxkcUaZccH8CiF0gDJtxW0d2q+TLS3ZgMPN6Y6ITshKROnk
 coIlpPCXi3qws7GfXo5XqHBRmqFI/MwXjo1uVkdVUNm/g5hDRrZ+cGBLsseQIJwe+maj
 nYl/T5ctRQjC6LG0RRMzQibjCbgqt+A79zcKchkKL7d/DiC7i6M0ib2CAS0j6pMaTico
 +Ni+We9ZWFKKJ4aLDYs41pNSrR/WXoHZcz8hlA+r9icztnnLwI1xzYZR+IIQMw9s78X1
 as4ZmC9177bnHtM04qcc5jOpP7bPtLrCvcVgFRBjQVhHTBkL1WSnkF+OwO0Tq3j3AJT6
 s/YQ==
X-Gm-Message-State: AOAM533jIz+XAJjizlgyS9/GF1Er9OhrRsLTptchEOK9O3cz9dIokEZk
 Y55LeNeZBQAm6frPd5L1f4ZxNwFurXc=
X-Google-Smtp-Source: ABdhPJx03Meg1sdR55rRsXrauUCaUZAwfAogD3Ax1CWlxAbHBD5oPJDEwUTQs0AsNK0UwEaQqrzqOQ==
X-Received: by 2002:aa7:8e43:0:b029:1ed:447c:f1d4 with SMTP id
 d3-20020aa78e430000b02901ed447cf1d4mr14084826pfr.16.1615891376045; 
 Tue, 16 Mar 2021 03:42:56 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 r30sm15828489pgu.86.2021.03.16.03.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:42:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/11] powerpc/64e/interrupt: Use new interrupt context
 tracking scheme
Date: Tue, 16 Mar 2021 20:42:01 +1000
Message-Id: <20210316104206.407354-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210316104206.407354-1-npiggin@gmail.com>
References: <20210316104206.407354-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the new interrupt exit code, context tracking can be managed
more precisely, so remove the last of the 64e workarounds and switch
to the new context tracking code already used by 64s.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 28 ----------------------------
 arch/powerpc/kernel/interrupt.c      | 16 +---------------
 2 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 29b48d083156..94fd8e1ff52c 100644
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
@@ -45,9 +42,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
 		trace_hardirqs_off();
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-#endif
 
-#ifdef CONFIG_PPC_BOOK3S_64
 	if (user_mode(regs)) {
 		CT_WARN_ON(ct_state() != CONTEXT_USER);
 		user_exit_irqoff();
@@ -64,12 +59,6 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 	}
 #endif
 
-#ifdef CONFIG_PPC_BOOK3E_64
-	state->ctx_state = exception_enter();
-	if (user_mode(regs))
-		account_cpu_user_entry();
-#endif
-
 	booke_restore_dbcr0();
 }
 
@@ -89,25 +78,8 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
  */
 static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-#ifdef CONFIG_PPC_BOOK3E_64
-	exception_exit(state->ctx_state);
-#endif
-
 	if (user_mode(regs))
 		kuep_unlock();
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
index 381a618b5b5b..1b0e1792ac37 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -235,10 +235,6 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
-/* temporary hack for context tracking, removed in later patch */
-#include <linux/sched/debug.h>
-asmlinkage __visible void __sched schedule_user(void);
-
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -296,11 +292,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
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
@@ -375,9 +367,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
-#ifdef CONFIG_PPC_BOOK3S_64
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
-#endif
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -392,11 +382,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
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
@@ -464,7 +450,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
 	 */
-	if (IS_ENABLED(CONFIG_BOOKS) && TRAP(regs) != 0x700)
+	if (TRAP(regs) != 0x700)
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	kuap = kuap_get_and_assert_locked();
-- 
2.23.0

