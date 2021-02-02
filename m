Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9751230B5C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:20:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV9796T4TzDr2c
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 14:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YN2UvDK/; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV8lq2VF3zDqyd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 14:03:51 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id b21so13940038pgk.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 19:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PALP5PWp5R1S6gUsD/bijy9LNNRaQYKiNMvvihsDfQU=;
 b=YN2UvDK/sJbDN7Cs1q/qVCs3W7MB/TraaZGod+oxQZkFzAiUhH/GCVu8hidDxv669O
 hAntrqs5K9DFMKNzK85V6Q6eWvPar7qfU6Hvag0n7aGJpReR8J3XjXP/JlQz2WoxQi71
 jRYjDvn/zOMz65TZaoZM4YFIjTgIwOs02gTm3QohRCZlKbt/CkXMAonnwgZ5APzeTqXZ
 v81I55UbSDeEhkg72eDChQchVe1QiHrk99T9RBelzL5A8/GXNWv8QEiygsdddpQZFmhM
 g4fKtJk67/BpFsra6osIRE9v8o/gq5bdclC6LTC/6CJKp/8Oi0p3d13TXkcy4PoKMT5g
 yAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PALP5PWp5R1S6gUsD/bijy9LNNRaQYKiNMvvihsDfQU=;
 b=KXxevISRKhdbuP5NjLFI22iin9+AjeD7b8lvaddu+tA13yLqZheluiudngRtCxRcW5
 lhkIQitkWM+7rQzqp/nIf5cxVCsMtdg4QmRfX8eLozuwYcyilaQAt034VL/HXMnFvB4J
 eCY00qLNEcd8LR5KIlpMReUcH0KryaTnXyAVag829oLMKIb7dZoUrDeEZOdZwpZ2aIao
 fe2hjEJ0895INR6kfquJ4CpR2VuHors1hSQcntVbwiAiHL2+kKKorho1C4jg4ms7A52a
 dn1JgjKBV7NSOJOwozsrp6+sqZT+2h+pCINm/5/rqYqFI9Y5zr9lq9HicW4SNO449G55
 qUvg==
X-Gm-Message-State: AOAM530C6mCjyCt+7fmpaALw6BYpopjRMWqfXQeF7N6Yakn5usNiBbZy
 IIzv8li42aYs6aKYPWbD78g=
X-Google-Smtp-Source: ABdhPJwvyFApUx+8M+HGGdVliJzlFX6OEOm4XpeU2OcnkB57EQ1xy+3xwejuDBbwW9QAqn8AcVYcWg==
X-Received: by 2002:a63:5221:: with SMTP id g33mr19658303pgb.202.1612235027941; 
 Mon, 01 Feb 2021 19:03:47 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id a24sm20877337pff.18.2021.02.01.19.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 19:03:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 9/9] KVM: PPC: Book3S HV: Implement the rest of the P9
 entry/exit handling in C
Date: Tue,  2 Feb 2021 13:03:13 +1000
Message-Id: <20210202030313.3509446-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210202030313.3509446-1-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
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

The remaining asm is a low level stack setup, with VCPU vs host register
save and restore. Only the GPRs that might be touched by the compiler are
handled in asm.

More consolidation could be made in future by inlining more of
__kvmhv_vcpu_entry_p9 into its callers and handling some bits there
perhaps, although there is something to be said for keeping the P9
and old path looking similar, so that needs to be done carefully if
at all.

Some bits are left out for now, ultravisor return for example.

I haven't added any loop to return quickly back into the guest, no
simple "realmode" hcalls, decrementer checks, etc. It remains to be
seen whether these would actually matter to add -- ISA v3.0 (radix,
large decrementer, etc) + XIVE should cut down on guest exits by
a huge amount, and of those that remain I would say a large portion
of them will need to go back out to Linux. Radix also makes this
much more light-weight because we are already in host MMU mode.
There are a few bits like LPID/LPCR/PID switching and XIVE pulling
and pushing which would still be desirable to avoid so if it
happens a lot we could probably handle some simple common cases. I
hope we won't have to at all.

---
 arch/powerpc/include/asm/asm-prototypes.h |   2 +-
 arch/powerpc/include/asm/kvm_asm.h        |   3 +-
 arch/powerpc/include/asm/kvm_book3s_64.h  |   2 +
 arch/powerpc/include/asm/kvm_ppc.h        |   2 +
 arch/powerpc/kvm/Makefile                 |   3 +
 arch/powerpc/kvm/book3s_64_entry.S        | 135 ++++++++++++++++++
 arch/powerpc/kvm/book3s_hv.c              |  21 ++-
 arch/powerpc/kvm/book3s_hv_interrupt.c    | 164 ++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 123 ++--------------
 arch/powerpc/kvm/book3s_xive.c            |  32 +++++
 10 files changed, 364 insertions(+), 123 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index d0b832cbbec8..ba15ce78ffe5 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -171,7 +171,7 @@ void kvmhv_load_host_pmu(void);
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
index 9bb9bb370b53..7f08f6ed73df 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -153,6 +153,8 @@ static inline bool kvmhv_vcpu_is_radix(struct kvm_vcpu *vcpu)
 	return radix;
 }
 
+int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu);
+
 #define KVM_DEFAULT_HPT_ORDER	24	/* 16MB HPT by default */
 #endif
 
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 0a056c64c317..1699e8ca96b1 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -670,6 +670,7 @@ extern int kvmppc_xive_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
 extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
 			       int level, bool line_status);
 extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
+extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
 
 static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 {
@@ -710,6 +711,7 @@ static inline int kvmppc_xive_set_icp(struct kvm_vcpu *vcpu, u64 icpval) { retur
 static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
 				      int level, bool line_status) { return -ENODEV; }
 static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
+static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
 
 static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 	{ return 0; }
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index cdd119028f64..b94be8c9bad1 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -43,6 +43,9 @@ kvm-objs-$(CONFIG_KVM_E500MC) := $(kvm-e500mc-objs)
 kvm-book3s_64-builtin-objs-$(CONFIG_SPAPR_TCE_IOMMU) := \
 	book3s_64_vio_hv.o
 
+kvm-book3s_64-objs-y += \
+	book3s_hv_interrupt.o
+
 kvm-pr-y := \
 	fpu.o \
 	emulate.o \
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 0e39267aef63..8541fba11aea 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -1,6 +1,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/cache.h>
 #include <asm/exception-64s.h>
+#include <asm/export.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_book3s_asm.h>
 #include <asm/ppc_asm.h>
@@ -9,13 +10,24 @@
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
@@ -95,3 +107,126 @@ maybe_skip:
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
+ * Enter the guest on ISAv3.0 or later system where we have exactly
+ * one vcpu per vcore and the host and guest are running radix.
+ */
+// void kvmppc_p9_enter_guest(struct vcpu *vcpu);
+.balign	IFETCH_ALIGN_BYTES
+_GLOBAL(kvmppc_p9_enter_guest)
+EXPORT_SYMBOL_GPL(kvmppc_p9_enter_guest)
+	mflr	r0
+	std	r0, PPC_LR_STKOFF(r1)
+	stdu	r1, -SFS(r1)
+
+	std	r1, HSTATE_HOST_R1(r13)
+	std	r3, STACK_SLOT_VCPU(r1)
+
+	mfcr	r4
+	stw	r4, SFS+8(r1)
+
+	reg = 14
+	.rept	18
+	std	reg, STACK_SLOT_NVGPRS + ((reg - 14) * 8)(r1)
+	reg = reg + 1
+	.endr
+
+	ld	r4,VCPU_LR(r3)
+	mtlr	r4
+	ld	r4,VCPU_CR(r3)
+	mtcr	r4
+	ld	r4,VCPU_CTR(r3)
+	mtctr	r4
+#if 0
+XXX
+	ld	r4,VCPU_TAR(r3)
+	mtspr	SPRN_TAR,r4
+#endif
+	ld	r4,VCPU_XER(r3)
+	mtspr	SPRN_XER,r4
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
+	ld	reg, __VCPU_GPR(reg)(r3)
+	reg = reg + 1
+	.endr
+	ld	r0,VCPU_GPR(R0)(r3)
+	ld	r1,VCPU_GPR(R1)(r3)
+	ld	r2,VCPU_GPR(R2)(r3)
+	ld	r4,VCPU_GPR(R4)(r3)
+	ld	r3,VCPU_GPR(R3)(r3)
+
+	HRFI_TO_GUEST
+
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
+	ld	r3, STACK_SLOT_VCPU(r1)
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
+	/* XXX: TAR */
+
+	reg = 14
+	.rept	18
+	ld	reg, STACK_SLOT_NVGPRS + ((reg - 14) * 8)(r1)
+	reg = reg + 1
+	.endr
+
+	lwz	r4, SFS+8(r1)
+	mtcr	r4
+
+	addi	r1, r1, SFS
+	ld	r0, PPC_LR_STKOFF(r1)
+	mtlr	r0
+	blr
+
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 53d0cbfe5933..f87a8cb6afef 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1127,7 +1127,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
  * This has to be done early, not in kvmppc_pseries_do_hcall(), so
  * that the cede logic in kvmppc_run_single_vcpu() works properly.
  */
-static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
+static void kvmppc_cede(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.shregs.msr |= MSR_EE;
 	vcpu->arch.ceded = 1;
@@ -3522,9 +3522,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	kvmppc_xive_push_vcpu(vcpu);
 
-	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
-	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
-
 	trap = __kvmhv_vcpu_entry_p9(vcpu);
 
 	/* Advance host PURR/SPURR by the amount used by guest */
@@ -3698,18 +3695,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
 		vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
 		mtspr(SPRN_PSSCR_PR, host_psscr);
-
-		/* H_CEDE has to be handled now, not later */
-		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
-		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
-			kvmppc_nested_cede(vcpu);
-			kvmppc_set_gpr(vcpu, 3, 0);
-			trap = 0;
-		}
 	} else {
 		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
 	}
 
+	/* H_CEDE has to be handled now, not later */
+	if (trap == BOOK3S_INTERRUPT_SYSCALL &&
+	    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
+		kvmppc_cede(vcpu);
+		kvmppc_set_gpr(vcpu, 3, 0);
+		trap = 0;
+	}
+
 	vcpu->arch.slb_max = 0;
 	dec = mfspr(SPRN_DEC);
 	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
new file mode 100644
index 000000000000..22d5f1013d01
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -0,0 +1,164 @@
+#include <linux/kernel.h>
+#include <linux/kvm_host.h>
+#include <asm/asm-prototypes.h>
+#include <asm/dbell.h>
+#include <asm/kvm_ppc.h>
+
+int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
+{
+	u64 *exsave;
+	unsigned long msr = mfmsr();
+	int trap;
+
+	vcpu->arch.ceded = 0;
+
+	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
+	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
+
+#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+	kvmhv_accumulate_time(vcpu, &vcpu->arch.guest_time); // XXX: something simpler?
+#endif
+	__mtmsrd(0, 1); /* clear RI (XXX: should already be cleared by caller because SRR0/1/DAR/etc are set. */
+
+	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
+	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
+
+	mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
+	mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
+
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
+	kvmppc_p9_enter_guest(vcpu);
+	// Radix host and guest means host never runs with guest MMU state
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
+
+	/* Get these from r11/12 and paca exsave */
+	vcpu->arch.shregs.srr0 = mfspr(SPRN_SRR0);
+	vcpu->arch.shregs.srr1 = mfspr(SPRN_SRR1);
+	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
+	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
+
+	trap = local_paca->kvm_hstate.scratch0 & ~0x2;
+	if (trap == 0x100) {
+		exsave = local_paca->exnmi;
+	} else if (trap == 0x200) {
+		exsave = local_paca->exmc;
+	} else {
+		exsave = local_paca->exgen;
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
+	/* XXX: could leave in real mode for machine check handler / hmi / etc */
+	/* XXX: flush first 4 slbes */
+	/* XXX: HPT guest could switch to LPCR[HR]=1 now, save/restore SLBs */
+
+	__mtmsrd(msr, 0);
+
+	/* XXX: Why are these set? */
+	vcpu->arch.fault_dar = vcpu->arch.shregs.dar;
+	vcpu->arch.fault_dsisr = vcpu->arch.shregs.dsisr;
+
+	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
+
+#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+	kvmhv_accumulate_time(vcpu, &vcpu->arch.rm_intr);
+#endif
+
+	// switch to virt mode somewhere here (unless sreset or mce I guess)
+	// could leave guest LPID and PID in case re-entering.
+
+	switch (trap) {
+	case BOOK3S_INTERRUPT_H_EMUL_ASSIST:
+		vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
+		break;
+
+	case BOOK3S_INTERRUPT_H_DATA_STORAGE:
+		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
+		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
+		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
+		break;
+
+	case BOOK3S_INTERRUPT_H_INST_STORAGE:
+		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
+		break;
+
+	// no TM for the moment
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	/* For softpatch interrupt, go off and do TM instruction emulation */
+	case BOOK3S_INTERRUPT_HV_SOFTPATCH:
+		WARN_ON(1);
+		/* kvmppc_tm_emul */
+		break;
+#endif
+
+	case BOOK3S_INTERRUPT_HV_DECREMENTER: {
+		s64 dec = mfspr(SPRN_HDEC);
+		if (!cpu_has_feature(CPU_FTR_ARCH_300))
+			dec = (s32)dec;
+		if (dec >= 0) { // XXX: could exit if a small amount remains?
+			/* See if this is a leftover HDEC interrupt */
+			// re-enter guest?
+		}
+		break;
+	}
+
+	// try_real_mode ? (no, should just go virt all the time)
+	//
+	case BOOK3S_INTERRUPT_H_DOORBELL:
+		ppc_msgsync();
+		if (vcpu->arch.nested)
+			goto out; // nested always exits
+		if (local_paca->kvm_hstate.host_ipi)
+			goto out;
+		// maybe_reenter_guest (always re-enter because no other threads
+		break;
+
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
+		vcpu->arch.hfscr = mfspr(SPRN_HFSCR);
+		break;
+
+	case BOOK3S_INTERRUPT_EXTERNAL:
+		WARN_ON_ONCE(1);
+		// kvmppc_guest_external
+		// let's assume xive_enabled() = always host pending interrupt
+		break;
+
+	case BOOK3S_INTERRUPT_MACHINE_CHECK:
+		kvmppc_realmode_machine_check(vcpu);
+		/* all machine checks go to virtual mode for further handling */
+		break;
+
+	case BOOK3S_INTERRUPT_HMI:
+		kvmppc_realmode_hmi_handler();
+		break;
+	case BOOK3S_INTERRUPT_SYSCALL:
+		break;
+	case 0:
+		WARN_ON_ONCE(1);
+		/* nothing */
+		break;
+	default:
+		printk("unknown guest interrupt %x\n", trap);
+		break;
+	}
+
+out:
+#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+	// XXX: this could go after the xive pull?
+	kvmhv_accumulate_time(vcpu, &vcpu->arch.rm_exit);
+#endif
+
+	kvmppc_xive_pull_vcpu(vcpu);
+	// XXX flush link stack
+
+	return trap;
+}
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 8144c1403203..aea43e06129f 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -46,7 +46,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 /* Stack frame offsets for kvmppc_hv_entry */
 #define SFS			208
 #define STACK_SLOT_TRAP		(SFS-4)
-#define STACK_SLOT_SHORT_PATH	(SFS-8)
 #define STACK_SLOT_TID		(SFS-16)
 #define STACK_SLOT_PSSCR	(SFS-24)
 #define STACK_SLOT_PID		(SFS-32)
@@ -994,9 +993,6 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
 no_xive:
 #endif /* CONFIG_KVM_XICS */
 
-	li	r0, 0
-	stw	r0, STACK_SLOT_SHORT_PATH(r1)
-
 deliver_guest_interrupt:	/* r4 = vcpu, r13 = paca */
 	/* Check if we can deliver an external or decrementer interrupt now */
 	ld	r0, VCPU_PENDING_EXC(r4)
@@ -1016,6 +1012,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	mtspr	SPRN_SRR0, r6
 	mtspr	SPRN_SRR1, r7
 
+	/* Activate guest mode, so faults get handled by KVM */
+	li	r9, KVM_GUEST_MODE_GUEST_HV
+	stb	r9, HSTATE_IN_GUEST(r13)
+
 fast_guest_entry_c:
 	ld	r10, VCPU_PC(r4)
 	ld	r11, VCPU_MSR(r4)
@@ -1042,10 +1042,6 @@ fast_guest_return:
 	mtspr	SPRN_HSRR0,r10
 	mtspr	SPRN_HSRR1,r11
 
-	/* Activate guest mode, so faults get handled by KVM */
-	li	r9, KVM_GUEST_MODE_GUEST_HV
-	stb	r9, HSTATE_IN_GUEST(r13)
-
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
 	/* Accumulate timing */
 	addi	r3, r4, VCPU_TB_GUEST
@@ -1121,97 +1117,6 @@ ret_to_ultra:
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
@@ -1466,17 +1371,12 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 #endif /* CONFIG_KVM_XICS */
 
 	/*
-	 * Possibly flush the link stack here, before we do a blr in
-	 * guest_exit_short_path.
+	 * Possibly flush the link stack here.
+	 * XXX: flush the link stack in the fast guest exit?
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
@@ -1520,8 +1420,13 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 	.endr
 	b	guest_bypass
 
-0:	/* Sanitise radix guest SLB, see guest_exit_short_path comment. */
-	li	r0,0
+	/*
+	 * Malicious or buggy radix guests may have inserted SLB entries
+	 * (only 0..3 because radix always runs with UPRT=1), so these must
+	 * be cleared here to avoid side-channels. slbmte is used rather
+	 * than slbia, as it won't clear cached translations.
+	 */
+0:	li	r0,0
 	slbmte	r0,r0
 	li	r4,1
 	slbmte	r0,r4
@@ -3322,7 +3227,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 	mtspr	SPRN_CIABR, r0
 	mtspr	SPRN_DAWRX0, r0
 
-	/* Clear hash and radix guest SLB, see guest_exit_short_path comment. */
+	/* Clear hash and radix guest SLB. */
 	slbmte	r0, r0
 	PPC_SLBIA(6)
 
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 30dfeac731c6..22a3be0aafa1 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -127,6 +127,38 @@ void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvmppc_xive_push_vcpu);
 
+/*
+ * Pull a vcpu's context from the XIVE on guest exit.
+ * This assumes we are in virtual mode (MMU on)
+ */
+void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
+{
+	void __iomem *tima = local_paca->kvm_hstate.xive_tima_virt;
+
+	if (!vcpu->arch.xive_pushed)
+		return;
+
+	/*
+	 * Sould not have been pushed if there is no tima
+	 */
+	if (WARN_ON(!tima))
+		return
+
+	eieio();
+	/* First load to pull the context, we ignore the value */
+	__raw_readw(tima + TM_SPC_PULL_OS_CTX);
+	/* Second load to recover the context state (Words 0 and 1) */
+	vcpu->arch.xive_saved_state.w01 = __raw_readq(tima + TM_QW1_OS);
+
+	/* Fixup some of the state for the next load */
+	vcpu->arch.xive_pushed = 0;
+	vcpu->arch.xive_saved_state.lsmfb = 0;
+	vcpu->arch.xive_saved_state.ack = 0xff;
+	eieio();
+}
+EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
+
+
 /*
  * This is a simple trigger for a generic XIVE IRQ. This must
  * only be called for interrupts that support a trigger page
-- 
2.23.0

