Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28C4C719
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:07:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TrvC0g2QzDr0N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:07:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eYfOPF0V"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqlv3K6dzDqvr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:55 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id s21so906578pga.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tPBHMFFLkCBxEFXYZ0eSojcON3VlvIWqEEH6sjb909E=;
 b=eYfOPF0V1f7cbNhzt7CNwDJgw0jGkM0tZt86peLwSBEXJMhg+rx66S9HgH9fN5wpzS
 s2S39NZyX5A8gRxSnWIPZegHSDyykNryGNPSNUawRU998z6v03zXp3KCwCpHbK92rSVy
 YeeI48Jkra5taq5vBJ7T6t8w+vFRz4lBxPHFHB+gglCwfXjts2vLBSbG67DJ+xFz0dJt
 Vi2itd7z++7dGnSKa6I33/RD+ckXgGs6MZy7hMzopCCYDqO5SqfuyhhOH1TZj+zM/Itt
 pjrUc4yZjNRJoe5l2u2H630lTds81MFOypIwio2bWXb5dnlxSA9yQKJcSdXXFuQjuU83
 WIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tPBHMFFLkCBxEFXYZ0eSojcON3VlvIWqEEH6sjb909E=;
 b=YAfdpkF+l0gyXM8tpr5WPDhQnUyxPAVmVJdqQiJP9LPZC02HoUE7QhCSVVj/tY3mhj
 RIIsoIHcUyeH92uhtN7mfWZnSNFnCsnUlNKs48b0Kwf028T7VsmEI9ellWAWgu2r7Z4a
 /evjOeH9C9xKwcAJasxjq0ARLiDuzfNty0V4KYQkZECRX+GUGgXBBBebdI6cBEajc/cd
 ZDcV9hSqvBNg6WKZ/hIXDxSjy22yfBfS6AEHmwu6q6tWVWfa+LEmNcm96eQNwp+FuJJu
 BSK0AXQsTXUV4RC1XpLfqhbJCS/kKkb/rOgFzO5KCrujOC0ncYilFbdalciBqwWj/MhY
 Myjg==
X-Gm-Message-State: APjAAAXhNLszlHy/GzCtnv3G0jRJJ6mAO9Zkd/FBc0awP+CVYDIKmG7b
 GjW9s4DNSu1PuHC4Oqqo/cP/HGar
X-Google-Smtp-Source: APXvYqwxfqmFSi8Ltt6X3NpqRJ/ynzwR8mfTMo88mc984B9Hk3QNRM/zRE9avos3oetGbZrl/AkezQ==
X-Received: by 2002:a17:90a:1d8:: with SMTP id 24mr1140964pjd.70.1561007753250; 
 Wed, 19 Jun 2019 22:15:53 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 25/52] powerpc/64s/exception: remove bad stack branch
Date: Thu, 20 Jun 2019 15:14:32 +1000
Message-Id: <20190620051459.29573-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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
index 0a2b4e8b02b0..6c0321e128da 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -343,14 +343,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
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
@@ -1489,21 +1483,25 @@ EXC_COMMON_BEGIN(program_check_common)
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
@@ -2474,67 +2472,6 @@ handle_dabr_fault:
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

