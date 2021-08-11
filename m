Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 537BA3E9631
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:40:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFsp1jxYz3hXw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:39:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=i85A2td1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i85A2td1; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF4Y5yhDz3dLc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:04:13 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso6313957pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cauDK1klmHflV3Go2+XAubrxTRr9Jif78l3bR4wcjqc=;
 b=i85A2td1DrHjFgYpy+LZhR94hnP1eMF8ZTVrO4wyemr+zxtqYD6pRgryQkXhe/rVWV
 aT40uu1Bmmqy/oobIPPKHVs7aGRhA/Qd/w3+LBu3iipi7vcyBvEexSCUYd3+4bmsKHKf
 yCMtoWSBkOZp+iqt/VdKIz+887Qw4hfjraOKudLWW+1gXSH46cp8hmOGmOUYIuWPU7E3
 iGI/O7uLGMyIjIIf5iyTwFf9fnhfZezV5Wk9VeZMMUR6u2JTguzNXf2IqoJKDbaNpZiE
 UKBhAZCcS3iFoTOYoHBa4fbYv1DEIEqXYYC7BvlJhtTeKRqlYsBx85mMLXr8ZYCrXxdd
 Owcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cauDK1klmHflV3Go2+XAubrxTRr9Jif78l3bR4wcjqc=;
 b=oVuhPQdNBajKzZMDLs4/PRvacagkNXNFPQIXbQkvjtHmla3HyuJ+3lvPjgT8/z/IOh
 auRSuKKEupmOTfQkYMu2OejQmHS/XKKet3jFXRKLy6hXO17m5E9FR7zZ45x/v+CuTj66
 CvX3n/+VUDYiHu3+N55x3d7Gmfkl+A+mSL9zmYNdMtrMmsLksa+nR3LL6lHdNYI1Gh1x
 uBXxIEyupNieZQFrgbdCu5ngnXXrAvQz0PsvPA3jBlOKZgm8OuXc98pv+VDrMvTJTI5t
 uG1iAmxmq6dX42iW46pCHNFdLvvrcYsEIExCpH8WWhK6bAJWBVQj+KG18JyyJ0X+UvR1
 067Q==
X-Gm-Message-State: AOAM5337UpRjpZQcBYxmuzr7dhxNAOUYJHCZWxpgXI7TQqqldS7fAbhU
 akIgkVMrKJvqqSl1ZhIZEsV0sjlr5jA=
X-Google-Smtp-Source: ABdhPJwko502Xql4qFBBh/0HXPRlb3F742tAlwLwUWjf4+CZhkn4sGlBJ3lo2EwyzTtEucMnZVfvNA==
X-Received: by 2002:a17:90a:ba0b:: with SMTP id
 s11mr37329217pjr.10.1628697852002; 
 Wed, 11 Aug 2021 09:04:12 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:04:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 57/60] KVM: PPC: Book3S HV P9: Remove most of the vcore
 logic
Date: Thu, 12 Aug 2021 02:01:31 +1000
Message-Id: <20210811160134.904987-58-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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

The P9 path always uses one vcpu per vcore, so none of the the vcore,
locks, stolen time, blocking logic, shared waitq, etc., is required.

Remove most of it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 147 ++++++++++++++++++++---------------
 1 file changed, 85 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d4df2add81ae..c8ea430d1955 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -276,6 +276,8 @@ static void kvmppc_core_start_stolen(struct kvmppc_vcore *vc, u64 tb)
 {
 	unsigned long flags;
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	spin_lock_irqsave(&vc->stoltb_lock, flags);
 	vc->preempt_tb = tb;
 	spin_unlock_irqrestore(&vc->stoltb_lock, flags);
@@ -285,6 +287,8 @@ static void kvmppc_core_end_stolen(struct kvmppc_vcore *vc, u64 tb)
 {
 	unsigned long flags;
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	spin_lock_irqsave(&vc->stoltb_lock, flags);
 	if (vc->preempt_tb != TB_NIL) {
 		vc->stolen_tb += tb - vc->preempt_tb;
@@ -297,7 +301,12 @@ static void kvmppc_core_vcpu_load_hv(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	unsigned long flags;
-	u64 now = mftb();
+	u64 now;
+
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		return;
+
+	now = mftb();
 
 	/*
 	 * We can test vc->runner without taking the vcore lock,
@@ -321,7 +330,12 @@ static void kvmppc_core_vcpu_put_hv(struct kvm_vcpu *vcpu)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	unsigned long flags;
-	u64 now = mftb();
+	u64 now;
+
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		return;
+
+	now = mftb();
 
 	if (vc->runner == vcpu && vc->vcore_state >= VCORE_SLEEPING)
 		kvmppc_core_start_stolen(vc, now);
@@ -673,6 +687,8 @@ static u64 vcore_stolen_time(struct kvmppc_vcore *vc, u64 now)
 	u64 p;
 	unsigned long flags;
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	spin_lock_irqsave(&vc->stoltb_lock, flags);
 	p = vc->stolen_tb;
 	if (vc->vcore_state != VCORE_INACTIVE &&
@@ -695,13 +711,19 @@ static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
 	dt = vcpu->arch.dtl_ptr;
 	vpa = vcpu->arch.vpa.pinned_addr;
 	now = tb;
-	core_stolen = vcore_stolen_time(vc, now);
-	stolen = core_stolen - vcpu->arch.stolen_logged;
-	vcpu->arch.stolen_logged = core_stolen;
-	spin_lock_irqsave(&vcpu->arch.tbacct_lock, flags);
-	stolen += vcpu->arch.busy_stolen;
-	vcpu->arch.busy_stolen = 0;
-	spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
+
+	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+		stolen = 0;
+	} else {
+		core_stolen = vcore_stolen_time(vc, now);
+		stolen = core_stolen - vcpu->arch.stolen_logged;
+		vcpu->arch.stolen_logged = core_stolen;
+		spin_lock_irqsave(&vcpu->arch.tbacct_lock, flags);
+		stolen += vcpu->arch.busy_stolen;
+		vcpu->arch.busy_stolen = 0;
+		spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
+	}
+
 	if (!dt || !vpa)
 		return;
 	memset(dt, 0, sizeof(struct dtl_entry));
@@ -898,13 +920,14 @@ static int kvm_arch_vcpu_yield_to(struct kvm_vcpu *target)
 	 * mode handler is not called but no other threads are in the
 	 * source vcore.
 	 */
-
-	spin_lock(&vcore->lock);
-	if (target->arch.state == KVMPPC_VCPU_RUNNABLE &&
-	    vcore->vcore_state != VCORE_INACTIVE &&
-	    vcore->runner)
-		target = vcore->runner;
-	spin_unlock(&vcore->lock);
+	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
+		spin_lock(&vcore->lock);
+		if (target->arch.state == KVMPPC_VCPU_RUNNABLE &&
+		    vcore->vcore_state != VCORE_INACTIVE &&
+		    vcore->runner)
+			target = vcore->runner;
+		spin_unlock(&vcore->lock);
+	}
 
 	return kvm_vcpu_yield_to(target);
 }
@@ -3128,13 +3151,6 @@ static void kvmppc_start_thread(struct kvm_vcpu *vcpu, struct kvmppc_vcore *vc)
 		kvmppc_ipi_thread(cpu);
 }
 
-/* Old path does this in asm */
-static void kvmppc_stop_thread(struct kvm_vcpu *vcpu)
-{
-	vcpu->cpu = -1;
-	vcpu->arch.thread_cpu = -1;
-}
-
 static void kvmppc_wait_for_nap(int n_threads)
 {
 	int cpu = smp_processor_id();
@@ -3223,6 +3239,8 @@ static void kvmppc_vcore_preempt(struct kvmppc_vcore *vc)
 {
 	struct preempted_vcore_list *lp = this_cpu_ptr(&preempted_vcores);
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	vc->vcore_state = VCORE_PREEMPT;
 	vc->pcpu = smp_processor_id();
 	if (vc->num_threads < threads_per_vcore(vc->kvm)) {
@@ -3239,6 +3257,8 @@ static void kvmppc_vcore_end_preempt(struct kvmppc_vcore *vc)
 {
 	struct preempted_vcore_list *lp;
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	kvmppc_core_end_stolen(vc, mftb());
 	if (!list_empty(&vc->preempt_list)) {
 		lp = &per_cpu(preempted_vcores, vc->pcpu);
@@ -3967,7 +3987,6 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			 unsigned long lpcr, u64 *tb)
 {
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	u64 next_timer;
 	int trap;
 
@@ -3983,9 +4002,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	kvmppc_subcore_enter_guest();
 
-	vc->entry_exit_map = 1;
-	vc->in_guest = 1;
-
 	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (kvmhv_on_pseries()) {
@@ -4038,9 +4054,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	vc->entry_exit_map = 0x101;
-	vc->in_guest = 0;
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
@@ -4106,6 +4119,13 @@ static bool kvmppc_vcpu_woken(struct kvm_vcpu *vcpu)
 	return false;
 }
 
+static bool kvmppc_vcpu_check_block(struct kvm_vcpu *vcpu)
+{
+	if (!vcpu->arch.ceded || kvmppc_vcpu_woken(vcpu))
+		return true;
+	return false;
+}
+
 /*
  * Check to see if any of the runnable vcpus on the vcore have pending
  * exceptions or are no longer ceded
@@ -4116,7 +4136,7 @@ static int kvmppc_vcore_check_block(struct kvmppc_vcore *vc)
 	int i;
 
 	for_each_runnable_thread(i, vcpu, vc) {
-		if (!vcpu->arch.ceded || kvmppc_vcpu_woken(vcpu))
+		if (kvmppc_vcpu_check_block(vcpu))
 			return 1;
 	}
 
@@ -4133,6 +4153,8 @@ static void kvmppc_vcore_blocked(struct kvmppc_vcore *vc)
 	int do_sleep = 1;
 	u64 block_ns;
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	/* Poll for pending exceptions and ceded state */
 	cur = start_poll = ktime_get();
 	if (vc->halt_poll_ns) {
@@ -4398,11 +4420,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->arch.ceded = 0;
 	vcpu->arch.run_task = current;
 	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
-	vcpu->arch.busy_preempt = TB_NIL;
 	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
-	vc->runnable_threads[0] = vcpu;
-	vc->n_runnable = 1;
-	vc->runner = vcpu;
 
 	/* See if the MMU is ready to go */
 	if (unlikely(!kvm->arch.mmu_ready)) {
@@ -4420,11 +4438,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	kvmppc_update_vpas(vcpu);
 
-	init_vcore_to_run(vc);
-
 	preempt_disable();
 	pcpu = smp_processor_id();
-	vc->pcpu = pcpu;
 	if (kvm_is_radix(kvm))
 		kvmppc_prepare_radix_vcpu(vcpu, pcpu);
 
@@ -4453,21 +4468,23 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 		goto out;
 	}
 
-	tb = mftb();
+	if (vcpu->arch.timer_running) {
+		hrtimer_try_to_cancel(&vcpu->arch.dec_timer);
+		vcpu->arch.timer_running = 0;
+	}
 
-	vcpu->arch.stolen_logged = vcore_stolen_time(vc, tb);
-	vc->preempt_tb = TB_NIL;
+	tb = mftb();
 
-	kvmppc_clear_host_core(pcpu);
+	vcpu->cpu = pcpu;
+	vcpu->arch.thread_cpu = pcpu;
+	local_paca->kvm_hstate.kvm_vcpu = vcpu;
+	local_paca->kvm_hstate.ptid = 0;
+	local_paca->kvm_hstate.fake_suspend = 0;
 
-	local_paca->kvm_hstate.napping = 0;
-	local_paca->kvm_hstate.kvm_split_mode = NULL;
-	kvmppc_start_thread(vcpu, vc);
+	vc->pcpu = pcpu; // for kvmppc_create_dtl_entry
 	kvmppc_create_dtl_entry(vcpu, vc, tb);
-	trace_kvm_guest_enter(vcpu);
 
-	vc->vcore_state = VCORE_RUNNING;
-	trace_kvmppc_run_core(vc, 0);
+	trace_kvm_guest_enter(vcpu);
 
 	guest_enter_irqoff();
 
@@ -4489,11 +4506,10 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	set_irq_happened(trap);
 
-	kvmppc_set_host_core(pcpu);
-
 	guest_exit_irqoff();
 
-	kvmppc_stop_thread(vcpu);
+	vcpu->cpu = -1;
+	vcpu->arch.thread_cpu = -1;
 
 	powerpc_local_irq_pmu_restore(flags);
 
@@ -4520,28 +4536,31 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 	vcpu->arch.ret = r;
 
-	if (is_kvmppc_resume_guest(r) && vcpu->arch.ceded &&
-	    !kvmppc_vcpu_woken(vcpu)) {
+	if (is_kvmppc_resume_guest(r) && !kvmppc_vcpu_check_block(vcpu)) {
 		kvmppc_set_timer(vcpu);
-		while (vcpu->arch.ceded && !kvmppc_vcpu_woken(vcpu)) {
+
+		prepare_to_rcuwait(&vcpu->wait);
+		for (;;) {
+			set_current_state(TASK_INTERRUPTIBLE);
 			if (signal_pending(current)) {
 				vcpu->stat.signal_exits++;
 				run->exit_reason = KVM_EXIT_INTR;
 				vcpu->arch.ret = -EINTR;
 				break;
 			}
-			spin_lock(&vc->lock);
-			kvmppc_vcore_blocked(vc);
-			spin_unlock(&vc->lock);
+
+			if (kvmppc_vcpu_check_block(vcpu))
+				break;
+
+			trace_kvmppc_vcore_blocked(vc, 0);
+			schedule();
+			trace_kvmppc_vcore_blocked(vc, 1);
 		}
+		finish_rcuwait(&vcpu->wait);
 	}
 	vcpu->arch.ceded = 0;
 
-	vc->vcore_state = VCORE_INACTIVE;
-	trace_kvmppc_run_core(vc, 1);
-
  done:
-	kvmppc_remove_runnable(vc, vcpu, tb);
 	trace_kvmppc_run_vcpu_exit(vcpu);
 
 	return vcpu->arch.ret;
@@ -4625,7 +4644,8 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 
 	kvmppc_save_current_sprs();
 
-	vcpu->arch.waitp = &vcpu->arch.vcore->wait;
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
+		vcpu->arch.waitp = &vcpu->arch.vcore->wait;
 	vcpu->arch.pgdir = kvm->mm->pgd;
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
@@ -5087,6 +5107,9 @@ void kvmppc_alloc_host_rm_ops(void)
 	int cpu, core;
 	int size;
 
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		return;
+
 	/* Not the first time here ? */
 	if (kvmppc_host_rm_ops_hv != NULL)
 		return;
-- 
2.23.0

