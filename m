Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E78412C6FBA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:06:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjvvV0L32zF1cK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oswvTewl; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMj5rmkzDsM9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:53 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id 34so6599354pgp.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oLnmutyJfFM4IdwVIFttl2OG+zX3XwPjUqRfqEGeS+g=;
 b=oswvTewlyFFDTmlh8BoKE+zqg+qKNOWLyrvHY3+mv2kALEtnPcLvJvs9Wv3RDrZcJR
 ph914jefvLP+83XmtcSZ/k7OUAJG1kNp3U7M1aKO3FQDYfu+MFzWj2B8YKJDZhyGjGz0
 d82lVDUgb8WVPJN7Cv5HB5RZYccA5LjPDjXFTK+9kjQmqOyOT/QIl0JzSFdyWrmrccdv
 r3TSqk0pB3mQGWfhA2UsBGR/PMC53IZsVKguUCQUY4WiTw0LjVvS7MMuVhBtp4YIgH9K
 lh8Hf+oK4Ft1e9rS5TPZ9JydzxSpLGUlo9mirp9Iw12geLtvWE0W75b//mfr3OMrmR+Q
 Q3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oLnmutyJfFM4IdwVIFttl2OG+zX3XwPjUqRfqEGeS+g=;
 b=Uczxuga/q4nfLXnpTn7OJWwVCo6afxRVdtgCYXmq/4Aenz1LsSy73NvPlsLHycRhyG
 wvzoHbGB54Ss8rRHjMqTuFhfjcOWuYS/aJg+1M7ReJ6YP8sKxr7o39L3rr7isFa/FDEt
 AeO1BWeOoGuNAVlFCJOOfOurPujmOYgCe5VVCTtiOV65xSF0E4tEZervACwLc1HW+80F
 OorPv6DV1fm8iAn7bmTbnnwj/zbmcVjDUrpjJx2fqz3WebGaQRKcjnq+u0u7ea9jyMr5
 Xw0d27I7zTJvcvdK5uQkZi0/EbOnr7DWK1sMXbNfIOa4Y8iKw2czZVn1yE7JcBKCL2WG
 JecA==
X-Gm-Message-State: AOAM5304NUZ1T5KjR1nLte0LBFKgrgQSRpl99FY6Y8g06Tf0yXi2+a8g
 fsHEtzfpSA1zZbPedhfOgRcRfj9FQ6g=
X-Google-Smtp-Source: ABdhPJykMNDmj3bXm0MZATWWwDCNjUDOfk4KhvyUwnW++52byuKtjOi9a9qJvQlqnxIxR7Qj4VpvEQ==
X-Received: by 2002:a63:d1b:: with SMTP id c27mr10711420pgl.25.1606574508823; 
 Sat, 28 Nov 2020 06:41:48 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:48 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/19] powerpc/64s: move context tracking exit to interrupt
 exit path
Date: Sun, 29 Nov 2020 00:41:07 +1000
Message-Id: <20201128144114.944000-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128144114.944000-1-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
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

The interrupt handler wrapper functions are not the ideal place to
maintain context tracking because after they return, the low level exit
code must then determine if there are interrupts to replay, or if the
task should be preempted, etc. Those paths (e.g., schedule_user) include
their own exception_enter/exit pairs to fix this up but it's a bit hacky
(see schedule_user() comments).

Ideally context tracking will go to user mode only when there are no
more interrupts or context switches or other exit processing work to
handle.

64e can not do this because it does not use the C interrupt exit code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 34 +++++++++++++++++++++++++---
 arch/powerpc/kernel/syscall_64.c     |  9 ++++++++
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 21acf0d0154f..542ad8e9c313 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -7,16 +7,30 @@
 #include <asm/ftrace.h>
 
 struct interrupt_state {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3E_64
 	enum ctx_state ctx_state;
 #endif
 };
 
 static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3E_64
 	state->ctx_state = exception_enter();
 #endif
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (user_mode(regs)) {
+		CT_WARN_ON(ct_state() != CONTEXT_USER);
+		user_exit_irqoff();
+	} else {
+		/*
+		 * CT_WARN_ON comes here via program_check_exception,
+		 * so avoid recursion.
+		 */
+		if (TRAP(regs) != 0x700)
+			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
+	}
+#endif
 }
 
 /*
@@ -35,9 +49,23 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
  */
 static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3E_64
 	exception_exit(state->ctx_state);
 #endif
+
+	/*
+	 * Book3S exits to user via interrupt_exit_user_prepare(), which does
+	 * context tracking, which is a cleaner way to handle PREEMPT=y
+	 * and avoid context entry/exit in e.g., preempt_schedule_irq()),
+	 * which is likely to be where the core code wants to end up.
+	 *
+	 * The above comment explains why we can't do the
+	 *
+	 *     if (user_mode(regs))
+	 *         user_exit_irqoff();
+	 *
+	 * sequence here.
+	 */
 }
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 9e855b25bd15..668a4557fc3f 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -275,6 +275,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -317,7 +318,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
+	user_enter_irqoff();
 	if (unlikely(!prep_irq_for_enabled_exit(true))) {
+		user_exit_irqoff();
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
@@ -358,6 +361,12 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 		unrecoverable_exception(regs);
 	BUG_ON(regs->msr & MSR_PR);
 	BUG_ON(!FULL_REGS(regs));
+	/*
+	 * CT_WARN_ON comes here via program_check_exception,
+	 * so avoid recursion.
+	 */
+	if (TRAP(regs) != 0x700)
+		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	amr = kuap_get_and_check_amr();
 
-- 
2.23.0

