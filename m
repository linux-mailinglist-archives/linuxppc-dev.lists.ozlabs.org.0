Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA67B7F72B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:46:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460RkC3f5qzDr24
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:46:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dHS8CPWV"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PNb6bGszDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:01:19 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c2so33487337plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gpEiYkgipzVx7IMbkAbwqZKPBlXypportruuk52nx6w=;
 b=dHS8CPWV+TOj2N3xyxrcce0BTsMKAvkR5Wbt2uwkOvqkd3S6C4mgplhvb0JUnU5T2C
 Z/hS7Hx78aYv8eG5tAruGUcT0eiUzMtUdDSWgarzJDKU+OKZ+hsCrbmKUCOZu+DEg/2Y
 B2Y40gDW6pYFMPXfOual8DFbZIsMsXW4eN7SxmQEP5W+MnkY/SaqN3Y4K7rxQvOiG4cx
 QPDtmryV8m1WbGvbrc9Q2wQ2KdeP28DdvDskZJV/UyRRS4TB07pGWiC5dsTjRlYeHAc+
 1V01Vgx2PbcqakYtvx/AmCInDua5UYx69NTVzkbs3qpFvAnC1F62DvtTmmzomoP3YXIE
 bq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gpEiYkgipzVx7IMbkAbwqZKPBlXypportruuk52nx6w=;
 b=ECDsUleSd6lO+VYqdvh0iRF0SWN/6hPMjAOWm6KCY4aA6uZs7Nf2X9/Ta/GaXvYjOC
 R504Tl4USzlFB6MTGFys7a9Ynn5n1BG5mT3BikA6/kO+Ry5sPHUHBMSR/X4CYEy8bwuh
 duxu7rbzCx4XAu0wpj7W5JVPlGekhBwIbstDe7kQ+ay1CuLUgQysWEazThBY6ePgetHI
 HMK1ZpaeCz1cKJo8UPtjwVodrCeeZthOpfhpJ1plo9hHWhanq7lblZ5qvBWI/sTj1jzS
 sZJ+OrHqN4zV8A5IbfS2HvZucdjCBKzOcZrhoCydEBh/5L2rI2B5b5BKFDR4RP6aWoJr
 uQRQ==
X-Gm-Message-State: APjAAAUxCzNMot/XilVxwT1Axhpur1BzHd4PXX56ooGBrQ4y0snKJa/c
 g10+jWni5+dNJITC55HNsqa3kyaHoqg=
X-Google-Smtp-Source: APXvYqzLNA9lf9ei1G82QjTupQ5FIHK5YhPvjzlEnEu84jbdE5cKYkIxd2gMI1ik/VIoeZfqomEDbw==
X-Received: by 2002:a17:902:b608:: with SMTP id
 b8mr132723853pls.303.1564743676361; 
 Fri, 02 Aug 2019 04:01:16 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.01.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:01:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 41/44] powerpc/64s/exception: Move all interrupt handlers
 to new style code gen macros
Date: Fri,  2 Aug 2019 20:57:06 +1000
Message-Id: <20190802105709.27696-42-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

Aside from label names and BUG line numbers, the generated code change
is an additional HMI KVM handler added for the "late" KVM handler,
because early and late HMI generation is achieved by defining two
different interrupt types.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 611 ++++++++++++++++++++-------
 1 file changed, 465 insertions(+), 146 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 94f8ecacbce5..3e57b5861695 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -206,8 +206,10 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define IMASK		.L_IMASK_\name\()
 #define IKVM_SKIP	.L_IKVM_SKIP_\name\()
 #define IKVM_REAL	.L_IKVM_REAL_\name\()
+#define __IKVM_REAL(name)	.L_IKVM_REAL_ ## name
 #define IKVM_VIRT	.L_IKVM_VIRT_\name\()
 #define ISTACK		.L_ISTACK_\name\()
+#define __ISTACK(name)	.L_ISTACK_ ## name
 #define IRECONCILE	.L_IRECONCILE_\name\()
 #define IKUAP		.L_IKUAP_\name\()
 
@@ -570,7 +572,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	/* nothing more */
 	.elseif \early
 	mfctr	r10			/* save ctr, even for !RELOCATABLE */
-	BRANCH_TO_C000(r11, \name\()_early_common)
+	BRANCH_TO_C000(r11, \name\()_common)
 	.elseif !\virt
 	INT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr, \ri
 	.else
@@ -847,6 +849,20 @@ __start_interrupts:
 EXC_VIRT_NONE(0x4000, 0x100)
 
 
+INT_DEFINE_BEGIN(system_reset)
+	IVEC=0x100
+	IHSRR=EXC_STD
+	IAREA=PACA_EXNMI
+	/*
+	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
+	 * being used, so a nested NMI exception would corrupt it.
+	 */
+	ISET_RI=0
+	ISTACK=0
+	IRECONCILE=0
+	IKVM_REAL=1
+INT_DEFINE_END(system_reset)
+
 EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
 #ifdef CONFIG_PPC_P7_NAP
 	/*
@@ -884,11 +900,8 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
-	INT_HANDLER system_reset, 0x100, 0, 0, 0, EXC_STD, PACA_EXNMI, 0, 0, 0, 0, 1
+	GEN_INT_ENTRY system_reset, GEN_REAL
 	/*
-	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
-	 * being used, so a nested NMI exception would corrupt it.
-	 *
 	 * In theory, we should not enable relocation here if it was disabled
 	 * in SRR1, because the MMU may not be configured to support it (e.g.,
 	 * SLB may have been cleared). In practice, there should only be a few
@@ -897,7 +910,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 */
 EXC_REAL_END(system_reset, 0x100, 0x100)
 EXC_VIRT_NONE(0x4100, 0x100)
-INT_KVM_HANDLER system_reset 0x100, EXC_STD, PACA_EXNMI, 0
+TRAMP_KVM_BEGIN(system_reset_kvm)
+	GEN_KVM system_reset
 
 #ifdef CONFIG_PPC_P7_NAP
 TRAMP_REAL_BEGIN(system_reset_idle_wake)
@@ -912,8 +926,8 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
  * Vectors for the FWNMI option.  Share common code.
  */
 TRAMP_REAL_BEGIN(system_reset_fwnmi)
-	/* See comment at system_reset exception, don't turn on RI */
-	INT_HANDLER system_reset, 0x100, 0, 0, 0, EXC_STD, PACA_EXNMI, 0, 0, 0, 0, 0
+	__IKVM_REAL(system_reset)=0
+	GEN_INT_ENTRY system_reset, GEN_REAL
 
 #endif /* CONFIG_PPC_PSERIES */
 
@@ -933,7 +947,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	mr	r10,r1
 	ld	r1,PACA_NMI_EMERG_SP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	INT_COMMON 0x100, PACA_EXNMI, 0, 1, 0, 0, 0
+	GEN_COMMON system_reset
 	bl	save_nvgprs
 	/*
 	 * Set IRQS_ALL_DISABLED unconditionally so arch_irqs_disabled does
@@ -975,23 +989,48 @@ EXC_COMMON_BEGIN(system_reset_common)
 	RFI_TO_USER_OR_KERNEL
 
 
-EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
-	INT_HANDLER machine_check, 0x200, 0, 1, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 0
+INT_DEFINE_BEGIN(machine_check_early)
+	IVEC=0x200
+	IHSRR=EXC_STD
+	IAREA=PACA_EXMC
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
 	 * MSR_RI.
 	 */
+	ISET_RI=0
+	ISTACK=0
+	IEARLY=1
+	IDAR=1
+	IDSISR=1
+	IRECONCILE=0
+	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
+INT_DEFINE_END(machine_check_early)
+
+INT_DEFINE_BEGIN(machine_check)
+	IVEC=0x200
+	IHSRR=EXC_STD
+	IAREA=PACA_EXMC
+	ISET_RI=0
+	IDAR=1
+	IDSISR=1
+	IKVM_SKIP=1
+	IKVM_REAL=1
+INT_DEFINE_END(machine_check)
+
+EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
+	GEN_INT_ENTRY machine_check_early, GEN_REAL
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 
 #ifdef CONFIG_PPC_PSERIES
 TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	/* See comment at machine_check exception, don't turn on RI */
-	INT_HANDLER machine_check, 0x200, 0, 1, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 0
+	GEN_INT_ENTRY machine_check_early, GEN_REAL
 #endif
 
-INT_KVM_HANDLER machine_check 0x200, EXC_STD, PACA_EXMC, 1
+TRAMP_KVM_BEGIN(machine_check_kvm)
+	GEN_KVM machine_check
 
 #define MACHINE_CHECK_HANDLER_WINDUP			\
 	/* Clear MSR_RI before setting SRR0 and SRR1. */\
@@ -1043,8 +1082,7 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	bgt	cr1,unrecoverable_mce	/* Check if we hit limit of 4 */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
 
-	/* We don't touch AMR here, we never go to virtual mode */
-	INT_COMMON 0x200, PACA_EXMC, 0, 0, 0, 1, 1
+	GEN_COMMON machine_check_early
 
 BEGIN_FTR_SECTION
 	bl	enable_machine_check
@@ -1132,15 +1170,16 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_CFAR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	MACHINE_CHECK_HANDLER_WINDUP
-	/* See comment at machine_check exception, don't turn on RI */
-	INT_HANDLER machine_check, 0x200, 0, 0, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 1
+
+	GEN_INT_ENTRY machine_check, GEN_REAL
 
 EXC_COMMON_BEGIN(machine_check_common)
 	/*
 	 * Machine check is different because we use a different
 	 * save area: PACA_EXMC instead of PACA_EXGEN.
 	 */
-	INT_COMMON 0x200, PACA_EXMC, 1, 1, 1, 1, 1
+	GEN_COMMON machine_check
+
 	FINISH_NAP
 	/* Enable MSR_RI when finished with PACA_EXMC */
 	li	r10,MSR_RI
@@ -1212,21 +1251,30 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	bl	unrecoverable_exception
 	b	.
 
+
+/**
+ * 0x300 - Data Storage Interrupt (DSI)
+ * This interrupt is generated due to a data access which does not have a valid
+ * page table entry with permissions to allow the data access to be performed.
+ * DAWR matches also fault here, as do RC updates, and minor misc errors e.g.,
+ * copy/paste, AMO, certain invalid CI accesses, etc.
+ *
+ * This interrupt is delivered to the guest (HV bit unchanged).
+ *
+ * Linux HPT responds by first attempting to refill the hash table from the
+ * Linux page table, then going to a full page fault if the Linux page table
+ * entry was insufficient. RPT goes straight to full page fault.
+ *
+ * PR KVM ...?
+ */
 INT_DEFINE_BEGIN(data_access)
 	IVEC=0x300
-	IHSRR=0
+	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
 	IDAR=1
 	IDSISR=1
-	ISET_RI=1
-	IEARLY=0
-	IMASK=0
 	IKVM_SKIP=1
 	IKVM_REAL=1
-	IKVM_VIRT=0
-	IKUAP=1
-	IRECONCILE=1
-	ISTACK=1
 INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
@@ -1250,15 +1298,26 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
+INT_DEFINE_BEGIN(data_access_slb)
+	IVEC=0x380
+	IHSRR=EXC_STD
+	IAREA=PACA_EXSLB
+	IRECONCILE=0
+	IDAR=1
+	IKVM_SKIP=1
+	IKVM_REAL=1
+INT_DEFINE_END(data_access_slb)
+
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
-	INT_HANDLER data_access_slb, 0x380, 1, 0, 0, 0, PACA_EXSLB, 1, 1, 0, 0, 1
+	GEN_INT_ENTRY data_access_slb, GEN_REAL, GEN_OOL
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
-	INT_HANDLER data_access_slb, 0x380, 0, 0, 1, 0, PACA_EXSLB, 1, 1, 0, 0, 0
+	GEN_INT_ENTRY data_access_slb, GEN_VIRT
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
-INT_KVM_HANDLER data_access_slb, 0x380, EXC_STD, PACA_EXSLB, 1
+TRAMP_KVM_BEGIN(data_access_slb_kvm)
+	GEN_KVM data_access_slb
 EXC_COMMON_BEGIN(data_access_slb_common)
-	INT_COMMON 0x380, PACA_EXSLB, 1, 1, 0, 1, 0
+	GEN_COMMON data_access_slb
 	ld	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
@@ -1282,15 +1341,25 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(instruction_access)
+	IVEC=0x400
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IDAR=2
+	IDSISR=2
+	IKVM_REAL=1
+INT_DEFINE_END(instruction_access)
+
 EXC_REAL_BEGIN(instruction_access, 0x400, 0x80)
-	INT_HANDLER instruction_access, 0x400, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY instruction_access, GEN_REAL
 EXC_REAL_END(instruction_access, 0x400, 0x80)
 EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
-	INT_HANDLER instruction_access, 0x400, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY instruction_access, GEN_VIRT
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
-INT_KVM_HANDLER instruction_access, 0x400, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(instruction_access_kvm)
+	GEN_KVM instruction_access
 EXC_COMMON_BEGIN(instruction_access_common)
-	INT_COMMON 0x400, PACA_EXGEN, 1, 1, 1, 2, 2
+	GEN_COMMON instruction_access
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
 BEGIN_MMU_FTR_SECTION
@@ -1302,15 +1371,25 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
+INT_DEFINE_BEGIN(instruction_access_slb)
+	IVEC=0x480
+	IHSRR=EXC_STD
+	IAREA=PACA_EXSLB
+	IRECONCILE=0
+	IDAR=2
+	IKVM_REAL=1
+INT_DEFINE_END(instruction_access_slb)
+
 EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
-	INT_HANDLER instruction_access_slb, 0x480, 0, 0, 0, EXC_STD, PACA_EXSLB, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY instruction_access_slb, GEN_REAL
 EXC_REAL_END(instruction_access_slb, 0x480, 0x80)
 EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
-	INT_HANDLER instruction_access_slb, 0x480, 0, 0, 1, EXC_STD, PACA_EXSLB, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY instruction_access_slb, GEN_VIRT
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
-INT_KVM_HANDLER instruction_access_slb, 0x480, EXC_STD, PACA_EXSLB, 0
+TRAMP_KVM_BEGIN(instruction_access_slb_kvm)
+	GEN_KVM instruction_access_slb
 EXC_COMMON_BEGIN(instruction_access_slb_common)
-	INT_COMMON 0x480, PACA_EXSLB, 1, 1, 0, 2, 0
+	GEN_COMMON instruction_access_slb
 	ld	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
@@ -1333,15 +1412,25 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	bl	do_bad_slb_fault
 	b	ret_from_except
 
+INT_DEFINE_BEGIN(hardware_interrupt)
+	IVEC=0x500
+	IHSRR=EXC_HV_OR_STD
+	IAREA=PACA_EXGEN
+	IMASK=IRQS_DISABLED
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(hardware_interrupt)
+
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
-	INT_HANDLER hardware_interrupt, 0x500, 0, 0, 0, EXC_HV_OR_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	GEN_INT_ENTRY hardware_interrupt, GEN_REAL
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
-	INT_HANDLER hardware_interrupt, 0x500, 0, 0, 1, EXC_HV_OR_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	GEN_INT_ENTRY hardware_interrupt, GEN_VIRT
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
-INT_KVM_HANDLER hardware_interrupt, 0x500, EXC_HV_OR_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(hardware_interrupt_kvm)
+	GEN_KVM hardware_interrupt
 EXC_COMMON_BEGIN(hardware_interrupt_common)
-	INT_COMMON 0x500, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON hardware_interrupt
 	FINISH_NAP
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1349,28 +1438,46 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
 	b	ret_from_except_lite
 
 
+INT_DEFINE_BEGIN(alignment)
+	IVEC=0x600
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IDAR=1
+	IDSISR=1
+	IKVM_REAL=1
+INT_DEFINE_END(alignment)
+
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
-	INT_HANDLER alignment, 0x600, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 1
+	GEN_INT_ENTRY alignment, GEN_REAL
 EXC_REAL_END(alignment, 0x600, 0x100)
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
-	INT_HANDLER alignment, 0x600, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_INT_ENTRY alignment, GEN_VIRT
 EXC_VIRT_END(alignment, 0x4600, 0x100)
-INT_KVM_HANDLER alignment, 0x600, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(alignment_kvm)
+	GEN_KVM alignment
 EXC_COMMON_BEGIN(alignment_common)
-	INT_COMMON 0x600, PACA_EXGEN, 1, 1, 1, 1, 1
+	GEN_COMMON alignment
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(program_check)
+	IVEC=0x700
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IKVM_REAL=1
+INT_DEFINE_END(program_check)
+
 EXC_REAL_BEGIN(program_check, 0x700, 0x100)
-	INT_HANDLER program_check, 0x700, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY program_check, GEN_REAL
 EXC_REAL_END(program_check, 0x700, 0x100)
 EXC_VIRT_BEGIN(program_check, 0x4700, 0x100)
-	INT_HANDLER program_check, 0x700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY program_check, GEN_VIRT
 EXC_VIRT_END(program_check, 0x4700, 0x100)
-INT_KVM_HANDLER program_check, 0x700, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(program_check_kvm)
+	GEN_KVM program_check
 EXC_COMMON_BEGIN(program_check_common)
 	/*
 	 * It's possible to receive a TM Bad Thing type program check with
@@ -1396,10 +1503,12 @@ EXC_COMMON_BEGIN(program_check_common)
 	mr	r10,r1			/* Save r1			*/
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack		*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
-	INT_COMMON 0x700, PACA_EXGEN, 0, 1, 1, 0, 0
+	__ISTACK(program_check)=0
+	GEN_COMMON program_check
 	b 3f
 2:
-	INT_COMMON 0x700, PACA_EXGEN, 1, 1, 1, 0, 0
+	__ISTACK(program_check)=1
+	GEN_COMMON program_check
 3:
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1407,15 +1516,24 @@ EXC_COMMON_BEGIN(program_check_common)
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(fp_unavailable)
+	IVEC=0x800
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IRECONCILE=0
+	IKVM_REAL=1
+INT_DEFINE_END(fp_unavailable)
+
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
-	INT_HANDLER fp_unavailable, 0x800, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY fp_unavailable, GEN_REAL
 EXC_REAL_END(fp_unavailable, 0x800, 0x100)
 EXC_VIRT_BEGIN(fp_unavailable, 0x4800, 0x100)
-	INT_HANDLER fp_unavailable, 0x800, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY fp_unavailable, GEN_VIRT
 EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
-INT_KVM_HANDLER fp_unavailable, 0x800, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(fp_unavailable_kvm)
+	GEN_KVM fp_unavailable
 EXC_COMMON_BEGIN(fp_unavailable_common)
-	INT_COMMON 0x800, PACA_EXGEN, 1, 1, 0, 0, 0
+	GEN_COMMON fp_unavailable
 	bne	1f			/* if from user, just load it up */
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
@@ -1444,15 +1562,24 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
 
 
+INT_DEFINE_BEGIN(decrementer)
+	IVEC=0x900
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IMASK=IRQS_DISABLED
+	IKVM_REAL=1
+INT_DEFINE_END(decrementer)
+
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
-	INT_HANDLER decrementer, 0x900, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	GEN_INT_ENTRY decrementer, GEN_REAL, GEN_OOL
 EXC_REAL_END(decrementer, 0x900, 0x80)
 EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
-	INT_HANDLER decrementer, 0x900, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
+	GEN_INT_ENTRY decrementer, GEN_VIRT
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
-INT_KVM_HANDLER decrementer, 0x900, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(decrementer_kvm)
+	GEN_KVM decrementer
 EXC_COMMON_BEGIN(decrementer_common)
-	INT_COMMON 0x900, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON decrementer
 	FINISH_NAP
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1460,30 +1587,48 @@ EXC_COMMON_BEGIN(decrementer_common)
 	b	ret_from_except_lite
 
 
+INT_DEFINE_BEGIN(hdecrementer)
+	IVEC=0x980
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(hdecrementer)
+
 EXC_REAL_BEGIN(hdecrementer, 0x980, 0x80)
-	INT_HANDLER hdecrementer, 0x980, 0, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY hdecrementer, GEN_REAL
 EXC_REAL_END(hdecrementer, 0x980, 0x80)
 EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
-	INT_HANDLER hdecrementer, 0x980, 0, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY hdecrementer, GEN_VIRT
 EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
-INT_KVM_HANDLER hdecrementer, 0x980, EXC_HV, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(hdecrementer_kvm)
+	GEN_KVM hdecrementer
 EXC_COMMON_BEGIN(hdecrementer_common)
-	INT_COMMON 0x980, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON hdecrementer
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	hdec_interrupt
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(doorbell_super)
+	IVEC=0xa00
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IMASK=IRQS_DISABLED
+	IKVM_REAL=1
+INT_DEFINE_END(doorbell_super)
+
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
-	INT_HANDLER doorbell_super, 0xa00, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	GEN_INT_ENTRY doorbell_super, GEN_REAL
 EXC_REAL_END(doorbell_super, 0xa00, 0x100)
 EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
-	INT_HANDLER doorbell_super, 0xa00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
+	GEN_INT_ENTRY doorbell_super, GEN_VIRT
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
-INT_KVM_HANDLER doorbell_super, 0xa00, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(doorbell_super_kvm)
+	GEN_KVM doorbell_super
 EXC_COMMON_BEGIN(doorbell_super_common)
-	INT_COMMON 0xa00, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON doorbell_super
 	FINISH_NAP
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1631,30 +1776,50 @@ TRAMP_KVM_BEGIN(system_call_kvm)
 #endif
 
 
+INT_DEFINE_BEGIN(single_step)
+	IVEC=0xd00
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IKVM_REAL=1
+INT_DEFINE_END(single_step)
+
 EXC_REAL_BEGIN(single_step, 0xd00, 0x100)
-	INT_HANDLER single_step, 0xd00, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY single_step, GEN_REAL
 EXC_REAL_END(single_step, 0xd00, 0x100)
 EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
-	INT_HANDLER single_step, 0xd00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY single_step, GEN_VIRT
 EXC_VIRT_END(single_step, 0x4d00, 0x100)
-INT_KVM_HANDLER single_step, 0xd00, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(single_step_kvm)
+	GEN_KVM single_step
 EXC_COMMON_BEGIN(single_step_common)
-	INT_COMMON 0xd00, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON single_step
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	single_step_exception
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(h_data_storage)
+	IVEC=0xe00
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IDAR=1
+	IDSISR=1
+	IKVM_SKIP=1
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(h_data_storage)
+
 EXC_REAL_BEGIN(h_data_storage, 0xe00, 0x20)
-	INT_HANDLER h_data_storage, 0xe00, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 1, 1, 0, 1
+	GEN_INT_ENTRY h_data_storage, GEN_REAL, GEN_OOL
 EXC_REAL_END(h_data_storage, 0xe00, 0x20)
 EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
-	INT_HANDLER h_data_storage, 0xe00, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 1, 1, 0, 1
+	GEN_INT_ENTRY h_data_storage, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
-INT_KVM_HANDLER h_data_storage, 0xe00, EXC_HV, PACA_EXGEN, 1
+TRAMP_KVM_BEGIN(h_data_storage_kvm)
+	GEN_KVM h_data_storage
 EXC_COMMON_BEGIN(h_data_storage_common)
-	INT_COMMON 0xe00, PACA_EXGEN, 1, 1, 1, 1, 1
+	GEN_COMMON h_data_storage
 	bl      save_nvgprs
 	addi    r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
@@ -1667,30 +1832,48 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 	b       ret_from_except
 
 
+INT_DEFINE_BEGIN(h_instr_storage)
+	IVEC=0xe20
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(h_instr_storage)
+
 EXC_REAL_BEGIN(h_instr_storage, 0xe20, 0x20)
-	INT_HANDLER h_instr_storage, 0xe20, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY h_instr_storage, GEN_REAL, GEN_OOL
 EXC_REAL_END(h_instr_storage, 0xe20, 0x20)
 EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
-	INT_HANDLER h_instr_storage, 0xe20, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY h_instr_storage, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
-INT_KVM_HANDLER h_instr_storage, 0xe20, EXC_HV, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(h_instr_storage_kvm)
+	GEN_KVM h_instr_storage
 EXC_COMMON_BEGIN(h_instr_storage_common)
-	INT_COMMON 0xe20, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON h_instr_storage
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(emulation_assist)
+	IVEC=0xe40
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(emulation_assist)
+
 EXC_REAL_BEGIN(emulation_assist, 0xe40, 0x20)
-	INT_HANDLER emulation_assist, 0xe40, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY emulation_assist, GEN_REAL, GEN_OOL
 EXC_REAL_END(emulation_assist, 0xe40, 0x20)
 EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
-	INT_HANDLER emulation_assist, 0xe40, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY emulation_assist, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
-INT_KVM_HANDLER emulation_assist, 0xe40, EXC_HV, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(emulation_assist_kvm)
+	GEN_KVM emulation_assist
 EXC_COMMON_BEGIN(emulation_assist_common)
-	INT_COMMON 0xe40, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON emulation_assist
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
@@ -1702,11 +1885,34 @@ EXC_COMMON_BEGIN(emulation_assist_common)
  * first, and then eventaully from there to the trampoline to get into virtual
  * mode.
  */
+INT_DEFINE_BEGIN(hmi_exception_early)
+	IVEC=0xe60
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IEARLY=1
+	ISTACK=0
+	IRECONCILE=0
+	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
+	IKVM_REAL=1
+INT_DEFINE_END(hmi_exception_early)
+
+INT_DEFINE_BEGIN(hmi_exception)
+	IVEC=0xe60
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IMASK=IRQS_DISABLED
+	IKVM_REAL=1
+INT_DEFINE_END(hmi_exception)
+
 EXC_REAL_BEGIN(hmi_exception, 0xe60, 0x20)
-	INT_HANDLER hmi_exception, 0xe60, 1, 1, 0, EXC_HV, PACA_EXGEN, 0, 0, 0, 0, 1
+	GEN_INT_ENTRY hmi_exception_early, GEN_REAL, GEN_OOL
 EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
-INT_KVM_HANDLER hmi_exception, 0xe60, EXC_HV, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(hmi_exception_early_kvm)
+	GEN_KVM hmi_exception_early
+TRAMP_KVM_BEGIN(hmi_exception_kvm)
+	GEN_KVM hmi_exception
+
 EXC_COMMON_BEGIN(hmi_exception_early_common)
 	mtctr	r10			/* Restore ctr */
 	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
@@ -1715,8 +1921,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 
-	/* We don't touch AMR here, we never go to virtual mode */
-	INT_COMMON 0xe60, PACA_EXGEN, 0, 0, 0, 0, 0
+	GEN_COMMON hmi_exception_early
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	hmi_exception_realmode
@@ -1732,10 +1937,10 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	 * firmware.
 	 */
 	EXCEPTION_RESTORE_REGS EXC_HV
-	INT_HANDLER hmi_exception, 0xe60, 0, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	GEN_INT_ENTRY hmi_exception, GEN_REAL
 
 EXC_COMMON_BEGIN(hmi_exception_common)
-	INT_COMMON 0xe60, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON hmi_exception
 	FINISH_NAP
 	RUNLATCH_ON
 	bl	save_nvgprs
@@ -1744,15 +1949,25 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(h_doorbell)
+	IVEC=0xe80
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IMASK=IRQS_DISABLED
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(h_doorbell)
+
 EXC_REAL_BEGIN(h_doorbell, 0xe80, 0x20)
-	INT_HANDLER h_doorbell, 0xe80, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	GEN_INT_ENTRY h_doorbell, GEN_REAL, GEN_OOL
 EXC_REAL_END(h_doorbell, 0xe80, 0x20)
 EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
-	INT_HANDLER h_doorbell, 0xe80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	GEN_INT_ENTRY h_doorbell, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
-INT_KVM_HANDLER h_doorbell, 0xe80, EXC_HV, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(h_doorbell_kvm)
+	GEN_KVM h_doorbell
 EXC_COMMON_BEGIN(h_doorbell_common)
-	INT_COMMON 0xe80, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON h_doorbell
 	FINISH_NAP
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1764,15 +1979,25 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 	b	ret_from_except_lite
 
 
+INT_DEFINE_BEGIN(h_virt_irq)
+	IVEC=0xea0
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IMASK=IRQS_DISABLED
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(h_virt_irq)
+
 EXC_REAL_BEGIN(h_virt_irq, 0xea0, 0x20)
-	INT_HANDLER h_virt_irq, 0xea0, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	GEN_INT_ENTRY h_virt_irq, GEN_REAL, GEN_OOL
 EXC_REAL_END(h_virt_irq, 0xea0, 0x20)
 EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
-	INT_HANDLER h_virt_irq, 0xea0, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	GEN_INT_ENTRY h_virt_irq, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
-INT_KVM_HANDLER h_virt_irq, 0xea0, EXC_HV, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(h_virt_irq_kvm)
+	GEN_KVM h_virt_irq
 EXC_COMMON_BEGIN(h_virt_irq_common)
-	INT_COMMON 0xea0, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON h_virt_irq
 	FINISH_NAP
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1786,15 +2011,24 @@ EXC_REAL_NONE(0xee0, 0x20)
 EXC_VIRT_NONE(0x4ee0, 0x20)
 
 
+INT_DEFINE_BEGIN(performance_monitor)
+	IVEC=0xf00
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IMASK=IRQS_PMI_DISABLED
+	IKVM_REAL=1
+INT_DEFINE_END(performance_monitor)
+
 EXC_REAL_BEGIN(performance_monitor, 0xf00, 0x20)
-	INT_HANDLER performance_monitor, 0xf00, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_PMI_DISABLED, 1
+	GEN_INT_ENTRY performance_monitor, GEN_REAL, GEN_OOL
 EXC_REAL_END(performance_monitor, 0xf00, 0x20)
 EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
-	INT_HANDLER performance_monitor, 0xf00, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_PMI_DISABLED, 0
+	GEN_INT_ENTRY performance_monitor, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
-INT_KVM_HANDLER performance_monitor, 0xf00, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(performance_monitor_kvm)
+	GEN_KVM performance_monitor
 EXC_COMMON_BEGIN(performance_monitor_common)
-	INT_COMMON 0xf00, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON performance_monitor
 	FINISH_NAP
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1802,15 +2036,24 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	b	ret_from_except_lite
 
 
+INT_DEFINE_BEGIN(altivec_unavailable)
+	IVEC=0xf20
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IRECONCILE=0
+	IKVM_REAL=1
+INT_DEFINE_END(altivec_unavailable)
+
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
-	INT_HANDLER altivec_unavailable, 0xf20, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY altivec_unavailable, GEN_REAL, GEN_OOL
 EXC_REAL_END(altivec_unavailable, 0xf20, 0x20)
 EXC_VIRT_BEGIN(altivec_unavailable, 0x4f20, 0x20)
-	INT_HANDLER altivec_unavailable, 0xf20, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY altivec_unavailable, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(altivec_unavailable, 0x4f20, 0x20)
-INT_KVM_HANDLER altivec_unavailable, 0xf20, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(altivec_unavailable_kvm)
+	GEN_KVM altivec_unavailable
 EXC_COMMON_BEGIN(altivec_unavailable_common)
-	INT_COMMON 0xf20, PACA_EXGEN, 1, 1, 0, 0, 0
+	GEN_COMMON altivec_unavailable
 #ifdef CONFIG_ALTIVEC
 BEGIN_FTR_SECTION
 	beq	1f
@@ -1843,15 +2086,24 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(vsx_unavailable)
+	IVEC=0xf40
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IRECONCILE=0
+	IKVM_REAL=1
+INT_DEFINE_END(vsx_unavailable)
+
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
-	INT_HANDLER vsx_unavailable, 0xf40, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY vsx_unavailable, GEN_REAL, GEN_OOL
 EXC_REAL_END(vsx_unavailable, 0xf40, 0x20)
 EXC_VIRT_BEGIN(vsx_unavailable, 0x4f40, 0x20)
-	INT_HANDLER vsx_unavailable, 0xf40, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY vsx_unavailable, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(vsx_unavailable, 0x4f40, 0x20)
-INT_KVM_HANDLER vsx_unavailable, 0xf40, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(vsx_unavailable_kvm)
+	GEN_KVM vsx_unavailable
 EXC_COMMON_BEGIN(vsx_unavailable_common)
-	INT_COMMON 0xf40, PACA_EXGEN, 1, 1, 0, 0, 0
+	GEN_COMMON vsx_unavailable
 #ifdef CONFIG_VSX
 BEGIN_FTR_SECTION
 	beq	1f
@@ -1883,30 +2135,47 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(facility_unavailable)
+	IVEC=0xf60
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IKVM_REAL=1
+INT_DEFINE_END(facility_unavailable)
+
 EXC_REAL_BEGIN(facility_unavailable, 0xf60, 0x20)
-	INT_HANDLER facility_unavailable, 0xf60, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY facility_unavailable, GEN_REAL, GEN_OOL
 EXC_REAL_END(facility_unavailable, 0xf60, 0x20)
 EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
-	INT_HANDLER facility_unavailable, 0xf60, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY facility_unavailable, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
-INT_KVM_HANDLER facility_unavailable, 0xf60, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(facility_unavailable_kvm)
+	GEN_KVM facility_unavailable
 EXC_COMMON_BEGIN(facility_unavailable_common)
-	INT_COMMON 0xf60, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON facility_unavailable
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
 	b	ret_from_except
 
 
+INT_DEFINE_BEGIN(h_facility_unavailable)
+	IVEC=0xf80
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(h_facility_unavailable)
+
 EXC_REAL_BEGIN(h_facility_unavailable, 0xf80, 0x20)
-	INT_HANDLER h_facility_unavailable, 0xf80, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY h_facility_unavailable, GEN_REAL, GEN_OOL
 EXC_REAL_END(h_facility_unavailable, 0xf80, 0x20)
 EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
-	INT_HANDLER h_facility_unavailable, 0xf80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY h_facility_unavailable, GEN_VIRT, GEN_OOL
 EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
-INT_KVM_HANDLER h_facility_unavailable, 0xf80, EXC_HV, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(h_facility_unavailable_kvm)
+	GEN_KVM h_facility_unavailable
 EXC_COMMON_BEGIN(h_facility_unavailable_common)
-	INT_COMMON 0xf80, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON h_facility_unavailable
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
@@ -1926,13 +2195,22 @@ EXC_REAL_NONE(0x1100, 0x100)
 EXC_VIRT_NONE(0x5100, 0x100)
 
 #ifdef CONFIG_CBE_RAS
+INT_DEFINE_BEGIN(cbe_system_error)
+	IVEC=0x1200
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IKVM_SKIP=1
+	IKVM_REAL=1
+INT_DEFINE_END(cbe_system_error)
+
 EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x100)
-	INT_HANDLER cbe_system_error, 0x1200, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY cbe_system_error, GEN_REAL
 EXC_REAL_END(cbe_system_error, 0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
-INT_KVM_HANDLER cbe_system_error, 0x1200, EXC_HV, PACA_EXGEN, 1
+TRAMP_KVM_BEGIN(cbe_system_error_kvm)
+	GEN_KVM cbe_system_error
 EXC_COMMON_BEGIN(cbe_system_error_common)
-	INT_COMMON 0x1200, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON cbe_system_error
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_system_error_exception
@@ -1943,15 +2221,24 @@ EXC_VIRT_NONE(0x5200, 0x100)
 #endif
 
 
+INT_DEFINE_BEGIN(instruction_breakpoint)
+	IVEC=0x1300
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IKVM_SKIP=1
+	IKVM_REAL=1
+INT_DEFINE_END(instruction_breakpoint)
+
 EXC_REAL_BEGIN(instruction_breakpoint, 0x1300, 0x100)
-	INT_HANDLER instruction_breakpoint, 0x1300, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY instruction_breakpoint, GEN_REAL
 EXC_REAL_END(instruction_breakpoint, 0x1300, 0x100)
 EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
-	INT_HANDLER instruction_breakpoint, 0x1300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY instruction_breakpoint, GEN_VIRT
 EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
-INT_KVM_HANDLER instruction_breakpoint, 0x1300, EXC_STD, PACA_EXGEN, 1
+TRAMP_KVM_BEGIN(instruction_breakpoint_kvm)
+	GEN_KVM instruction_breakpoint
 EXC_COMMON_BEGIN(instruction_breakpoint_common)
-	INT_COMMON 0x1300, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON instruction_breakpoint
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	instruction_breakpoint_exception
@@ -1961,30 +2248,36 @@ EXC_COMMON_BEGIN(instruction_breakpoint_common)
 EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
 
-EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
-	INT_HANDLER denorm_exception_hv, 0x1500, 0, 2, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 0
+INT_DEFINE_BEGIN(denorm_exception)
+	IVEC=0x1500
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IEARLY=2
+INT_DEFINE_END(denorm_exception)
+
+EXC_REAL_BEGIN(denorm_exception, 0x1500, 0x100)
+	GEN_INT_ENTRY denorm_exception, GEN_REAL
 #ifdef CONFIG_PPC_DENORMALISATION
 	mfspr	r10,SPRN_HSRR1
 	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
 #endif
-	KVMTEST denorm_exception_hv, EXC_HV 0x1500
-	INT_SAVE_SRR_AND_JUMP denorm_common, EXC_HV, 1
-EXC_REAL_END(denorm_exception_hv, 0x1500, 0x100)
-
+	KVMTEST denorm_exception, EXC_HV, 0x1500
+	INT_SAVE_SRR_AND_JUMP denorm_exception_common, EXC_HV, 1
+EXC_REAL_END(denorm_exception, 0x1500, 0x100)
 #ifdef CONFIG_PPC_DENORMALISATION
 EXC_VIRT_BEGIN(denorm_exception, 0x5500, 0x100)
-	INT_HANDLER denorm_exception, 0x1500, 0, 2, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY denorm_exception, GEN_VIRT
 	mfspr	r10,SPRN_HSRR1
 	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
-	INT_VIRT_SAVE_SRR_AND_JUMP denorm_common, EXC_HV
+	INT_VIRT_SAVE_SRR_AND_JUMP denorm_exception_common, EXC_HV
 EXC_VIRT_END(denorm_exception, 0x5500, 0x100)
 #else
 EXC_VIRT_NONE(0x5500, 0x100)
 #endif
-
-INT_KVM_HANDLER denorm_exception_hv, 0x1500, EXC_HV, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(denorm_exception_kvm)
+	GEN_KVM denorm_exception
 
 #ifdef CONFIG_PPC_DENORMALISATION
 TRAMP_REAL_BEGIN(denorm_assist)
@@ -2055,8 +2348,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	b	.
 #endif
 
-EXC_COMMON_BEGIN(denorm_common)
-	INT_COMMON 0x1500, PACA_EXGEN, 1, 1, 1, 0, 0
+EXC_COMMON_BEGIN(denorm_exception_common)
+	GEN_COMMON denorm_exception
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
@@ -2064,13 +2357,22 @@ EXC_COMMON_BEGIN(denorm_common)
 
 
 #ifdef CONFIG_CBE_RAS
+INT_DEFINE_BEGIN(cbe_maintenance)
+	IVEC=0x1600
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IKVM_SKIP=1
+	IKVM_REAL=1
+INT_DEFINE_END(cbe_maintenance)
+
 EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x100)
-	INT_HANDLER cbe_maintenance, 0x1600, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY cbe_maintenance, GEN_REAL
 EXC_REAL_END(cbe_maintenance, 0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
-INT_KVM_HANDLER cbe_maintenance, 0x1600, EXC_HV, PACA_EXGEN, 1
+TRAMP_KVM_BEGIN(cbe_maintenance_kvm)
+	GEN_KVM cbe_maintenance
 EXC_COMMON_BEGIN(cbe_maintenance_common)
-	INT_COMMON 0x1600, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON cbe_maintenance
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_maintenance_exception
@@ -2081,15 +2383,23 @@ EXC_VIRT_NONE(0x5600, 0x100)
 #endif
 
 
+INT_DEFINE_BEGIN(altivec_assist)
+	IVEC=0x1700
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN
+	IKVM_REAL=1
+INT_DEFINE_END(altivec_assist)
+
 EXC_REAL_BEGIN(altivec_assist, 0x1700, 0x100)
-	INT_HANDLER altivec_assist, 0x1700, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY altivec_assist, GEN_REAL
 EXC_REAL_END(altivec_assist, 0x1700, 0x100)
 EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
-	INT_HANDLER altivec_assist, 0x1700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	GEN_INT_ENTRY altivec_assist, GEN_VIRT
 EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
-INT_KVM_HANDLER altivec_assist, 0x1700, EXC_STD, PACA_EXGEN, 0
+TRAMP_KVM_BEGIN(altivec_assist_kvm)
+	GEN_KVM altivec_assist
 EXC_COMMON_BEGIN(altivec_assist_common)
-	INT_COMMON 0x1700, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON altivec_assist
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
@@ -2101,13 +2411,22 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 
 
 #ifdef CONFIG_CBE_RAS
+INT_DEFINE_BEGIN(cbe_thermal)
+	IVEC=0x1800
+	IHSRR=EXC_HV
+	IAREA=PACA_EXGEN
+	IKVM_SKIP=1
+	IKVM_REAL=1
+INT_DEFINE_END(cbe_thermal)
+
 EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x100)
-	INT_HANDLER cbe_thermal, 0x1800, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	GEN_INT_ENTRY cbe_thermal, GEN_REAL
 EXC_REAL_END(cbe_thermal, 0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
-INT_KVM_HANDLER cbe_thermal, 0x1800, EXC_HV, PACA_EXGEN, 1
+TRAMP_KVM_BEGIN(cbe_thermal_kvm)
+	GEN_KVM cbe_thermal
 EXC_COMMON_BEGIN(cbe_thermal_common)
-	INT_COMMON 0x1800, PACA_EXGEN, 1, 1, 1, 0, 0
+	GEN_COMMON cbe_thermal
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_thermal_exception
-- 
2.22.0

