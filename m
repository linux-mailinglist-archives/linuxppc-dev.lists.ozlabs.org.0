Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A175D16EDF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:26:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RnSY0dBPzDqWw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:26:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pNYWSAhy; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmRd2V32zDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:28 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id g6so76533plp.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KRjkzhGDDHSnkYV056IxwJLnJ8Bcu99dtMH6B6/jmls=;
 b=pNYWSAhyLLXc5TFrfDSdicrg0bF42khbkpJeu5ki4pLlEjvmScg8wbwE5dYogeo0+e
 HtiYIHu4Smunni0iKjRn7mctIl5XHjXjpP2SursFcd66yn1aCYt3N3XdVZN1KLZpfLvI
 jvcMNumxXLF1eCGbsBYBgGR6B66ken1AQdZCme6u/4tCPNrYzXPVi6kQ+Lxr7PhUSK9i
 1S34TNSYA6CCkEqaC/XS1/B++GNNxq84LmhZaPRvfYsHz/6Auv/fR1zEssCYGBSXekvt
 hcNXooi9OLluZIetj903SsqeY0zYp/H2CWRGa/AIya6lHSIEw+SjzmBt0dqWtC3tz14B
 UX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KRjkzhGDDHSnkYV056IxwJLnJ8Bcu99dtMH6B6/jmls=;
 b=Pttj9y2JnJyQO9pz2KlLIapz4l6RO0BggaEjM2/VyGfjcbsPiUr+zy6f6iRK0uiKnc
 t93KRpnW+DeteM8XViymxg2DSdx16VIyobiq4AWi4nsB0/PHlvcgV6ekFe7hfF6HMRJ4
 aDoJ/kQg+QVDtTpfq9wApA0Vw1YUHdRNCeWvReOEhZkVNwUM9MtvhZfmwehyipwtHwmS
 eq01zUaN9j5yj949FFLhysxcfLEYd487JIiWiTEJqSRczmCJfNmK7nhCFkU/EStVsDfn
 vBIKMdF0UEcGbdmjIRYizFBMtXzbDjbV7E1v/P6AC2b6SFqQs1lNK1577u8WjL9J/n6X
 udpw==
X-Gm-Message-State: APjAAAVM3X15x+JI1CSmnPrDnjnx14Uk7BptY64/Y0w07FtNHisdNCJV
 iF3SUow8dpoohI/WUoJKrRYdHWHD
X-Google-Smtp-Source: APXvYqxnGPCioMo1zeaTKmS8GkvFzr0gBqU09DwqFo6AwBRXCIMaZOml+zuIsYYTDC55glqC/19yag==
X-Received: by 2002:a17:902:7d86:: with SMTP id
 a6mr56959631plm.212.1582652419024; 
 Tue, 25 Feb 2020 09:40:19 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/32] powerpc/64s/exception: move KVM test to common code
Date: Wed, 26 Feb 2020 03:35:21 +1000
Message-Id: <20200225173541.1549955-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows more code to be moved out of unrelocated regions. The system
call KVMTEST is changed to be open-coded and remain in the tramp area to
avoid having to move it to entry_64.S. The custom nature of the system
call entry code means the hcall case can be made more streamlined than
regular interrupt handlers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S    | 239 ++++++++++++------------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  11 --
 arch/powerpc/kvm/book3s_segment.S       |   7 -
 3 files changed, 119 insertions(+), 138 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a23f2450f9ed..eb2f6ee4d652 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -44,7 +44,6 @@
  * EXC_VIRT_BEGIN/END  - virt (AIL), unrelocated exception vectors
  * TRAMP_REAL_BEGIN    - real, unrelocated helpers (virt may call these)
  * TRAMP_VIRT_BEGIN    - virt, unreloc helpers (in practice, real can use)
- * TRAMP_KVM_BEGIN     - KVM handlers, these are put into real, unrelocated
  * EXC_COMMON          - After switching to virtual, relocated mode.
  */
 
@@ -74,13 +73,6 @@ name:
 #define TRAMP_VIRT_BEGIN(name)					\
 	FIXED_SECTION_ENTRY_BEGIN(virt_trampolines, name)
 
-#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-#define TRAMP_KVM_BEGIN(name)					\
-	TRAMP_VIRT_BEGIN(name)
-#else
-#define TRAMP_KVM_BEGIN(name)
-#endif
-
 #define EXC_REAL_NONE(start, size)				\
 	FIXED_SECTION_ENTRY_BEGIN_LOCATION(real_vectors, exc_real_##start##_##unused, start, size); \
 	FIXED_SECTION_ENTRY_END_LOCATION(real_vectors, exc_real_##start##_##unused, start, size)
@@ -271,6 +263,9 @@ do_define_int n
 .endm
 
 .macro GEN_KVM name
+	.balign IFETCH_ALIGN_BYTES
+\name\()_kvm:
+
 	.if IKVM_SKIP
 	cmpwi	r10,KVM_GUEST_MODE_SKIP
 	beq	89f
@@ -281,13 +276,18 @@ BEGIN_FTR_SECTION_NESTED(947)
 END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
 	.endif
 
+	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	mtctr	r10
 BEGIN_FTR_SECTION_NESTED(948)
 	ld	r10,IAREA+EX_PPR(r13)
 	std	r10,HSTATE_PPR(r13)
 END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
-	ld	r10,IAREA+EX_R10(r13)
+	ld	r11,IAREA+EX_R11(r13)
+	ld	r12,IAREA+EX_R12(r13)
 	std	r12,HSTATE_SCRATCH0(r13)
 	sldi	r12,r9,32
+	ld	r9,IAREA+EX_R9(r13)
+	ld	r10,IAREA+EX_R10(r13)
 	/* HSRR variants have the 0x2 bit added to their trap number */
 	.if IHSRR == EXC_HV_OR_STD
 	BEGIN_FTR_SECTION
@@ -300,29 +300,16 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.else
 	ori	r12,r12,(IVEC)
 	.endif
-
-#ifdef CONFIG_RELOCATABLE
-	/*
-	 * KVM requires __LOAD_FAR_HANDLER beause kvmppc_interrupt lives
-	 * outside the head section. CONFIG_RELOCATABLE KVM expects CTR
-	 * to be saved in HSTATE_SCRATCH1.
-	 */
-	ld	r9,IAREA+EX_CTR(r13)
-	std	r9,HSTATE_SCRATCH1(r13)
-	__LOAD_FAR_HANDLER(r9, kvmppc_interrupt)
-	mtctr	r9
-	ld	r9,IAREA+EX_R9(r13)
-	bctr
-#else
-	ld	r9,IAREA+EX_R9(r13)
 	b	kvmppc_interrupt
-#endif
-
 
 	.if IKVM_SKIP
 89:	mtocrf	0x80,r9
+	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	mtctr	r10
 	ld	r9,IAREA+EX_R9(r13)
 	ld	r10,IAREA+EX_R10(r13)
+	ld	r11,IAREA+EX_R11(r13)
+	ld	r12,IAREA+EX_R12(r13)
 	.if IHSRR == EXC_HV_OR_STD
 	BEGIN_FTR_SECTION
 	b	kvmppc_skip_Hinterrupt
@@ -407,11 +394,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	mfctr	r10
 	std	r10,IAREA+EX_CTR(r13)
 	mfcr	r9
-
-	.if (!\virt && IKVM_REAL) || (\virt && IKVM_VIRT)
-		KVMTEST \name IHSRR IVEC
-	.endif
-
 	std	r11,IAREA+EX_R11(r13)
 	std	r12,IAREA+EX_R12(r13)
 
@@ -475,6 +457,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 .macro __GEN_COMMON_ENTRY name
 DEFINE_FIXED_SYMBOL(\name\()_common_real)
 \name\()_common_real:
+	.if IKVM_REAL
+		KVMTEST \name IHSRR IVEC
+	.endif
+
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
 	/* MSR[RI] is clear iff using SRR regs */
 	.if IHSRR == EXC_HV_OR_STD
@@ -487,9 +473,17 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 	mtmsrd	r10
 
 	.if IVIRT
+	.if IKVM_VIRT
+	b	1f /* skip the virt test coming from real */
+	.endif
+
 	.balign IFETCH_ALIGN_BYTES
 DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 \name\()_common_virt:
+	.if IKVM_VIRT
+		KVMTEST \name IHSRR IVEC
+1:
+	.endif
 	.endif /* IVIRT */
 .endm
 
@@ -848,8 +842,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 */
 EXC_REAL_END(system_reset, 0x100, 0x100)
 EXC_VIRT_NONE(0x4100, 0x100)
-TRAMP_KVM_BEGIN(system_reset_kvm)
-	GEN_KVM system_reset
 
 #ifdef CONFIG_PPC_P7_NAP
 TRAMP_REAL_BEGIN(system_reset_idle_wake)
@@ -927,6 +919,8 @@ EXC_COMMON_BEGIN(system_reset_common)
 	EXCEPTION_RESTORE_REGS EXC_STD
 	RFI_TO_USER_OR_KERNEL
 
+	GEN_KVM system_reset
+
 
 INT_DEFINE_BEGIN(machine_check_early)
 	IVEC=0x200
@@ -968,9 +962,6 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	GEN_INT_ENTRY machine_check_early, virt=0
 #endif
 
-TRAMP_KVM_BEGIN(machine_check_kvm)
-	GEN_KVM machine_check
-
 #define MACHINE_CHECK_HANDLER_WINDUP			\
 	/* Clear MSR_RI before setting SRR0 and SRR1. */\
 	li	r9,0;					\
@@ -1126,6 +1117,9 @@ EXC_COMMON_BEGIN(machine_check_common)
 	bl	machine_check_exception
 	b	ret_from_except
 
+	GEN_KVM machine_check
+
+
 #ifdef CONFIG_PPC_P7_NAP
 /*
  * This is an idle wakeup. Low level machine check has already been
@@ -1218,8 +1212,6 @@ EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	GEN_INT_ENTRY data_access, virt=1
 EXC_VIRT_END(data_access, 0x4300, 0x80)
-TRAMP_KVM_BEGIN(data_access_kvm)
-	GEN_KVM data_access
 EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
@@ -1232,6 +1224,8 @@ MMU_FTR_SECTION_ELSE
 	b	handle_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
+	GEN_KVM data_access
+
 
 INT_DEFINE_BEGIN(data_access_slb)
 	IVEC=0x380
@@ -1248,8 +1242,6 @@ EXC_REAL_END(data_access_slb, 0x380, 0x80)
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 	GEN_INT_ENTRY data_access_slb, virt=1
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
-TRAMP_KVM_BEGIN(data_access_slb_kvm)
-	GEN_KVM data_access_slb
 EXC_COMMON_BEGIN(data_access_slb_common)
 	GEN_COMMON data_access_slb
 	ld	r4,_DAR(r1)
@@ -1274,6 +1266,8 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	bl	do_bad_slb_fault
 	b	ret_from_except
 
+	GEN_KVM data_access_slb
+
 
 INT_DEFINE_BEGIN(instruction_access)
 	IVEC=0x400
@@ -1289,8 +1283,6 @@ EXC_REAL_END(instruction_access, 0x400, 0x80)
 EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
 	GEN_INT_ENTRY instruction_access, virt=1
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
-TRAMP_KVM_BEGIN(instruction_access_kvm)
-	GEN_KVM instruction_access
 EXC_COMMON_BEGIN(instruction_access_common)
 	GEN_COMMON instruction_access
 	ld	r4,_DAR(r1)
@@ -1303,6 +1295,8 @@ MMU_FTR_SECTION_ELSE
 	b	handle_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
+	GEN_KVM instruction_access
+
 
 INT_DEFINE_BEGIN(instruction_access_slb)
 	IVEC=0x480
@@ -1319,8 +1313,6 @@ EXC_REAL_END(instruction_access_slb, 0x480, 0x80)
 EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
 	GEN_INT_ENTRY instruction_access_slb, virt=1
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
-TRAMP_KVM_BEGIN(instruction_access_slb_kvm)
-	GEN_KVM instruction_access_slb
 EXC_COMMON_BEGIN(instruction_access_slb_common)
 	GEN_COMMON instruction_access_slb
 	ld	r4,_DAR(r1)
@@ -1345,6 +1337,9 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	bl	do_bad_slb_fault
 	b	ret_from_except
 
+	GEN_KVM instruction_access_slb
+
+
 INT_DEFINE_BEGIN(hardware_interrupt)
 	IVEC=0x500
 	IHSRR=EXC_HV_OR_STD
@@ -1359,8 +1354,6 @@ EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	GEN_INT_ENTRY hardware_interrupt, virt=1
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
-TRAMP_KVM_BEGIN(hardware_interrupt_kvm)
-	GEN_KVM hardware_interrupt
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
 	FINISH_NAP
@@ -1369,6 +1362,8 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
 	bl	do_IRQ
 	b	ret_from_except_lite
 
+	GEN_KVM hardware_interrupt
+
 
 INT_DEFINE_BEGIN(alignment)
 	IVEC=0x600
@@ -1383,8 +1378,6 @@ EXC_REAL_END(alignment, 0x600, 0x100)
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 	GEN_INT_ENTRY alignment, virt=1
 EXC_VIRT_END(alignment, 0x4600, 0x100)
-TRAMP_KVM_BEGIN(alignment_kvm)
-	GEN_KVM alignment
 EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
 	bl	save_nvgprs
@@ -1392,6 +1385,8 @@ EXC_COMMON_BEGIN(alignment_common)
 	bl	alignment_exception
 	b	ret_from_except
 
+	GEN_KVM alignment
+
 
 INT_DEFINE_BEGIN(program_check)
 	IVEC=0x700
@@ -1404,8 +1399,6 @@ EXC_REAL_END(program_check, 0x700, 0x100)
 EXC_VIRT_BEGIN(program_check, 0x4700, 0x100)
 	GEN_INT_ENTRY program_check, virt=1
 EXC_VIRT_END(program_check, 0x4700, 0x100)
-TRAMP_KVM_BEGIN(program_check_kvm)
-	GEN_KVM program_check
 EXC_COMMON_BEGIN(program_check_common)
 	__GEN_COMMON_ENTRY program_check
 
@@ -1445,6 +1438,8 @@ EXC_COMMON_BEGIN(program_check_common)
 	bl	program_check_exception
 	b	ret_from_except
 
+	GEN_KVM program_check
+
 
 INT_DEFINE_BEGIN(fp_unavailable)
 	IVEC=0x800
@@ -1458,8 +1453,6 @@ EXC_REAL_END(fp_unavailable, 0x800, 0x100)
 EXC_VIRT_BEGIN(fp_unavailable, 0x4800, 0x100)
 	GEN_INT_ENTRY fp_unavailable, virt=1
 EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
-TRAMP_KVM_BEGIN(fp_unavailable_kvm)
-	GEN_KVM fp_unavailable
 EXC_COMMON_BEGIN(fp_unavailable_common)
 	GEN_COMMON fp_unavailable
 	bne	1f			/* if from user, just load it up */
@@ -1490,6 +1483,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	b	ret_from_except
 #endif
 
+	GEN_KVM fp_unavailable
+
 
 INT_DEFINE_BEGIN(decrementer)
 	IVEC=0x900
@@ -1503,8 +1498,6 @@ EXC_REAL_END(decrementer, 0x900, 0x80)
 EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 	GEN_INT_ENTRY decrementer, virt=1
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
-TRAMP_KVM_BEGIN(decrementer_kvm)
-	GEN_KVM decrementer
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
 	FINISH_NAP
@@ -1513,6 +1506,8 @@ EXC_COMMON_BEGIN(decrementer_common)
 	bl	timer_interrupt
 	b	ret_from_except_lite
 
+	GEN_KVM decrementer
+
 
 INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
@@ -1527,8 +1522,6 @@ EXC_REAL_END(hdecrementer, 0x980, 0x80)
 EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
 	GEN_INT_ENTRY hdecrementer, virt=1
 EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
-TRAMP_KVM_BEGIN(hdecrementer_kvm)
-	GEN_KVM hdecrementer
 EXC_COMMON_BEGIN(hdecrementer_common)
 	GEN_COMMON hdecrementer
 	bl	save_nvgprs
@@ -1536,6 +1529,8 @@ EXC_COMMON_BEGIN(hdecrementer_common)
 	bl	hdec_interrupt
 	b	ret_from_except
 
+	GEN_KVM hdecrementer
+
 
 INT_DEFINE_BEGIN(doorbell_super)
 	IVEC=0xa00
@@ -1549,8 +1544,6 @@ EXC_REAL_END(doorbell_super, 0xa00, 0x100)
 EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 	GEN_INT_ENTRY doorbell_super, virt=1
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
-TRAMP_KVM_BEGIN(doorbell_super_kvm)
-	GEN_KVM doorbell_super
 EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
 	FINISH_NAP
@@ -1563,6 +1556,8 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #endif
 	b	ret_from_except_lite
 
+	GEN_KVM doorbell_super
+
 
 EXC_REAL_NONE(0xb00, 0x100)
 EXC_VIRT_NONE(0x4b00, 0x100)
@@ -1667,6 +1662,7 @@ EXC_VIRT_BEGIN(system_call, 0x4c00, 0x100)
 EXC_VIRT_END(system_call, 0x4c00, 0x100)
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
+TRAMP_REAL_BEGIN(system_call_kvm)
 	/*
 	 * This is a hcall, so register convention is as above, with these
 	 * differences:
@@ -1674,20 +1670,35 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
 	 * ctr = orig r13
 	 * orig r10 saved in PACA
 	 */
-TRAMP_KVM_BEGIN(system_call_kvm)
 	 /*
 	  * Save the PPR (on systems that support it) before changing to
 	  * HMT_MEDIUM. That allows the KVM code to save that value into the
 	  * guest state (it is the guest's PPR value).
 	  */
-	OPT_GET_SPR(r10, SPRN_PPR, CPU_FTR_HAS_PPR)
+BEGIN_FTR_SECTION_NESTED(948)
+	mfspr	r10,SPRN_PPR
+	std	r10,HSTATE_PPR(r13)
+END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	HMT_MEDIUM
-	OPT_SAVE_REG_TO_PACA(PACA_EXGEN+EX_PPR, r10, CPU_FTR_HAS_PPR)
 	mfctr	r10
 	SET_SCRATCH0(r10)
-	std	r9,PACA_EXGEN+EX_R9(r13)
-	mfcr	r9
-	GEN_KVM system_call
+	mfcr	r10
+	std	r12,HSTATE_SCRATCH0(r13)
+	sldi	r12,r10,32
+	ori	r12,r12,0xc00
+#ifdef CONFIG_RELOCATABLE
+	/*
+	 * Requires __LOAD_FAR_HANDLER beause kvmppc_interrupt lives
+	 * outside the head section.
+	 */
+	__LOAD_FAR_HANDLER(r10, kvmppc_interrupt)
+	mtctr   r10
+	ld	r10,PACA_EXGEN+EX_R10(r13)
+	bctr
+#else
+	ld	r10,PACA_EXGEN+EX_R10(r13)
+	b       kvmppc_interrupt
+#endif
 #endif
 
 
@@ -1702,8 +1713,6 @@ EXC_REAL_END(single_step, 0xd00, 0x100)
 EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
 	GEN_INT_ENTRY single_step, virt=1
 EXC_VIRT_END(single_step, 0x4d00, 0x100)
-TRAMP_KVM_BEGIN(single_step_kvm)
-	GEN_KVM single_step
 EXC_COMMON_BEGIN(single_step_common)
 	GEN_COMMON single_step
 	bl	save_nvgprs
@@ -1711,6 +1720,8 @@ EXC_COMMON_BEGIN(single_step_common)
 	bl	single_step_exception
 	b	ret_from_except
 
+	GEN_KVM single_step
+
 
 INT_DEFINE_BEGIN(h_data_storage)
 	IVEC=0xe00
@@ -1728,8 +1739,6 @@ EXC_REAL_END(h_data_storage, 0xe00, 0x20)
 EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
 	GEN_INT_ENTRY h_data_storage, virt=1, ool=1
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
-TRAMP_KVM_BEGIN(h_data_storage_kvm)
-	GEN_KVM h_data_storage
 EXC_COMMON_BEGIN(h_data_storage_common)
 	GEN_COMMON h_data_storage
 	bl      save_nvgprs
@@ -1743,6 +1752,8 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 	b       ret_from_except
 
+	GEN_KVM h_data_storage
+
 
 INT_DEFINE_BEGIN(h_instr_storage)
 	IVEC=0xe20
@@ -1757,8 +1768,6 @@ EXC_REAL_END(h_instr_storage, 0xe20, 0x20)
 EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
 	GEN_INT_ENTRY h_instr_storage, virt=1, ool=1
 EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
-TRAMP_KVM_BEGIN(h_instr_storage_kvm)
-	GEN_KVM h_instr_storage
 EXC_COMMON_BEGIN(h_instr_storage_common)
 	GEN_COMMON h_instr_storage
 	bl	save_nvgprs
@@ -1766,6 +1775,8 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
 	bl	unknown_exception
 	b	ret_from_except
 
+	GEN_KVM h_instr_storage
+
 
 INT_DEFINE_BEGIN(emulation_assist)
 	IVEC=0xe40
@@ -1780,8 +1791,6 @@ EXC_REAL_END(emulation_assist, 0xe40, 0x20)
 EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
 	GEN_INT_ENTRY emulation_assist, virt=1, ool=1
 EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
-TRAMP_KVM_BEGIN(emulation_assist_kvm)
-	GEN_KVM emulation_assist
 EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
 	bl	save_nvgprs
@@ -1789,6 +1798,8 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	bl	emulation_assist_interrupt
 	b	ret_from_except
 
+	GEN_KVM emulation_assist
+
 
 /*
  * hmi_exception trampoline is a special case. It jumps to hmi_exception_early
@@ -1816,10 +1827,6 @@ EXC_REAL_BEGIN(hmi_exception, 0xe60, 0x20)
 	GEN_INT_ENTRY hmi_exception_early, virt=0, ool=1
 EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
-TRAMP_KVM_BEGIN(hmi_exception_early_kvm)
-	GEN_KVM hmi_exception_early
-TRAMP_KVM_BEGIN(hmi_exception_kvm)
-	GEN_KVM hmi_exception
 
 EXC_COMMON_BEGIN(hmi_exception_early_common)
 	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
@@ -1846,6 +1853,8 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	EXCEPTION_RESTORE_REGS EXC_HV
 	GEN_INT_ENTRY hmi_exception, virt=0
 
+	GEN_KVM hmi_exception_early
+
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	FINISH_NAP
@@ -1855,6 +1864,8 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 	bl	handle_hmi_exception
 	b	ret_from_except
 
+	GEN_KVM hmi_exception
+
 
 INT_DEFINE_BEGIN(h_doorbell)
 	IVEC=0xe80
@@ -1870,8 +1881,6 @@ EXC_REAL_END(h_doorbell, 0xe80, 0x20)
 EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 	GEN_INT_ENTRY h_doorbell, virt=1, ool=1
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
-TRAMP_KVM_BEGIN(h_doorbell_kvm)
-	GEN_KVM h_doorbell
 EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
 	FINISH_NAP
@@ -1884,6 +1893,8 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #endif
 	b	ret_from_except_lite
 
+	GEN_KVM h_doorbell
+
 
 INT_DEFINE_BEGIN(h_virt_irq)
 	IVEC=0xea0
@@ -1899,8 +1910,6 @@ EXC_REAL_END(h_virt_irq, 0xea0, 0x20)
 EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 	GEN_INT_ENTRY h_virt_irq, virt=1, ool=1
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
-TRAMP_KVM_BEGIN(h_virt_irq_kvm)
-	GEN_KVM h_virt_irq
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
 	FINISH_NAP
@@ -1909,6 +1918,8 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
 	bl	do_IRQ
 	b	ret_from_except_lite
 
+	GEN_KVM h_virt_irq
+
 
 EXC_REAL_NONE(0xec0, 0x20)
 EXC_VIRT_NONE(0x4ec0, 0x20)
@@ -1928,8 +1939,6 @@ EXC_REAL_END(performance_monitor, 0xf00, 0x20)
 EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 	GEN_INT_ENTRY performance_monitor, virt=1, ool=1
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
-TRAMP_KVM_BEGIN(performance_monitor_kvm)
-	GEN_KVM performance_monitor
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	FINISH_NAP
@@ -1938,6 +1947,8 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	bl	performance_monitor_exception
 	b	ret_from_except_lite
 
+	GEN_KVM performance_monitor
+
 
 INT_DEFINE_BEGIN(altivec_unavailable)
 	IVEC=0xf20
@@ -1951,8 +1962,6 @@ EXC_REAL_END(altivec_unavailable, 0xf20, 0x20)
 EXC_VIRT_BEGIN(altivec_unavailable, 0x4f20, 0x20)
 	GEN_INT_ENTRY altivec_unavailable, virt=1, ool=1
 EXC_VIRT_END(altivec_unavailable, 0x4f20, 0x20)
-TRAMP_KVM_BEGIN(altivec_unavailable_kvm)
-	GEN_KVM altivec_unavailable
 EXC_COMMON_BEGIN(altivec_unavailable_common)
 	GEN_COMMON altivec_unavailable
 #ifdef CONFIG_ALTIVEC
@@ -1986,6 +1995,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	bl	altivec_unavailable_exception
 	b	ret_from_except
 
+	GEN_KVM altivec_unavailable
+
 
 INT_DEFINE_BEGIN(vsx_unavailable)
 	IVEC=0xf40
@@ -1999,8 +2010,6 @@ EXC_REAL_END(vsx_unavailable, 0xf40, 0x20)
 EXC_VIRT_BEGIN(vsx_unavailable, 0x4f40, 0x20)
 	GEN_INT_ENTRY vsx_unavailable, virt=1, ool=1
 EXC_VIRT_END(vsx_unavailable, 0x4f40, 0x20)
-TRAMP_KVM_BEGIN(vsx_unavailable_kvm)
-	GEN_KVM vsx_unavailable
 EXC_COMMON_BEGIN(vsx_unavailable_common)
 	GEN_COMMON vsx_unavailable
 #ifdef CONFIG_VSX
@@ -2033,6 +2042,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	bl	vsx_unavailable_exception
 	b	ret_from_except
 
+	GEN_KVM vsx_unavailable
+
 
 INT_DEFINE_BEGIN(facility_unavailable)
 	IVEC=0xf60
@@ -2045,8 +2056,6 @@ EXC_REAL_END(facility_unavailable, 0xf60, 0x20)
 EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
 	GEN_INT_ENTRY facility_unavailable, virt=1, ool=1
 EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
-TRAMP_KVM_BEGIN(facility_unavailable_kvm)
-	GEN_KVM facility_unavailable
 EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
 	bl	save_nvgprs
@@ -2054,6 +2063,8 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	bl	facility_unavailable_exception
 	b	ret_from_except
 
+	GEN_KVM facility_unavailable
+
 
 INT_DEFINE_BEGIN(h_facility_unavailable)
 	IVEC=0xf80
@@ -2068,8 +2079,6 @@ EXC_REAL_END(h_facility_unavailable, 0xf80, 0x20)
 EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
 	GEN_INT_ENTRY h_facility_unavailable, virt=1, ool=1
 EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
-TRAMP_KVM_BEGIN(h_facility_unavailable_kvm)
-	GEN_KVM h_facility_unavailable
 EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
 	bl	save_nvgprs
@@ -2077,6 +2086,8 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	bl	facility_unavailable_exception
 	b	ret_from_except
 
+	GEN_KVM h_facility_unavailable
+
 
 EXC_REAL_NONE(0xfa0, 0x20)
 EXC_VIRT_NONE(0x4fa0, 0x20)
@@ -2102,14 +2113,15 @@ EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x100)
 	GEN_INT_ENTRY cbe_system_error, virt=0
 EXC_REAL_END(cbe_system_error, 0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
-TRAMP_KVM_BEGIN(cbe_system_error_kvm)
-	GEN_KVM cbe_system_error
 EXC_COMMON_BEGIN(cbe_system_error_common)
 	GEN_COMMON cbe_system_error
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_system_error_exception
 	b	ret_from_except
+
+	GEN_KVM cbe_system_error
+
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
@@ -2128,8 +2140,6 @@ EXC_REAL_END(instruction_breakpoint, 0x1300, 0x100)
 EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
 	GEN_INT_ENTRY instruction_breakpoint, virt=1
 EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
-TRAMP_KVM_BEGIN(instruction_breakpoint_kvm)
-	GEN_KVM instruction_breakpoint
 EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	GEN_COMMON instruction_breakpoint
 	bl	save_nvgprs
@@ -2137,6 +2147,8 @@ EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	bl	instruction_breakpoint_exception
 	b	ret_from_except
 
+	GEN_KVM instruction_breakpoint
+
 
 EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
@@ -2145,6 +2157,7 @@ INT_DEFINE_BEGIN(denorm_exception)
 	IVEC=0x1500
 	IHSRR=EXC_HV
 	IEARLY=2
+	IKVM_REAL=1
 INT_DEFINE_END(denorm_exception)
 
 EXC_REAL_BEGIN(denorm_exception, 0x1500, 0x100)
@@ -2154,7 +2167,6 @@ EXC_REAL_BEGIN(denorm_exception, 0x1500, 0x100)
 	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
 #endif
-	KVMTEST denorm_exception, EXC_HV, 0x1500
 	mfspr	r11,SPRN_HSRR0
 	mfspr	r12,SPRN_HSRR1
 	GEN_BRANCH_TO_COMMON denorm_exception, virt=0
@@ -2172,8 +2184,6 @@ EXC_VIRT_END(denorm_exception, 0x5500, 0x100)
 #else
 EXC_VIRT_NONE(0x5500, 0x100)
 #endif
-TRAMP_KVM_BEGIN(denorm_exception_kvm)
-	GEN_KVM denorm_exception
 
 #ifdef CONFIG_PPC_DENORMALISATION
 TRAMP_REAL_BEGIN(denorm_assist)
@@ -2251,6 +2261,8 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 	bl	unknown_exception
 	b	ret_from_except
 
+	GEN_KVM denorm_exception
+
 
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_maintenance)
@@ -2264,14 +2276,15 @@ EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x100)
 	GEN_INT_ENTRY cbe_maintenance, virt=0
 EXC_REAL_END(cbe_maintenance, 0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
-TRAMP_KVM_BEGIN(cbe_maintenance_kvm)
-	GEN_KVM cbe_maintenance
 EXC_COMMON_BEGIN(cbe_maintenance_common)
 	GEN_COMMON cbe_maintenance
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_maintenance_exception
 	b	ret_from_except
+
+	GEN_KVM cbe_maintenance
+
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
@@ -2289,8 +2302,6 @@ EXC_REAL_END(altivec_assist, 0x1700, 0x100)
 EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
 	GEN_INT_ENTRY altivec_assist, virt=1
 EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
-TRAMP_KVM_BEGIN(altivec_assist_kvm)
-	GEN_KVM altivec_assist
 EXC_COMMON_BEGIN(altivec_assist_common)
 	GEN_COMMON altivec_assist
 	bl	save_nvgprs
@@ -2302,6 +2313,8 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 #endif
 	b	ret_from_except
 
+	GEN_KVM altivec_assist
+
 
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_thermal)
@@ -2315,14 +2328,15 @@ EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x100)
 	GEN_INT_ENTRY cbe_thermal, virt=0
 EXC_REAL_END(cbe_thermal, 0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
-TRAMP_KVM_BEGIN(cbe_thermal_kvm)
-	GEN_KVM cbe_thermal
 EXC_COMMON_BEGIN(cbe_thermal_common)
 	GEN_COMMON cbe_thermal
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_thermal_exception
 	b	ret_from_except
+
+	GEN_KVM cbe_thermal
+
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
@@ -2514,17 +2528,12 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
 	GET_SCRATCH0(r13);
 	hrfid
 
-/*
- * Real mode exceptions actually use this too, but alternate
- * instruction code patches (which end up in the common .text area)
- * cannot reach these if they are put there.
- */
 USE_TEXT_SECTION()
 	MASKED_INTERRUPT EXC_STD
 	MASKED_INTERRUPT EXC_HV
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-TRAMP_REAL_BEGIN(kvmppc_skip_interrupt)
+kvmppc_skip_interrupt:
 	/*
 	 * Here all GPRs are unchanged from when the interrupt happened
 	 * except for r13, which is saved in SPRG_SCRATCH0.
@@ -2536,7 +2545,7 @@ TRAMP_REAL_BEGIN(kvmppc_skip_interrupt)
 	RFI_TO_KERNEL
 	b	.
 
-TRAMP_REAL_BEGIN(kvmppc_skip_Hinterrupt)
+kvmppc_skip_Hinterrupt:
 	/*
 	 * Here all GPRs are unchanged from when the interrupt happened
 	 * except for r13, which is saved in SPRG_SCRATCH0.
@@ -2549,16 +2558,6 @@ TRAMP_REAL_BEGIN(kvmppc_skip_Hinterrupt)
 	b	.
 #endif
 
-/*
- * Ensure that any handlers that get invoked from the exception prologs
- * above are below the first 64KB (0x10000) of the kernel image because
- * the prologs assemble the addresses of these handlers using the
- * LOAD_HANDLER macro, which uses an ori instruction.
- */
-
-/*** Common interrupt handlers ***/
-
-
 	/*
 	 * Relocation-on interrupts: A subset of the interrupts can be delivered
 	 * with IR=1/DR=1, if AIL==2 and MSR.HV won't be changed by delivering
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index dbc2fecc37f0..780a499c7114 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1266,7 +1266,6 @@ kvmppc_interrupt_hv:
 	 * R12		= (guest CR << 32) | interrupt vector
 	 * R13		= PACA
 	 * guest R12 saved in shadow VCPU SCRATCH0
-	 * guest CTR saved in shadow VCPU SCRATCH1 if RELOCATABLE
 	 * guest R13 saved in SPRN_SCRATCH0
 	 */
 	std	r9, HSTATE_SCRATCH2(r13)
@@ -1367,12 +1366,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 11:	stw	r3,VCPU_HEIR(r9)
 
 	/* these are volatile across C function calls */
-#ifdef CONFIG_RELOCATABLE
-	ld	r3, HSTATE_SCRATCH1(r13)
-	mtctr	r3
-#else
 	mfctr	r3
-#endif
 	mfxer	r4
 	std	r3, VCPU_CTR(r9)
 	std	r4, VCPU_XER(r9)
@@ -3258,7 +3252,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_P9_TM_HV_ASSIST)
  * r12 is (CR << 32) | vector
  * r13 points to our PACA
  * r12 is saved in HSTATE_SCRATCH0(r13)
- * ctr is saved in HSTATE_SCRATCH1(r13) if RELOCATABLE
  * r9 is saved in HSTATE_SCRATCH2(r13)
  * r13 is saved in HSPRG1
  * cfar is saved in HSTATE_CFAR(r13)
@@ -3307,11 +3300,7 @@ kvmppc_bad_host_intr:
 	ld	r5, HSTATE_CFAR(r13)
 	std	r5, ORIG_GPR3(r1)
 	mflr	r3
-#ifdef CONFIG_RELOCATABLE
-	ld	r4, HSTATE_SCRATCH1(r13)
-#else
 	mfctr	r4
-#endif
 	mfxer	r5
 	lbz	r6, PACAIRQSOFTMASK(r13)
 	std	r3, _LINK(r1)
diff --git a/arch/powerpc/kvm/book3s_segment.S b/arch/powerpc/kvm/book3s_segment.S
index 0169bab544dd..1f492aa4c8d6 100644
--- a/arch/powerpc/kvm/book3s_segment.S
+++ b/arch/powerpc/kvm/book3s_segment.S
@@ -167,16 +167,9 @@ kvmppc_interrupt_pr:
 	 * R12             = (guest CR << 32) | exit handler id
 	 * R13             = PACA
 	 * HSTATE.SCRATCH0 = guest R12
-	 * HSTATE.SCRATCH1 = guest CTR if RELOCATABLE
 	 */
 #ifdef CONFIG_PPC64
 	/* Match 32-bit entry */
-#ifdef CONFIG_RELOCATABLE
-	std	r9, HSTATE_SCRATCH2(r13)
-	ld	r9, HSTATE_SCRATCH1(r13)
-	mtctr	r9
-	ld	r9, HSTATE_SCRATCH2(r13)
-#endif
 	rotldi	r12, r12, 32		  /* Flip R12 halves for stw */
 	stw	r12, HSTATE_SCRATCH1(r13) /* CR is now in the low half */
 	srdi	r12, r12, 32		  /* shift trap into low half */
-- 
2.23.0

