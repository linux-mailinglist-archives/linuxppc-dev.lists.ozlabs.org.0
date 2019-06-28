Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2C59441
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 08:36:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zn905DNWzDqkm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 16:36:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hq5ZRjB5"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zn5X0FnBzDqjc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 16:33:19 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id c85so2464156pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 23:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d9DB0Z82Gv6Cq3JsOlCNH6f/YJZXpZHmqG7Ru07dUpg=;
 b=hq5ZRjB5kcec2SCk+lI80pWrQtg9mk4kT/P3H8RVhHNRrWskRQLhavE28VAF+TP+aW
 gYKUUheyQnuQCW/qB6BCxeszDMPdcORDyhoEnX7yo7uNAYlhjHQolVfLGvyATGuAn9qa
 KQwf9weJZqpuyY321uewuEonEPLxdPgB+vQIYgEAY0YjmkNtnEHYqKOFfJ9I0xbRhIJa
 SInXubae+dpZHNqlAFeSUsqZmGvMPKFP7AWLTELdTb0symsBtEJZj9+fxE9pvK9J3DtG
 ao+ln+dfDM4URIS1VAAVGk37+sgKKR+eiVnPJJd2zsQ22n1ja0aZWIWS8lT0pC5hmxj3
 n85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d9DB0Z82Gv6Cq3JsOlCNH6f/YJZXpZHmqG7Ru07dUpg=;
 b=hh0ghxyZu1zFxGMZKbrti7YUBMW/8QO+8/bIvGsbdPs0In+OsQJ3kDSxyYMFvGqdSF
 5Y7pPY0M5UErHxt9ElOFhNMb/mRjRyaZRSVzG7wjog1BRu+Y4sO/V9kFZZFr7qiqVA4H
 YqJZ4+jYQFB3rXt8D22PUHFktSsGlZairHapK0kIJn+ssZId4IUgP3u3XmjMWQbjQIkb
 bv15ToRqiJALTbStwwM+NmKfjz8WN1GrSnf7KxdyQGglqP2XFQM+W0CRcGncEnEU2Ewx
 LuMmd/QW9FKKYPucuffKJflkn9YTavbh4XQ+N83u57nTZkYicB6jhyg6EtGpzptM/g+3
 BEtg==
X-Gm-Message-State: APjAAAWZ7dztGKH+ujQczIXlZ3DABEUtHTDSoJkn4VyyjOcUJvYWLaNJ
 YsSxZQbNafgWJYma76d7+48IpVGJ
X-Google-Smtp-Source: APXvYqxV9UZmIW2MXpoJqFkz+6kCqGjtpOHrOrhkp7TllPlMAgcK2jJ8W4FUAfAEYLY3IwABQNLiVA==
X-Received: by 2002:a63:c301:: with SMTP id c1mr7690966pgd.41.1561703597611;
 Thu, 27 Jun 2019 23:33:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id h14sm1071500pfq.22.2019.06.27.23.33.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 23:33:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] powerpc/64s/exception: remove bad stack branch
Date: Fri, 28 Jun 2019 16:33:18 +1000
Message-Id: <20190628063322.11628-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628063322.11628-1-npiggin@gmail.com>
References: <20190628063322.11628-1-npiggin@gmail.com>
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

The bad stack test in interrupt handlers has a few problems. For
performance it is taken in the common case, which is a fetch bubble
and a waste of i-cache.

For code development and maintainence, it requires yet another stack
frame setup routine, and that constrains all exception handlers to
follow the same register save pattern which inhibits future
optimisation.

Remove the test/branch and replace it with a trap. Teach the program
check handler to use the emergency stack for this case.

This does not result in quite so nice a message, however the SRR0 and
SRR1 of the crashed interrupt can be seen in r11 and r12, as is the
original r1 (adjusted by INT_FRAME_SIZE). These are the most important
parts to debugging the issue.

The original r9-12 and cr0 is lost, which is the main downside.

  kernel BUG at linux/arch/powerpc/kernel/exceptions-64s.S:847!
  Oops: Exception in kernel mode, sig: 5 [#1]
  BE SMP NR_CPUS=2048 NUMA PowerNV
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted
  NIP:  c000000000009108 LR: c000000000cadbcc CTR: c0000000000090f0
  REGS: c0000000fffcbd70 TRAP: 0700   Not tainted
  MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28222448  XER: 20040000
  CFAR: c000000000009100 IRQMASK: 0
  GPR00: 000000000000003d fffffffffffffd00 c0000000018cfb00 c0000000f02b3166
  GPR04: fffffffffffffffd 0000000000000007 fffffffffffffffb 0000000000000030
  GPR08: 0000000000000037 0000000028222448 0000000000000000 c000000000ca8de0
  GPR12: 9000000002009032 c000000001ae0000 c000000000010a00 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: c0000000f00322c0 c000000000f85200 0000000000000004 ffffffffffffffff
  GPR24: fffffffffffffffe 0000000000000000 0000000000000000 000000000000000a
  GPR28: 0000000000000000 0000000000000000 c0000000f02b391c c0000000f02b3167
  NIP [c000000000009108] decrementer_common+0x18/0x160
  LR [c000000000cadbcc] .vsnprintf+0x3ec/0x4f0
  Call Trace:
  Instruction dump:
  996d098a 994d098b 38610070 480246ed 48005518 60000000 38200000 718a4000
  7c2a0b78 3821fd00 41c20008 e82d0970 <0981fd00> f92101a0 f9610170 f9810178

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h |  7 --
 arch/powerpc/include/asm/paca.h          |  2 +
 arch/powerpc/kernel/asm-offsets.c        |  2 +
 arch/powerpc/kernel/exceptions-64s.S     | 96 ++++--------------------
 arch/powerpc/xmon/xmon.c                 |  2 +
 5 files changed, 22 insertions(+), 87 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 2e919253a075..33f4f72eb035 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -44,13 +44,6 @@
  */
 #define MAX_MCE_DEPTH	4
 
-/*
- * EX_R3 is only used by the bad_stack handler. bad_stack reloads and
- * saves DAR from SPRN_DAR, and EX_DAR is not used. So EX_R3 can overlap
- * with EX_DAR.
- */
-#define EX_R3		EX_DAR
-
 #ifdef __ASSEMBLY__
 
 #define STF_ENTRY_BARRIER_SLOT						\
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 9bd2326bef6f..e3cc9eb9204d 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -166,7 +166,9 @@ struct paca_struct {
 	u64 kstack;			/* Saved Kernel stack addr */
 	u64 saved_r1;			/* r1 save for RTAS calls or PM or EE=0 */
 	u64 saved_msr;			/* MSR saved here by enter_rtas */
+#ifdef CONFIG_PPC_BOOK3E
 	u16 trap_save;			/* Used when bad stack is encountered */
+#endif
 	u8 irq_soft_mask;		/* mask for irq soft masking */
 	u8 irq_happened;		/* irq happened while soft-disabled */
 	u8 irq_work_pending;		/* IRQ_WORK interrupt while soft-disable */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 31dc7e64cbfc..4ccb6b3a7fbd 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -266,7 +266,9 @@ int main(void)
 	OFFSET(ACCOUNT_STARTTIME_USER, paca_struct, accounting.starttime_user);
 	OFFSET(ACCOUNT_USER_TIME, paca_struct, accounting.utime);
 	OFFSET(ACCOUNT_SYSTEM_TIME, paca_struct, accounting.stime);
+#ifdef CONFIG_PPC_BOOK3E
 	OFFSET(PACA_TRAP_SAVE, paca_struct, trap_save);
+#endif
 	OFFSET(PACA_SPRG_VDSO, paca_struct, sprg_vdso);
 #else /* CONFIG_PPC64 */
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0857c696480c..9aafe86193db 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -411,14 +411,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	subi	r1,r1,INT_FRAME_SIZE;	/* alloc frame on kernel stack	*/ \
 	beq-	1f;							   \
 	ld	r1,PACAKSAVE(r13);	/* kernel stack to use		*/ \
-1:	cmpdi	cr1,r1,-INT_FRAME_SIZE;	/* check if r1 is in userspace	*/ \
-	blt+	cr1,3f;			/* abort if it is		*/ \
-	li	r1,(trap);		/* will be reloaded later	*/ \
-	sth	r1,PACA_TRAP_SAVE(r13);					   \
-	std	r3,area+EX_R3(r13);					   \
-	addi	r3,r13,area;		/* r3 -> where regs are saved*/	   \
-	RESTORE_CTR(r1, area);						   \
-	b	bad_stack;						   \
+1:	tdgei	r1,-INT_FRAME_SIZE;	/* trap if r1 is in userspace	*/ \
+	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0;				   \
 3:	EXCEPTION_PROLOG_COMMON_1();					   \
 	kuap_save_amr_and_lock r9, r10, cr1, cr0;			   \
 	beq	4f;			/* if from kernel mode		*/ \
@@ -428,7 +422,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	EXCEPTION_PROLOG_COMMON_3(trap);				   \
 	ACCOUNT_STOLEN_TIME
 
-
 /*
  * Exception where stack is already set in r1, r1 is saved in r10.
  * PPR save and CPU accounting is not done (for some reason).
@@ -1453,21 +1446,25 @@ EXC_COMMON_BEGIN(program_check_common)
 	 * we switch to the emergency stack if we're taking a TM Bad Thing from
 	 * the kernel.
 	 */
-	li	r10,MSR_PR		/* Build a mask of MSR_PR ..	*/
-	oris	r10,r10,0x200000@h	/* .. and SRR1_PROGTM		*/
-	and	r10,r10,r12		/* Mask SRR1 with that.		*/
-	srdi	r10,r10,8		/* Shift it so we can compare	*/
-	cmpldi	r10,(0x200000 >> 8)	/* .. with an immediate.	*/
-	bne 1f				/* If != go to normal path.	*/
-
-	/* SRR1 had PR=0 and SRR1_PROGTM=1, so use the emergency stack	*/
-	andi.	r10,r12,MSR_PR;		/* Set CR0 correctly for label	*/
+
+	andi.	r10,r12,MSR_PR
+	bne	2f			/* If userspace, go normal path */
+
+	andis.	r10,r12,(SRR1_PROGTM)@h
+	bne	1f			/* If TM, emergency		*/
+
+	cmpdi	r1,-INT_FRAME_SIZE	/* check if r1 is in userspace	*/
+	blt	2f			/* normal path if not		*/
+
+	/* Use the emergency stack					*/
+1:	andi.	r10,r12,MSR_PR		/* Set CR0 correctly for label	*/
 					/* 3 in EXCEPTION_PROLOG_COMMON	*/
 	mr	r10,r1			/* Save r1			*/
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack		*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 	b 3f				/* Jump into the macro !!	*/
-1:	EXCEPTION_COMMON(PACA_EXGEN, 0x700)
+2:
+	EXCEPTION_COMMON(PACA_EXGEN, 0x700)
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -2403,67 +2400,6 @@ handle_dabr_fault:
 	bl	bad_page_fault
 	b	ret_from_except
 
-/*
- * Here we have detected that the kernel stack pointer is bad.
- * R9 contains the saved CR, r13 points to the paca,
- * r10 contains the (bad) kernel stack pointer,
- * r11 and r12 contain the saved SRR0 and SRR1.
- * We switch to using an emergency stack, save the registers there,
- * and call kernel_bad_stack(), which panics.
- */
-bad_stack:
-	ld	r1,PACAEMERGSP(r13)
-	subi	r1,r1,64+INT_FRAME_SIZE
-	std	r9,_CCR(r1)
-	std	r10,GPR1(r1)
-	std	r11,_NIP(r1)
-	std	r12,_MSR(r1)
-	mfspr	r11,SPRN_DAR
-	mfspr	r12,SPRN_DSISR
-	std	r11,_DAR(r1)
-	std	r12,_DSISR(r1)
-	mflr	r10
-	mfctr	r11
-	mfxer	r12
-	std	r10,_LINK(r1)
-	std	r11,_CTR(r1)
-	std	r12,_XER(r1)
-	SAVE_GPR(0,r1)
-	SAVE_GPR(2,r1)
-	ld	r10,EX_R3(r3)
-	std	r10,GPR3(r1)
-	SAVE_GPR(4,r1)
-	SAVE_4GPRS(5,r1)
-	ld	r9,EX_R9(r3)
-	ld	r10,EX_R10(r3)
-	SAVE_2GPRS(9,r1)
-	ld	r9,EX_R11(r3)
-	ld	r10,EX_R12(r3)
-	ld	r11,EX_R13(r3)
-	std	r9,GPR11(r1)
-	std	r10,GPR12(r1)
-	std	r11,GPR13(r1)
-BEGIN_FTR_SECTION
-	ld	r10,EX_CFAR(r3)
-	std	r10,ORIG_GPR3(r1)
-END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
-	SAVE_8GPRS(14,r1)
-	SAVE_10GPRS(22,r1)
-	lhz	r12,PACA_TRAP_SAVE(r13)
-	std	r12,_TRAP(r1)
-	addi	r11,r1,INT_FRAME_SIZE
-	std	r11,0(r1)
-	li	r12,0
-	std	r12,0(r11)
-	ld	r2,PACATOC(r13)
-	ld	r11,exception_marker@toc(r2)
-	std	r12,RESULT(r1)
-	std	r11,STACK_FRAME_OVERHEAD-16(r1)
-1:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	kernel_bad_stack
-	b	1b
-_ASM_NOKPROBE_SYMBOL(bad_stack);
-
 /*
  * When doorbell is triggered from system reset wakeup, the message is
  * not cleared, so it would fire again when EE is enabled.
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index d0620d762a5a..41c91f17e408 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2448,7 +2448,9 @@ static void dump_one_paca(int cpu)
 	DUMP(p, canary, "%#-*lx");
 #endif
 	DUMP(p, saved_r1, "%#-*llx");
+#ifdef CONFIG_PPC_BOOK3E
 	DUMP(p, trap_save, "%#-*x");
+#endif
 	DUMP(p, irq_soft_mask, "%#-*x");
 	DUMP(p, irq_happened, "%#-*x");
 #ifdef CONFIG_MMIOWB
-- 
2.20.1

