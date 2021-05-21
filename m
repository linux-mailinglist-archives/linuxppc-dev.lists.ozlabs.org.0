Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6836D38C5F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmlDM2BLXz3c7G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:45:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f/PuMbHg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f/PuMbHg; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmlBv4Zm0z303P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 21:44:39 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id j12so14008352pgh.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KBlXMpJZbdE1xEh5rqkkshqOkRyVlkZ7GOS1V005+hc=;
 b=f/PuMbHgYmS6sKgu4Pj9AyQdMSpv+YfAil8zHdJR+rKRPuvXSHshRyTg1EftrwAFhe
 ndwTlMRZwoLCgnkwriEHIYYRs2pJTaOXQMOujHDebCHGYmgOiWW6kNixE5zk2wxKFENg
 k+E2dp73rV6kwwBo71YMHpUjl3j0agAT+ZtRKzfVYApqGCvTJhvEWyWNPGt96ICnM+Cg
 /y/Duzt5T07JxZC446Nza6VRMzKg0xxviBxsyfpcj4YtvMspO2VLucW1655IYbH9FT91
 zwuoVnsN8JhEdgww67m1I1ywbDqtF9aj5m4Lp7OAYv+9HkQDjvfSDlZtBv0S+Oxr4udP
 +6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KBlXMpJZbdE1xEh5rqkkshqOkRyVlkZ7GOS1V005+hc=;
 b=cKYw0yzGNL03skUdbfpsplEqMQic1Xi0CjL73Crdi+/KVqH4FOtddSt60Y0YWY7dX5
 LWspYGPrfm5XEAnT1dYl9tDTTH7acWAKfzCFQraczK664hlen7goPIhQxaSYjsTetlni
 U7XnWa1JqEWjs4uRtqZBUDJVxSPM3l0RgfxXSj01mpCjWf+/mQkB0Lkemdr26qyn0T5v
 6fTlqEKdMSFXLCDCQ5IuRNjVQpE9E7vWLMp1vKKP52h6i3jxZUm8Hd1FasBuHK3SXxIX
 Ru0WBvCt2VCTp4KL54MqlHkdCEwX0pWQgfbaL5vdAotJnscuE+8+MS7rcpuEK8/7YXDi
 uycQ==
X-Gm-Message-State: AOAM533mKNUadOHiM2ZH401oKGZ5OiC4YlNGNk/UZUKEFWGycjZOnFDr
 +mtz2xRjXV3q87eMFgvs/Qys9i9QhnQ=
X-Google-Smtp-Source: ABdhPJwzdXd17NW4OgeCigNNtgfVg7dWEf+ACi+88nVUVRmXy+/tJv3jDjJASk5ktyDSznaBiPycQQ==
X-Received: by 2002:aa7:9aed:0:b029:2e1:fdad:ac11 with SMTP id
 y13-20020aa79aed0000b02902e1fdadac11mr8338291pfp.58.1621597476953; 
 Fri, 21 May 2021 04:44:36 -0700 (PDT)
Received: from bobo.ibm.com (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id f5sm8681390pjp.37.2021.05.21.04.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:44:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/11] powerpc/64s: introduce different functions to return
 from SRR vs HSRR interrupts
Date: Fri, 21 May 2021 21:44:13 +1000
Message-Id: <20210521114422.3179350-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210521114422.3179350-1-npiggin@gmail.com>
References: <20210521114422.3179350-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/entry_64.S       | 65 +++++++++++++++++-------
 arch/powerpc/kernel/exceptions-64e.S |  4 ++
 arch/powerpc/kernel/exceptions-64s.S | 76 +++++++++++++++-------------
 arch/powerpc/kernel/vector.S         |  2 +-
 4 files changed, 92 insertions(+), 55 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 03727308d8cc..03a45a88b4b8 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -635,51 +635,57 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
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
-	bne	.Lfast_user_interrupt_return_amr
+	bne	.Lfast_user_interrupt_return_amr_srr
 	kuap_kernel_restore r3, r4
 	andi.	r0,r5,MSR_RI
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
-	bne+	.Lfast_kernel_interrupt_return
+	bne+	.Lfast_kernel_interrupt_return_srr
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
+	bne-	.Lrestore_nvgprs_\srr
 
 #ifdef CONFIG_PPC_BOOK3S
-.Lfast_user_interrupt_return_amr:
+.Lfast_user_interrupt_return_amr_\srr\():
 	kuap_user_restore r3, r4
 #endif
-.Lfast_user_interrupt_return:
+.Lfast_user_interrupt_return_\srr\():
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
@@ -706,24 +712,33 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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
@@ -757,7 +772,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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
@@ -777,8 +796,18 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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
index f1ae710274bc..b35c97c7082f 100644
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
index fa8e52a0239e..3a63feedae0b 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1234,7 +1234,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	mtmsrd 	r10,1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM machine_check
 
@@ -1363,7 +1363,7 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
-	b	interrupt_return
+	b	interrupt_return_srr
 
 1:	bl	do_break
 	/*
@@ -1371,7 +1371,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	 * If so, we need to restore them with their updated values.
 	 */
 	REST_NVGPRS(r1)
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM data_access
 
@@ -1414,7 +1414,7 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
@@ -1423,7 +1423,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM data_access_slb
 
@@ -1461,7 +1461,7 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM instruction_access
 
@@ -1498,7 +1498,7 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_interrupt_return
+	b	fast_interrupt_return_srr
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
@@ -1507,7 +1507,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM instruction_access_slb
 
@@ -1553,7 +1553,11 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
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
 
@@ -1582,7 +1586,7 @@ EXC_COMMON_BEGIN(alignment_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM alignment
 
@@ -1691,7 +1695,7 @@ EXC_COMMON_BEGIN(program_check_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM program_check
 
@@ -1736,12 +1740,12 @@ BEGIN_FTR_SECTION
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
@@ -1782,7 +1786,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM decrementer
 
@@ -1870,7 +1874,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #else
 	bl	unknown_async_exception
 #endif
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM doorbell_super
 
@@ -2041,7 +2045,7 @@ EXC_COMMON_BEGIN(single_step_common)
 	GEN_COMMON single_step
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	single_step_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM single_step
 
@@ -2082,7 +2086,7 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl      unknown_exception
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
-	b       interrupt_return
+	b       interrupt_return_hsrr
 
 	GEN_KVM h_data_storage
 
@@ -2109,7 +2113,7 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
 	GEN_COMMON h_instr_storage
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_instr_storage
 
@@ -2135,7 +2139,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM emulation_assist
 
@@ -2216,7 +2220,7 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM hmi_exception
 
@@ -2248,7 +2252,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #else
 	bl	unknown_async_exception
 #endif
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_doorbell
 
@@ -2276,7 +2280,7 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_virt_irq
 
@@ -2321,7 +2325,7 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM performance_monitor
 
@@ -2360,19 +2364,19 @@ BEGIN_FTR_SECTION
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
 
@@ -2415,14 +2419,14 @@ BEGIN_FTR_SECTION
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
 
@@ -2452,7 +2456,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM facility_unavailable
 
@@ -2482,7 +2486,7 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
 	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM h_facility_unavailable
 
@@ -2513,7 +2517,7 @@ EXC_COMMON_BEGIN(cbe_system_error_common)
 	GEN_COMMON cbe_system_error
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_system_error_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM cbe_system_error
 
@@ -2546,7 +2550,7 @@ EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	GEN_COMMON instruction_breakpoint
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	instruction_breakpoint_exception
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM instruction_breakpoint
 
@@ -2668,7 +2672,7 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 	GEN_COMMON denorm_exception
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM denorm_exception
 
@@ -2687,7 +2691,7 @@ EXC_COMMON_BEGIN(cbe_maintenance_common)
 	GEN_COMMON cbe_maintenance
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_maintenance_exception
-	b	interrupt_return
+	b	interrupt_return_hsrr
 
 	GEN_KVM cbe_maintenance
 
@@ -2719,7 +2723,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 #else
 	bl	unknown_exception
 #endif
-	b	interrupt_return
+	b	interrupt_return_srr
 
 	GEN_KVM altivec_assist
 
@@ -2738,7 +2742,7 @@ EXC_COMMON_BEGIN(cbe_thermal_common)
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

