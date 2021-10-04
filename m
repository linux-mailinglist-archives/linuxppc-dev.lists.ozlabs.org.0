Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC0A42122D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 17:00:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNP6C1J6lz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 02:00:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DrwqnIQ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DrwqnIQ9; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNP250Yrxz2yb5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:57:00 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id l6so50885plh.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnF/Kk6Kg4xjwWJUCOwcLK+8ZdHnYhvDLLdERkb09sQ=;
 b=DrwqnIQ9TmHiPidKcGOIbeHtEtUhkWJ5xg3jQZW95wB9kJzXSm3aijl2/TLNoQevMJ
 8oq1DhK0/zNcW2FuOSkKfz/4mbyJ4VNEugWIvk67WLV//m6lTgrIO4W2ti4bb/pzGb3v
 6FG37IFg8HkqKzeXl082/19dxHndb2dfIp0D/w2uyBwdsdqTmQ+oLCXirs9lq0BBtcLx
 ktgynDG8H89EcnjHetwMDpWtFFmyYLpHjI1UYKyHr4pBjceF5XfuQ6iXlDCD+g31JFAc
 HXTuzE300iqspl0YHOsjWp4lW0+fYnz4hv+iadiGzulyF25/Lr/KZgjF3QhvRQ1XGqZD
 9urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnF/Kk6Kg4xjwWJUCOwcLK+8ZdHnYhvDLLdERkb09sQ=;
 b=U61gLu0ycbQPE3pEDd6AzRRj1GMpngCOzA76u8RWqgnnMI1n++z3JL63L3aBZBHsj3
 HNwUpYVYYOd7qOOhEuA/DsYbjelavqlQ6513YgdcjDVsGbNYQIlJS/XJzFO1z6uRGu2S
 MD4lJlHsviT/Xe9KypreLs5dFlOFPZrmjjl59VrQc30IXHnDNqnivftGihJhPpomLIy5
 /RGLWfaL+UH6gnKvSaMi5xdZBhQb67xyVZYrnbXnR613ZhkChd03HHAclre5El34AR9p
 gigsvOYzs+I9MEXjq/RsUicPWh2KTzOCJ8LlE6sq1bTdBhMZUrXBYwGX37tJxVw1jZ91
 UoZg==
X-Gm-Message-State: AOAM5335soaFL2Vq0SfiMF/AdnRz2vcZVQ+pi1sECJXwfTepO/1y2ksK
 N7jeCmkzZubA3heweVKIqvNwf2L35Rk=
X-Google-Smtp-Source: ABdhPJxeSDvBjzwZ7WwyWJD9X3sZPVAGzM/iywxM1Wys1XBVqPTtCY3cLElzPKQTHwbA4TcNxhoETw==
X-Received: by 2002:a17:90b:4b0f:: with SMTP id
 lx15mr37086616pjb.126.1633359418903; 
 Mon, 04 Oct 2021 07:56:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id f16sm13194903pjj.56.2021.10.04.07.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:56:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powerpc/64s: Fix unrecoverable MCE calling async handler
 from NMI
Date: Tue,  5 Oct 2021 00:56:42 +1000
Message-Id: <20211004145642.1331214-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004145642.1331214-1-npiggin@gmail.com>
References: <20211004145642.1331214-1-npiggin@gmail.com>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The machine check handler is not considered NMI on 64s. The early
handler is the true NMI handler, and then it schedules the
machine_check_exception handler to run when interrupts are enabled.

This works fine except the case of an unrecoverable MCE, where the true
NMI is taken when MSR[RI] is clear, it can not recover, so it calls
machine_check_exception directly so something might be done about it.

Calling an async handler from NMI context can result in irq state and
other things getting corrupted. This can also trigger the BUG at
  arch/powerpc/include/asm/interrupt.h:168
  BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));

Fix this by making an _async version of the handler which is called
in the normal case, and a NMI version that is called for unrecoverable
interrupts.

Fixes: 2b43dd7653cc ("powerpc/64: enable MSR[EE] in irq replay pt_regs")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  5 ++---
 arch/powerpc/kernel/exceptions-64s.S |  8 +++++--
 arch/powerpc/kernel/traps.c          | 31 ++++++++++++++++------------
 3 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index b894b7169706..a1d238255f07 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -528,10 +528,9 @@ static __always_inline long ____##func(struct pt_regs *regs)
 /* kernel/traps.c */
 DECLARE_INTERRUPT_HANDLER_NMI(system_reset_exception);
 #ifdef CONFIG_PPC_BOOK3S_64
-DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception);
-#else
-DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
+DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception_async);
 #endif
+DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
 DECLARE_INTERRUPT_HANDLER(SMIException);
 DECLARE_INTERRUPT_HANDLER(handle_hmi_exception);
 DECLARE_INTERRUPT_HANDLER(unknown_exception);
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 024d9231f88c..eaf1f72131a1 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1243,7 +1243,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	li	r10,MSR_RI
 	mtmsrd 	r10,1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	machine_check_exception
+	bl	machine_check_exception_async
 	b	interrupt_return_srr
 
 
@@ -1303,7 +1303,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	subi	r12,r12,1
 	sth	r12,PACA_IN_MCE(r13)
 
-	/* Invoke machine_check_exception to print MCE event and panic. */
+	/*
+	 * Invoke machine_check_exception to print MCE event and panic.
+	 * This is the NMI version of the handler because we are called from
+	 * the early handler which is a true NMI.
+	 */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index e453b666613b..11741703d26e 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -796,24 +796,22 @@ void die_mce(const char *str, struct pt_regs *regs, long err)
 	 * do_exit() checks for in_interrupt() and panics in that case, so
 	 * exit the irq/nmi before calling die.
 	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
-		irq_exit();
-	else
+	if (in_nmi())
 		nmi_exit();
+	else
+		irq_exit();
 	die(str, regs, err);
 }
 
 /*
- * BOOK3S_64 does not call this handler as a non-maskable interrupt
+ * BOOK3S_64 does not usually call this handler as a non-maskable interrupt
  * (it uses its own early real-mode handler to handle the MCE proper
  * and then raises irq_work to call this handler when interrupts are
- * enabled).
+ * enabled). The only time when this is not true is if the early handler
+ * is unrecoverable, then it does call this directly to try to get a
+ * message out.
  */
-#ifdef CONFIG_PPC_BOOK3S_64
-DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
-#else
-DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
-#endif
+static void __machine_check_exception(struct pt_regs *regs)
 {
 	int recover = 0;
 
@@ -847,12 +845,19 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 	/* Must die if the interrupt is not recoverable */
 	if (regs_is_unrecoverable(regs))
 		die_mce("Unrecoverable Machine check", regs, SIGBUS);
+}
 
 #ifdef CONFIG_PPC_BOOK3S_64
-	return;
-#else
-	return 0;
+DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception_async)
+{
+	__machine_check_exception(regs);
+}
 #endif
+DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
+{
+	__machine_check_exception(regs);
+
+	return 0;
 }
 
 DEFINE_INTERRUPT_HANDLER(SMIException) /* async? */
-- 
2.23.0

