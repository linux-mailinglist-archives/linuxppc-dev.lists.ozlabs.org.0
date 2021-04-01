Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C9D3515FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6CL2yxJz3fr4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:13:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rJZAuEn+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rJZAuEn+; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB60w0McMz3cD8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:47 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so3220920pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dz3RfJWOVB4EfEU4OXbkUB9DD57x5+BPpAfiiQY1A9Y=;
 b=rJZAuEn+nruup4QOqe6XIRFyCeha3RUIfl0EadkDBsaV5fBu7M5Hla7p4jg+s2UUn0
 rj7U6FUoynUeNq3L7W5XMbGKZcowu5d9FO+TX/r5l2R2TW8hUUPNlsTF1lN3j3qaL03F
 DPjKHFaDKxKumbLr4iWmxmsHtVSF3RHKfoBCHnKGPZc2tY0tBX+FDYXAGerHcLQdSSZr
 1nLobzLQGCGbUKSn2SGYUXzW1IALhsfIOAubGzFxSESu6+CZ0UwZWq4stsBH8bsA/M6T
 /ohHhO3QhlYjRC2Nk3KwBTaQ5POa+5j6Nzpp6y98hDOXb+HH0KxUoIi9T/VGSAjulutm
 /eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dz3RfJWOVB4EfEU4OXbkUB9DD57x5+BPpAfiiQY1A9Y=;
 b=s94wkjgNBhEer1l83KbpPC6fTBVhLzjb0EYuWkl3iYiS/FfsUFej4ZHHda/aA6vCLF
 4F8CN4B2yo/tKGaL82nd4tZToAMWpVQ3Nu7L8lzqDZ3wSEuSXbAl/j/lgj7ldoWzHeD4
 LpO7nDPwvy0/k06zVunvhOHdIJoZXpidA5wDZ78/G1IM9/nIq77P7JepX8jzOyRDJW12
 AYOqvV11/r+UbU55kz9uPQ+Hw08w6sKxbmVUqe8dlAF6M4wqEXfXbW8h/+4YiMhuqvy7
 yZlbEf8A3jpWvJou9yB+ISLSPGxYZNX7xVbw/Yz0dl9f15ryJHV8TtGONpHXodo3D0j6
 WuBw==
X-Gm-Message-State: AOAM530EmzYMOGNhYUxqcyRWunbLGRh8fEEb2NYI+Ud/75HysQscKYM6
 VQ6/+LoQxcTrgGCM/4VKrH8=
X-Google-Smtp-Source: ABdhPJxRGr7kwYEoW6+Og66ZDvfCn5lm0bfAd1nmCE0WDvA3eiKSXpXR+HKm2hKj1RXzzRFbvIO7fw==
X-Received: by 2002:a17:902:9345:b029:e7:4853:ff5f with SMTP id
 g5-20020a1709029345b02900e74853ff5fmr8471286plp.74.1617289486095; 
 Thu, 01 Apr 2021 08:04:46 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 22/48] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
Date: Fri,  2 Apr 2021 01:02:59 +1000
Message-Id: <20210401150325.442125-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the interest of minimising the amount of code that is run in
"real-mode", don't handle hcalls in real mode in the P9 path.

POWER8 and earlier are much more expensive to exit from HV real mode
and switch to host mode, because on those processors HV interrupts get
to the hypervisor with the MMU off, and the other threads in the core
need to be pulled out of the guest, and SLBs all need to be saved,
ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
in host mode. Hash guests also require a lot of hcalls to run. The
XICS interrupt controller requires hcalls to run.

By contrast, POWER9 has independent thread switching, and in radix mode
the hypervisor is already in a host virtual memory mode when the HV
interrupt is taken. Radix + xive guests don't need hcalls to handle
interrupts or manage translations.

So it's much less important to handle hcalls in real mode in P9.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h      |  6 +++
 arch/powerpc/kvm/book3s.c               |  6 +++
 arch/powerpc/kvm/book3s_hv.c            | 70 +++++++++++++++++++++----
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  5 ++
 arch/powerpc/kvm/book3s_xive.c          | 64 ++++++++++++++++++++++
 5 files changed, 140 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 73b1ca5a6471..cbd8deba2e8a 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -129,6 +129,7 @@ extern void kvmppc_core_vcpu_put(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_pending_dec(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_queue_machine_check(struct kvm_vcpu *vcpu, ulong flags);
+extern void kvmppc_core_queue_syscall(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_queue_program(struct kvm_vcpu *vcpu, ulong flags);
 extern void kvmppc_core_queue_fpunavail(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_queue_vec_unavail(struct kvm_vcpu *vcpu);
@@ -607,6 +608,7 @@ extern void kvmppc_free_pimap(struct kvm *kvm);
 extern int kvmppc_xics_rm_complete(struct kvm_vcpu *vcpu, u32 hcall);
 extern void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu);
 extern int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd);
+extern int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req);
 extern u64 kvmppc_xics_get_icp(struct kvm_vcpu *vcpu);
 extern int kvmppc_xics_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
 extern int kvmppc_xics_connect_vcpu(struct kvm_device *dev,
@@ -639,6 +641,8 @@ static inline int kvmppc_xics_enabled(struct kvm_vcpu *vcpu)
 static inline void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu) { }
 static inline int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd)
 	{ return 0; }
+static inline int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
+	{ return 0; }
 #endif
 
 #ifdef CONFIG_KVM_XIVE
@@ -673,6 +677,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
 			       int level, bool line_status);
 extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
 extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
+extern void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu);
 
 static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 {
@@ -714,6 +719,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 ir
 				      int level, bool line_status) { return -ENODEV; }
 static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
 static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
+static inline void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { }
 
 static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 	{ return 0; }
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 44bf567b6589..1658f899e289 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -171,6 +171,12 @@ void kvmppc_core_queue_machine_check(struct kvm_vcpu *vcpu, ulong flags)
 }
 EXPORT_SYMBOL_GPL(kvmppc_core_queue_machine_check);
 
+void kvmppc_core_queue_syscall(struct kvm_vcpu *vcpu)
+{
+	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_SYSCALL, 0);
+}
+EXPORT_SYMBOL(kvmppc_core_queue_syscall);
+
 void kvmppc_core_queue_program(struct kvm_vcpu *vcpu, ulong flags)
 {
 	/* might as well deliver this straight away */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2dc65d752f80..c45352fbc25d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1142,12 +1142,13 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 }
 
 /*
- * Handle H_CEDE in the nested virtualization case where we haven't
- * called the real-mode hcall handlers in book3s_hv_rmhandlers.S.
+ * Handle H_CEDE in the P9 path where we don't call the real-mode hcall
+ * handlers in book3s_hv_rmhandlers.S.
+ *
  * This has to be done early, not in kvmppc_pseries_do_hcall(), so
  * that the cede logic in kvmppc_run_single_vcpu() works properly.
  */
-static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
+static void kvmppc_cede(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.shregs.msr |= MSR_EE;
 	vcpu->arch.ceded = 1;
@@ -1400,17 +1401,28 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	}
 	case BOOK3S_INTERRUPT_SYSCALL:
 	{
-		/* hcall - punt to userspace */
 		int i;
 
-		/* hypercall with MSR_PR has already been handled in rmode,
-		 * and never reaches here.
-		 */
+		if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
+			/*
+			 * Guest userspace executed sc 1, reflect it back as a
+			 * syscall as it may be a PR KVM hcall.
+			 */
+			kvmppc_core_queue_syscall(vcpu);
+			r = RESUME_GUEST;
+			break;
+		}
 
+		/*
+		 * hcall - gather args and set exit_reason. This will next be
+		 * handled by kvmppc_pseries_do_hcall which may be able to deal
+		 * with it and resume guest, or may punt to userspace.
+		 */
 		run->papr_hcall.nr = kvmppc_get_gpr(vcpu, 3);
 		for (i = 0; i < 9; ++i)
 			run->papr_hcall.args[i] = kvmppc_get_gpr(vcpu, 4 + i);
 		run->exit_reason = KVM_EXIT_PAPR_HCALL;
+		/* Should this only be set if pseries_do_hcall fails? */
 		vcpu->arch.hcall_needed = 1;
 		r = RESUME_HOST;
 		break;
@@ -3669,6 +3681,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	return trap;
 }
 
+static inline bool hcall_is_xics(unsigned long req)
+{
+	return req == H_EOI || req == H_CPPR || req == H_IPI ||
+		req == H_IPOLL || req == H_XIRR || req == H_XIRR_X;
+}
+
 /*
  * Virtual-mode guest entry for POWER9 and later when the host and
  * guest are both using the radix MMU.  The LPIDR has already been set.
@@ -3780,15 +3798,36 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
 		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
-			kvmppc_nested_cede(vcpu);
+			kvmppc_cede(vcpu);
 			kvmppc_set_gpr(vcpu, 3, 0);
 			trap = 0;
 		}
 	} else {
 		kvmppc_xive_push_vcpu(vcpu);
 		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
+		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
+		    !(vcpu->arch.shregs.msr & MSR_PR)) {
+			unsigned long req = kvmppc_get_gpr(vcpu, 3);
+
+			/* H_CEDE has to be handled now, not later */
+			if (req == H_CEDE) {
+				kvmppc_cede(vcpu);
+				kvmppc_xive_rearm_escalation(vcpu); /* may un-cede */
+				kvmppc_set_gpr(vcpu, 3, 0);
+				trap = 0;
+
+			/* XICS hcalls must be handled before xive is pulled */
+			} else if (hcall_is_xics(req)) {
+				int ret;
+
+				ret = kvmppc_xive_xics_hcall(vcpu, req);
+				if (ret != H_TOO_HARD) {
+					kvmppc_set_gpr(vcpu, 3, ret);
+					trap = 0;
+				}
+			}
+		}
 		kvmppc_xive_pull_vcpu(vcpu);
-
 	}
 
 	vcpu->arch.slb_max = 0;
@@ -4448,8 +4487,17 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		else
 			r = kvmppc_run_vcpu(vcpu);
 
-		if (run->exit_reason == KVM_EXIT_PAPR_HCALL &&
-		    !(vcpu->arch.shregs.msr & MSR_PR)) {
+		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
+			if (WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_PR)) {
+				/*
+				 * These should have been caught reflected
+				 * into the guest by now. Final sanity check:
+				 * don't allow userspace to execute hcalls in
+				 * the hypervisor.
+				 */
+				r = RESUME_GUEST;
+				continue;
+			}
 			trace_kvm_hcall_enter(vcpu);
 			r = kvmppc_pseries_do_hcall(vcpu);
 			trace_kvm_hcall_exit(vcpu, r);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index c11597f815e4..2d0d14ed1d92 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1397,9 +1397,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	mr	r4,r9
 	bge	fast_guest_return
 2:
+	/* If we came in through the P9 short path, no real mode hcalls */
+	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
+	cmpwi	r0, 0
+	bne	no_try_real
 	/* See if this is an hcall we can handle in real mode */
 	cmpwi	r12,BOOK3S_INTERRUPT_SYSCALL
 	beq	hcall_try_real_mode
+no_try_real:
 
 	/* Hypervisor doorbell - exit only if host IPI flag set */
 	cmpwi	r12, BOOK3S_INTERRUPT_H_DOORBELL
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 741bf1f4387a..24c07094651a 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -158,6 +158,40 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
 
+void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
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
+EXPORT_SYMBOL_GPL(kvmppc_xive_rearm_escalation);
+
 /*
  * This is a simple trigger for a generic XIVE IRQ. This must
  * only be called for interrupts that support a trigger page
@@ -2106,6 +2140,36 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
 	return 0;
 }
 
+int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
+{
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+
+	/* The VM should have configured XICS mode before doing XICS hcalls. */
+	if (!kvmppc_xics_enabled(vcpu))
+		return H_TOO_HARD;
+
+	switch (req) {
+	case H_XIRR:
+		return xive_vm_h_xirr(vcpu);
+	case H_CPPR:
+		return xive_vm_h_cppr(vcpu, kvmppc_get_gpr(vcpu, 4));
+	case H_EOI:
+		return xive_vm_h_eoi(vcpu, kvmppc_get_gpr(vcpu, 4));
+	case H_IPI:
+		return xive_vm_h_ipi(vcpu, kvmppc_get_gpr(vcpu, 4),
+					  kvmppc_get_gpr(vcpu, 5));
+	case H_IPOLL:
+		return xive_vm_h_ipoll(vcpu, kvmppc_get_gpr(vcpu, 4));
+	case H_XIRR_X:
+		xive_vm_h_xirr(vcpu);
+		kvmppc_set_gpr(vcpu, 5, get_tb() + vc->tb_offset);
+		return H_SUCCESS;
+	}
+
+	return H_UNSUPPORTED;
+}
+EXPORT_SYMBOL_GPL(kvmppc_xive_xics_hcall);
+
 int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *vcpu)
 {
 	struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
-- 
2.23.0

