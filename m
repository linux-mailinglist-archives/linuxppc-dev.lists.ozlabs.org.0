Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DD42142C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:34:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNRBM2b8Xz3h5T
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:34:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WPMXaN0H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WPMXaN0H; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQVC5xssz3cVM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:59 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id 187so10493385pfc.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSA9KNw+NCGluNGMWhmCZ5xJhNmCaVO+jtqY+PDjziM=;
 b=WPMXaN0HlBOdwuVrNVxQ5RMrBbpfht7lKCuB4x2rsv0FdYJYvkzuTA/qPzublqTx95
 V/sQmuSbmw9Pkp9fYQyx/elGS3jSgYmjtT5ZfPwtTwj1B4C6FdsNNH2raWpAWi5GgtPv
 0JJt+kCjevk/k6j6PYXihIYGG21oWuyWzW5x/uWrNj6iXoZ6XIu0ISjd/27kNYNpqp1L
 Ttug1diMyrFEF0DNJytSonFTxG/yihQn53sBWCFB9DbnrF0ObFcbWSQ02a7atRtjSsmR
 qElsjPBAYU/TNiBwdZKeHQ1qQcAxMN6ZqKrDTaov89P7KIBDGbux6chyzkcXN2jjPyHf
 ONew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSA9KNw+NCGluNGMWhmCZ5xJhNmCaVO+jtqY+PDjziM=;
 b=2gPw/3jLYy0zGUanXPMmI66HiU+WGyU24e9IYRuxCuVt2miOweAAVvhZteC17t55OC
 XVc2NjjHxHFM9g+tdixXBlnswCNwfI0xdfl8v746+YWijJrwhJ6xaOtikkpLmEGHcbBV
 7CEgeiEU7ILRCWsz3lBbRSQ55Y7Zowh7O2Ug8alkiLjkIDCh4A8GKQ40kOHVxKXVJXwS
 FzE5EcMitJn8eT8Ylfg/u/zOpqeFBdneOo+qMbcs3TcIp8FSRk3Zk+Gig8DZWK1az3JH
 YEMRuq8+lbfwhj6to5UPKeOrx0lBdmVix+uMkScOXBW1Nr3+YanbjrRKaF6MWxHT4xAI
 b41g==
X-Gm-Message-State: AOAM530Xu7AkBgLHm3/L9Ue6cw5geKNfuaEbYM8hiIScWAuWXpRh+p8W
 NGNQ2dfLolEd4GrxqnyHLIgEW77Q+ho=
X-Google-Smtp-Source: ABdhPJwz5HJuEcc3d2byvuLv7N/j2pw5/8BrlF0wHgVsv794DR969uoaRKzkoLcaXhpS8X1M/ru7Cw==
X-Received: by 2002:a05:6a00:188b:b0:44c:70a8:cf4 with SMTP id
 x11-20020a056a00188b00b0044c70a80cf4mr2241186pfh.85.1633363377978; 
 Mon, 04 Oct 2021 09:02:57 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 49/52] KVM: PPC: Book3S HV P9: Remove most of the vcore
 logic
Date: Tue,  5 Oct 2021 02:00:46 +1000
Message-Id: <20211004160049.1338837-50-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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

The P9 path always uses one vcpu per vcore, so none of the vcore, locks,
stolen time, blocking logic, shared waitq, etc., is required.

Remove most of it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 147 ++++++++++++++++++++---------------
 1 file changed, 85 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6574e8a3731e..d614f83c7b3f 100644
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
@@ -3125,13 +3148,6 @@ static void kvmppc_start_thread(struct kvm_vcpu *vcpu, struct kvmppc_vcore *vc)
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
@@ -3220,6 +3236,8 @@ static void kvmppc_vcore_preempt(struct kvmppc_vcore *vc)
 {
 	struct preempted_vcore_list *lp = this_cpu_ptr(&preempted_vcores);
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	vc->vcore_state = VCORE_PREEMPT;
 	vc->pcpu = smp_processor_id();
 	if (vc->num_threads < threads_per_vcore(vc->kvm)) {
@@ -3236,6 +3254,8 @@ static void kvmppc_vcore_end_preempt(struct kvmppc_vcore *vc)
 {
 	struct preempted_vcore_list *lp;
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	kvmppc_core_end_stolen(vc, mftb());
 	if (!list_empty(&vc->preempt_list)) {
 		lp = &per_cpu(preempted_vcores, vc->pcpu);
@@ -3964,7 +3984,6 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			 unsigned long lpcr, u64 *tb)
 {
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	u64 next_timer;
 	int trap;
 
@@ -3980,9 +3999,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	kvmppc_subcore_enter_guest();
 
-	vc->entry_exit_map = 1;
-	vc->in_guest = 1;
-
 	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (kvmhv_on_pseries()) {
@@ -4035,9 +4051,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	vc->entry_exit_map = 0x101;
-	vc->in_guest = 0;
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
@@ -4103,6 +4116,13 @@ static bool kvmppc_vcpu_woken(struct kvm_vcpu *vcpu)
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
@@ -4113,7 +4133,7 @@ static int kvmppc_vcore_check_block(struct kvmppc_vcore *vc)
 	int i;
 
 	for_each_runnable_thread(i, vcpu, vc) {
-		if (!vcpu->arch.ceded || kvmppc_vcpu_woken(vcpu))
+		if (kvmppc_vcpu_check_block(vcpu))
 			return 1;
 	}
 
@@ -4130,6 +4150,8 @@ static void kvmppc_vcore_blocked(struct kvmppc_vcore *vc)
 	int do_sleep = 1;
 	u64 block_ns;
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	/* Poll for pending exceptions and ceded state */
 	cur = start_poll = ktime_get();
 	if (vc->halt_poll_ns) {
@@ -4407,11 +4429,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4429,11 +4447,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	kvmppc_update_vpas(vcpu);
 
-	init_vcore_to_run(vc);
-
 	preempt_disable();
 	pcpu = smp_processor_id();
-	vc->pcpu = pcpu;
 	if (kvm_is_radix(kvm))
 		kvmppc_prepare_radix_vcpu(vcpu, pcpu);
 
@@ -4462,21 +4477,23 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
 
@@ -4498,11 +4515,10 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	set_irq_happened(trap);
 
-	kvmppc_set_host_core(pcpu);
-
 	guest_exit_irqoff();
 
-	kvmppc_stop_thread(vcpu);
+	vcpu->cpu = -1;
+	vcpu->arch.thread_cpu = -1;
 
 	powerpc_local_irq_pmu_restore(flags);
 
@@ -4529,28 +4545,31 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4632,7 +4651,8 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 
 	kvmppc_save_current_sprs();
 
-	vcpu->arch.waitp = &vcpu->arch.vcore->wait;
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
+		vcpu->arch.waitp = &vcpu->arch.vcore->wait;
 	vcpu->arch.pgdir = kvm->mm->pgd;
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
@@ -5094,6 +5114,9 @@ void kvmppc_alloc_host_rm_ops(void)
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

