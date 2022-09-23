Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459A5E726F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:28:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYd0919STz3c6x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:28:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HayJGaoD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HayJGaoD;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYcww1vZcz3c8B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 13:25:35 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id w10so9728607pll.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 20:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ENy/WEIbY0UvnPaFQKk0TlHStqX2OdMcbmfS7+e60BI=;
        b=HayJGaoDJtoZjhpg6/Ze5j8NTrefBXD/FPUpB7veHlCRgIgdHinJjXcq/YjfDdXKNh
         8U0odPn7WSKk2/UKmRDEzuCneN13716WSqr3+6OkBcvUXjAkTaGZi8nS13dyriHhatBS
         NhG/DwTVtIWSs3sCzAmIU9HZTLJgM/tp826iyDjH4AGNNKt1qmh0++X5u9xK1SLwS9jj
         8Em9QYezdHIJjSG8yI1U5wOLFWfj3mx53+NLb7SDEsgkdLVmGrJ9dyeTfifca7Co0Fu+
         JZv7Fwt3IypbG9IcJ/jW4hiTgsyrkRKFTr+MkwVoL+x64RH5yGsZTKBknFb1tNqlXozs
         XqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ENy/WEIbY0UvnPaFQKk0TlHStqX2OdMcbmfS7+e60BI=;
        b=NDr3yXIXybMDMW1yOBmR7KnS5LV9Sp1nmVksd/swuzNI5f88Vmw8NnIgBHM0rfCwNt
         nMeWZbqwWP8BG+nKBql5ZqHvYXkQzbgdFFiOT8wZ4AbVKdSfiog8ci5Q2EnFtmDW8AIE
         /HP0xhpcA2SQ645heAFgTicxVhjHXkwgSNxoSfnx5Gy9HyD/hYdgWmb+jCNzsZMG4uXW
         wrGK6SYsss4oF0KzQ7lXSZAhBY/mCTRtjt08+NcPSrVNCnKIsEkxDXDtal96EhzGvTU2
         mZTaGHSmpA7GQY1ZWbw0wijyRiVysIEUQgSxQnd4DqxTVxaNT95CiFzog1ZiXXUrd5h7
         rhbQ==
X-Gm-Message-State: ACrzQf1Err/mfQ/Rpq/H8N408rm5J1Ak4fIhBxV2+P/0O6u+XG0xo3zL
	aLpdK79GAw7IazsxI5ttRPpp7CdvnIeDlg==
X-Google-Smtp-Source: AMsMyM7ARRc1lO8QuQA/dVOUYdyohE9Aytyx3icj/eK9rMgj2aLcyr9LrVuwwE1UpPC2X+3hA60Q2Q==
X-Received: by 2002:a17:90b:17c9:b0:202:640c:ec5 with SMTP id me9-20020a17090b17c900b00202640c0ec5mr7328094pjb.71.1663903533224;
        Thu, 22 Sep 2022 20:25:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902f78300b001752216ca51sm4895224pln.39.2022.09.22.20.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 20:25:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc/64: provide a helper macro to load r2 with the kernel TOC
Date: Fri, 23 Sep 2022 13:25:11 +1000
Message-Id: <20220923032512.535725-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220923032512.535725-1-npiggin@gmail.com>
References: <20220923032512.535725-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A later change stops the kernel using r2 and loads it with a poison
value.  Provide a PACATOC loading abstraction which can hide this
detail.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc_asm.h             |  6 ++++++
 arch/powerpc/kernel/exceptions-64e.S           | 12 ++++++------
 arch/powerpc/kernel/exceptions-64s.S           |  6 +++---
 arch/powerpc/kernel/head_64.S                  |  4 ++--
 arch/powerpc/kernel/interrupt_64.S             | 12 ++++++------
 arch/powerpc/kernel/optprobes_head.S           |  2 +-
 arch/powerpc/kernel/trace/ftrace_low.S         |  2 +-
 arch/powerpc/kernel/trace/ftrace_mprofile.S    |  3 +--
 arch/powerpc/kvm/book3s_64_entry.S             |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S        |  4 ++--
 arch/powerpc/kvm/tm.S                          |  2 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S           |  2 +-
 arch/powerpc/platforms/powernv/opal-wrappers.S |  2 +-
 13 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index da570b197e82..17a87ecd82c9 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -305,6 +305,12 @@ GLUE(.,name):
 
 #ifdef __powerpc64__
 
+#define __LOAD_PACA_TOC(reg)			\
+	ld	reg,PACATOC(r13)
+
+#define LOAD_PACA_TOC()				\
+	__LOAD_PACA_TOC(r2)
+
 #define LOAD_REG_IMMEDIATE(reg, expr) __LOAD_REG_IMMEDIATE reg, expr
 
 #define LOAD_REG_IMMEDIATE_SYM(reg, tmp, expr)	\
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 08a3139079b7..c20b39d011a9 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -382,7 +382,7 @@ exc_##n##_common:							    \
 	ld	r4,excf+EX_R11(r13);	/* get back r11 */		    \
 	mfspr	r5,scratch;		/* get back r13 */		    \
 	std	r12,GPR12(r1);		/* save r12 in stackframe */	    \
-	ld	r2,PACATOC(r13);	/* get kernel TOC into r2 */	    \
+	LOAD_PACA_TOC();		/* get kernel TOC into r2 */	    \
 	mflr	r6;			/* save LR in stackframe */	    \
 	mfctr	r7;			/* save CTR in stackframe */	    \
 	mfspr	r8,SPRN_XER;		/* save XER in stackframe */	    \
@@ -698,7 +698,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	beq+	1f
 
 #ifdef CONFIG_RELOCATABLE
-	ld	r15,PACATOC(r13)
+	__LOAD_PACA_TOC(r15)
 	ld	r14,interrupt_base_book3e@got(r15)
 	ld	r15,__end_interrupts@got(r15)
 	cmpld	cr0,r10,r14
@@ -769,7 +769,7 @@ kernel_dbg_exc:
 	beq+	1f
 
 #ifdef CONFIG_RELOCATABLE
-	ld	r15,PACATOC(r13)
+	__LOAD_PACA_TOC(r15)
 	ld	r14,interrupt_base_book3e@got(r15)
 	ld	r15,__end_interrupts@got(r15)
 	cmpld	cr0,r10,r14
@@ -894,7 +894,7 @@ kernel_dbg_exc:
 
 .macro SEARCH_RESTART_TABLE
 #ifdef CONFIG_RELOCATABLE
-	ld	r11,PACATOC(r13)
+	__LOAD_PACA_TOC(r11)
 	ld	r14,__start___restart_table@got(r11)
 	ld	r15,__stop___restart_table@got(r11)
 #else
@@ -1073,7 +1073,7 @@ bad_stack_book3e:
 	std	r11,0(r1)
 	li	r12,0
 	std	r12,0(r11)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 1:	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_bad_stack
 	b	1b
@@ -1314,7 +1314,7 @@ a2_tlbinit_after_linear_map:
 
 	/* Now we branch the new virtual address mapped by this entry */
 #ifdef CONFIG_RELOCATABLE
-	ld	r5,PACATOC(r13)
+	__LOAD_PACA_TOC(r5)
 	ld	r3,1f@got(r5)
 #else
 	LOAD_REG_IMMEDIATE_SYM(r3, r5, 1f)
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 9d375ea58add..8e6fd8c6618e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -580,7 +580,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
 	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   */
 	mflr	r9			/* Get LR, later save to stack	*/
-	ld	r2,PACATOC(r13)		/* get kernel TOC into r2	*/
+	LOAD_PACA_TOC()			/* get kernel TOC into r2	*/
 	std	r9,_LINK(r1)
 	lbz	r10,PACAIRQSOFTMASK(r13)
 	mfspr	r11,SPRN_XER		/* save XER in stackframe	*/
@@ -610,7 +610,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 .macro SEARCH_RESTART_TABLE
 #ifdef CONFIG_RELOCATABLE
 	mr	r12,r2
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	LOAD_REG_ADDR(r9, __start___restart_table)
 	LOAD_REG_ADDR(r10, __stop___restart_table)
 	mr	r2,r12
@@ -640,7 +640,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 .macro SEARCH_SOFT_MASK_TABLE
 #ifdef CONFIG_RELOCATABLE
 	mr	r12,r2
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	LOAD_REG_ADDR(r9, __start___soft_mask_table)
 	LOAD_REG_ADDR(r10, __stop___soft_mask_table)
 	mr	r2,r12
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index cac3e1b58360..80106aaf0b7a 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -841,7 +841,7 @@ __secondary_start:
  * before going into C code.
  */
 start_secondary_prolog:
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	li	r3,0
 	std	r3,0(r1)		/* Zero the stack frame pointer	*/
 	bl	start_secondary
@@ -981,7 +981,7 @@ start_here_common:
 	std	r1,PACAKSAVE(r13)
 
 	/* Load the TOC (virtual address) */
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 
 	/* Mark interrupts soft and hard disabled (they might be enabled
 	 * in the PACA when doing hotplug)
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index fbfb72a62da9..3205be189e34 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -57,7 +57,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	std	r0,GPR0(r1)
 	std	r10,GPR1(r1)
 	std	r2,GPR2(r1)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	mfcr	r12
 	li	r11,0
 	/* Can we avoid saving r3-r8 in common case? */
@@ -185,7 +185,7 @@ syscall_vectored_\name\()_restart:
 _ASM_NOKPROBE_SYMBOL(syscall_vectored_\name\()_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	ld	r3,RESULT(r1)
 	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
@@ -235,7 +235,7 @@ START_BTB_FLUSH_SECTION
 	BTB_FLUSH(r10)
 END_BTB_FLUSH_SECTION
 #endif
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	mfcr	r12
 	li	r11,0
 	/* Can we avoid saving r3-r8 in common case? */
@@ -378,7 +378,7 @@ syscall_restart:
 _ASM_NOKPROBE_SYMBOL(syscall_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	ld	r3,RESULT(r1)
 	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
@@ -525,7 +525,7 @@ interrupt_return_\srr\()_user_restart:
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
@@ -658,7 +658,7 @@ interrupt_return_\srr\()_kernel_restart:
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
index 5c7f0b4b784b..cd4e7bc32609 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -73,7 +73,7 @@ optprobe_template_entry:
 	 * further below.
 	 */
 #ifdef CONFIG_PPC64
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 #endif
 
 	.global optprobe_template_op_address
diff --git a/arch/powerpc/kernel/trace/ftrace_low.S b/arch/powerpc/kernel/trace/ftrace_low.S
index 0bddf1fa6636..294d1e05958a 100644
--- a/arch/powerpc/kernel/trace/ftrace_low.S
+++ b/arch/powerpc/kernel/trace/ftrace_low.S
@@ -48,7 +48,7 @@ _GLOBAL(return_to_handler)
 	 * We might be called from a module.
 	 * Switch to our TOC to run inside the core kernel.
 	 */
-	ld	r2, PACATOC(r13)
+	LOAD_PACA_TOC()
 #else
 	stwu	r1, -16(r1)
 	stw	r3, 8(r1)
diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index 33fcfb2eaded..d031093bc436 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -83,8 +83,7 @@
 #ifdef CONFIG_PPC64
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, STK_GOT(r1)
-	ld	r2,PACATOC(r13)	/* get kernel TOC in r2 */
-
+	LOAD_PACA_TOC()		/* get kernel TOC in r2 */
 	LOAD_REG_ADDR(r3, function_trace_op)
 	ld	r5,0(r3)
 #else
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index e43704547a1e..6c2b1d17cb63 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -315,7 +315,7 @@ kvmppc_p9_exit_interrupt:
 	reg = reg + 1
 	.endr
 
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 
 	mflr	r4
 	std	r4,VCPU_LR(r3)
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 7ded202bf995..c984021e62c8 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1024,7 +1024,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 	/* Restore R1/R2 so we can handle faults */
 	ld	r1, HSTATE_HOST_R1(r13)
-	ld	r2, PACATOC(r13)
+	LOAD_PACA_TOC()
 
 	mfspr	r10, SPRN_SRR0
 	mfspr	r11, SPRN_SRR1
@@ -2727,7 +2727,7 @@ kvmppc_bad_host_intr:
 	std	r4, _CTR(r1)
 	std	r5, _XER(r1)
 	std	r6, SOFTE(r1)
-	ld	r2, PACATOC(r13)
+	LOAD_PACA_TOC()
 	LOAD_REG_IMMEDIATE(3, 0x7265677368657265)
 	std	r3, STACK_FRAME_OVERHEAD-16(r1)
 
diff --git a/arch/powerpc/kvm/tm.S b/arch/powerpc/kvm/tm.S
index 3bf17c854be4..2158f61e317f 100644
--- a/arch/powerpc/kvm/tm.S
+++ b/arch/powerpc/kvm/tm.S
@@ -110,7 +110,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_P9_TM_HV_ASSIST)
 	mtmsrd	r2, 1
 
 	/* Reload TOC pointer. */
-	ld	r2, PACATOC(r13)
+	LOAD_PACA_TOC()
 
 	/* Save all but r0-r2, r9 & r13 */
 	reg = 3
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 68ffbfdba894..0e4d9c817382 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -1124,7 +1124,7 @@ tlb_load_linear:
 	 * we only use 1G pages for now. That might have to be changed in a
 	 * final implementation, especially when dealing with hypervisors
 	 */
-	ld	r11,PACATOC(r13)
+	__LOAD_PACA_TOC(r11)
 	ld	r11,linear_map_top@got(r11)
 	ld	r10,0(r11)
 	tovirt(10,10)
diff --git a/arch/powerpc/platforms/powernv/opal-wrappers.S b/arch/powerpc/platforms/powernv/opal-wrappers.S
index e5acc33b3b20..0ed95f753416 100644
--- a/arch/powerpc/platforms/powernv/opal-wrappers.S
+++ b/arch/powerpc/platforms/powernv/opal-wrappers.S
@@ -57,7 +57,7 @@ opal_return:
 	.long 0xa64b7b7d /* mthsrr1 r11				*/
 	.long 0x2402004c /* hrfid				*/
 #endif
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	ld	r0,PPC_LR_STKOFF(r1)
 	mtlr	r0
 	blr
-- 
2.37.2

