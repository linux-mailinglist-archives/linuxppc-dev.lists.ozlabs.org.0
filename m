Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AF8400014
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 14:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1Hsp08psz2yZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 22:58:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q7fi63e2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Q7fi63e2; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1HrM3Rn9z2yJW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 22:57:22 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so3235830pje.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Sep 2021 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EaQ2fooX1vPRz5N6SHbztxU39g6t8gfSHCl0iqSubxY=;
 b=Q7fi63e2JDvRP1J0orz2dbR6ZKvha0CzsULb8M5kbedvKl6Twpx1qHXodKhMgVr1Zb
 h7shfWZIjifVEOLgMMFN9rTzboGFGleiEMJ4dulcOiSadr0VsPH6Q7sVNTviVoYOVKVe
 HeTnk9YlZJSKSdGAtBv7JROvYiXwBXvKW31/Xr2a/0eyYuxt/v4cuMdOqd5qeVHobMfp
 8KZbuKrFtwh5eIzhyhomWjbY+nsim0EyVZKHprYZlxOuluf7p4wW7ex1hkbPpIPO9yws
 Ki6YefKjHBkOaSmi04mCzdGpiGzZ2JqOXKiAXzO0eGvEerge5LsO84oYUclMKo9pV3Dp
 jXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EaQ2fooX1vPRz5N6SHbztxU39g6t8gfSHCl0iqSubxY=;
 b=rr4aPipWuzpKUyuk7vmjtQD8j18ZgBN0A3DI0ML+6eKpE6IOC6YxiYlo1mTnRsr1+E
 OJg2TSvgG/FTg3P3uLZPDnz1FVT8sS0RW6RjtKhBXcdMvuzFMAU602rauWPdnY1a0BWt
 ShA3cJPrRXp7CxNFBw9KtnsA2X1Qa6NIvTGTDEciKjk2JpSBMcWAvsaUGeNEVsY3ljoS
 dDUL+/i/tTF442qajUNsdV8gGIco2htNRbWMtAQT2EDhYmZvi3sg1HDoum5uG5iCz1c2
 cw1AwGcFr8uaQx6LspkPu5Sne7ZEU2f9DZfjp0o8Ww2v4w6B/rCr/GSkXM4S7DRIvx7M
 54+w==
X-Gm-Message-State: AOAM532j9SGjxIvfM3CcFd4Ur4FPkRykP+TeYqyJg0XctngxpMy4M8jg
 riu9e7Io+CCCQsJhgmselTNeD01tU14=
X-Google-Smtp-Source: ABdhPJzy/LHfUrBkLmdwqz4YM32CPs8O67OWsOd/EZ8BwXZSV0736RrKaFNksA0VmOVKwNys8T/KIw==
X-Received: by 2002:a17:902:ab52:b0:12d:92b8:60c7 with SMTP id
 ij18-20020a170902ab5200b0012d92b860c7mr2887563plb.44.1630673837533; 
 Fri, 03 Sep 2021 05:57:17 -0700 (PDT)
Received: from bobo.ibm.com (203-219-56-12.tpgi.com.au. [203.219.56.12])
 by smtp.gmail.com with ESMTPSA id x16sm6352225pgc.49.2021.09.03.05.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:57:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] powerpc/64s: system call scv tabort fix for corrupt
 irq soft-mask state
Date: Fri,  3 Sep 2021 22:57:06 +1000
Message-Id: <20210903125707.1601269-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Eirik Fuller <efuller@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a system call is made with a transaction active, the kernel
immediately aborts it and returns. scv system calls disable irqs even
earlier in their interrupt handler, and tabort_syscall does not fix this
up.

This can result in irq soft-mask state being messed up on the next
kernel entry, and crashing at BUG_ON(arch_irq_disabled_regs(regs)) in
the kernel exit handlers, or possibly worse.

This can't easily be fixed in asm because at this point an async irq may
have hit, which is soft-masked and marked pending. The pending interrupt
has to be replayed before returning to userspace. The fix is to move the
tabort_syscall code to C in the main syscall handler, and just skip the
system call but otherwise return as usual, which will take care of the
pending irqs. This also does a bunch of other things including possible
signal delivery to the process, but the doomed transaction should still
be aborted when it is eventually returned to.

The sc system call path is changed to use the new C function as well to
reduce code and path differences. This slows down how quickly system
calls are aborted when called while a transaction is active, which could
potentially impact TM performance. But making any system call is already
bad for performance, and TM is on the way out, so go with simpler over
faster.

Reported-by: Eirik Fuller <efuller@redhat.com>
Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv instructions")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

v2 of this fix had a bug where an irq could be soft masked and pending
before we hard disable interrupts in tabort_syscall for the case of
scv (because it enters the kernel with EE enabled). So this actually
requires a pretty large change to fix because we can't replay interrupts
just from this early asm context.

Thanks,
Nick

 arch/powerpc/kernel/interrupt.c    | 29 +++++++++++++++++++++
 arch/powerpc/kernel/interrupt_64.S | 41 ------------------------------
 2 files changed, 29 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 21bbd615ca41..c77c80214ad3 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -19,6 +19,7 @@
 #include <asm/switch_to.h>
 #include <asm/syscall.h>
 #include <asm/time.h>
+#include <asm/tm.h>
 #include <asm/unistd.h>
 
 #if defined(CONFIG_PPC_ADV_DEBUG_REGS) && defined(CONFIG_PPC32)
@@ -138,6 +139,34 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	 */
 	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
 
+	/*
+	 * If the system call was made with a transaction active, doom it and
+	 * return without performing the system call. Unless it was an
+	 * unsupported scv vector, in which case it's treated like an illegal
+	 * instruction.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+			unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
+			!trap_is_unsupported_scv(regs)) {
+		/* Enable TM in the kernel, and disable EE (for scv) */
+		hard_irq_disable();
+		mtmsr(mfmsr() | MSR_TM);
+
+		/* tabort, this dooms the transaction, nothing else */
+		asm volatile(".long 0x7c00071d | ((%0) << 16)"
+				:: "r"(TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT));
+
+		/*
+		 * Userspace will never see the return value. Execution will
+		 * resume after the tbegin. of the aborted transaction with the
+		 * checkpointed register state. A context switch could occur
+		 * or signal delivered to the process before resuming the
+		 * doomed transaction context, but that should all be handled
+		 * as expected.
+		 */
+		return -ENOSYS;
+	}
+
 	local_irq_enable();
 
 	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index d4212d2ff0b5..ec950b08a8dc 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -12,7 +12,6 @@
 #include <asm/mmu.h>
 #include <asm/ppc_asm.h>
 #include <asm/ptrace.h>
-#include <asm/tm.h>
 
 	.section	".toc","aw"
 SYS_CALL_TABLE:
@@ -55,12 +54,6 @@ COMPAT_SYS_CALL_TABLE:
 	.globl system_call_vectored_\name
 system_call_vectored_\name:
 _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-BEGIN_FTR_SECTION
-	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
-	bne	tabort_syscall
-END_FTR_SECTION_IFSET(CPU_FTR_TM)
-#endif
 	SCV_INTERRUPT_TO_KERNEL
 	mr	r10,r1
 	ld	r1,PACAKSAVE(r13)
@@ -247,12 +240,6 @@ _ASM_NOKPROBE_SYMBOL(system_call_common_real)
 	.globl system_call_common
 system_call_common:
 _ASM_NOKPROBE_SYMBOL(system_call_common)
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-BEGIN_FTR_SECTION
-	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
-	bne	tabort_syscall
-END_FTR_SECTION_IFSET(CPU_FTR_TM)
-#endif
 	mr	r10,r1
 	ld	r1,PACAKSAVE(r13)
 	std	r10,0(r1)
@@ -425,34 +412,6 @@ SOFT_MASK_TABLE(.Lsyscall_rst_start, 1b)
 RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
 #endif
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-tabort_syscall:
-_ASM_NOKPROBE_SYMBOL(tabort_syscall)
-	/* Firstly we need to enable TM in the kernel */
-	mfmsr	r10
-	li	r9, 1
-	rldimi	r10, r9, MSR_TM_LG, 63-MSR_TM_LG
-	mtmsrd	r10, 0
-
-	/* tabort, this dooms the transaction, nothing else */
-	li	r9, (TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT)
-	TABORT(R9)
-
-	/*
-	 * Return directly to userspace. We have corrupted user register state,
-	 * but userspace will never see that register state. Execution will
-	 * resume after the tbegin of the aborted transaction with the
-	 * checkpointed register state.
-	 */
-	li	r9, MSR_RI
-	andc	r10, r10, r9
-	mtmsrd	r10, 1
-	mtspr	SPRN_SRR0, r11
-	mtspr	SPRN_SRR1, r12
-	RFI_TO_USER
-	b	.	/* prevent speculative execution */
-#endif
-
 	/*
 	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
 	 * touched, no exit work created, then this can be used.
-- 
2.23.0

