Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2E3B7E56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:48:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFD431ZFCz2yxT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:48:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Jisqxw7v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Jisqxw7v; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFD1q6rfpz2yNl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:46:39 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id c15so968415pls.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nKr5UjJW4WyeukqNL5B1ZKZLnFhlqjcPo846rJJevpM=;
 b=Jisqxw7vGQD4sh3ljVXJTyXvwpGLNClgQ5PZAhuVa6UTkRGBvyri62l3L8IN4ab9Kh
 BEgTKjDFequRCt5T8UXQWcMdKSd0mNnsOU3+eVae/jgcB5ewVIgJsSoTdmMJtppB0+X7
 1jasXCpwDuAup17uTuW8VGsdg9OsUJhYjHuArEIW+XO5LVJvYCRn9Tv/3BMyTgJm1Hl4
 azGpqCefH51JW41f2zu/ZgJ/woryd3E0JmBdXM+Hb0KbIU1fyfQw0fNm+U5qjyo4CpgM
 Fw8pVccBggS9aCrP5UJrVPoqM+S6lPmtHu1a+8QMsdOJ+7HrhQ9GZ79bV5DcMWLzuDuF
 Vy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nKr5UjJW4WyeukqNL5B1ZKZLnFhlqjcPo846rJJevpM=;
 b=ILBPOnptge0inMN/zfqF1nTBMUNcQCvyyNJYWS8yaHCqZ/qzxOeRj5CDE4EPvQnJSy
 LKC0+thj8NUVKRnHu5AntVhxl4oy+QJVGfMN8dQ6FNvA5w/qVulj6jh4jrHn/EHC5Mvt
 PcxR7/V0KStJTdAJYDpqy52jOFMGHbmDTT4WbLefhoBkuAa0vwEnMpqbq+LYPidK4Kd3
 tx0R4ZHKvhK+AOClQ1dTYqKFYJ8sC1lukh/OAkXg1CqUdVuFVTHP9TD5RjmUdlKNg2xd
 4HZJSOsJ109wFScWPbgvF6XMylEcUVSrBzm+7TPdXo1CC+82MndR9JFue5W9d/ANI6EF
 4LwA==
X-Gm-Message-State: AOAM530PdNfwDtWe9MAiNbIuix24vyS2TWZmOKKvkirBWWOWm2mF2qD9
 dJ0gNuISozsOTuNLhwZdjjWTdP/qxCA=
X-Google-Smtp-Source: ABdhPJwP/2v02g4JR+8Y7Gn7iVkyF+qK2H7OYLMc6G8iGBaM/Mkn+3Q8v/S3ZqsjgVc776+MZRw2Zg==
X-Received: by 2002:a17:90a:4b88:: with SMTP id
 i8mr35596858pjh.99.1625039197296; 
 Wed, 30 Jun 2021 00:46:37 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id g4sm20503369pfu.134.2021.06.30.00.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:46:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/9] powerpc/64s: add a table of implicit soft-masked
 addresses
Date: Wed, 30 Jun 2021 17:46:16 +1000
Message-Id: <20210630074621.2109197-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210630074621.2109197-1-npiggin@gmail.com>
References: <20210630074621.2109197-1-npiggin@gmail.com>
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
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  3 +-
 arch/powerpc/include/asm/ppc_asm.h   |  7 +++
 arch/powerpc/kernel/exceptions-64s.S | 64 +++++++++++++++++++++++-----
 arch/powerpc/kernel/interrupt_64.S   |  8 ++++
 arch/powerpc/kernel/vmlinux.lds.S    |  9 ++++
 arch/powerpc/lib/restart_table.c     | 26 +++++++++++
 6 files changed, 106 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index f13c93b033c7..d7df247a149c 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -75,6 +75,7 @@
 
 #ifdef CONFIG_PPC_BOOK3S_64
 extern char __end_soft_masked[];
+bool search_kernel_soft_mask_table(unsigned long addr);
 unsigned long search_kernel_restart_table(unsigned long addr);
 
 DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
@@ -87,7 +88,7 @@ static inline bool is_implicit_soft_masked(struct pt_regs *regs)
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
index ecd07bf604c5..4aec59a77d4c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -428,21 +428,31 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 
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
+		mtctr	r12
+		stw	r9,PACA_EXGEN+EX_CCR(r13)
+		SEARCH_SOFT_MASK_TABLE
+		cmpdi	r12,0
+		mfctr	r12		/* Restore r12 to SRR1 */
+		lwz	r9,PACA_EXGEN+EX_CCR(r13)
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
@@ -473,7 +483,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 
 	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
-2:	mr	r10,r1			/* Save r1			*/
+3:	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
 	beq-	100f
 	ld	r1,PACAKSAVE(r13)	/* kernel stack to use		*/
@@ -624,6 +634,36 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
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
@@ -754,8 +794,8 @@ __start_interrupts:
  * scv instructions enter the kernel without changing EE, RI, ME, or HV.
  * In particular, this means we can take a maskable interrupt at any point
  * in the scv handler, which is unlike any other interrupt. This is solved
- * by treating the instruction addresses below __end_soft_masked as being
- * soft-masked.
+ * by treating the instruction addresses in the handler as being soft-masked,
+ * by adding a SOFT_MASK_TABLE entry for them.
  *
  * AIL-0 mode scv exceptions go to 0x17000-0x17fff, but we set AIL-3 and
  * ensure scv is never executed with relocation off, which means AIL-0
@@ -772,6 +812,7 @@ __start_interrupts:
  * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
  */
 EXC_VIRT_BEGIN(system_call_vectored, 0x3000, 0x1000)
+1:
 	/* SCV 0 */
 	mr	r9,r13
 	GET_PACA(r13)
@@ -801,8 +842,11 @@ EXC_VIRT_BEGIN(system_call_vectored, 0x3000, 0x1000)
 	b	system_call_vectored_sigill
 #endif
 	.endr
+2:
 EXC_VIRT_END(system_call_vectored, 0x3000, 0x1000)
 
+SOFT_MASK_TABLE(1b, 2b) // Treat scv vectors as soft-masked, see comment above.
+
 #ifdef CONFIG_RELOCATABLE
 TRAMP_VIRT_BEGIN(system_call_vectored_tramp)
 	__LOAD_HANDLER(r10, system_call_vectored_common)
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 09b8d8846c67..2c92bbca02ca 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -207,7 +207,9 @@ syscall_vectored_\name\()_restart:
 	bl	syscall_exit_restart
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Lsyscall_vectored_\name\()_rst_start
+1:
 
+SOFT_MASK_TABLE(.Lsyscall_vectored_\name\()_rst_start, 1b)
 RESTART_TABLE(.Lsyscall_vectored_\name\()_rst_start, .Lsyscall_vectored_\name\()_rst_end, syscall_vectored_\name\()_restart)
 
 .endm
@@ -410,7 +412,9 @@ syscall_restart:
 	bl	syscall_exit_restart
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Lsyscall_rst_start
+1:
 
+SOFT_MASK_TABLE(.Lsyscall_rst_start, 1b)
 RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
 #endif
 
@@ -607,7 +611,9 @@ interrupt_return_\srr\()_user_restart:
 	bl	interrupt_exit_user_restart
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Linterrupt_return_\srr\()_user_rst_start
+1:
 
+SOFT_MASK_TABLE(.Linterrupt_return_\srr\()_user_rst_start, 1b)
 RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr\()_user_rst_end, interrupt_return_\srr\()_user_restart)
 #endif
 
@@ -738,7 +744,9 @@ interrupt_return_\srr\()_kernel_restart:
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

