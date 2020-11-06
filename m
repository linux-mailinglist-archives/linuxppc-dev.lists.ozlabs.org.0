Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDF52A990C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:06:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSQHq1w0BzDrRM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:06:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qVZEv8tI; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSQ7k3gBRzDrGs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 02:59:46 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id e21so1238069pgr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zjlOcP1SibozeBJytyUdwL7NYDaxa22eH0t6dqrlinM=;
 b=qVZEv8tIQTwZVAaVEuUuTF+Sg7Vg4kL/X82A4rvAmsdYFyDPqHpDwK7MtFQh4lX9Ny
 KO+rpi/sJXtDw3787zri+68SYO/8eUe5ZALckeccdqUyRgz3rJ0eR/GFvPxOAEMnBNTw
 q9KTKhkWSFK1Qv0k9RvI5hAmmykkOOl+8MmNiDxNY07kY19dZaDVhp2zKgF+aTEO1ir5
 507CqwEFyS/Dp6GGG3pWhosnCBUDNF02bve1M9zff/vNELUjBE2ML/QqQ5RwEUPgxHyp
 DoT3jnalITlMuvW7ZghpemY15Cz1Z+LLhP92n9lEJpgS/a3ay8eduaEZZeWQ0BZ4pAiu
 4ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zjlOcP1SibozeBJytyUdwL7NYDaxa22eH0t6dqrlinM=;
 b=PiwetiEQVJxs+j7A0VpMagE+M6E8+SemdQToEAvdSgL85K4S7CN8noZ4q9Eq8Id+Fy
 Ly58EAqEPwbXpNou7jaC2bP08ZLlItz3ph96F57IL1Bb8WgVxrJfCRGYdqlUAAdJZiml
 zk9tVT141nRGroH8rwhAsvmfyDB3CuV4uiqCZ2ApZDesFNV2ns/pfj1aoIurJSCTI2ml
 vW1G9IFl/K/aMdIfFRl2ROGl03Mvu+gs2zAAaq2T2W+E35lMVXOy+u08NaKSv+i2stQp
 XK3w1ieKxMgAm7l4XG8uAutH34nPnDcNjg6Ui1qg+t5z348ETZYg61sPStLbdisIz0Pd
 btrw==
X-Gm-Message-State: AOAM533jV4e4RHkWBpKCITtH34sfrjhR/1ihEYKUxHo2UNsPtmuLYtjz
 +xQctwteb852dCZ3tGXaTLq5DYtiQbY=
X-Google-Smtp-Source: ABdhPJxj+FokhXaeoPQvrTS6ceiEk7nZ7SNl3Bxnv2IH8tRWCWiXu6lr26Q5zQw7Qo4/D72H04V2ww==
X-Received: by 2002:a17:90b:8c8:: with SMTP id ds8mr272570pjb.40.1604678383507; 
 Fri, 06 Nov 2020 07:59:43 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id g7sm2899536pjl.11.2020.11.06.07.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:59:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/9] powerpc/64s: introduce different functions to return
 from SRR vs HSRR interrupts
Date: Sat,  7 Nov 2020 01:59:23 +1000
Message-Id: <20201106155929.2246055-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201106155929.2246055-1-npiggin@gmail.com>
References: <20201106155929.2246055-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/entry_64.S       | 58 +++++++++++++++------
 arch/powerpc/kernel/exceptions-64s.S | 78 +++++++++++++++-------------
 arch/powerpc/kernel/vector.S         |  2 +-
 3 files changed, 85 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index bd8cc7a214d3..53027fc9cd31 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -648,47 +648,54 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	blr
 
 #ifdef CONFIG_PPC_BOOK3S
+
 	/*
 	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
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
-	bne	.Lfast_user_interrupt_return
+	bne	.Lfast_user_interrupt_return_srr
 	kuap_restore_amr r3, r4
 	andi.	r0,r5,MSR_RI
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
-	bne+	.Lfast_kernel_interrupt_return
+	bne+	.Lfast_kernel_interrupt_return_srr
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unrecoverable_exception
 	b	. /* should not get here */
 
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
+	bne-	.Lrestore_nvgprs_\srr
 
-.Lfast_user_interrupt_return:
+.Lfast_user_interrupt_return_\srr:
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
 BEGIN_FTR_SECTION
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
@@ -715,24 +722,33 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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
@@ -766,7 +782,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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
@@ -786,8 +806,16 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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
+interrupt_return_macro hsrr
 #endif /* CONFIG_PPC_BOOK3S */
 
 #ifdef CONFIG_PPC_RTAS
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ad9f51e49806..1f725a3ac2f3 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1236,7 +1236,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	mtmsrd 	r10,1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM machine_check
 
@@ -1360,10 +1360,10 @@ MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
         cmpdi	r3,0
-	beq+	interrupt_return
+	beq+	interrupt_return_srr
 	/* We need to restore NVGPRS */
 	REST_NVGPRS(r1)
-	b       interrupt_return
+	b       interrupt_return_srr
 
 	GEN_KVM data_access
 
@@ -1410,7 +1410,7 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
@@ -1419,7 +1419,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM data_access_slb
 
@@ -1458,10 +1458,10 @@ MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
         cmpdi	r3,0
-	beq+	interrupt_return
+	beq+	interrupt_return_srr
 	/* We need to restore NVGPRS */
 	REST_NVGPRS(r1)
-	b       interrupt_return
+	b       interrupt_return_srr
 
 	GEN_KVM instruction_access
 
@@ -1499,7 +1499,7 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
@@ -1508,7 +1508,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM instruction_access_slb
 
@@ -1554,7 +1554,11 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
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
 
@@ -1583,7 +1587,7 @@ EXC_COMMON_BEGIN(alignment_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM alignment
 
@@ -1647,7 +1651,7 @@ EXC_COMMON_BEGIN(program_check_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM program_check
 
@@ -1692,12 +1696,12 @@ BEGIN_FTR_SECTION
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
@@ -1738,7 +1742,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM decrementer
 
@@ -1826,7 +1830,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #else
 	bl	unknown_async_exception
 #endif
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM doorbell_super
 
@@ -1995,7 +1999,7 @@ EXC_COMMON_BEGIN(single_step_common)
 	GEN_COMMON single_step
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	single_step_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM single_step
 
@@ -2036,7 +2040,7 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl      unknown_exception
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
-	b       interrupt_return
+	b       interrupt_return_hsrr
 
 	GEN_KVM h_data_storage
 
@@ -2063,7 +2067,7 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
 	GEN_COMMON h_instr_storage
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_instr_storage
 
@@ -2089,7 +2093,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM emulation_assist
 
@@ -2170,7 +2174,7 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM hmi_exception
 
@@ -2202,7 +2206,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #else
 	bl	unknown_async_exception
 #endif
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_doorbell
 
@@ -2230,7 +2234,7 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_virt_irq
 
@@ -2275,7 +2279,7 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM performance_monitor
 
@@ -2314,19 +2318,19 @@ BEGIN_FTR_SECTION
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
 
@@ -2369,14 +2373,14 @@ BEGIN_FTR_SECTION
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
 
@@ -2406,7 +2410,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM facility_unavailable
 
@@ -2436,7 +2440,7 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
 	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_facility_unavailable
 
@@ -2469,7 +2473,7 @@ EXC_COMMON_BEGIN(cbe_system_error_common)
 	GEN_COMMON cbe_system_error
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_system_error_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM cbe_system_error
 
@@ -2497,7 +2501,7 @@ EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	GEN_COMMON instruction_breakpoint
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	instruction_breakpoint_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM instruction_breakpoint
 
@@ -2619,7 +2623,7 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 	GEN_COMMON denorm_exception
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM denorm_exception
 
@@ -2640,7 +2644,7 @@ EXC_COMMON_BEGIN(cbe_maintenance_common)
 	GEN_COMMON cbe_maintenance
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_maintenance_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM cbe_maintenance
 
@@ -2672,7 +2676,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 #else
 	bl	unknown_exception
 #endif
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM altivec_assist
 
@@ -2693,7 +2697,7 @@ EXC_COMMON_BEGIN(cbe_thermal_common)
 	GEN_COMMON cbe_thermal
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_thermal_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM cbe_thermal
 
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 801dc28fdcca..2c948e7b0d00 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -133,7 +133,7 @@ _GLOBAL(load_up_vsx)
 	/* enable use of VSX after return */
 	oris	r12,r12,MSR_VSX@h
 	std	r12,_MSR(r1)
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 
 #endif /* CONFIG_VSX */
 
-- 
2.23.0

