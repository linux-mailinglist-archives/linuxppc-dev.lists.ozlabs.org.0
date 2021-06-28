Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA73F3B5A12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 09:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD0DC4lCFz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:51:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=b4AVYyJd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b4AVYyJd; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD0BN6T35z3021
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 17:49:48 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id g24so9550499pji.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WdN6NkByScw7Bh//CEiVXa61bonsAZAyoZ4Pgukyj6A=;
 b=b4AVYyJdKRcLo1gq4ysEFKy1fGpGq5L1S4k2e9wzpGaOLqcvOxZ0FtXnRQC80fOBC0
 NxnuN0PA5CGWvqcmEShj+6KrX8SnhbN/sQa6c1cq4d+HVx/cNT1ADltDf30J578qS1NN
 /KJ1dB53D5malSKopdIu1NKRPPpoDRCBZtr1/3EHmqczRbZdLP5ZadN+TyYyY7EUrp2D
 KjQxqsZFZ/7QHY+Mh4c9mIXyaKWRctLeHZ7oI+pd0KI1UBZUpEhfy0Q2q2KFSkF5MCH9
 uVytPxiRqF8PAbw0oY+dwf+aHlOF/T4CpNWZNg5EN79qKDPo4sr6oruaZ9uf1qwf3bqN
 Ax/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WdN6NkByScw7Bh//CEiVXa61bonsAZAyoZ4Pgukyj6A=;
 b=okqkSK8nAp7fwjngIBqOlszLCLLZDuS9fusyEEmWyte7cSK56w0tlXePsK2SHrpk8t
 1Gp5d2j81dtJYrFVkO1Pi58pd+3WbfqKH9npsL8HiWYXzpyy3OjpLWC3KeQQZSY7f+vK
 92b5x7AAdMUqJTCLg071RZi7lLZkjrRbACLvBtXRDrl1s/HWiDMyYwKXxpMrVg+UGPya
 gRXid3H0nOd/kpXa7tYtHfAYpo4tkSw3PP/BL5Ikb9kkpGH5cVMHuaAbSQQ4wd64vijB
 X12duY1khiMv3H/lKCSk+mL9WoaeQNiQI2KUihe6ZDbv2sr8r3Fz7NCrqxVJJtHmX8eH
 OLvw==
X-Gm-Message-State: AOAM532G5b2w3mcZcpcUOQFGGsFSY9HEwOiVu0eXI2aZkG3IAdzdIFip
 LwaDf0jliSZScydQc7dznyL2PRTfHSY=
X-Google-Smtp-Source: ABdhPJxjZ3lnxRfC0AmCcacPGsMXo0aT1DYLg/uvwmRZcHKF2sm5MdyO32c+YdULb6SdJSFMcCUxLA==
X-Received: by 2002:a17:90b:1291:: with SMTP id
 fw17mr27062248pjb.105.1624866586243; 
 Mon, 28 Jun 2021 00:49:46 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id b22sm5264962pfp.20.2021.06.28.00.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 00:49:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/8] powerpc/64s: add a table of implicit soft-masked addresses
Date: Mon, 28 Jun 2021 17:49:27 +1000
Message-Id: <20210628074932.1499554-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210628074932.1499554-1-npiggin@gmail.com>
References: <20210628074932.1499554-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 9d1988ca87dd ("powerpc/64: treat low kernel text as irqs
soft-masked") ends up catching too much code, including ret_from_fork,
and parts of interrupt and syscall return that do not expect to be
interrupts to be soft-masked. If an interrupt gets marked pending,
and then the code proceeds out of the implicit soft-masked region it
will fail to deal with the pending interrupt.

Fix this by adding a new table of addresses which explicitly marks
the regions of code that are soft masked. This table is only checked
for interrupts that below __end_soft_masked, so most kernel interrupts
will not have the overhead of the table search.

Fixes: 9d1988ca87dd ("powerpc/64: treat low kernel text as irqs soft-masked")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  5 ++-
 arch/powerpc/include/asm/ppc_asm.h   |  7 ++++
 arch/powerpc/kernel/exceptions-64s.S | 55 ++++++++++++++++++++++++----
 arch/powerpc/kernel/interrupt_64.S   |  8 ++++
 arch/powerpc/kernel/vmlinux.lds.S    |  9 +++++
 arch/powerpc/lib/restart_table.c     | 26 +++++++++++++
 6 files changed, 100 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index f2481fac7f7f..d7df247a149c 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -75,11 +75,12 @@
 
 #ifdef CONFIG_PPC_BOOK3S_64
 extern char __end_soft_masked[];
+bool search_kernel_soft_mask_table(unsigned long addr);
 unsigned long search_kernel_restart_table(unsigned long addr);
 
 DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
 
-bool is_implicit_soft_masked(struct pt_regs *regs)
+static inline bool is_implicit_soft_masked(struct pt_regs *regs)
 {
 	if (regs->msr & MSR_PR)
 		return false;
@@ -87,7 +88,7 @@ bool is_implicit_soft_masked(struct pt_regs *regs)
 	if (regs->nip >= (unsigned long)__end_soft_masked)
 		return false;
 
-	return true;
+	return search_kernel_soft_mask_table(regs->nip);
 }
 
 static inline void srr_regs_clobbered(void)
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index c9c2c36c1f8f..116c1519728a 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -762,6 +762,13 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 	stringify_in_c(.long (_target) - . ;)	\
 	stringify_in_c(.previous)
 
+#define SOFT_MASK_TABLE(_start, _end)		\
+	stringify_in_c(.section __soft_mask_table,"a";)\
+	stringify_in_c(.balign 8;)		\
+	stringify_in_c(.llong (_start);)	\
+	stringify_in_c(.llong (_end);)		\
+	stringify_in_c(.previous)
+
 #define RESTART_TABLE(_start, _end, _target)	\
 	stringify_in_c(.section __restart_table,"a";)\
 	stringify_in_c(.balign 8;)		\
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ecd07bf604c5..3a58c3fd6de4 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -428,21 +428,30 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 
 		/* If coming from user, skip soft-mask tests. */
 		andi.	r10,r12,MSR_PR
-		bne	2f
+		bne	3f
 
 		/*
-		 * Kernel code running below __end_soft_masked is implicitly
-		 * soft-masked
+		 * Kernel code running below __end_soft_masked may be
+		 * implicitly soft-masked if it is within the regions
+		 * in the soft mask table.
 		 */
 		LOAD_HANDLER(r10, __end_soft_masked)
 		cmpld	r11,r10
-
+		bge+	1f
+
+		/* SEARCH_SOFT_MASK_TABLE clobbers r9,r10,r12 */
+		stw	r9,PACA_EXGEN+EX_CCR(r13)
+		SEARCH_SOFT_MASK_TABLE
+		lwz	r9,PACA_EXGEN+EX_CCR(r13)
+		cmpdi	r12,0
+		mfspr	r12,SPRN_SRR1	/* Restore r12 to SRR1 */
+		beq	1f		/* Not in soft-mask table */
 		li	r10,IMASK
-		blt-	1f
+		b	2f		/* In soft-mask table, always mask */
 
 		/* Test the soft mask state against our interrupt's bit */
-		lbz	r10,PACAIRQSOFTMASK(r13)
-1:		andi.	r10,r10,IMASK
+1:		lbz	r10,PACAIRQSOFTMASK(r13)
+2:		andi.	r10,r10,IMASK
 		/* Associate vector numbers with bits in paca->irq_happened */
 		.if IVEC == 0x500 || IVEC == 0xea0
 		li	r10,PACA_IRQ_EE
@@ -473,7 +482,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 
 	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
-2:	mr	r10,r1			/* Save r1			*/
+3:	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
 	beq-	100f
 	ld	r1,PACAKSAVE(r13)	/* kernel stack to use		*/
@@ -624,6 +633,36 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 303:
 .endm
 
+.macro SEARCH_SOFT_MASK_TABLE
+#ifdef CONFIG_RELOCATABLE
+	mr	r12,r2
+	ld	r2,PACATOC(r13)
+	LOAD_REG_ADDR(r9, __start___soft_mask_table)
+	LOAD_REG_ADDR(r10, __stop___soft_mask_table)
+	mr	r2,r12
+#else
+	LOAD_REG_IMMEDIATE_SYM(r9, r12, __start___soft_mask_table)
+	LOAD_REG_IMMEDIATE_SYM(r10, r12, __stop___soft_mask_table)
+#endif
+300:
+	cmpd	r9,r10
+	beq	302f
+	ld	r12,0(r9)
+	cmpld	r11,r12
+	blt	301f
+	ld	r12,8(r9)
+	cmpld	r11,r12
+	bge	301f
+	li	r12,1
+	b	303f
+301:
+	addi	r9,r9,16
+	b	300b
+302:
+	li	r12,0
+303:
+.endm
+
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 0a8afec6c07b..c06ed64541e1 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -208,7 +208,9 @@ syscall_vectored_\name\()_restart:
 	bl	syscall_exit_restart
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Lsyscall_vectored_\name\()_rst_start
+1:
 
+SOFT_MASK_TABLE(.Lsyscall_vectored_\name\()_rst_start, 1b)
 RESTART_TABLE(.Lsyscall_vectored_\name\()_rst_start, .Lsyscall_vectored_\name\()_rst_end, syscall_vectored_\name\()_restart)
 #endif
 
@@ -412,7 +414,9 @@ syscall_restart:
 	bl	syscall_exit_restart
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Lsyscall_rst_start
+1:
 
+SOFT_MASK_TABLE(.Lsyscall_rst_start, 1b)
 RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
 #endif
 
@@ -609,7 +613,9 @@ interrupt_return_\srr\()_user_restart:
 	bl	interrupt_exit_user_restart
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Linterrupt_return_\srr\()_user_rst_start
+1:
 
+SOFT_MASK_TABLE(.Linterrupt_return_\srr\()_user_rst_start, 1b)
 RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr\()_user_rst_end, interrupt_return_\srr\()_user_restart)
 #endif
 
@@ -740,7 +746,9 @@ interrupt_return_\srr\()_kernel_restart:
 	bl	interrupt_exit_kernel_restart
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Linterrupt_return_\srr\()_kernel_rst_start
+1:
 
+SOFT_MASK_TABLE(.Linterrupt_return_\srr\()_kernel_rst_start, 1b)
 RESTART_TABLE(.Linterrupt_return_\srr\()_kernel_rst_start, .Linterrupt_return_\srr\()_kernel_rst_end, interrupt_return_\srr\()_kernel_restart)
 #endif
 
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 16c5e13e00c4..40bdefe9caa7 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -9,6 +9,14 @@
 #define EMITS_PT_NOTE
 #define RO_EXCEPTION_TABLE_ALIGN	0
 
+#define SOFT_MASK_TABLE(align)						\
+	. = ALIGN(align);						\
+	__soft_mask_table : AT(ADDR(__soft_mask_table) - LOAD_OFFSET) {	\
+		__start___soft_mask_table = .;				\
+		KEEP(*(__soft_mask_table))				\
+		__stop___soft_mask_table = .;				\
+	}
+
 #define RESTART_TABLE(align)						\
 	. = ALIGN(align);						\
 	__restart_table : AT(ADDR(__restart_table) - LOAD_OFFSET) {	\
@@ -132,6 +140,7 @@ SECTIONS
 	RO_DATA(PAGE_SIZE)
 
 #ifdef CONFIG_PPC64
+	SOFT_MASK_TABLE(8)
 	RESTART_TABLE(8)
 
 	. = ALIGN(8);
diff --git a/arch/powerpc/lib/restart_table.c b/arch/powerpc/lib/restart_table.c
index 7cd20757cc33..bccb662c1b7b 100644
--- a/arch/powerpc/lib/restart_table.c
+++ b/arch/powerpc/lib/restart_table.c
@@ -1,15 +1,41 @@
 #include <asm/interrupt.h>
 #include <asm/kprobes.h>
 
+struct soft_mask_table_entry {
+	unsigned long start;
+	unsigned long end;
+};
+
 struct restart_table_entry {
 	unsigned long start;
 	unsigned long end;
 	unsigned long fixup;
 };
 
+extern struct soft_mask_table_entry __start___soft_mask_table[];
+extern struct soft_mask_table_entry __stop___soft_mask_table[];
+
 extern struct restart_table_entry __start___restart_table[];
 extern struct restart_table_entry __stop___restart_table[];
 
+/* Given an address, look for it in the soft mask table */
+bool search_kernel_soft_mask_table(unsigned long addr)
+{
+	struct soft_mask_table_entry *smte = __start___soft_mask_table;
+
+	while (smte < __stop___soft_mask_table) {
+		unsigned long start = smte->start;
+		unsigned long end = smte->end;
+
+		if (addr >= start && addr < end)
+			return true;
+
+		smte++;
+	}
+	return false;
+}
+NOKPROBE_SYMBOL(search_kernel_soft_mask_table);
+
 /* Given an address, look for it in the kernel exception table */
 unsigned long search_kernel_restart_table(unsigned long addr)
 {
-- 
2.23.0

