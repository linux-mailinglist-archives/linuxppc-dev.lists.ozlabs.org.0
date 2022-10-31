Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DCD613017
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:02:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12br6bHlz3f9w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:02:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g+47/WTS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g+47/WTS;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12Rw0XMtz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:07 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so9410959pjd.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlIKz6HKSWrHmX7zPYfIjv8jrE75Ia2asP8lfX+VNOo=;
        b=g+47/WTSOwuk0hR/2Q9/DcyYZkz6wj2V1Noy5m8k7Ok2q5ttjHO40uQyQ7KFrDtDx/
         44cPnr5RRLWJQQURrd0jFsvfhEc2DlQODRp/IvaGfr539rqqfD3INiGDrfpXisuxdziV
         NvQt6zjcpJpI8s3Yc7Gb5fwHuqdgl9xaDttsPXu9ECiV9C73hkYSzDLOvu6DsiTmDimO
         DZn3aNB62g5WI+f4KcMTotSj+hk6B0LMZYs9TvywEUSdvnAWmElfK+WEHmauXDP4u8pm
         z4A4l2ShazjR/CKdxFfDNR4V+FoNDr+LgM7Cx3LAiPnRDMeisHpQ+isXyFj7yFT8nJIr
         jYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlIKz6HKSWrHmX7zPYfIjv8jrE75Ia2asP8lfX+VNOo=;
        b=zIyV7o+ggnE9RJd2S7C4MElbzm9yskVal7gHhtLuJJu1rwMTiejbkkjQQdC8V7nZDl
         cPjPxSbm6GKjfKgXQHqIYVciuBVgCWJfAGwpIG0kGpz1qsbvqGh8bAJm+ALgm20skUFf
         We3hL5dfQWwRwTBLiAkiN4YLjtgzfgXofI0f1K0qRZU1LSsTN8cjv6JcaG7z0S1UKC5l
         SRVD3Jxz0vYyfG/D4COzTsL+JCubLInqWUxD3gcbMAk0OXSwMIRQ2IuAPF1afLISEq0V
         opVpvN/S0et04+rOQTvMWyS0DwW39O/Wlgmm5pXmKRB3URjHE1ZfsZznIBbXg/rf3p/l
         lXkw==
X-Gm-Message-State: ACrzQf1Ay3d7bfHfv1g61aL2NsI3hesCLq8sKtGBpieIdmOhFPbqGS76
	m5l+eQ0j6d1MIi3vIslGWqdDfroYP34=
X-Google-Smtp-Source: AMsMyM5m3kFwUb+VtYINaWpi0UZfzKKaB1Z4VkJEkiHA2LTas15iPJvf4fKS3RIhMFzebPz6iqcXPA==
X-Received: by 2002:a17:902:9b88:b0:17c:97d6:5e78 with SMTP id y8-20020a1709029b8800b0017c97d65e78mr12730866plp.62.1667195704815;
        Sun, 30 Oct 2022 22:55:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 07/19] powerpc: add definition for pt_regs offset within an interrupt frame
Date: Mon, 31 Oct 2022 15:54:28 +1000
Message-Id: <20221031055440.3594315-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a common offset that currently uses the overloaded
STACK_FRAME_OVERHEAD constant. It's easier to read and more
flexible to use a specific regs offset for this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h             |  2 +
 arch/powerpc/kernel/asm-offsets.c             |  7 +-
 arch/powerpc/kernel/entry_32.S                |  6 +-
 arch/powerpc/kernel/exceptions-64e.S          | 42 +++++-----
 arch/powerpc/kernel/exceptions-64s.S          | 80 +++++++++----------
 arch/powerpc/kernel/head_32.h                 |  2 +-
 arch/powerpc/kernel/head_85xx.S               |  4 +-
 arch/powerpc/kernel/head_booke.h              |  2 +-
 arch/powerpc/kernel/interrupt_64.S            | 22 ++---
 arch/powerpc/kernel/kgdb.c                    |  2 +-
 arch/powerpc/kernel/optprobes_head.S          |  4 +-
 arch/powerpc/kernel/ppc_save_regs.S           |  2 +-
 arch/powerpc/kernel/process.c                 |  4 +-
 arch/powerpc/kernel/tm.S                      |  8 +-
 arch/powerpc/kernel/trace/ftrace_mprofile.S   |  2 +-
 .../lib/test_emulate_step_exec_instr.S        |  2 +-
 arch/powerpc/perf/callchain.c                 |  2 +-
 arch/powerpc/xmon/xmon.c                      |  7 +-
 18 files changed, 100 insertions(+), 100 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 2efec6d87049..a4ae67aa9b76 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -124,6 +124,7 @@ struct pt_regs
 #define STACK_FRAME_LR_SAVE	2	/* Location of LR in stack frame */
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + \
 				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
+#define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
 #define STACK_FRAME_MARKER	12
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
@@ -143,6 +144,7 @@ struct pt_regs
 #define STACK_FRAME_OVERHEAD	16	/* size of minimum stack frame */
 #define STACK_FRAME_LR_SAVE	1	/* Location of LR in stack frame */
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
+#define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
 #define STACK_FRAME_MARKER	2
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 4ce2a4aa3985..db5e66c1d031 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -72,7 +72,7 @@
 #endif
 
 #define STACK_PT_REGS_OFFSET(sym, val)	\
-	DEFINE(sym, STACK_FRAME_OVERHEAD + offsetof(struct pt_regs, val))
+	DEFINE(sym, STACK_INT_FRAME_REGS + offsetof(struct pt_regs, val))
 
 int main(void)
 {
@@ -167,9 +167,8 @@ int main(void)
 	OFFSET(THREAD_CKVRSTATE, thread_struct, ckvr_state.vr);
 	OFFSET(THREAD_CKVRSAVE, thread_struct, ckvrsave);
 	OFFSET(THREAD_CKFPSTATE, thread_struct, ckfp_state.fpr);
-	/* Local pt_regs on stack for Transactional Memory funcs. */
-	DEFINE(TM_FRAME_SIZE, STACK_FRAME_OVERHEAD +
-	       sizeof(struct pt_regs) + 16);
+	/* Local pt_regs on stack in int frame form, plus 16 bytes for TM */
+	DEFINE(TM_FRAME_SIZE, STACK_INT_FRAME_SIZE + 16);
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
 	OFFSET(TI_LOCAL_FLAGS, thread_info, local_flags);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 3fc7c9886bb7..24c8d84a56c9 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -123,12 +123,12 @@ transfer_to_syscall:
 	kuep_lock
 
 	/* Calling convention has r3 = regs, r4 = orig r0 */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	mr	r4,r0
 	bl	system_call_exception
 
 ret_from_syscall:
-	addi    r4,r1,STACK_FRAME_OVERHEAD
+	addi    r4,r1,STACK_INT_FRAME_REGS
 	li	r5,0
 	bl	syscall_exit_prepare
 #ifdef CONFIG_PPC_47x
@@ -293,7 +293,7 @@ _ASM_NOKPROBE_SYMBOL(fast_exception_return)
 	.globl interrupt_return
 interrupt_return:
 	lwz	r4,_MSR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	andi.	r0,r4,MSR_PR
 	beq	.Lkernel_interrupt_return
 	bl	interrupt_exit_user_prepare
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 930e36099015..f6b36083a8c2 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -455,7 +455,7 @@ exc_##n##_bad_stack:							    \
 	EXCEPTION_COMMON(trapnum)					\
 	ack(r8);							\
 	CHECK_NAPPING();						\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
+	addi	r3,r1,STACK_INT_FRAME_REGS;				\
 	bl	hdlr;							\
 	b	interrupt_return
 
@@ -504,7 +504,7 @@ __end_interrupts:
 	EXCEPTION_COMMON_CRIT(0x100)
 	bl	special_reg_save
 	CHECK_NAPPING();
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_nmi_exception
 	b	ret_from_crit_except
 
@@ -515,7 +515,7 @@ __end_interrupts:
 	EXCEPTION_COMMON_MC(0x000)
 	bl	special_reg_save
 	CHECK_NAPPING();
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	machine_check_exception
 	b	ret_from_mc_except
 
@@ -570,7 +570,7 @@ __end_interrupts:
 	std	r14,_ESR(r1)
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	EXCEPTION_COMMON(0x700)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	program_check_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -586,7 +586,7 @@ __end_interrupts:
 	beq-	1f
 	bl	load_up_fpu
 	b	fast_interrupt_return
-1:	addi	r3,r1,STACK_FRAME_OVERHEAD
+1:	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	kernel_fp_unavailable_exception
 	b	interrupt_return
 
@@ -606,7 +606,7 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	altivec_unavailable_exception
 	b	interrupt_return
 
@@ -616,7 +616,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 				BOOKE_INTERRUPT_ALTIVEC_ASSIST,
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x220)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_ALTIVEC
 BEGIN_FTR_SECTION
 	bl	altivec_assist_exception
@@ -643,7 +643,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	EXCEPTION_COMMON_CRIT(0x9f0)
 	bl	special_reg_save
 	CHECK_NAPPING();
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_BOOKE_WDT
 	bl	WatchdogException
 #else
@@ -664,7 +664,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	NORMAL_EXCEPTION_PROLOG(0xf20, BOOKE_INTERRUPT_AP_UNAVAIL,
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0xf20)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -731,7 +731,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	ld	r14,PACA_EXCRIT+EX_R14(r13)
 	ld	r15,PACA_EXCRIT+EX_R15(r13)
 	EXCEPTION_COMMON_CRIT(0xd00)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	DebugException
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -802,7 +802,7 @@ kernel_dbg_exc:
 	ld	r14,PACA_EXDBG+EX_R14(r13)
 	ld	r15,PACA_EXDBG+EX_R15(r13)
 	EXCEPTION_COMMON_DBG(0xd08)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	DebugException
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -812,7 +812,7 @@ kernel_dbg_exc:
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x260)
 	CHECK_NAPPING()
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	performance_monitor_exception
 	b	interrupt_return
 
@@ -827,7 +827,7 @@ kernel_dbg_exc:
 	EXCEPTION_COMMON_CRIT(0x2a0)
 	bl	special_reg_save
 	CHECK_NAPPING();
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_nmi_exception
 	b	ret_from_crit_except
 
@@ -839,7 +839,7 @@ kernel_dbg_exc:
 	GDBELL_EXCEPTION_PROLOG(0x2c0, BOOKE_INTERRUPT_GUEST_DBELL,
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x2c0)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -850,7 +850,7 @@ kernel_dbg_exc:
 	EXCEPTION_COMMON_CRIT(0x2e0)
 	bl	special_reg_save
 	CHECK_NAPPING();
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_nmi_exception
 	b	ret_from_crit_except
 
@@ -859,7 +859,7 @@ kernel_dbg_exc:
 	NORMAL_EXCEPTION_PROLOG(0x310, BOOKE_INTERRUPT_HV_SYSCALL,
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x310)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -868,7 +868,7 @@ kernel_dbg_exc:
 	NORMAL_EXCEPTION_PROLOG(0x320, BOOKE_INTERRUPT_HV_PRIV,
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x320)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -877,7 +877,7 @@ kernel_dbg_exc:
 	NORMAL_EXCEPTION_PROLOG(0x340, BOOKE_INTERRUPT_LRAT_ERROR,
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x340)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -972,7 +972,7 @@ masked_interrupt_book3e_0x2c0:
  * original values stashed away in the PACA
  */
 storage_fault_common:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	do_page_fault
 	b	interrupt_return
 
@@ -981,7 +981,7 @@ storage_fault_common:
  * continues here.
  */
 alignment_more:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	alignment_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -1062,7 +1062,7 @@ bad_stack_book3e:
 	ZEROIZE_GPR(12)
 	std	r12,0(r11)
 	LOAD_PACA_TOC()
-1:	addi	r3,r1,STACK_FRAME_OVERHEAD
+1:	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	kernel_bad_stack
 	b	1b
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5381a43e50fe..907054940a07 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1061,7 +1061,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	subi	r1,r1,INT_FRAME_SIZE
 	__GEN_COMMON_BODY system_reset
 
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	system_reset_exception
 
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
@@ -1208,7 +1208,7 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 BEGIN_FTR_SECTION
 	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 BEGIN_FTR_SECTION
 	bl	machine_check_early_boot
 END_FTR_SECTION(0, 1)     // nop out after boot
@@ -1298,7 +1298,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	 * save area: PACA_EXMC instead of PACA_EXGEN.
 	 */
 	GEN_COMMON machine_check
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	machine_check_exception_async
 	b	interrupt_return_srr
 
@@ -1364,14 +1364,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	 * This is the NMI version of the handler because we are called from
 	 * the early handler which is a true NMI.
 	 */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	machine_check_exception
 
 	/*
 	 * We will not reach here. Even if we did, there is no way out.
 	 * Call unrecoverable_exception and die.
 	 */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unrecoverable_exception
 	b	.
 
@@ -1422,7 +1422,7 @@ EXC_VIRT_END(data_access, 0x4300, 0x80)
 EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
 	ld	r4,_DSISR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	andis.	r0,r4,DSISR_DABRMATCH@h
 	bne-	1f
 #ifdef CONFIG_PPC_64S_HASH_MMU
@@ -1479,7 +1479,7 @@ EXC_COMMON_BEGIN(data_access_slb_common)
 #ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
@@ -1493,7 +1493,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	li	r3,-EFAULT
 #endif
 	std	r3,RESULT(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	do_bad_segment_interrupt
 	b	interrupt_return_srr
 
@@ -1525,7 +1525,7 @@ EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
 EXC_COMMON_BEGIN(instruction_access_common)
 	GEN_COMMON instruction_access
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	bl	do_hash_fault
@@ -1567,7 +1567,7 @@ EXC_COMMON_BEGIN(instruction_access_slb_common)
 #ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
@@ -1581,7 +1581,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	li	r3,-EFAULT
 #endif
 	std	r3,RESULT(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	do_bad_segment_interrupt
 	b	interrupt_return_srr
 
@@ -1635,7 +1635,7 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	do_IRQ
 	BEGIN_FTR_SECTION
 	b	interrupt_return_hsrr
@@ -1665,7 +1665,7 @@ EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	alignment_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
@@ -1731,7 +1731,7 @@ EXC_COMMON_BEGIN(program_check_common)
 	__GEN_COMMON_BODY program_check
 
 .Ldo_program_check:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	program_check_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
@@ -1762,7 +1762,7 @@ EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
 EXC_COMMON_BEGIN(fp_unavailable_common)
 	GEN_COMMON fp_unavailable
 	bne	1f			/* if from user, just load it up */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	kernel_fp_unavailable_exception
 0:	trap
 	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
@@ -1780,7 +1780,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	b	fast_interrupt_return_srr
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	fp_unavailable_tm
 	b	interrupt_return_srr
 #endif
@@ -1824,7 +1824,7 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	timer_interrupt
 	b	interrupt_return_srr
 
@@ -1909,7 +1909,7 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
 #else
@@ -2076,7 +2076,7 @@ EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
 EXC_VIRT_END(single_step, 0x4d00, 0x100)
 EXC_COMMON_BEGIN(single_step_common)
 	GEN_COMMON single_step
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	single_step_exception
 	b	interrupt_return_srr
 
@@ -2110,7 +2110,7 @@ EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
 EXC_COMMON_BEGIN(h_data_storage_common)
 	GEN_COMMON h_data_storage
-	addi    r3,r1,STACK_FRAME_OVERHEAD
+	addi    r3,r1,STACK_INT_FRAME_REGS
 BEGIN_MMU_FTR_SECTION
 	bl      do_bad_page_fault_segv
 MMU_FTR_SECTION_ELSE
@@ -2139,7 +2139,7 @@ EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
 EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
 EXC_COMMON_BEGIN(h_instr_storage_common)
 	GEN_COMMON h_instr_storage
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_exception
 	b	interrupt_return_hsrr
 
@@ -2162,7 +2162,7 @@ EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
 EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
 EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	emulation_assist_interrupt
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_hsrr
@@ -2222,7 +2222,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 
 	__GEN_COMMON_BODY hmi_exception_early
 
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	hmi_exception_realmode
 	cmpdi	cr0,r3,0
 	bne	1f
@@ -2240,7 +2240,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	handle_hmi_exception
 	b	interrupt_return_hsrr
 
@@ -2274,7 +2274,7 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
 #else
@@ -2310,7 +2310,7 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	do_IRQ
 	b	interrupt_return_hsrr
 
@@ -2356,7 +2356,7 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	performance_monitor_exception
 	b	interrupt_return_srr
 
@@ -2398,14 +2398,14 @@ BEGIN_FTR_SECTION
 	b	fast_interrupt_return_srr
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	altivec_unavailable_tm
 	b	interrupt_return_srr
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	altivec_unavailable_exception
 	b	interrupt_return_srr
 
@@ -2446,14 +2446,14 @@ BEGIN_FTR_SECTION
 	b	load_up_vsx
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	vsx_unavailable_tm
 	b	interrupt_return_srr
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 #endif
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	vsx_unavailable_exception
 	b	interrupt_return_srr
 
@@ -2480,7 +2480,7 @@ EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
 EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
 EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	facility_unavailable_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
@@ -2508,7 +2508,7 @@ EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
 EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
 EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	facility_unavailable_exception
 	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
 	b	interrupt_return_hsrr
@@ -2538,7 +2538,7 @@ EXC_REAL_END(cbe_system_error, 0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
 EXC_COMMON_BEGIN(cbe_system_error_common)
 	GEN_COMMON cbe_system_error
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	cbe_system_error_exception
 	b	interrupt_return_hsrr
 
@@ -2569,7 +2569,7 @@ EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
 EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
 EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	GEN_COMMON instruction_breakpoint
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	instruction_breakpoint_exception
 	b	interrupt_return_srr
 
@@ -2691,7 +2691,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 
 EXC_COMMON_BEGIN(denorm_exception_common)
 	GEN_COMMON denorm_exception
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unknown_exception
 	b	interrupt_return_hsrr
 
@@ -2708,7 +2708,7 @@ EXC_REAL_END(cbe_maintenance, 0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
 EXC_COMMON_BEGIN(cbe_maintenance_common)
 	GEN_COMMON cbe_maintenance
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	cbe_maintenance_exception
 	b	interrupt_return_hsrr
 
@@ -2733,7 +2733,7 @@ EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
 EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
 EXC_COMMON_BEGIN(altivec_assist_common)
 	GEN_COMMON altivec_assist
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_ALTIVEC
 	bl	altivec_assist_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
@@ -2755,7 +2755,7 @@ EXC_REAL_END(cbe_thermal, 0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
 EXC_COMMON_BEGIN(cbe_thermal_common)
 	GEN_COMMON cbe_thermal
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	cbe_thermal_exception
 	b	interrupt_return_hsrr
 
@@ -2788,7 +2788,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	subi	r1,r1,INT_FRAME_SIZE
 	__GEN_COMMON_BODY soft_nmi
 
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	soft_nmi_interrupt
 
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index c3286260a7d1..117d25330e13 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -127,7 +127,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	mfspr	r10,SPRN_XER
 	addi	r2, r2, -THREAD
 	stw	r10,_XER(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 .endm
 
 .macro prepare_transfer_to_handler
diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index 52c0ab416326..24f39abf81df 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -972,10 +972,10 @@ _GLOBAL(__giveup_spe)
 	li	r4,THREAD_ACC
 	evstddx	evr6, r4, r3		/* save off accumulator */
 	beq	1f
-	lwz	r4,_MSR-STACK_FRAME_OVERHEAD(r5)
+	lwz	r4,_MSR-STACK_INT_FRAME_REGS(r5)
 	lis	r3,MSR_SPE@h
 	andc	r4,r4,r3		/* disable SPE for previous task */
-	stw	r4,_MSR-STACK_FRAME_OVERHEAD(r5)
+	stw	r4,_MSR-STACK_INT_FRAME_REGS(r5)
 1:
 	blr
 #endif /* CONFIG_SPE */
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 1cb9d0f7cbf2..3149ac20b18e 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -99,7 +99,7 @@ END_BTB_FLUSH_SECTION
 	mfspr	r10,SPRN_XER
 	addi	r2, r2, -THREAD
 	stw	r10,_XER(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 .endm
 
 .macro prepare_transfer_to_handler
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 978a173eb339..12807d5298a3 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -78,7 +78,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	std	r12,_CCR(r1)
 	std	r3,ORIG_GPR3(r1)
 	/* Calling convention has r3 = regs, r4 = orig r0 */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	mr	r4,r0
 	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
 	std	r11,-16(r3)		/* "regshere" marker */
@@ -99,7 +99,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	bl	system_call_exception
 
 .Lsyscall_vectored_\name\()_exit:
-	addi	r4,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_INT_FRAME_REGS
 	li	r5,1 /* scv */
 	bl	syscall_exit_prepare
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
@@ -176,7 +176,7 @@ _ASM_NOKPROBE_SYMBOL(syscall_vectored_\name\()_restart)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	LOAD_PACA_TOC()
 	ld	r3,RESULT(r1)
-	addi	r4,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_INT_FRAME_REGS
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
 	bl	syscall_exit_restart
@@ -251,7 +251,7 @@ END_BTB_FLUSH_SECTION
 	std	r12,_CCR(r1)
 	std	r3,ORIG_GPR3(r1)
 	/* Calling convention has r3 = regs, r4 = orig r0 */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	mr	r4,r0
 	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
 	std	r11,-16(r3)		/* "regshere" marker */
@@ -278,7 +278,7 @@ END_BTB_FLUSH_SECTION
 	bl	system_call_exception
 
 .Lsyscall_exit:
-	addi	r4,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_INT_FRAME_REGS
 	li	r5,0 /* !scv */
 	bl	syscall_exit_prepare
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
@@ -357,7 +357,7 @@ _ASM_NOKPROBE_SYMBOL(syscall_restart)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	LOAD_PACA_TOC()
 	ld	r3,RESULT(r1)
-	addi	r4,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_INT_FRAME_REGS
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
 	bl	syscall_exit_restart
@@ -388,7 +388,7 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return_srr)
 	andi.	r0,r5,MSR_RI
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
 	bne+	.Lfast_kernel_interrupt_return_srr
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	unrecoverable_exception
 	b	. /* should not get here */
 #else
@@ -406,7 +406,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	beq	interrupt_return_\srr\()_kernel
 interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	interrupt_exit_user_prepare
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs_\srr
@@ -503,7 +503,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	LOAD_PACA_TOC()
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
 	bl	interrupt_exit_user_restart
@@ -518,7 +518,7 @@ RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr
 	.balign IFETCH_ALIGN_BYTES
 interrupt_return_\srr\()_kernel:
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	interrupt_exit_kernel_prepare
 
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
@@ -675,7 +675,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	LOAD_PACA_TOC()
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
 	bl	interrupt_exit_kernel_restart
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index 1a1e9995dae3..ebe4d1645ca1 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -191,7 +191,7 @@ static int kgdb_break_match(struct pt_regs *regs)
 void sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *p)
 {
 	struct pt_regs *regs = (struct pt_regs *)(p->thread.ksp +
-						  STACK_FRAME_OVERHEAD);
+						  STACK_INT_FRAME_REGS);
 	unsigned long *ptr = gdb_regs;
 	int reg;
 
diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
index cd4e7bc32609..35932f45fb4e 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -85,7 +85,7 @@ optprobe_template_op_address:
 	TEMPLATE_FOR_IMM_LOAD_INSNS
 
 	/* 2. pt_regs pointer in r4 */
-	addi	r4,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_INT_FRAME_REGS
 
 	.global optprobe_template_call_handler
 optprobe_template_call_handler:
@@ -96,7 +96,7 @@ optprobe_template_call_handler:
 	 * Parameters for instruction emulation:
 	 * 1. Pass SP in register r3.
 	 */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_INT_FRAME_REGS
 
 	.global optprobe_template_insn
 optprobe_template_insn:
diff --git a/arch/powerpc/kernel/ppc_save_regs.S b/arch/powerpc/kernel/ppc_save_regs.S
index 2908a5c2cd2f..272b632fe0d5 100644
--- a/arch/powerpc/kernel/ppc_save_regs.S
+++ b/arch/powerpc/kernel/ppc_save_regs.S
@@ -22,7 +22,7 @@
  */
 _GLOBAL(ppc_save_regs)
 	/* This allows stack frame accessor macros and offsets to be used */
-	subi	r3,r3,STACK_FRAME_OVERHEAD
+	subi	r3,r3,STACK_INT_FRAME_REGS
 	SAVE_GPRS(0, 31, r3)
 #ifdef CONFIG_PPC64
 	lbz	r0,PACAIRQSOFTMASK(r13)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index acfa197fb2df..e7010f71de24 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2231,12 +2231,12 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
 
 		/*
 		 * See if this is an exception frame.
-		 * We look for the "regshere" marker in the current frame.
+		 * We look for the "regs" marker in the current frame.
 		 */
 		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
 		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
 			struct pt_regs *regs = (struct pt_regs *)
-				(sp + STACK_FRAME_OVERHEAD);
+				(sp + STACK_INT_FRAME_REGS);
 
 			lr = regs->link;
 			printk("%s--- interrupt: %lx at %pS\n",
diff --git a/arch/powerpc/kernel/tm.S b/arch/powerpc/kernel/tm.S
index 5a0f023a26e9..9feab5e0485b 100644
--- a/arch/powerpc/kernel/tm.S
+++ b/arch/powerpc/kernel/tm.S
@@ -117,7 +117,7 @@ _GLOBAL(tm_reclaim)
 	std	r2, STK_GOT(r1)
 	stdu	r1, -TM_FRAME_SIZE(r1)
 
-	/* We've a struct pt_regs at [r1+STACK_FRAME_OVERHEAD]. */
+	/* We've a struct pt_regs at [r1+STACK_INT_FRAME_REGS]. */
 
 	std	r3, STK_PARAM(R3)(r1)
 	SAVE_NVGPRS(r1)
@@ -222,7 +222,7 @@ _GLOBAL(tm_reclaim)
 	 * Make r7 look like an exception frame so that we can use the neat
 	 * GPRx(n) macros. r7 is NOT a pt_regs ptr!
 	 */
-	subi	r7, r7, STACK_FRAME_OVERHEAD
+	subi	r7, r7, STACK_INT_FRAME_REGS
 
 	/* Sync the userland GPRs 2-12, 14-31 to thread->regs: */
 	SAVE_GPR(0, r7)				/* user r0 */
@@ -359,7 +359,7 @@ _GLOBAL(__tm_recheckpoint)
 	stdu	r1, -TM_FRAME_SIZE(r1)
 
 	/*
-	 * We've a struct pt_regs at [r1+STACK_FRAME_OVERHEAD].
+	 * We've a struct pt_regs at [r1+STACK_INT_FRAME_REGS].
 	 * This is used for backing up the NVGPRs:
 	 */
 	SAVE_NVGPRS(r1)
@@ -379,7 +379,7 @@ _GLOBAL(__tm_recheckpoint)
 	 * Make r7 look like an exception frame so that we can use the neat
 	 * GPRx(n) macros. r7 is now NOT a pt_regs ptr!
 	 */
-	subi	r7, r7, STACK_FRAME_OVERHEAD
+	subi	r7, r7, STACK_INT_FRAME_REGS
 
 	/* We need to setup MSR for FP/VMX/VSX register save instructions. */
 	mfmsr	r6
diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index d031093bc436..ffb1db386849 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -110,7 +110,7 @@
 	.endif
 
 	/* Load &pt_regs in r6 for call below */
-	addi    r6, r1, STACK_FRAME_OVERHEAD
+	addi    r6, r1, STACK_INT_FRAME_REGS
 .endm
 
 .macro	ftrace_regs_exit allregs
diff --git a/arch/powerpc/lib/test_emulate_step_exec_instr.S b/arch/powerpc/lib/test_emulate_step_exec_instr.S
index 5473f9d03df3..e2b646a4f7fa 100644
--- a/arch/powerpc/lib/test_emulate_step_exec_instr.S
+++ b/arch/powerpc/lib/test_emulate_step_exec_instr.S
@@ -16,7 +16,7 @@ _GLOBAL(exec_instr)
 
 	/*
 	 * Stack frame layout (INT_FRAME_SIZE bytes)
-	 *   In-memory pt_regs	(SP + STACK_FRAME_OVERHEAD)
+	 *   In-memory pt_regs	(SP + STACK_INT_FRAME_REGS)
 	 *   Scratch space	(SP + 8)
 	 *   Back chain		(SP + 0)
 	 */
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 8718289c051d..9e254aed1f61 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -67,7 +67,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 			 * This looks like an interrupt frame for an
 			 * interrupt that occurred in the kernel
 			 */
-			regs = (struct pt_regs *)(sp + STACK_FRAME_OVERHEAD);
+			regs = (struct pt_regs *)(sp + STACK_INT_FRAME_REGS);
 			next_ip = regs->nip;
 			lr = regs->link;
 			level = 0;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f51c882bf902..e403f14eb6eb 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1781,14 +1781,13 @@ static void xmon_show_stack(unsigned long sp, unsigned long lr,
 			xmon_print_symbol(ip, " ", "\n");
 		}
 
-		/* Look for "regshere" marker to see if this is
+		/* Look for "regs" marker to see if this is
 		   an exception frame. */
 		if (mread(sp + MARKER_OFFSET, &marker, sizeof(unsigned long))
 		    && marker == STACK_FRAME_REGS_MARKER) {
-			if (mread(sp + STACK_FRAME_OVERHEAD, &regs, sizeof(regs))
-			    != sizeof(regs)) {
+			if (mread(sp + STACK_INT_FRAME_REGS, &regs, sizeof(regs)) != sizeof(regs)) {
 				printf("Couldn't read registers at %lx\n",
-				       sp + STACK_FRAME_OVERHEAD);
+				       sp + STACK_INT_FRAME_REGS);
 				break;
 			}
 			printf("--- Exception: %lx %s at ", regs.trap,
-- 
2.37.2

