Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A33863D12D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:44:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NZ6n6g2gzDqnk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:44:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DSd+SxVS"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZn5bM4zDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:41 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a186so7559763pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HiBu0ZTZk5hKgoZX8Md47fI1451gIUFmbvs7Hr3SbkE=;
 b=DSd+SxVSyUFKdu6bl4UzL4ErSCAcAL921T6e8QJ1F0Y5QRw5aZprMVQi5jjtymp7T/
 L9oNNJEVcLeKJZauxcFODYoxAhR3KKAjLYKGTXAW2XK929VOeixc7ACOFgvh9kt1oPSM
 0pKScF/SdZZH15F0ogD6kauYxFFm2pUd6lL2zhQpSgQ/b1h3OsfR/uS2zxf5qjir25nl
 Npy3bnnkiZJ+9siUWh+2POkUfAKEch9JD16ZI1DVVYyzN2wbV3Jk87M0/mbqEBI1/5o5
 cf7GhTY1oQkjB8bZyH4Hl0XCRVoCiokWKH8J47HZ/DnsdC2qTnbqGm8Nok6PsexSkH7/
 Vv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HiBu0ZTZk5hKgoZX8Md47fI1451gIUFmbvs7Hr3SbkE=;
 b=ijex8UkPSutrCVjA30U0dRMjAgOo+Zd/eoTBFhHpczfSjvqp94nP9IDItS8IUxb4bf
 Kkf4xzuvh82VIFIaK8G8TBF2UzKurHyZDNB+rgKacPlkke9BF2ZLW+LaA731YeJlHq3/
 svJGo6EaLWUywrEx1neMQtkf0p9MGwNTR7xFSIyIltHyABPa0YjWJ19eB/zXABaw03ly
 FOcur23+EQU3hXvWPk9iZBAb3sT/e/25PzHV24toamLdlk9E2axSofdCEGbsvS3k4jtG
 lo43vFrhRhrp8ytk31FNeQu3XdXFMZkNqoX0hDzFSpxAwwJffSY10Kmq9koQ/aZqYGo2
 zNtA==
X-Gm-Message-State: APjAAAWCKBBIwzN1HDITz356BSPXMy2CH/7afttUQctP6Xmj3aPsnFz4
 llGaVUtqalQk58kirDxqKCsD+PcL
X-Google-Smtp-Source: APXvYqw7mU76z9xgLtpAmUbQdA2FpFpvaGrJ7AdFdrcHGSuU6vxx4T32k3SMXoGZouKSJKQClTOZjw==
X-Received: by 2002:a17:90a:8a84:: with SMTP id
 x4mr19894365pjn.105.1560263679009; 
 Tue, 11 Jun 2019 07:34:39 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 24/28] powerpc/64s/exception: remove bad stack branch
Date: Wed, 12 Jun 2019 00:30:36 +1000
Message-Id: <20190611143040.7834-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S     | 95 ++++--------------------
 arch/powerpc/xmon/xmon.c                 |  2 +
 5 files changed, 22 insertions(+), 86 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index dc6a5ccac965..79e5ac87c029 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -55,13 +55,6 @@
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
index ce7aad9d3840..b402a006cd48 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -351,14 +351,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	subi	r1,r1,INT_FRAME_SIZE;	/* alloc frame on kernel stack	*/ \
 	beq-	1f;							   \
 	ld	r1,PACAKSAVE(r13);	/* kernel stack to use		*/ \
-1:	cmpdi	cr1,r1,-INT_FRAME_SIZE;	/* check if r1 is in userspace	*/ \
-	blt+	cr1,3f;			/* abort if it is		*/ \
-	li	r1,(n);			/* will be reloaded later	*/ \
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
@@ -1497,21 +1491,25 @@ EXC_COMMON_BEGIN(program_check_common)
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
-1:	EXCEPTION_PROLOG_COMMON(0x700, PACA_EXGEN)
+2:
+	EXCEPTION_PROLOG_COMMON(0x700, PACA_EXGEN)
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -2482,67 +2480,6 @@ handle_dabr_fault:
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

