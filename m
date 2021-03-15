Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCB833C91C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:11:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzrGl4H5bz3c1V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:11:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qgWJplCX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qgWJplCX; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr7Q4zLNz30LN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:50 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id y13so7489159pfr.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y+dg15PmAQIaQlIl2osG/hO3jjeAvCRiFGni1ZhwgxI=;
 b=qgWJplCXwPnKxkMOZJPqEDo7lnZMeZHNv6Hof5pH5nnymSRMY7K98BZzVEmbfo7/7z
 248aDEiIJNbjnS6z/xrXGEviK6XGxstHgeyPplWcW/SfF6sTEpT95H+smITs71RQ7tVX
 CdXSX28zNvhpHDGEGxatWvgHeYZNdD2v2Xq0rBLv8j30VQk68Zbj6MU1NzbH6I2MRwnq
 +EqqW3njmiaG0enAGkoYNRHqKomNNMhkW/1vQA4wy0Qmbow/j9I0XadBHL0kcKwqtdrd
 8bUsNfKnZhxCxbM0UFvPSjuj+oMz3qremmot02Z+ZVUQ8R5MH1pcquEI2G5D0MRdLDfC
 dP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y+dg15PmAQIaQlIl2osG/hO3jjeAvCRiFGni1ZhwgxI=;
 b=QymeK0DovK0Xi0ZZt9VJcTlrRcB7GbLSTSoLznsYGK2m/U7CkSm+rKonrsR49U0jVT
 r96DFks3DA8d8DJRqY3O/2TzmdW9S7KOgysdid9UoaLjLTqY5/irwE/e7q3VKt0EhZXG
 9qV8j25B8eEzZA8UGRn7CDYalgNrXCVzlP6vRWep8nrSND2jap8agOodsGO38h5jnMDM
 oNr4SCTwAvup6BvrazLu7nkdWTMTp/r3mikHY7/BEgjJ+griDxjWMBW+mtao8OyNqTyx
 5zwENrS3/9o4ew4Q/flEdEtxt2m3rfT66lY4oKWQnGg43wNXsOnfNQH7nobVfh1p3Suj
 Tz2w==
X-Gm-Message-State: AOAM533P2Rw8p/ubtQ3y59PNVUIOCuuHAvBsLjo2Wr6G76sG3UPNwz+w
 IBXTUCc16wh/n8VOiRyyQw6volGgAT0=
X-Google-Smtp-Source: ABdhPJy4lnU/fv6tr1AnVgVacx3ckViiw0iVbuzBtfjFUzXc5SS0009vNTjwUQlfI7j0hycU3uwRXA==
X-Received: by 2002:a05:6a00:1507:b029:1e4:d81:5586 with SMTP id
 q7-20020a056a001507b02901e40d815586mr12222975pfu.53.1615845888510; 
 Mon, 15 Mar 2021 15:04:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/14] powerpc/64s: use the same default PPR for user and
 kernel
Date: Tue, 16 Mar 2021 08:04:02 +1000
Message-Id: <20210315220402.260594-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315220402.260594-1-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
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

Change the default PPR to userspace to 4 (medium), matching the
normal kernel PPR.

This allows system calls and user interrupts to avoid setting PPR on
entry and exit, providing a significant speedup.

This is a change to the user environment. The problem with changing
the kernel to match userspace at 3 (medium-low), is that userspace
can then boost priority above the kernel which is also undesirable.

glibc does not seem to change PPR anywhere, so the decision is to
go with this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  2 ++
 arch/powerpc/include/asm/processor.h |  4 ++--
 arch/powerpc/kernel/exceptions-64s.S |  3 ---
 arch/powerpc/kernel/interrupt.c      | 33 ++++++++++++++++++++++++++++
 arch/powerpc/kernel/interrupt_64.S   | 17 --------------
 5 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index d6d54bbcba2f..293e6be9fd71 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -57,6 +57,8 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 #ifdef CONFIG_PPC64
 	bool trace_enable = false;
 
+	if (unlikely(regs->ppr != DEFAULT_PPR))
+		mtspr(SPRN_PPR, DEFAULT_PPR);
 	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS)) {
 		if (irq_soft_mask_set_return(IRQS_DISABLED) == IRQS_ENABLED)
 			trace_enable = true;
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index cb1edf21a82e..5ff589042103 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -27,8 +27,8 @@
 #endif
 
 #ifdef CONFIG_PPC64
-/* Default SMT priority is set to 3. Use 11- 13bits to save priority. */
-#define PPR_PRIORITY 3
+/* Default SMT priority is set to 4. Use 11- 13bits to save priority. */
+#define PPR_PRIORITY 4
 #ifdef __ASSEMBLY__
 #define DEFAULT_PPR (PPR_PRIORITY << 50)
 #else
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 75cee7cdf887..0d40614d13e0 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -367,7 +367,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 BEGIN_FTR_SECTION
 	mfspr	r9,SPRN_PPR
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-	HMT_MEDIUM
 	std	r10,IAREA+EX_R10(r13)		/* save r10 - r12 */
 BEGIN_FTR_SECTION
 	mfspr	r10,SPRN_CFAR
@@ -1962,8 +1961,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	mfspr	r11,SPRN_SRR0
 	mfspr	r12,SPRN_SRR1
 
-	HMT_MEDIUM
-
 	.if ! \virt
 	__LOAD_HANDLER(r10, system_call_common_real)
 	mtctr	r10
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 09cf699d0e2e..a6e0595da0dd 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -40,6 +40,11 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
 	regs->orig_gpr3 = r3;
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (unlikely(regs->ppr != DEFAULT_PPR))
+		mtspr(SPRN_PPR, DEFAULT_PPR);
+#endif
+
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
 
@@ -237,6 +242,11 @@ notrace unsigned long syscall_exit_prepare_main(unsigned long r3,
 
 	account_cpu_user_exit();
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (unlikely(regs->ppr != DEFAULT_PPR))
+		mtspr(SPRN_PPR, regs->ppr);
+#endif
+
 #ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not using this */
 	/*
 	 * We do this at the end so that we do context switch with KERNEL AMR
@@ -315,6 +325,11 @@ notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *reg
 	 */
 	hard_irq_disable();
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (unlikely(regs->ppr != DEFAULT_PPR))
+		mtspr(SPRN_PPR, DEFAULT_PPR);
+#endif
+
 	trace_hardirqs_off();
 	user_exit_irqoff();
 	account_cpu_user_entry();
@@ -398,6 +413,11 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 
 	account_cpu_user_exit();
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (unlikely(regs->ppr != DEFAULT_PPR))
+		mtspr(SPRN_PPR, regs->ppr);
+#endif
+
 	/*
 	 * We do this at the end so that we do context switch with KERNEL AMR
 	 */
@@ -489,6 +509,11 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 	local_paca->tm_scratch = regs->msr;
 #endif
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (unlikely(regs->ppr != DEFAULT_PPR))
+		mtspr(SPRN_PPR, regs->ppr);
+#endif
+
 	/*
 	 * Don't want to mfspr(SPRN_AMR) here, because this comes after mtmsr,
 	 * which would cause Read-After-Write stalls. Hence, we take the AMR
@@ -505,6 +530,10 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
 {
 	hard_irq_disable();
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (unlikely(regs->ppr != DEFAULT_PPR))
+		mtspr(SPRN_PPR, DEFAULT_PPR);
+#endif
 
 	trace_hardirqs_off();
 	user_exit_irqoff();
@@ -523,6 +552,10 @@ notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
 notrace unsigned long interrupt_exit_kernel_restart(struct pt_regs *regs)
 {
 	hard_irq_disable();
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (unlikely(regs->ppr != DEFAULT_PPR))
+		mtspr(SPRN_PPR, DEFAULT_PPR);
+#endif
 
 #ifndef CONFIG_PPC_BOOK3E_64
 	set_kuap(AMR_KUAP_BLOCKED);
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index eef61800f734..53fc446dcbeb 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -99,10 +99,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	ld	r11,exception_marker@toc(r2)
 	std	r11,-16(r10)		/* "regshere" marker */
 
-BEGIN_FTR_SECTION
-	HMT_MEDIUM
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
 	ENTER_KERNEL_SECURITY_FALLBACK
 
 	/*
@@ -142,10 +138,6 @@ BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
 END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
-BEGIN_FTR_SECTION
-	HMT_MEDIUM_LOW
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
 	cmpdi	r3,0
 	bne	.Lsyscall_vectored_\name\()_restore_regs
 
@@ -377,10 +369,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	mtspr	SPRN_XER,r0
 .Lsyscall_restore_regs_cont:
 
-BEGIN_FTR_SECTION
-	HMT_MEDIUM_LOW
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
 	 * The value of AMR only matters while we're in the kernel.
@@ -533,11 +521,6 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	tdnei	r4,IRQS_ENABLED
 
 #ifdef CONFIG_PPC_BOOK3S
-BEGIN_FTR_SECTION
-	ld	r10,_PPR(r1)
-	mtspr	SPRN_PPR,r10
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
 	.else
-- 
2.23.0

