Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C46D421439
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:37:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNRFb2440z3fYZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:37:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gcgnCZEB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gcgnCZEB; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQgQ5HrKz3f4J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:10:57 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id v11so4406823pgb.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0xHApedBwdkV8/VxE9KrIbt5h6CxgC8qD90Q7T0YrQU=;
 b=gcgnCZEBPm0tWhwCGPQ6D+2q0ZRRwRUiWUH2loWtJ9oWk4PiNBIPUBY0G+5Uap4/YF
 8lMjbVGFw5gd5G1MaFAK4tWWkhoOAtHndLlus48/pAxDVV+EmMLUBVwWcgcYd4htDZLp
 5jgxJ2G0I8c6WDs7f6ZIMWgRMmo+6nyF6weoFWUnq8NqApkRt88fPEVbhNCVD8b0gbHq
 TdMWH0UxNbojBCkCBNnT/Adj1SyTZDSajev5+jqzVsVoBYj/senIG+jKXc+HhCOQsfu4
 GeOJIqvIM+i4rn0/5hYkwkFD8MgR6aNP6mUEWXWQ9X/E60lvnpKyjqywEWKMsQoEjU52
 CzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0xHApedBwdkV8/VxE9KrIbt5h6CxgC8qD90Q7T0YrQU=;
 b=3I3LN2CWU7CePH5fUZtTOuQ0OHTL8tkY7i3r8DWNBMpTfwUpX4jp1vMP6mv/LeXnsK
 GsIbpuhAwbDaDMN1pMNy9ylnNauM74y5hHzT0t5ns9rJ01A/xbrit/Sxvj3/tYOhHD9q
 ml4Iihxj6V/uzASogrypWkCxJbzrzdLz+I/bFWI11mo0aR5JYWO9C7lIcaWbAH39hVOy
 N2I8PJO64TOcDDShQzSjXMvz/kjy8GkVussUL1O8Jz/XQxqAYmLqTFgEIKQ6K33eleIK
 ykAusxf1N/Zer2ol04vKO49dFoJnf5pYPAamlLOZlTji7ASLk4XebQi45jQJGmDk4hQs
 0dgQ==
X-Gm-Message-State: AOAM531y+yfccsrZsRvHzZR+Qrt5g0JnXN5k/+YWCt82fyaakgig7Ipq
 MGetdYj7henaAueDmU++xIw=
X-Google-Smtp-Source: ABdhPJz8tK92gwyEVbhnZzMCT+XRoRLZSkcjotOWWC7so6DzEC0NY985/G5gzlAj+IaJFiRc6qtoCQ==
X-Received: by 2002:a65:6a0f:: with SMTP id m15mr11647983pgu.298.1633363855795; 
 Mon, 04 Oct 2021 09:10:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id n14sm15063968pgd.48.2021.10.04.09.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:10:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] KVM: PPC: Book3S HV P9: Move H_CEDE logic mostly to one
 place
Date: Tue,  5 Oct 2021 02:10:50 +1000
Message-Id: <20211004161050.1341845-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

Move the vcpu->arch.ceded, hrtimer, and blocking handling to one place,
except the xive escalation rearm case. The only special case is the
xive handling, as it is to be done before the xive context is pulled.

This means the P9 path does not run with ceded==1 or the hrtimer armed
except in the kvmhv_handle_cede function, and hopefully cede handling is
a bit more understandable.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h    |   4 +-
 arch/powerpc/kvm/book3s_hv.c          | 137 +++++++++++++-------------
 arch/powerpc/kvm/book3s_hv_p9_entry.c |   3 +-
 arch/powerpc/kvm/book3s_xive.c        |  26 ++---
 4 files changed, 88 insertions(+), 82 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 70ffcb3c91bf..e2e6cee9dddf 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -674,7 +674,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
 			       int level, bool line_status);
 extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
 extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
-extern void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu);
+extern bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu);
 
 static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 {
@@ -712,7 +712,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 ir
 				      int level, bool line_status) { return -ENODEV; }
 static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
 static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
-static inline void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { }
+static inline bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { return false; }
 
 static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 	{ return 0; }
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 36c54f483a02..230f10b67f98 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1019,6 +1019,8 @@ static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
 	return H_SUCCESS;
 }
 
+static int kvmhv_handle_cede(struct kvm_vcpu *vcpu);
+
 int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -1080,7 +1082,9 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		break;
 
 	case H_CEDE:
+		ret = kvmhv_handle_cede(vcpu);
 		break;
+
 	case H_PROD:
 		target = kvmppc_get_gpr(vcpu, 4);
 		tvcpu = kvmppc_find_vcpu(kvm, target);
@@ -1292,25 +1296,6 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	return RESUME_GUEST;
 }
 
-/*
- * Handle H_CEDE in the P9 path where we don't call the real-mode hcall
- * handlers in book3s_hv_rmhandlers.S.
- *
- * This has to be done early, not in kvmppc_pseries_do_hcall(), so
- * that the cede logic in kvmppc_run_single_vcpu() works properly.
- */
-static void kvmppc_cede(struct kvm_vcpu *vcpu)
-{
-	vcpu->arch.shregs.msr |= MSR_EE;
-	vcpu->arch.ceded = 1;
-	smp_mb();
-	if (vcpu->arch.prodded) {
-		vcpu->arch.prodded = 0;
-		smp_mb();
-		vcpu->arch.ceded = 0;
-	}
-}
-
 static int kvmppc_hcall_impl_hv(unsigned long cmd)
 {
 	switch (cmd) {
@@ -2971,7 +2956,7 @@ static int kvmppc_core_check_requests_hv(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
-static void kvmppc_set_timer(struct kvm_vcpu *vcpu)
+static bool kvmppc_set_timer(struct kvm_vcpu *vcpu)
 {
 	unsigned long dec_nsec, now;
 
@@ -2980,11 +2965,12 @@ static void kvmppc_set_timer(struct kvm_vcpu *vcpu)
 		/* decrementer has already gone negative */
 		kvmppc_core_queue_dec(vcpu);
 		kvmppc_core_prepare_to_enter(vcpu);
-		return;
+		return false;
 	}
 	dec_nsec = tb_to_ns(kvmppc_dec_expires_host_tb(vcpu) - now);
 	hrtimer_start(&vcpu->arch.dec_timer, dec_nsec, HRTIMER_MODE_REL);
 	vcpu->arch.timer_running = 1;
+	return true;
 }
 
 extern int __kvmppc_vcore_entry(void);
@@ -4015,21 +4001,11 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	else if (*tb >= time_limit) /* nested time limit */
 		return BOOK3S_INTERRUPT_NESTED_HV_DECREMENTER;
 
-	vcpu->arch.ceded = 0;
-
 	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (kvmhv_on_pseries()) {
 		trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
 
-		/* H_CEDE has to be handled now, not later */
-		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
-		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
-			kvmppc_cede(vcpu);
-			kvmppc_set_gpr(vcpu, 3, 0);
-			trap = 0;
-		}
-
 	} else {
 		struct kvm *kvm = vcpu->kvm;
 
@@ -4043,12 +4019,14 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
 
-			/* H_CEDE has to be handled now, not later */
+			/* Have to rearm before pulling xive, may abort cede */
 			if (req == H_CEDE) {
-				kvmppc_cede(vcpu);
-				kvmppc_xive_rearm_escalation(vcpu); /* may un-cede */
-				kvmppc_set_gpr(vcpu, 3, 0);
-				trap = 0;
+				if (kvmppc_xive_rearm_escalation(vcpu)) {
+					vcpu->arch.shregs.msr |= MSR_EE;
+					vcpu->arch.prodded = 0;
+					kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
+					trap = 0;
+				}
 
 			/* XICS hcalls must be handled before xive is pulled */
 			} else if (hcall_is_xics(req)) {
@@ -4423,6 +4401,63 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 	return vcpu->arch.ret;
 }
 
+/* H_CEDE for the P9 path, P7/8 is handled by realmode handlers */
+static int kvmhv_handle_cede(struct kvm_vcpu *vcpu)
+{
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	struct kvm_run *run = vcpu->run;
+
+	kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
+	vcpu->arch.trap = 0;
+	vcpu->arch.shregs.msr |= MSR_EE;
+
+	vcpu->arch.ceded = 1;
+	smp_mb();
+	if (vcpu->arch.prodded) {
+		vcpu->arch.prodded = 0;
+		smp_mb();
+		vcpu->arch.ceded = 0;
+		return RESUME_GUEST;
+	}
+
+	if (kvmppc_vcpu_woken(vcpu)) {
+		vcpu->arch.ceded = 0;
+		return RESUME_GUEST;
+	}
+
+	if (!kvmppc_set_timer(vcpu)) {
+		vcpu->arch.ceded = 0;
+		return RESUME_GUEST;
+	}
+
+	prepare_to_rcuwait(&vcpu->wait);
+	for (;;) {
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (signal_pending(current)) {
+			vcpu->stat.signal_exits++;
+			run->exit_reason = KVM_EXIT_INTR;
+			vcpu->arch.ret = -EINTR;
+			break;
+		}
+
+		if (kvmppc_vcpu_woken(vcpu) || !vcpu->arch.ceded)
+			break;
+
+		trace_kvmppc_vcore_blocked(vc, 0);
+		schedule();
+		trace_kvmppc_vcore_blocked(vc, 1);
+	}
+	finish_rcuwait(&vcpu->wait);
+
+	if (vcpu->arch.timer_running) {
+		hrtimer_try_to_cancel(&vcpu->arch.dec_timer);
+		vcpu->arch.timer_running = 0;
+	}
+
+	vcpu->arch.ceded = 0;
+	return RESUME_GUEST;
+}
+
 int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 			  unsigned long lpcr)
 {
@@ -4442,7 +4477,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->arch.trap = 0;
 
 	vc = vcpu->arch.vcore;
-	vcpu->arch.ceded = 0;
 	vcpu->arch.run_task = current;
 	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
 	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
@@ -4488,11 +4522,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 		goto out;
 	}
 
-	if (vcpu->arch.timer_running) {
-		hrtimer_try_to_cancel(&vcpu->arch.dec_timer);
-		vcpu->arch.timer_running = 0;
-	}
-
 	tb = mftb();
 
 	vcpu->cpu = pcpu;
@@ -4555,30 +4584,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 	vcpu->arch.ret = r;
 
-	if (is_kvmppc_resume_guest(r) && !kvmppc_vcpu_check_block(vcpu)) {
-		kvmppc_set_timer(vcpu);
-
-		prepare_to_rcuwait(&vcpu->wait);
-		for (;;) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			if (signal_pending(current)) {
-				vcpu->stat.signal_exits++;
-				run->exit_reason = KVM_EXIT_INTR;
-				vcpu->arch.ret = -EINTR;
-				break;
-			}
-
-			if (kvmppc_vcpu_check_block(vcpu))
-				break;
-
-			trace_kvmppc_vcore_blocked(vc, 0);
-			schedule();
-			trace_kvmppc_vcore_blocked(vc, 1);
-		}
-		finish_rcuwait(&vcpu->wait);
-	}
-	vcpu->arch.ceded = 0;
-
  done:
 	trace_kvmppc_run_vcpu_exit(vcpu);
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 86a222f97e8e..a1fdfcba608f 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -713,11 +713,10 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
 	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
+	WARN_ON_ONCE(vcpu->arch.ceded);
 
 	start_timing(vcpu, &vcpu->arch.rm_entry);
 
-	vcpu->arch.ceded = 0;
-
 	/* Save MSR for restore, with EE clear. */
 	msr = mfmsr() & ~MSR_EE;
 
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index a18db9e16ea4..7d45764fd6a8 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -179,37 +179,39 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
 
-void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
+/* Return true if H_CEDE is to be aborted */
+bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
 {
 	void __iomem *esc_vaddr = (void __iomem *)vcpu->arch.xive_esc_vaddr;
 
 	if (!esc_vaddr)
-		return;
+		return false;
 
 	/* we are using XIVE with single escalation */
 
 	if (vcpu->arch.xive_esc_on) {
 		/*
-		 * If we still have a pending escalation, abort the cede,
-		 * and we must set PQ to 10 rather than 00 so that we don't
-		 * potentially end up with two entries for the escalation
-		 * interrupt in the XIVE interrupt queue.  In that case
-		 * we also don't want to set xive_esc_on to 1 here in
-		 * case we race with xive_esc_irq().
-		 */
-		vcpu->arch.ceded = 0;
-		/*
+		 * If we still have a pending escalation, return true to abort
+		 * the cede, and we must set PQ to 10 rather than 00 so that we
+		 * don't potentially end up with two entries for the escalation
+		 * interrupt in the XIVE interrupt queue.  In that case we also
+		 * don't want to set xive_esc_on to 1 here in case we race with
+		 * xive_esc_irq().
+		 *
 		 * The escalation interrupts are special as we don't EOI them.
 		 * There is no need to use the load-after-store ordering offset
 		 * to set PQ to 10 as we won't use StoreEOI.
 		 */
 		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_10);
+		mb();
+		return true;
 	} else {
 		vcpu->arch.xive_esc_on = true;
 		mb();
 		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
+		mb();
+		return false;
 	}
-	mb();
 }
 EXPORT_SYMBOL_GPL(kvmppc_xive_rearm_escalation);
 
-- 
2.23.0

