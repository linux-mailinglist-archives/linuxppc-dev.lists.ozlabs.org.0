Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B730E325101
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:56:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ8d53ZSz3dZT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kq06fiUQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kq06fiUQ; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYyx5SMgz3dD5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:25 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id z5so3655452pfe.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iugbjjW8P6YeBsxWVVXF7ID8mX0uXVwpCpjEUpz/KX0=;
 b=kq06fiUQcoCHZfL9k7u/oCZIOJBp6aZsbxAPlsVpRghCm/OcNEx/7feAkPmWqGVeHr
 dk9vDxl0XAii7VzgEZsLcXoRjGnJ2X4IORFsV8FYbSjkNQe/mHMXrAiP4dzYqj649/ax
 b+NzbARSkiyOTTMkaeEIqx3JOcElc817ARhcNbprsMqqzvnGd2MEoocK+1PyejbCX/ox
 PyCOzO//VU6vFeMW09fORblYfVadWadjm2w0ezKp3TR7Hnfek7+OpxQoFB8Xfu50rDUn
 JdYYqf2MI5dJ198dWz8ptYlwoOEZFj3ZWwh4lBA5OcWkURVHHWUghckqm9D3FEANXrDo
 bbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iugbjjW8P6YeBsxWVVXF7ID8mX0uXVwpCpjEUpz/KX0=;
 b=GVTiAfqQYDILcZPaOKpNcjxnP5H2lyJE5gZY7kXnbj2qb0OVfGndYa1eL6DrGmQWrp
 tFAzOn++tKkCl5icNG8MPmBzVRdTsDf0A/+Q8XZjt+4NAf36e+TBaZjl3OwIkdpAjCXb
 PKu7aSl2yEpnVyDKSS/Shl4JDTbaXkUg02d1cRnq1w4RkPRcN/ouCX7Dxz67BgfaR4EC
 immQty3ksrNPCZd5VhI3Aus+8lLyNfIgdd6OZtw+JFSUK0PIs4QmiplyQUcMuNVYOtGa
 +lfBVdkMts6wGmNkdweV67lHQupStNfgux+ife3zQVdRWg4J2Gqv3fFhGJc4XYFdSS6+
 2h9Q==
X-Gm-Message-State: AOAM531BEUzZr5f1PFne8/c0ejRa0aGfdRz3/k7Rpj09De6oLyulaBw1
 PNoaoGtp+gnRkwybePknEqQ=
X-Google-Smtp-Source: ABdhPJw7h4MLpxaOvYjAiH0IV0geHpya+fR3SmZ/FmPT/qi6dyWIHAo5dpWzSXPfyPSFHXvD78xNUg==
X-Received: by 2002:aa7:9e04:0:b029:1ed:996a:abb4 with SMTP id
 y4-20020aa79e040000b02901ed996aabb4mr3325005pfq.5.1614260903040; 
 Thu, 25 Feb 2021 05:48:23 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 23/37] KVM: PPC: Book3S HV P9: Implement the rest of the P9
 path in C
Date: Thu, 25 Feb 2021 23:46:38 +1000
Message-Id: <20210225134652.2127648-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Almost all logic is moved to C, by introducing a new in_guest mode that
selects and branches very early in the interrupt handler to the P9 exit
code.

The remaining assembly is only about 160 lines of low level stack setup,
with VCPU vs host register save and restore, plus a small shim to the
legacy paths in the interrupt handler.

There are two motivations for this, the first is just make the code more
maintainable being in C. The second is to reduce the amount of code
running in a special KVM mode, "realmode". I put that in quotes because
with radix it is no longer necessarily real-mode in the MMU, but it
still has to be treated specially because it may be in real-mode, and
has various important registers like PID, DEC, TB, etc set to guest.
This is hostile to the rest of Linux and can't use arbitrary kernel
functionality or be instrumented well.

This initial patch is a reasonably faithful conversion of the asm code.
It does lack any loop to return quickly back into the guest without
switching out of realmode in the case of unimportant or easily handled
interrupts, as explained in the previous change, handling HV interrupts
in real mode is not so important for P9.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |   3 +-
 arch/powerpc/include/asm/kvm_asm.h        |   3 +-
 arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
 arch/powerpc/kernel/security.c            |   5 +-
 arch/powerpc/kvm/Makefile                 |   3 +
 arch/powerpc/kvm/book3s_64_entry.S        | 181 ++++++++++++++++++
 arch/powerpc/kvm/book3s_hv.c              |  27 ++-
 arch/powerpc/kvm/book3s_hv_interrupt.c    | 221 ++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 123 +-----------
 arch/powerpc/kvm/book3s_xive.c            |  34 ++++
 10 files changed, 480 insertions(+), 128 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 939f3c94c8f3..8677d27929fe 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -122,6 +122,7 @@ extern s32 patch__call_flush_branch_caches3;
 extern s32 patch__flush_count_cache_return;
 extern s32 patch__flush_link_stack_return;
 extern s32 patch__call_kvm_flush_link_stack;
+extern s32 patch__call_kvm_flush_link_stack_2;
 extern s32 patch__memset_nocache, patch__memcpy_nocache;
 
 extern long flush_branch_caches;
@@ -142,7 +143,7 @@ void kvmhv_load_host_pmu(void);
 void kvmhv_save_guest_pmu(struct kvm_vcpu *vcpu, bool pmu_in_use);
 void kvmhv_load_guest_pmu(struct kvm_vcpu *vcpu);
 
-int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu);
+void kvmppc_p9_enter_guest(struct kvm_vcpu *vcpu);
 
 long kvmppc_h_set_dabr(struct kvm_vcpu *vcpu, unsigned long dabr);
 long kvmppc_h_set_xdabr(struct kvm_vcpu *vcpu, unsigned long dabr,
diff --git a/arch/powerpc/include/asm/kvm_asm.h b/arch/powerpc/include/asm/kvm_asm.h
index a3633560493b..b4f9996bd331 100644
--- a/arch/powerpc/include/asm/kvm_asm.h
+++ b/arch/powerpc/include/asm/kvm_asm.h
@@ -146,7 +146,8 @@
 #define KVM_GUEST_MODE_GUEST	1
 #define KVM_GUEST_MODE_SKIP	2
 #define KVM_GUEST_MODE_GUEST_HV	3
-#define KVM_GUEST_MODE_HOST_HV	4
+#define KVM_GUEST_MODE_GUEST_HV_FAST	4 /* ISA v3.0 with host radix mode */
+#define KVM_GUEST_MODE_HOST_HV	5
 
 #define KVM_INST_FETCH_FAILED	-1
 
diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 9bb9bb370b53..c214bcffb441 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -153,9 +153,17 @@ static inline bool kvmhv_vcpu_is_radix(struct kvm_vcpu *vcpu)
 	return radix;
 }
 
+int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu);
+
 #define KVM_DEFAULT_HPT_ORDER	24	/* 16MB HPT by default */
 #endif
 
+/*
+ * Invalid HDSISR value which is used to indicate when HW has not set the reg.
+ * Used to work around an errata.
+ */
+#define HDSISR_CANARY	0x7fff
+
 /*
  * We use a lock bit in HPTE dword 0 to synchronize updates and
  * accesses to each HPTE, and another bit to indicate non-present
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index e4e1a94ccf6a..6c37aeed0650 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -430,16 +430,19 @@ device_initcall(stf_barrier_debugfs_init);
 
 static void update_branch_cache_flush(void)
 {
-	u32 *site;
+	u32 *site, __maybe_unused *site2;
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	site = &patch__call_kvm_flush_link_stack;
+	site2 = &patch__call_kvm_flush_link_stack_2;
 	// This controls the branch from guest_exit_cont to kvm_flush_link_stack
 	if (link_stack_flush_type == BRANCH_CACHE_FLUSH_NONE) {
 		patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
+		patch_instruction_site(site2, ppc_inst(PPC_INST_NOP));
 	} else {
 		// Could use HW flush, but that could also flush count cache
 		patch_branch_site(site, (u64)&kvm_flush_link_stack, BRANCH_SET_LINK);
+		patch_branch_site(site2, (u64)&kvm_flush_link_stack, BRANCH_SET_LINK);
 	}
 #endif
 
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index cdd119028f64..40a55a5ba4ff 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -43,6 +43,9 @@ kvm-objs-$(CONFIG_KVM_E500MC) := $(kvm-e500mc-objs)
 kvm-book3s_64-builtin-objs-$(CONFIG_SPAPR_TCE_IOMMU) := \
 	book3s_64_vio_hv.o
 
+kvm-book3s_64-builtin-objs-y += \
+	book3s_hv_interrupt.o
+
 kvm-pr-y := \
 	fpu.o \
 	emulate.o \
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index f826c8dc2e19..cc7b76865a16 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -1,10 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #include <asm/asm-offsets.h>
 #include <asm/cache.h>
+#include <asm/code-patching-asm.h>
 #include <asm/exception-64s.h>
+#include <asm/export.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_book3s_asm.h>
 #include <asm/ppc_asm.h>
 #include <asm/reg.h>
+#include <asm/ultravisor-api.h>
 
 /*
  * These are branched to from interrupt handlers in exception-64s.S which set
@@ -13,13 +17,24 @@
 .global	kvmppc_hcall
 .balign IFETCH_ALIGN_BYTES
 kvmppc_hcall:
+	lbz	r10,HSTATE_IN_GUEST(r13)
+	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_FAST
+	beq	kvmppc_p9_exit_hcall
 	ld	r10,PACA_EXGEN+EX_R13(r13)
 	SET_SCRATCH0(r10)
 	li	r10,0xc00
+	li	r11,PACA_EXGEN
+	b	1f
 
 .global	kvmppc_interrupt
 .balign IFETCH_ALIGN_BYTES
 kvmppc_interrupt:
+	std	r10,HSTATE_SCRATCH0(r13)
+	lbz	r10,HSTATE_IN_GUEST(r13)
+	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_FAST
+	beq	kvmppc_p9_exit_interrupt
+	ld	r10,HSTATE_SCRATCH0(r13)
+	lbz	r11,HSTATE_IN_GUEST(r13)
 	li	r11,PACA_EXGEN
 	cmpdi	r10,0x200
 	bgt+	1f
@@ -114,3 +129,169 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	GET_SCRATCH0(r13)
 	HRFI_TO_KERNEL
 #endif
+
+/* Stack frame offsets for kvmppc_hv_entry */
+#define SFS			208
+#define STACK_SLOT_VCPU		(SFS-8)
+#define STACK_SLOT_NVGPRS	(SFS-152)	/* 18 gprs */
+
+/*
+ * void kvmppc_p9_enter_guest(struct vcpu *vcpu);
+ *
+ * Enter the guest on a ISAv3.0 or later system where we have exactly
+ * one vcpu per vcore, and both the host and guest are radix, and threads
+ * are set to "indepdent mode".
+ */
+.balign	IFETCH_ALIGN_BYTES
+_GLOBAL(kvmppc_p9_enter_guest)
+EXPORT_SYMBOL_GPL(kvmppc_p9_enter_guest)
+	mflr	r0
+	std	r0,PPC_LR_STKOFF(r1)
+	stdu	r1,-SFS(r1)
+
+	std	r1,HSTATE_HOST_R1(r13)
+	std	r3,STACK_SLOT_VCPU(r1)
+
+	mfcr	r4
+	stw	r4,SFS+8(r1)
+
+	reg = 14
+	.rept	18
+	std	reg,STACK_SLOT_NVGPRS + ((reg - 14) * 8)(r1)
+	reg = reg + 1
+	.endr
+
+	ld	r4,VCPU_LR(r3)
+	mtlr	r4
+	ld	r4,VCPU_CTR(r3)
+	mtctr	r4
+	ld	r4,VCPU_XER(r3)
+	mtspr	SPRN_XER,r4
+
+	ld	r1,VCPU_CR(r3)
+
+BEGIN_FTR_SECTION
+	ld	r4,VCPU_CFAR(r3)
+	mtspr	SPRN_CFAR,r4
+END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
+BEGIN_FTR_SECTION
+	ld	r4,VCPU_PPR(r3)
+	mtspr	SPRN_PPR,r4
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
+	reg = 4
+	.rept	28
+	ld	reg,__VCPU_GPR(reg)(r3)
+	reg = reg + 1
+	.endr
+
+	ld	r4,VCPU_KVM(r3)
+	lbz	r4,KVM_SECURE_GUEST(r4)
+	cmpdi	r4,0
+	ld	r4,VCPU_GPR(R4)(r3)
+	bne	.Lret_to_ultra
+
+	mtcr	r1
+
+	ld	r0,VCPU_GPR(R0)(r3)
+	ld	r1,VCPU_GPR(R1)(r3)
+	ld	r2,VCPU_GPR(R2)(r3)
+	ld	r3,VCPU_GPR(R3)(r3)
+
+	HRFI_TO_GUEST
+	b	.
+
+	/*
+	 * Use UV_RETURN ultracall to return control back to the Ultravisor
+	 * after processing an hypercall or interrupt that was forwarded
+	 * (a.k.a. reflected) to the Hypervisor.
+	 *
+	 * All registers have already been reloaded except the ucall requires:
+	 *   R0 = hcall result
+	 *   R2 = SRR1, so UV can detect a synthesized interrupt (if any)
+	 *   R3 = UV_RETURN
+	 */
+.Lret_to_ultra:
+	mtcr	r1
+	ld	r1,VCPU_GPR(R1)(r3)
+
+	ld	r0,VCPU_GPR(R3)(r3)
+	mfspr	r2,SPRN_SRR1
+	LOAD_REG_IMMEDIATE(r3, UV_RETURN)
+	sc	2
+
+/*
+ * kvmppc_p9_exit_hcall and kvmppc_p9_exit_interrupt are branched to from
+ * above if the interrupt was taken for a guest that was entered via
+ * kvmppc_p9_enter_guest().
+ *
+ * This code recovers the host stack and vcpu pointer, saves all GPRs and
+ * CR, LR, CTR, XER as well as guest MSR and NIA into the VCPU, then re-
+ * establishes the host stack and registers to return from  the
+ * kvmppc_p9_enter_guest() function.
+ */
+.balign	IFETCH_ALIGN_BYTES
+kvmppc_p9_exit_hcall:
+	mfspr	r11,SPRN_SRR0
+	mfspr	r12,SPRN_SRR1
+	li	r10,0xc00
+	std	r10,HSTATE_SCRATCH0(r13)
+
+.balign	IFETCH_ALIGN_BYTES
+kvmppc_p9_exit_interrupt:
+	std     r1,HSTATE_SCRATCH1(r13)
+	std     r3,HSTATE_SCRATCH2(r13)
+	ld	r1,HSTATE_HOST_R1(r13)
+	ld	r3,STACK_SLOT_VCPU(r1)
+
+	std	r9,VCPU_CR(r3)
+
+1:
+	std	r11,VCPU_PC(r3)
+	std	r12,VCPU_MSR(r3)
+
+	reg = 14
+	.rept	18
+	std	reg,__VCPU_GPR(reg)(r3)
+	reg = reg + 1
+	.endr
+
+	/* r1, r3, r9-r13 are saved to vcpu by C code */
+	std	r0,VCPU_GPR(R0)(r3)
+	std	r2,VCPU_GPR(R2)(r3)
+	reg = 4
+	.rept	5
+	std	reg,__VCPU_GPR(reg)(r3)
+	reg = reg + 1
+	.endr
+
+	ld	r2,PACATOC(r13)
+
+	mflr	r4
+	std	r4,VCPU_LR(r3)
+	mfspr	r4,SPRN_XER
+	std	r4,VCPU_XER(r3)
+
+	reg = 14
+	.rept	18
+	ld	reg,STACK_SLOT_NVGPRS + ((reg - 14) * 8)(r1)
+	reg = reg + 1
+	.endr
+
+	lwz	r4,SFS+8(r1)
+	mtcr	r4
+
+	/*
+	 * Flush the link stack here, before executing the first blr on the
+	 * way out of the guest.
+	 *
+	 * The link stack won't match coming out of the guest anyway so the
+	 * only cost is the flush itself. The call clobbers r0.
+	 */
+1:	nop
+	patch_site 1b patch__call_kvm_flush_link_stack_2
+
+	addi	r1,r1,SFS
+	ld	r0,PPC_LR_STKOFF(r1)
+	mtlr	r0
+	blr
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 1997cf347d3e..28a2761515e3 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1421,6 +1421,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 */
 	case BOOK3S_INTERRUPT_H_DATA_STORAGE:
 		r = RESUME_PAGE_FAULT;
+		if (vcpu->arch.fault_dsisr == HDSISR_CANARY)
+			r = RESUME_GUEST; /* Just retry if it's the canary */
 		break;
 	case BOOK3S_INTERRUPT_H_INST_STORAGE:
 		vcpu->arch.fault_dar = kvmppc_get_pc(vcpu);
@@ -3736,14 +3738,14 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
 		vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
 		mtspr(SPRN_PSSCR_PR, host_psscr);
-
 		/* H_CEDE has to be handled now, not later */
-		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
+		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
 		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
 			kvmppc_cede(vcpu);
 			kvmppc_set_gpr(vcpu, 3, 0);
 			trap = 0;
 		}
+
 	} else {
 		kvmppc_xive_push_vcpu(vcpu);
 		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
@@ -3768,9 +3770,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			}
 		}
 		kvmppc_xive_pull_vcpu(vcpu);
+
+		vcpu->arch.slb_max = 0;
 	}
 
-	vcpu->arch.slb_max = 0;
 	dec = mfspr(SPRN_DEC);
 	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 		dec = (s32) dec;
@@ -4429,11 +4432,19 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		else
 			r = kvmppc_run_vcpu(vcpu);
 
-		if (run->exit_reason == KVM_EXIT_PAPR_HCALL &&
-		    !(vcpu->arch.shregs.msr & MSR_PR)) {
-			trace_kvm_hcall_enter(vcpu);
-			r = kvmppc_pseries_do_hcall(vcpu);
-			trace_kvm_hcall_exit(vcpu, r);
+		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
+			if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
+				/*
+				 * Guest userspace executed sc 1, reflect it
+				 * back as a privileged program check interrupt.
+				 */
+				kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
+				r = RESUME_GUEST;
+			} else {
+				trace_kvm_hcall_enter(vcpu);
+				r = kvmppc_pseries_do_hcall(vcpu);
+				trace_kvm_hcall_exit(vcpu, r);
+			}
 			kvmppc_core_prepare_to_enter(vcpu);
 		} else if (r == RESUME_PAGE_FAULT) {
 			srcu_idx = srcu_read_lock(&kvm->srcu);
diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
new file mode 100644
index 000000000000..5a7b036c447f
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/kernel.h>
+#include <linux/kvm_host.h>
+#include <asm/asm-prototypes.h>
+#include <asm/dbell.h>
+#include <asm/kvm_ppc.h>
+
+#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+static void __start_timing(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
+{
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	u64 tb = mftb() - vc->tb_offset_applied;
+
+	vcpu->arch.cur_activity = next;
+	vcpu->arch.cur_tb_start = tb;
+}
+
+static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
+{
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	struct kvmhv_tb_accumulator *curr;
+	u64 tb = mftb() - vc->tb_offset_applied;
+	u64 prev_tb;
+	u64 delta;
+	u64 seq;
+
+	curr = vcpu->arch.cur_activity;
+	vcpu->arch.cur_activity = next;
+	prev_tb = vcpu->arch.cur_tb_start;
+	vcpu->arch.cur_tb_start = tb;
+
+	if (!curr)
+		return;
+
+	delta = tb - prev_tb;
+
+	seq = curr->seqcount;
+	curr->seqcount = seq + 1;
+	smp_wmb();
+	curr->tb_total += delta;
+	if (seq == 0 || delta < curr->tb_min)
+		curr->tb_min = delta;
+	if (delta > curr->tb_max)
+		curr->tb_max = delta;
+	smp_wmb();
+	curr->seqcount = seq + 2;
+}
+
+#define start_timing(vcpu, next) __start_timing(vcpu, next)
+#define end_timing(vcpu) __start_timing(vcpu, NULL)
+#define accumulate_time(vcpu, next) __accumulate_time(vcpu, next)
+#else
+#define start_timing(vcpu, next) do {} while (0)
+#define end_timing(vcpu) do {} while (0)
+#define accumulate_time(vcpu, next) do {} while (0)
+#endif
+
+static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
+{
+	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
+	asm volatile("slbmfee  %0,%1" : "=r" (*slbee) : "r" (idx));
+}
+
+static inline void mtslb(unsigned int idx, u64 slbee, u64 slbev)
+{
+	BUG_ON((slbee & 0xfff) != idx);
+
+	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
+}
+
+static inline void slb_invalidate(unsigned int ih)
+{
+	asm volatile("slbia %0" :: "i"(ih));
+}
+
+/*
+ * Malicious or buggy radix guests may have inserted SLB entries
+ * (only 0..3 because radix always runs with UPRT=1), so these must
+ * be cleared here to avoid side-channels. slbmte is used rather
+ * than slbia, as it won't clear cached translations.
+ */
+static void radix_clear_slb(void)
+{
+	u64 slbee, slbev;
+	int i;
+
+	for (i = 0; i < 4; i++) {
+		mfslb(i, &slbee, &slbev);
+		if (unlikely(slbee || slbev)) {
+			slbee = i;
+			slbev = 0;
+			mtslb(i, slbee, slbev);
+		}
+	}
+}
+
+int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
+{
+	u64 *exsave;
+	unsigned long msr = mfmsr();
+	int trap;
+
+	start_timing(vcpu, &vcpu->arch.rm_entry);
+
+	vcpu->arch.ceded = 0;
+
+	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
+	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
+
+	mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
+	mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
+
+	/*
+	 * On POWER9 DD2.1 and below, sometimes on a Hypervisor Data Storage
+	 * Interrupt (HDSI) the HDSISR is not be updated at all.
+	 *
+	 * To work around this we put a canary value into the HDSISR before
+	 * returning to a guest and then check for this canary when we take a
+	 * HDSI. If we find the canary on a HDSI, we know the hardware didn't
+	 * update the HDSISR. In this case we return to the guest to retake the
+	 * HDSI which should correctly update the HDSISR the second time HDSI
+	 * entry.
+	 *
+	 * Just do this on all p9 processors for now.
+	 */
+	mtspr(SPRN_HDSISR, HDSISR_CANARY);
+
+	accumulate_time(vcpu, &vcpu->arch.guest_time);
+
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
+	kvmppc_p9_enter_guest(vcpu);
+	// Radix host and guest means host never runs with guest MMU state
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
+
+	accumulate_time(vcpu, &vcpu->arch.rm_intr);
+
+	/* Get these from r11/12 and paca exsave */
+	vcpu->arch.shregs.srr0 = mfspr(SPRN_SRR0);
+	vcpu->arch.shregs.srr1 = mfspr(SPRN_SRR1);
+	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
+	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
+
+	trap = local_paca->kvm_hstate.scratch0 & ~0x2;
+	if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK)) {
+		exsave = local_paca->exgen;
+	} else if (trap == BOOK3S_INTERRUPT_SYSTEM_RESET) {
+		exsave = local_paca->exnmi;
+	} else { /* trap == 0x200 */
+		exsave = local_paca->exmc;
+	}
+
+	vcpu->arch.regs.gpr[1] = local_paca->kvm_hstate.scratch1;
+	vcpu->arch.regs.gpr[3] = local_paca->kvm_hstate.scratch2;
+	vcpu->arch.regs.gpr[9] = exsave[EX_R9/sizeof(u64)];
+	vcpu->arch.regs.gpr[10] = exsave[EX_R10/sizeof(u64)];
+	vcpu->arch.regs.gpr[11] = exsave[EX_R11/sizeof(u64)];
+	vcpu->arch.regs.gpr[12] = exsave[EX_R12/sizeof(u64)];
+	vcpu->arch.regs.gpr[13] = exsave[EX_R13/sizeof(u64)];
+	vcpu->arch.ppr = exsave[EX_PPR/sizeof(u64)];
+	vcpu->arch.cfar = exsave[EX_CFAR/sizeof(u64)];
+	vcpu->arch.regs.ctr = exsave[EX_CTR/sizeof(u64)];
+
+	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
+
+	if (unlikely(trap == BOOK3S_INTERRUPT_MACHINE_CHECK)) {
+		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
+		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
+		kvmppc_realmode_machine_check(vcpu);
+
+	} else if (unlikely(trap == BOOK3S_INTERRUPT_HMI)) {
+		kvmppc_realmode_hmi_handler();
+
+	} else if (trap == BOOK3S_INTERRUPT_H_EMUL_ASSIST) {
+		vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
+
+	} else if (trap == BOOK3S_INTERRUPT_H_DATA_STORAGE) {
+		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
+		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
+		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
+
+	} else if (trap == BOOK3S_INTERRUPT_H_INST_STORAGE) {
+		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
+
+	} else if (trap == BOOK3S_INTERRUPT_H_FAC_UNAVAIL) {
+		vcpu->arch.hfscr = mfspr(SPRN_HFSCR);
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	/*
+	 * Softpatch interrupt for transactional memory emulation cases
+	 * on POWER9 DD2.2.  This is early in the guest exit path - we
+	 * haven't saved registers or done a treclaim yet.
+	 */
+	} else if (trap == BOOK3S_INTERRUPT_HV_SOFTPATCH) {
+		vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
+
+		/*
+		 * The cases we want to handle here are those where the guest
+		 * is in real suspend mode and is trying to transition to
+		 * transactional mode.
+		 */
+		if (local_paca->kvm_hstate.fake_suspend &&
+				(vcpu->arch.shregs.msr & MSR_TS_S)) {
+			if (kvmhv_p9_tm_emulation_early(vcpu)) {
+				/* Prevent it being handled again. */
+				trap = 0;
+			}
+		}
+#endif
+	}
+
+	radix_clear_slb();
+
+	__mtmsrd(msr, 0);
+
+	accumulate_time(vcpu, &vcpu->arch.rm_exit);
+
+	end_timing(vcpu);
+
+	return trap;
+}
+EXPORT_SYMBOL_GPL(__kvmhv_vcpu_entry_p9);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 2d0d14ed1d92..6118e8a97ddd 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -44,9 +44,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 #define NAPPING_UNSPLIT	3
 
 /* Stack frame offsets for kvmppc_hv_entry */
-#define SFS			208
+#define SFS			160
 #define STACK_SLOT_TRAP		(SFS-4)
-#define STACK_SLOT_SHORT_PATH	(SFS-8)
 #define STACK_SLOT_TID		(SFS-16)
 #define STACK_SLOT_PSSCR	(SFS-24)
 #define STACK_SLOT_PID		(SFS-32)
@@ -59,8 +58,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 #define STACK_SLOT_UAMOR	(SFS-88)
 #define STACK_SLOT_DAWR1	(SFS-96)
 #define STACK_SLOT_DAWRX1	(SFS-104)
-/* the following is used by the P9 short path */
-#define STACK_SLOT_NVGPRS	(SFS-152)	/* 18 gprs */
 
 /*
  * Call kvmppc_hv_entry in real mode.
@@ -1008,9 +1005,6 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
 no_xive:
 #endif /* CONFIG_KVM_XICS */
 
-	li	r0, 0
-	stw	r0, STACK_SLOT_SHORT_PATH(r1)
-
 deliver_guest_interrupt:	/* r4 = vcpu, r13 = paca */
 	/* Check if we can deliver an external or decrementer interrupt now */
 	ld	r0, VCPU_PENDING_EXC(r4)
@@ -1030,7 +1024,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	mtspr	SPRN_SRR0, r6
 	mtspr	SPRN_SRR1, r7
 
-fast_guest_entry_c:
 	ld	r10, VCPU_PC(r4)
 	ld	r11, VCPU_MSR(r4)
 	/* r11 = vcpu->arch.msr & ~MSR_HV */
@@ -1135,97 +1128,6 @@ ret_to_ultra:
 	ld	r4, VCPU_GPR(R4)(r4)
 	sc	2
 
-/*
- * Enter the guest on a P9 or later system where we have exactly
- * one vcpu per vcore and we don't need to go to real mode
- * (which implies that host and guest are both using radix MMU mode).
- * r3 = vcpu pointer
- * Most SPRs and all the VSRs have been loaded already.
- */
-_GLOBAL(__kvmhv_vcpu_entry_p9)
-EXPORT_SYMBOL_GPL(__kvmhv_vcpu_entry_p9)
-	mflr	r0
-	std	r0, PPC_LR_STKOFF(r1)
-	stdu	r1, -SFS(r1)
-
-	li	r0, 1
-	stw	r0, STACK_SLOT_SHORT_PATH(r1)
-
-	std	r3, HSTATE_KVM_VCPU(r13)
-	mfcr	r4
-	stw	r4, SFS+8(r1)
-
-	std	r1, HSTATE_HOST_R1(r13)
-
-	reg = 14
-	.rept	18
-	std	reg, STACK_SLOT_NVGPRS + ((reg - 14) * 8)(r1)
-	reg = reg + 1
-	.endr
-
-	reg = 14
-	.rept	18
-	ld	reg, __VCPU_GPR(reg)(r3)
-	reg = reg + 1
-	.endr
-
-	mfmsr	r10
-	std	r10, HSTATE_HOST_MSR(r13)
-
-	mr	r4, r3
-	b	fast_guest_entry_c
-guest_exit_short_path:
-	/*
-	 * Malicious or buggy radix guests may have inserted SLB entries
-	 * (only 0..3 because radix always runs with UPRT=1), so these must
-	 * be cleared here to avoid side-channels. slbmte is used rather
-	 * than slbia, as it won't clear cached translations.
-	 */
-	li	r0,0
-	slbmte	r0,r0
-	li	r4,1
-	slbmte	r0,r4
-	li	r4,2
-	slbmte	r0,r4
-	li	r4,3
-	slbmte	r0,r4
-
-	li	r0, KVM_GUEST_MODE_NONE
-	stb	r0, HSTATE_IN_GUEST(r13)
-
-	reg = 14
-	.rept	18
-	std	reg, __VCPU_GPR(reg)(r9)
-	reg = reg + 1
-	.endr
-
-	reg = 14
-	.rept	18
-	ld	reg, STACK_SLOT_NVGPRS + ((reg - 14) * 8)(r1)
-	reg = reg + 1
-	.endr
-
-	lwz	r4, SFS+8(r1)
-	mtcr	r4
-
-	mr	r3, r12		/* trap number */
-
-	addi	r1, r1, SFS
-	ld	r0, PPC_LR_STKOFF(r1)
-	mtlr	r0
-
-	/* If we are in real mode, do a rfid to get back to the caller */
-	mfmsr	r4
-	andi.	r5, r4, MSR_IR
-	bnelr
-	rldicl	r5, r4, 64 - MSR_TS_S_LG, 62	/* extract TS field */
-	mtspr	SPRN_SRR0, r0
-	ld	r10, HSTATE_HOST_MSR(r13)
-	rldimi	r10, r5, MSR_TS_S_LG, 63 - MSR_TS_T_LG
-	mtspr	SPRN_SRR1, r10
-	RFI_TO_KERNEL
-	b	.
-
 secondary_too_late:
 	li	r12, 0
 	stw	r12, STACK_SLOT_TRAP(r1)
@@ -1397,14 +1299,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	mr	r4,r9
 	bge	fast_guest_return
 2:
-	/* If we came in through the P9 short path, no real mode hcalls */
-	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
-	cmpwi	r0, 0
-	bne	no_try_real
 	/* See if this is an hcall we can handle in real mode */
 	cmpwi	r12,BOOK3S_INTERRUPT_SYSCALL
 	beq	hcall_try_real_mode
-no_try_real:
 
 	/* Hypervisor doorbell - exit only if host IPI flag set */
 	cmpwi	r12, BOOK3S_INTERRUPT_H_DOORBELL
@@ -1447,11 +1344,6 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 	bl	kvmhv_accumulate_time
 #endif
 #ifdef CONFIG_KVM_XICS
-	/* If we came in through the P9 short path, xive pull is done in C */
-	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
-	cmpwi	r0, 0
-	bne	1f
-
 	/* We are exiting, pull the VP from the XIVE */
 	lbz	r0, VCPU_XIVE_PUSHED(r9)
 	cmpwi	cr0, r0, 0
@@ -1496,11 +1388,6 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 1:	nop
 	patch_site 1b patch__call_kvm_flush_link_stack
 
-	/* If we came in through the P9 short path, go back out to C now */
-	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
-	cmpwi	r0, 0
-	bne	guest_exit_short_path
-
 	/* For hash guest, read the guest SLB and save it away */
 	ld	r5, VCPU_KVM(r9)
 	lbz	r0, KVM_RADIX(r5)
@@ -1548,8 +1435,10 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 	b	guest_bypass
 
 0:	/*
-	 * Sanitise radix guest SLB, see guest_exit_short_path comment.
-	 * We clear vcpu->arch.slb_max to match earlier behaviour.
+	 * Malicious or buggy radix guests may have inserted SLB entries
+	 * (only 0..3 because radix always runs with UPRT=1), so these must
+	 * be cleared here to avoid side-channels. slbmte is used rather
+	 * than slbia, as it won't clear cached translations.
 	 */
 	li	r0,0
 	stw	r0,VCPU_SLB_MAX(r9)
@@ -3362,7 +3251,7 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_DAWRX1, r0
 END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
 
-	/* Clear hash and radix guest SLB, see guest_exit_short_path comment. */
+	/* Clear hash and radix guest SLB. */
 	slbmte	r0, r0
 	PPC_SLBIA(6)
 
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index d2266d36a7c7..cb03ed147b42 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -161,6 +161,40 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
 
+void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu)
+{
+	void __iomem *esc_vaddr = (void __iomem *)vcpu->arch.xive_esc_vaddr;
+
+	if (!esc_vaddr)
+		return;
+
+	/* we are using XIVE with single escalation */
+
+	if (vcpu->arch.xive_esc_on) {
+		/*
+		 * If we still have a pending escalation, abort the cede,
+		 * and we must set PQ to 10 rather than 00 so that we don't
+		 * potentially end up with two entries for the escalation
+		 * interrupt in the XIVE interrupt queue.  In that case
+		 * we also don't want to set xive_esc_on to 1 here in
+		 * case we race with xive_esc_irq().
+		 */
+		vcpu->arch.ceded = 0;
+		/*
+		 * The escalation interrupts are special as we don't EOI them.
+		 * There is no need to use the load-after-store ordering offset
+		 * to set PQ to 10 as we won't use StoreEOI.
+		 */
+		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_10);
+	} else {
+		vcpu->arch.xive_esc_on = true;
+		mb();
+		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
+	}
+	mb();
+}
+EXPORT_SYMBOL_GPL(kvmppc_xive_cede_vcpu);
+
 /*
  * This is a simple trigger for a generic XIVE IRQ. This must
  * only be called for interrupts that support a trigger page
-- 
2.23.0

