Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BC4393FA9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:14:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzXX2G8Mz3bvj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:14:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JwLO3aSw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JwLO3aSw; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPg1wGvz2yXp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:39 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id f8so2187874pjh.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HVOojtQBQgYK5ATSe0TwVTMrg32P0A/i927pchYBLE=;
 b=JwLO3aSwT8wY54Cl6h4q4jJ/cTjbCOZUREcTUA2JESXtKHNL85VA3Qz2OgC5pNqBqK
 06vDhq+BSZn4nYzKvT6yZMWQ6WyBUiviSgf5Ej1+OmKTPQkxUSAucZ/HvU7oSeJIq7JL
 g2QW8Jl1r/hp9u6Oo8x2g7NJYKFjHUBSB4NkwaFoEXukZSKFp2rFazPwdKgH6N0oH5xL
 Kz16jbcgRtb8vbASaDa6RM8Eojn6VETIM+A2sSoyuhcBr5HNdujlfnIAnnJTv7dg6H59
 cuLbkD86fvkyMpiAClNHeYJjwjoWud+PCO3riz4Y0ud6HSHgxVEt0toN37RtF8DXgOZU
 LADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HVOojtQBQgYK5ATSe0TwVTMrg32P0A/i927pchYBLE=;
 b=shUrrt1Y4iLlNg5//fjmHE3K5VUvzym1CWWYpg+N6de+kog0a3nNRKh6aNvJy3I++B
 ceCkGb7SUUCgTGvssOLmaT9uD/Z9Tot45XkJ+jAX1CAHItxohqONBAFrBizvSZR8BCQR
 x3MKSwckNz52T+OGbhlxaUy0QorXlHx+QCkpMwG1PKyS8D78FFGlrewTL8KTLfO7l2kS
 L1q772LvBgSJmfyzz6bLHvPgoRu9yKTchfiRyRz9u5Ge4sPR6b5UJMWfHRu1FEn0f9iI
 Jz7MhHBEIUIxO9SOhuMCtQi/S+Sk+Y8A44lRKb2px2u1f/RDsxgPjbIc5g+Pv83HX/ey
 iiqA==
X-Gm-Message-State: AOAM532UhMH0vf40BlYV/0ZOYp+hyU923TsoonqPPrPh9dOPeYaWjXJM
 jOhzU23o6K8pTsrSzprgUuY=
X-Google-Smtp-Source: ABdhPJwsHqMyzqh/8FpnBDdO4zlTTpAx799Nul5zy72GRpfnfdrc5JW8vtBKlimpXmewc+QbZToOwg==
X-Received: by 2002:a17:902:a983:b029:fb:973:956a with SMTP id
 bh3-20020a170902a983b02900fb0973956amr7198910plb.79.1622192916257; 
 Fri, 28 May 2021 02:08:36 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 14/32] KVM: PPC: Book3S HV P9: Implement the rest of the P9
 path in C
Date: Fri, 28 May 2021 19:07:34 +1000
Message-Id: <20210528090752.3542186-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Almost all logic is moved to C, by introducing a new in_guest mode for
the P9 path that branches very early in the KVM interrupt handler to P9
exit code.

The main P9 entry and exit assembly is now only about 160 lines of low
level stack setup and register save/restore, plus a bad-interrupt
handler.

There are two motivations for this, the first is just make the code more
maintainable being in C. The second is to reduce the amount of code
running in a special KVM mode, "realmode". In quotes because with radix
it is no longer necessarily real-mode in the MMU, but it still has to be
treated specially because it may be in real-mode, and has various
important registers like PID, DEC, TB, etc set to guest. This is hostile
to the rest of Linux and can't use arbitrary kernel functionality or be
instrumented well.

This initial patch is a reasonably faithful conversion of the asm code,
but it does lack any loop to return quickly back into the guest without
switching out of realmode in the case of unimportant or easily handled
interrupts. As explained in previous changes, handling HV interrupts
very quickly in this low level realmode is not so important for P9
performance, and are important to avoid for security, observability,
debugability reasons.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |   3 +-
 arch/powerpc/include/asm/kvm_asm.h        |   1 +
 arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
 arch/powerpc/include/asm/kvm_host.h       |   7 +-
 arch/powerpc/kernel/security.c            |   5 +-
 arch/powerpc/kvm/Makefile                 |   1 +
 arch/powerpc/kvm/book3s_64_entry.S        | 254 ++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv.c              |   9 +-
 arch/powerpc/kvm/book3s_hv_p9_entry.c     | 207 ++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 125 +----------
 10 files changed, 496 insertions(+), 124 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_hv_p9_entry.c

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 1c7b75834e04..02ee6f5ac9fe 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -120,6 +120,7 @@ extern s32 patch__call_flush_branch_caches3;
 extern s32 patch__flush_count_cache_return;
 extern s32 patch__flush_link_stack_return;
 extern s32 patch__call_kvm_flush_link_stack;
+extern s32 patch__call_kvm_flush_link_stack_p9;
 extern s32 patch__memset_nocache, patch__memcpy_nocache;
 
 extern long flush_branch_caches;
@@ -140,7 +141,7 @@ void kvmhv_load_host_pmu(void);
 void kvmhv_save_guest_pmu(struct kvm_vcpu *vcpu, bool pmu_in_use);
 void kvmhv_load_guest_pmu(struct kvm_vcpu *vcpu);
 
-int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu);
+void kvmppc_p9_enter_guest(struct kvm_vcpu *vcpu);
 
 long kvmppc_h_set_dabr(struct kvm_vcpu *vcpu, unsigned long dabr);
 long kvmppc_h_set_xdabr(struct kvm_vcpu *vcpu, unsigned long dabr,
diff --git a/arch/powerpc/include/asm/kvm_asm.h b/arch/powerpc/include/asm/kvm_asm.h
index a3633560493b..43b1788e1f93 100644
--- a/arch/powerpc/include/asm/kvm_asm.h
+++ b/arch/powerpc/include/asm/kvm_asm.h
@@ -147,6 +147,7 @@
 #define KVM_GUEST_MODE_SKIP	2
 #define KVM_GUEST_MODE_GUEST_HV	3
 #define KVM_GUEST_MODE_HOST_HV	4
+#define KVM_GUEST_MODE_HV_FAST	5 /* ISA >= v3.0 host+guest radix, indep thr */
 
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
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 1e83359f286b..69add9d662df 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -683,7 +683,12 @@ struct kvm_vcpu_arch {
 	ulong fault_dar;
 	u32 fault_dsisr;
 	unsigned long intr_msr;
-	ulong fault_gpa;	/* guest real address of page fault (POWER9) */
+	/*
+	 * POWER9 and later: fault_gpa contains the guest real address of page
+	 * fault for a radix guest, or segment descriptor (equivalent to result
+	 * from slbmfev of SLB entry that translated the EA) for hash guests.
+	 */
+	ulong fault_gpa;
 #endif
 
 #ifdef CONFIG_BOOKE
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 0fdfcdd9d880..c17d1c9362b5 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -432,16 +432,19 @@ device_initcall(stf_barrier_debugfs_init);
 
 static void update_branch_cache_flush(void)
 {
-	u32 *site;
+	u32 *site, __maybe_unused *site2;
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	site = &patch__call_kvm_flush_link_stack;
+	site2 = &patch__call_kvm_flush_link_stack_p9;
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
index cdd119028f64..91eb67bb91e1 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -89,6 +89,7 @@ kvm-book3s_64-builtin-tm-objs-$(CONFIG_PPC_TRANSACTIONAL_MEM) += \
 ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	book3s_hv_hmi.o \
+	book3s_hv_p9_entry.o \
 	book3s_hv_rmhandlers.o \
 	book3s_hv_rm_mmu.o \
 	book3s_hv_ras.o \
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index a01046202eef..177e8fad5c8d 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -1,11 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <asm/asm-offsets.h>
 #include <asm/cache.h>
+#include <asm/code-patching-asm.h>
 #include <asm/exception-64s.h>
+#include <asm/export.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_book3s_asm.h>
+#include <asm/mmu.h>
 #include <asm/ppc_asm.h>
+#include <asm/ptrace.h>
 #include <asm/reg.h>
+#include <asm/ultravisor-api.h>
 
 /*
  * These are branched to from interrupt handlers in exception-64s.S which set
@@ -29,6 +34,11 @@
 .global	kvmppc_hcall
 .balign IFETCH_ALIGN_BYTES
 kvmppc_hcall:
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	lbz	r10,HSTATE_IN_GUEST(r13)
+	cmpwi	r10,KVM_GUEST_MODE_HV_FAST
+	beq	kvmppc_p9_exit_hcall
+#endif
 	ld	r10,PACA_EXGEN+EX_R13(r13)
 	SET_SCRATCH0(r10)
 	li	r10,0xc00
@@ -55,6 +65,13 @@ kvmppc_hcall:
 .global	kvmppc_interrupt
 .balign IFETCH_ALIGN_BYTES
 kvmppc_interrupt:
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	std	r10,HSTATE_SCRATCH0(r13)
+	lbz	r10,HSTATE_IN_GUEST(r13)
+	cmpwi	r10,KVM_GUEST_MODE_HV_FAST
+	beq	kvmppc_p9_exit_interrupt
+	ld	r10,HSTATE_SCRATCH0(r13)
+#endif
 	li	r11,PACA_EXGEN
 	cmpdi	r10,0x200
 	bgt+	.Lgot_save_area
@@ -156,3 +173,240 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	GET_SCRATCH0(r13)
 	HRFI_TO_KERNEL
 #endif
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+
+/* Stack frame offsets for kvmppc_p9_enter_guest */
+#define SFS			(144 + STACK_FRAME_MIN_SIZE)
+#define STACK_SLOT_NVGPRS	(SFS - 144)	/* 18 gprs */
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
+ * The exit code recovers the host stack and vcpu pointer, saves all guest GPRs
+ * and CR, LR, XER as well as guest MSR and NIA into the VCPU, then re-
+ * establishes the host stack and registers to return from the
+ * kvmppc_p9_enter_guest() function, which saves CTR and other guest registers
+ * (SPRs and FP, VEC, etc).
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
+	/*
+	 * If set to KVM_GUEST_MODE_HV_FAST but we're still in the
+	 * hypervisor, that means we can't return from the entry stack.
+	 */
+	rldicl. r10,r12,64-MSR_HV_LG,63
+	bne-	kvmppc_p9_bad_interrupt
+
+	std     r1,HSTATE_SCRATCH1(r13)
+	std     r3,HSTATE_SCRATCH2(r13)
+	ld	r1,HSTATE_HOST_R1(r13)
+	ld	r3,HSTATE_KVM_VCPU(r13)
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
+	patch_site 1b patch__call_kvm_flush_link_stack_p9
+
+	addi	r1,r1,SFS
+	ld	r0,PPC_LR_STKOFF(r1)
+	mtlr	r0
+	blr
+
+/*
+ * Took an interrupt somewhere right before HRFID to guest, so registers are
+ * in a bad way. Return things hopefully enough to run host virtual code and
+ * run the Linux interrupt handler (SRESET or MCE) to print something useful.
+ *
+ * We could be really clever and save all host registers in known locations
+ * before setting HSTATE_IN_GUEST, then restoring them all here, and setting
+ * return address to a fixup that sets them up again. But that's a lot of
+ * effort for a small bit of code. Lots of other things to do first.
+ */
+kvmppc_p9_bad_interrupt:
+	/*
+	 * Clean up guest registers to give host a chance to run.
+	 */
+	li	r10,0
+	mtspr	SPRN_AMR,r10
+	mtspr	SPRN_IAMR,r10
+	mtspr	SPRN_CIABR,r10
+	mtspr	SPRN_DAWRX0,r10
+BEGIN_FTR_SECTION
+	mtspr	SPRN_DAWRX1,r10
+END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
+	mtspr	SPRN_PID,r10
+
+	/*
+	 * Switch to host MMU mode
+	 */
+	ld	r10, HSTATE_KVM_VCPU(r13)
+	ld	r10, VCPU_KVM(r10)
+	lwz	r10, KVM_HOST_LPID(r10)
+	mtspr	SPRN_LPID,r10
+
+	ld	r10, HSTATE_KVM_VCPU(r13)
+	ld	r10, VCPU_KVM(r10)
+	ld	r10, KVM_HOST_LPCR(r10)
+	mtspr	SPRN_LPCR,r10
+
+	/*
+	 * Set GUEST_MODE_NONE so the handler won't branch to KVM, and clear
+	 * MSR_RI in r12 ([H]SRR1) so the handler won't try to return.
+	 */
+	li	r10,KVM_GUEST_MODE_NONE
+	stb	r10,HSTATE_IN_GUEST(r13)
+	li	r10,MSR_RI
+	andc	r12,r12,r10
+
+	/*
+	 * Go back to interrupt handler. MCE and SRESET have their specific
+	 * PACA save area so they should be used directly. They set up their
+	 * own stack. The other handlers all use EXGEN. They will use the
+	 * guest r1 if it looks like a kernel stack, so just load the
+	 * emergency stack and go to program check for all other interrupts.
+	 */
+	ld	r10,HSTATE_SCRATCH0(r13)
+	cmpwi	r10,BOOK3S_INTERRUPT_MACHINE_CHECK
+	beq	machine_check_common
+
+	cmpwi	r10,BOOK3S_INTERRUPT_SYSTEM_RESET
+	beq	system_reset_common
+
+	b	.
+#endif
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8df02be9be72..665279927437 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1445,6 +1445,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 */
 	case BOOK3S_INTERRUPT_H_DATA_STORAGE:
 		r = RESUME_PAGE_FAULT;
+		if (vcpu->arch.fault_dsisr == HDSISR_CANARY)
+			r = RESUME_GUEST; /* Just retry if it's the canary */
 		break;
 	case BOOK3S_INTERRUPT_H_INST_STORAGE:
 		vcpu->arch.fault_dar = kvmppc_get_pc(vcpu);
@@ -3708,6 +3710,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	u64 tb;
 	int trap, save_pmu;
 
+	WARN_ON_ONCE(vcpu->arch.ceded);
+
 	dec = mfspr(SPRN_DEC);
 	tb = mftb();
 	if (dec < 0)
@@ -3716,8 +3720,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (local_paca->kvm_hstate.dec_expires < time_limit)
 		time_limit = local_paca->kvm_hstate.dec_expires;
 
-	vcpu->arch.ceded = 0;
-
 	kvmhv_save_host_pmu();		/* saves it to PACA kvm_hstate */
 
 	kvmppc_subcore_enter_guest();
@@ -3844,9 +3846,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
new file mode 100644
index 000000000000..9db0e031a443
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -0,0 +1,207 @@
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
+static inline void mtslb(u64 slbee, u64 slbev)
+{
+	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
+}
+
+static inline void clear_slb_entry(unsigned int idx)
+{
+	mtslb(idx, 0);
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
+	int i;
+
+	for (i = 0; i < 4; i++)
+		clear_slb_entry(i);
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
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_FAST;
+	kvmppc_p9_enter_guest(vcpu);
+	// Radix host and guest means host never runs with guest MMU state
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
+
+	accumulate_time(vcpu, &vcpu->arch.rm_intr);
+
+	/* XXX: Could get these from r11/12 and paca exsave instead */
+	vcpu->arch.shregs.srr0 = mfspr(SPRN_SRR0);
+	vcpu->arch.shregs.srr1 = mfspr(SPRN_SRR1);
+	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
+	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
+
+	/* 0x2 bit for HSRR is only used by PR and P7/8 HV paths, clear it */
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
index 0637126be21e..d742233dec55 100644
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
@@ -60,8 +59,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 #define STACK_SLOT_DAWR1	(SFS-96)
 #define STACK_SLOT_DAWRX1	(SFS-104)
 #define STACK_SLOT_FSCR		(SFS-112)
-/* the following is used by the P9 short path */
-#define STACK_SLOT_NVGPRS	(SFS-152)	/* 18 gprs */
 
 /*
  * Call kvmppc_hv_entry in real mode.
@@ -1011,9 +1008,6 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
 no_xive:
 #endif /* CONFIG_KVM_XICS */
 
-	li	r0, 0
-	stw	r0, STACK_SLOT_SHORT_PATH(r1)
-
 deliver_guest_interrupt:	/* r4 = vcpu, r13 = paca */
 	/* Check if we can deliver an external or decrementer interrupt now */
 	ld	r0, VCPU_PENDING_EXC(r4)
@@ -1033,7 +1027,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	mtspr	SPRN_SRR0, r6
 	mtspr	SPRN_SRR1, r7
 
-fast_guest_entry_c:
 	ld	r10, VCPU_PC(r4)
 	ld	r11, VCPU_MSR(r4)
 	/* r11 = vcpu->arch.msr & ~MSR_HV */
@@ -1138,97 +1131,6 @@ ret_to_ultra:
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
@@ -1400,14 +1302,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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
@@ -1450,11 +1347,6 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
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
@@ -1494,16 +1386,11 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 
 	/*
 	 * Possibly flush the link stack here, before we do a blr in
-	 * guest_exit_short_path.
+	 * kvmhv_switch_to_host.
 	 */
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
@@ -1551,8 +1438,10 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
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
@@ -3369,7 +3258,7 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_DAWRX1, r0
 END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
 
-	/* Clear hash and radix guest SLB, see guest_exit_short_path comment. */
+	/* Clear hash and radix guest SLB. */
 	slbmte	r0, r0
 	PPC_SLBIA(6)
 
-- 
2.23.0

