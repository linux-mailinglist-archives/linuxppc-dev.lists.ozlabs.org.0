Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B468433C909
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:06:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzr9S585Xz30D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:06:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=smzFM9aO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=smzFM9aO; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr6y5BZyz30CG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:26 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id b23so7460071pfo.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c9XIxiTI18/af71g4cRXWy00Q43r1G9z1OuTDdDj6IA=;
 b=smzFM9aOkObw/J1pNIQyPQF/+NIx1djRWMwpAU56eS74PDBDcXOPRUU1ZA6VxCjEKC
 p0QtNh8x2ZtZNbE68pL7M8+uIXELllGJdCVSrLR/fhGZJ+fS+ZNOxIuZsqmMUv14hmol
 P5mlqSN8UMzEsAM398k6ajfT642qM7bq1D+BQjXT6M+CC66/neE7dkdorH8euZC015M+
 oNzpbg7ii4nJuLwwbWYm7RV3bGjD9dlS+L2zopJZa7OzDDs5noLI5rRRjtoodaOzvmGP
 7CwlfjHWujYn8Vjvc8b173CATPUGK8QYwLuQ+p1lFOg6cUgg8ZguRUTy17VhBkTewNec
 quFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c9XIxiTI18/af71g4cRXWy00Q43r1G9z1OuTDdDj6IA=;
 b=NKNCW2ST+hxXbc2jfgKqLFwIMBUBT/rNDt2gubZdY5vWPVe2urgSKU6abi49zYRsTQ
 AiYKCnPZ2mdu2u1FpdI5NBTSmuBvYxlDzLzTpYG4SGrn1EMVn6VV0c0qnd1ok0X60lal
 FOkWg8qsGR+BWw008V9Lw4LGcOZculKF7s08i5wAlyaBwZq5u1lB3CL/KRYODzO/VIve
 yLTSWGumz0yDaqkR4uxDe4X6oWDhNVpYEE5iRZ6jeSjonyE1PCjCqaQMLEaFW9QD8KXl
 TGwxZyN5riFv1DmTvYG0cved1zyUZ9+fJV+LmWZvnQjJAnhdRO6pMbhPfOBXuh1w5m1G
 Fb9g==
X-Gm-Message-State: AOAM532viYOJBa9SWNh5XnSijGubjRepbmCKoP9sq35YjoSXFOPjagag
 xGIilcq/zA3Nu4kWEHZofM+HZo/9Z54=
X-Google-Smtp-Source: ABdhPJxpQsQlaS107ebYAjY6zVO5XeGvp7ElCDGqq4e7FZsSIfMXwjnB0HJZsItIzXLIvH+qZVsASw==
X-Received: by 2002:a63:fb10:: with SMTP id o16mr1015078pgh.368.1615845859596; 
 Mon, 15 Mar 2021 15:04:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/14] powerpc/64s: introduce different functions to return
 from SRR vs HSRR interrupts
Date: Tue, 16 Mar 2021 08:03:51 +1000
Message-Id: <20210315220402.260594-4-npiggin@gmail.com>
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

This makes no real difference yet except that HSRR type interrupts will
use hrfid to return. This is important for the next patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S       | 63 ++++++++++++++++-------
 arch/powerpc/kernel/exceptions-64e.S |  4 ++
 arch/powerpc/kernel/exceptions-64s.S | 76 +++++++++++++++-------------
 arch/powerpc/kernel/vector.S         |  2 +-
 4 files changed, 91 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 3632d8c56e48..ccf913cedd29 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -643,43 +643,44 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	 * touched, no exit work created, then this can be used.
 	 */
 	.balign IFETCH_ALIGN_BYTES
-	.globl fast_interrupt_return
-fast_interrupt_return:
-_ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
+	.globl fast_interrupt_return_srr
+fast_interrupt_return_srr:
+_ASM_NOKPROBE_SYMBOL(fast_interrupt_return_srr)
 	kuap_check_amr r3, r4
 	ld	r5,_MSR(r1)
 	andi.	r0,r5,MSR_PR
 #ifdef CONFIG_PPC_BOOK3S
 	beq	1f
 	kuap_user_restore r3, r4
-	b	.Lfast_user_interrupt_return
+	b	.Lfast_user_interrupt_return_srr
 1:
 	andi.	r0,r5,MSR_RI
 	beq-	2f
 	kuap_kernel_restore r3, r4
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
-	b	.Lfast_kernel_interrupt_return
+	b	.Lfast_kernel_interrupt_return_srr
 2:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unrecoverable_exception
 	b	. /* should not get here */
 #else
-	bne	.Lfast_user_interrupt_return
-	b	.Lfast_kernel_interrupt_return
+	bne	.Lfast_user_interrupt_return_srr
+	b	.Lfast_kernel_interrupt_return_srr
 #endif
 
+.macro interrupt_return_macro srr
 	.balign IFETCH_ALIGN_BYTES
-	.globl interrupt_return
-interrupt_return:
-_ASM_NOKPROBE_SYMBOL(interrupt_return)
+	.globl interrupt_return_\srr
+interrupt_return_\srr\():
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
-	beq	.Lkernel_interrupt_return
+	beq	.Lkernel_interrupt_return_\srr
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_user_prepare
 	cmpdi	r3,0
-	bne-	.Lrestore_nvgprs
-.Lfast_user_interrupt_return:
+	bne-	.Lrestore_nvgprs_\srr
+.Lfast_user_interrupt_return_\srr\():
 	EXIT_KERNEL_SECURITY_FALLBACK
 
 	ld	r11,_NIP(r1)
@@ -688,8 +689,13 @@ BEGIN_FTR_SECTION
 	ld	r10,_PPR(r1)
 	mtspr	SPRN_PPR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+	.ifc \srr,srr
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
+	.else
+	mtspr	SPRN_HSRR0,r11
+	mtspr	SPRN_HSRR1,r12
+	.endif
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
@@ -716,24 +722,33 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	REST_GPR(6, r1)
 	REST_GPR(0, r1)
 	REST_GPR(1, r1)
+	.ifc \srr,srr
 	RFI_TO_USER
+	.else
+	HRFI_TO_USER
+	.endif
 	b	.	/* prevent speculative execution */
 
-.Lrestore_nvgprs:
+.Lrestore_nvgprs_\srr\():
 	REST_NVGPRS(r1)
-	b	.Lfast_user_interrupt_return
+	b	.Lfast_user_interrupt_return_\srr
 
 	.balign IFETCH_ALIGN_BYTES
-.Lkernel_interrupt_return:
+.Lkernel_interrupt_return_\srr\():
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_kernel_prepare
 
-.Lfast_kernel_interrupt_return:
+.Lfast_kernel_interrupt_return_\srr\():
 	cmpdi	cr1,r3,0
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
+	.ifc \srr,srr
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
+	.else
+	mtspr	SPRN_HSRR0,r11
+	mtspr	SPRN_HSRR1,r12
+	.endif
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
@@ -767,7 +782,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	REST_GPR(6, r1)
 	REST_GPR(0, r1)
 	REST_GPR(1, r1)
+	.ifc \srr,srr
 	RFI_TO_KERNEL
+	.else
+	HRFI_TO_KERNEL
+	.endif
 	b	.	/* prevent speculative execution */
 
 1:	/*
@@ -787,8 +806,18 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	std	r9,0(r1) /* perform store component of stdu */
 	ld	r9,PACA_EXGEN+0(r13)
 
+	.ifc \srr,srr
 	RFI_TO_KERNEL
+	.else
+	HRFI_TO_KERNEL
+	.endif
 	b	.	/* prevent speculative execution */
+.endm
+
+interrupt_return_macro srr
+#ifdef CONFIG_PPC_BOOK3S
+interrupt_return_macro hsrr
+#endif
 
 #ifdef CONFIG_PPC_RTAS
 /*
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index b08c84e0fa56..86612f68f5bd 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -26,6 +26,10 @@
 #include <asm/feature-fixups.h>
 #include <asm/context_tracking.h>
 
+/* 64e interrupt returns always use SRR registers */
+#define fast_interrupt_return fast_interrupt_return_srr
+#define interrupt_return interrupt_return_srr
+
 /* XXX This will ultimately add space for a special exception save
  *     structure used to save things like SRR0/SRR1, SPRGs, MAS, etc...
  *     when taking special interrupts. For now we don't support that,
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0127032bc2aa..136323d38c80 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1238,7 +1238,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	mtmsrd 	r10,1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM machine_check
 
@@ -1367,7 +1367,7 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
-	b	interrupt_return
+	b	interrupt_return_srr
 
 1:	bl	do_break
 	/*
@@ -1375,7 +1375,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	 * If so, we need to restore them with their updated values.
 	 */
 	REST_NVGPRS(r1)
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM data_access
 
@@ -1418,7 +1418,7 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
@@ -1427,7 +1427,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM data_access_slb
 
@@ -1465,7 +1465,7 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM instruction_access
 
@@ -1502,7 +1502,7 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
@@ -1511,7 +1511,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM instruction_access_slb
 
@@ -1557,7 +1557,11 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return
+	BEGIN_FTR_SECTION
+	b	interrupt_return_hsrr
+	FTR_SECTION_ELSE
+	b	interrupt_return_srr
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 
 	GEN_KVM hardware_interrupt
 
@@ -1586,7 +1590,7 @@ EXC_COMMON_BEGIN(alignment_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM alignment
 
@@ -1695,7 +1699,7 @@ EXC_COMMON_BEGIN(program_check_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM program_check
 
@@ -1740,12 +1744,12 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
 	bl	load_up_fpu
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	fp_unavailable_tm
-	b	interrupt_return
+	b	interrupt_return_srr
 #endif
 
 	GEN_KVM fp_unavailable
@@ -1786,7 +1790,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM decrementer
 
@@ -1874,7 +1878,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #else
 	bl	unknown_async_exception
 #endif
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM doorbell_super
 
@@ -2045,7 +2049,7 @@ EXC_COMMON_BEGIN(single_step_common)
 	GEN_COMMON single_step
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	single_step_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM single_step
 
@@ -2086,7 +2090,7 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl      unknown_exception
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
-	b       interrupt_return
+	b       interrupt_return_hsrr
 
 	GEN_KVM h_data_storage
 
@@ -2113,7 +2117,7 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
 	GEN_COMMON h_instr_storage
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_instr_storage
 
@@ -2139,7 +2143,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM emulation_assist
 
@@ -2222,7 +2226,7 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM hmi_exception
 
@@ -2254,7 +2258,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #else
 	bl	unknown_async_exception
 #endif
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_doorbell
 
@@ -2282,7 +2286,7 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_virt_irq
 
@@ -2327,7 +2331,7 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM performance_monitor
 
@@ -2366,19 +2370,19 @@ BEGIN_FTR_SECTION
   END_FTR_SECTION_NESTED(CPU_FTR_TM, CPU_FTR_TM, 69)
 #endif
 	bl	load_up_altivec
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_tm
-	b	interrupt_return
+	b	interrupt_return_srr
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM altivec_unavailable
 
@@ -2421,14 +2425,14 @@ BEGIN_FTR_SECTION
 2:	/* User process was in a transaction */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_tm
-	b	interrupt_return
+	b	interrupt_return_srr
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 #endif
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM vsx_unavailable
 
@@ -2458,7 +2462,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM facility_unavailable
 
@@ -2488,7 +2492,7 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
 	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_facility_unavailable
 
@@ -2521,7 +2525,7 @@ EXC_COMMON_BEGIN(cbe_system_error_common)
 	GEN_COMMON cbe_system_error
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_system_error_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM cbe_system_error
 
@@ -2549,7 +2553,7 @@ EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	GEN_COMMON instruction_breakpoint
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	instruction_breakpoint_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM instruction_breakpoint
 
@@ -2671,7 +2675,7 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 	GEN_COMMON denorm_exception
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM denorm_exception
 
@@ -2692,7 +2696,7 @@ EXC_COMMON_BEGIN(cbe_maintenance_common)
 	GEN_COMMON cbe_maintenance
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_maintenance_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM cbe_maintenance
 
@@ -2724,7 +2728,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 #else
 	bl	unknown_exception
 #endif
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM altivec_assist
 
@@ -2745,7 +2749,7 @@ EXC_COMMON_BEGIN(cbe_thermal_common)
 	GEN_COMMON cbe_thermal
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_thermal_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM cbe_thermal
 
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index f5a52f444e36..54dbefcb4cde 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -131,7 +131,7 @@ _GLOBAL(load_up_vsx)
 	/* enable use of VSX after return */
 	oris	r12,r12,MSR_VSX@h
 	std	r12,_MSR(r1)
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 
 #endif /* CONFIG_VSX */
 
-- 
2.23.0

