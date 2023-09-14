Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5CE79F8AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 05:13:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OxbBV9IM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmMp366cLz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 13:12:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OxbBV9IM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmMg0319kz3cGb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 13:06:52 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c364fb8a4cso4270835ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 20:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694660810; x=1695265610; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSY9oehCmsassunipNzl1VVTMw2/RZt+mSgC6ITLdDI=;
        b=OxbBV9IMm9B6J5HuT88ocY86OVWFbGXdJw7vBSl15wLXMe4DV+HYKW9e8dNZlLCG1W
         cCcEQmOYwkom2As88eWd7G5EcIa69HzeW29xv5rPww6cFSWzJff7f1sQonQFvYCDiGt5
         7BoqeoJPliQvyMJGxb89mGoTGnMUN72JztlBxo7ktpvTyk95ds5Fa4hrpsQ+bLB0/8lr
         z/GIA9KzWA3ceuMowiS7c3NuDsI51JIuk3/4mbefdDcMY1beOD7J6BhgUyzqOdIYoEtO
         jAyy21qsm/eMfEsml+g7KPW3SHPbKd4h7K2IO/Vlq6pZ2SWPrPAbZxDHMDuMlThAFzI7
         V7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694660810; x=1695265610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSY9oehCmsassunipNzl1VVTMw2/RZt+mSgC6ITLdDI=;
        b=MGp2b8nLNbr+ryCGTG+7k+qPZ228ab9GIQafIWehjlQ5A/tU2OUejOywXuUhYZJGGs
         J498wjVt3BG69iRqYDGOam6GDbzucddFsx5eApCnxcGzaX2ODD0b409AG4wyXiXzzZBG
         BkieW7WeLwNkLyXzYW2UFpVw2tNZAUIe7eIKtErewB4NOQVluqpA9F5Nu0WDrIYva5bW
         xyXSJCohEq0kWMMu8HCk4kr4up2R+oiGU8bEDxDEX3dar+Sb6IomYeztZ2mgxLKrJ8Kz
         sg6l/Nb4blAXCYD/eBc5uSzgzdTcwRdyLcZs8M4fN20h7jg902ZdwpLjK92S70lTQOyX
         +eMg==
X-Gm-Message-State: AOJu0Yw36waHQmLziOFj3XKOhUUoD3/oi9jd1GH/HQCk2FPOnJRL2Tx9
	RmhkZmaVvM6M5FBkr63WLIF1f47U/a+3Rg==
X-Google-Smtp-Source: AGHT+IGnu8zA+4mlLmPqha+HlIDYjbZ8/UyV6Vj+T+MhIRCBcwZUfp/UdMMeWnqtEPpTZsWzRWz+XA==
X-Received: by 2002:a17:902:9896:b0:1bc:6c8:cded with SMTP id s22-20020a170902989600b001bc06c8cdedmr3836452plp.67.1694660809595;
        Wed, 13 Sep 2023 20:06:49 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id w2-20020a170902904200b001b567bbe82dsm330521plz.150.2023.09.13.20.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 20:06:49 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 07/11] KVM: PPC: Book3S HV: Introduce low level MSR accessor
Date: Thu, 14 Sep 2023 13:05:56 +1000
Message-Id: <20230914030600.16993-8-jniethe5@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230914030600.16993-1-jniethe5@gmail.com>
References: <20230914030600.16993-1-jniethe5@gmail.com>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, npiggin@gmail.com, David.Laight@ACULAB.COM, kvm-ppc@vger.kernel.org, sachinp@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmppc_get_msr() and kvmppc_set_msr_fast() serve as accessors for the
MSR. However because the MSR is kept in the shared regs they include a
conditional check for kvmppc_shared_big_endian() and endian conversion.

Within the Book3S HV specific code there are direct reads and writes of
shregs::msr. In preparation for Nested APIv2 these accesses need to be
replaced with accessor functions so it is possible to extend their
behavior. However, using the kvmppc_get_msr() and kvmppc_set_msr_fast()
functions is undesirable because it would introduce a conditional branch
and endian conversion that is not currently present.

kvmppc_set_msr_hv() already exists, it is used for the
kvmppc_ops::set_msr callback.

Introduce a low level accessor __kvmppc_{s,g}et_msr_hv() that simply
gets and sets shregs::msr. This will be extend for Nested APIv2 support.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4:
  - New to series
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c  |  5 ++--
 arch/powerpc/kvm/book3s_hv.c         | 34 ++++++++++++++--------------
 arch/powerpc/kvm/book3s_hv.h         | 10 ++++++++
 arch/powerpc/kvm/book3s_hv_builtin.c |  5 ++--
 4 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index efd0ebf70a5e..fdfc2a62dd67 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -28,6 +28,7 @@
 #include <asm/pte-walk.h>
 
 #include "book3s.h"
+#include "book3s_hv.h"
 #include "trace_hv.h"
 
 //#define DEBUG_RESIZE_HPT	1
@@ -347,7 +348,7 @@ static int kvmppc_mmu_book3s_64_hv_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 	unsigned long v, orig_v, gr;
 	__be64 *hptep;
 	long int index;
-	int virtmode = vcpu->arch.shregs.msr & (data ? MSR_DR : MSR_IR);
+	int virtmode = __kvmppc_get_msr_hv(vcpu) & (data ? MSR_DR : MSR_IR);
 
 	if (kvm_is_radix(vcpu->kvm))
 		return kvmppc_mmu_radix_xlate(vcpu, eaddr, gpte, data, iswrite);
@@ -385,7 +386,7 @@ static int kvmppc_mmu_book3s_64_hv_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 
 	/* Get PP bits and key for permission check */
 	pp = gr & (HPTE_R_PP0 | HPTE_R_PP);
-	key = (vcpu->arch.shregs.msr & MSR_PR) ? SLB_VSID_KP : SLB_VSID_KS;
+	key = (__kvmppc_get_msr_hv(vcpu) & MSR_PR) ? SLB_VSID_KP : SLB_VSID_KS;
 	key &= slb_v;
 
 	/* Calculate permissions */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 25025f6c4cce..5743f32bf45e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1374,7 +1374,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
  */
 static void kvmppc_cede(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.shregs.msr |= MSR_EE;
+	__kvmppc_set_msr_hv(vcpu, __kvmppc_get_msr_hv(vcpu) | MSR_EE);
 	vcpu->arch.ceded = 1;
 	smp_mb();
 	if (vcpu->arch.prodded) {
@@ -1589,7 +1589,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 * That can happen due to a bug, or due to a machine check
 	 * occurring at just the wrong time.
 	 */
-	if (vcpu->arch.shregs.msr & MSR_HV) {
+	if (__kvmppc_get_msr_hv(vcpu) & MSR_HV) {
 		printk(KERN_EMERG "KVM trap in HV mode!\n");
 		printk(KERN_EMERG "trap=0x%x | pc=0x%lx | msr=0x%llx\n",
 			vcpu->arch.trap, kvmppc_get_pc(vcpu),
@@ -1640,7 +1640,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		 * so that it knows that the machine check occurred.
 		 */
 		if (!vcpu->kvm->arch.fwnmi_enabled) {
-			ulong flags = (vcpu->arch.shregs.msr & 0x083c0000) |
+			ulong flags = (__kvmppc_get_msr_hv(vcpu) & 0x083c0000) |
 					(kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 			kvmppc_core_queue_machine_check(vcpu, flags);
 			r = RESUME_GUEST;
@@ -1670,7 +1670,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		 * as a result of a hypervisor emulation interrupt
 		 * (e40) getting turned into a 700 by BML RTAS.
 		 */
-		flags = (vcpu->arch.shregs.msr & 0x1f0000ull) |
+		flags = (__kvmppc_get_msr_hv(vcpu) & 0x1f0000ull) |
 			(kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 		kvmppc_core_queue_program(vcpu, flags);
 		r = RESUME_GUEST;
@@ -1680,7 +1680,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	{
 		int i;
 
-		if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
+		if (unlikely(__kvmppc_get_msr_hv(vcpu) & MSR_PR)) {
 			/*
 			 * Guest userspace executed sc 1. This can only be
 			 * reached by the P9 path because the old path
@@ -1758,7 +1758,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 			break;
 		}
 
-		if (!(vcpu->arch.shregs.msr & MSR_DR))
+		if (!(__kvmppc_get_msr_hv(vcpu) & MSR_DR))
 			vsid = vcpu->kvm->arch.vrma_slb_v;
 		else
 			vsid = vcpu->arch.fault_gpa;
@@ -1782,7 +1782,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		long err;
 
 		vcpu->arch.fault_dar = kvmppc_get_pc(vcpu);
-		vcpu->arch.fault_dsisr = vcpu->arch.shregs.msr &
+		vcpu->arch.fault_dsisr = __kvmppc_get_msr_hv(vcpu) &
 			DSISR_SRR1_MATCH_64S;
 		if (kvm_is_radix(vcpu->kvm) || !cpu_has_feature(CPU_FTR_ARCH_300)) {
 			/*
@@ -1791,7 +1791,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 			 * hash fault handling below is v3 only (it uses ASDR
 			 * via fault_gpa).
 			 */
-			if (vcpu->arch.shregs.msr & HSRR1_HISI_WRITE)
+			if (__kvmppc_get_msr_hv(vcpu) & HSRR1_HISI_WRITE)
 				vcpu->arch.fault_dsisr |= DSISR_ISSTORE;
 			r = RESUME_PAGE_FAULT;
 			break;
@@ -1805,7 +1805,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 			break;
 		}
 
-		if (!(vcpu->arch.shregs.msr & MSR_IR))
+		if (!(__kvmppc_get_msr_hv(vcpu) & MSR_IR))
 			vsid = vcpu->kvm->arch.vrma_slb_v;
 		else
 			vsid = vcpu->arch.fault_gpa;
@@ -1895,7 +1895,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		kvmppc_dump_regs(vcpu);
 		printk(KERN_EMERG "trap=0x%x | pc=0x%lx | msr=0x%llx\n",
 			vcpu->arch.trap, kvmppc_get_pc(vcpu),
-			vcpu->arch.shregs.msr);
+			__kvmppc_get_msr_hv(vcpu));
 		run->hw.hardware_exit_reason = vcpu->arch.trap;
 		r = RESUME_HOST;
 		break;
@@ -1919,11 +1919,11 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 	 * That can happen due to a bug, or due to a machine check
 	 * occurring at just the wrong time.
 	 */
-	if (vcpu->arch.shregs.msr & MSR_HV) {
+	if (__kvmppc_get_msr_hv(vcpu) & MSR_HV) {
 		pr_emerg("KVM trap in HV mode while nested!\n");
 		pr_emerg("trap=0x%x | pc=0x%lx | msr=0x%llx\n",
 			 vcpu->arch.trap, kvmppc_get_pc(vcpu),
-			 vcpu->arch.shregs.msr);
+			 __kvmppc_get_msr_hv(vcpu));
 		kvmppc_dump_regs(vcpu);
 		return RESUME_HOST;
 	}
@@ -1980,7 +1980,7 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		vcpu->arch.fault_dar = kvmppc_get_pc(vcpu);
 		vcpu->arch.fault_dsisr = kvmppc_get_msr(vcpu) &
 					 DSISR_SRR1_MATCH_64S;
-		if (vcpu->arch.shregs.msr & HSRR1_HISI_WRITE)
+		if (__kvmppc_get_msr_hv(vcpu) & HSRR1_HISI_WRITE)
 			vcpu->arch.fault_dsisr |= DSISR_ISSTORE;
 		srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 		r = kvmhv_nested_page_fault(vcpu);
@@ -2940,7 +2940,7 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	spin_lock_init(&vcpu->arch.vpa_update_lock);
 	spin_lock_init(&vcpu->arch.tbacct_lock);
 	vcpu->arch.busy_preempt = TB_NIL;
-	vcpu->arch.shregs.msr = MSR_ME;
+	__kvmppc_set_msr_hv(vcpu, MSR_ME);
 	vcpu->arch.intr_msr = MSR_SF | MSR_ME;
 
 	/*
@@ -4188,7 +4188,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		__this_cpu_write(cpu_in_guest, NULL);
 
 		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
-		    !(vcpu->arch.shregs.msr & MSR_PR)) {
+		    !(__kvmppc_get_msr_hv(vcpu) & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
 
 			/*
@@ -4667,7 +4667,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	if (!nested) {
 		kvmppc_core_prepare_to_enter(vcpu);
-		if (vcpu->arch.shregs.msr & MSR_EE) {
+		if (__kvmppc_get_msr_hv(vcpu) & MSR_EE) {
 			if (xive_interrupt_pending(vcpu))
 				kvmppc_inject_interrupt_hv(vcpu,
 						BOOK3S_INTERRUPT_EXTERNAL, 0);
@@ -4880,7 +4880,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
 			accumulate_time(vcpu, &vcpu->arch.hcall);
 
-			if (WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_PR)) {
+			if (WARN_ON_ONCE(__kvmppc_get_msr_hv(vcpu) & MSR_PR)) {
 				/*
 				 * These should have been caught reflected
 				 * into the guest by now. Final sanity check:
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index acd9a7a95bbf..95241764dfb4 100644
--- a/arch/powerpc/kvm/book3s_hv.h
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -51,6 +51,16 @@ void accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next);
 #define end_timing(vcpu) do {} while (0)
 #endif
 
+static inline void __kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 val)
+{
+	vcpu->arch.shregs.msr = val;
+}
+
+static inline u64 __kvmppc_get_msr_hv(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.shregs.msr;
+}
+
 #define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_SET(reg, size)			\
 static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index f3afe194e616..fa0e3a22cac0 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -32,6 +32,7 @@
 
 #include "book3s_xics.h"
 #include "book3s_xive.h"
+#include "book3s_hv.h"
 
 /*
  * Hash page table alignment on newer cpus(CPU_FTR_ARCH_206)
@@ -514,7 +515,7 @@ void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
 	 */
 	if ((msr & MSR_TS_MASK) == MSR_TS_MASK)
 		msr &= ~MSR_TS_MASK;
-	vcpu->arch.shregs.msr = msr;
+	__kvmppc_set_msr_hv(vcpu, msr);
 	kvmppc_end_cede(vcpu);
 }
 EXPORT_SYMBOL_GPL(kvmppc_set_msr_hv);
@@ -552,7 +553,7 @@ static void inject_interrupt(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags)
 	kvmppc_set_srr0(vcpu, pc);
 	kvmppc_set_srr1(vcpu, (msr & SRR1_MSR_BITS) | srr1_flags);
 	kvmppc_set_pc(vcpu, new_pc);
-	vcpu->arch.shregs.msr = new_msr;
+	__kvmppc_set_msr_hv(vcpu, new_msr);
 }
 
 void kvmppc_inject_interrupt_hv(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags)
-- 
2.39.3

