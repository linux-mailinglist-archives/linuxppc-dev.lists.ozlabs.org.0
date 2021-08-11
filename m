Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 440933E95D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:23:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFVH0zT3z3g7w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:23:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=O/PYhnOi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O/PYhnOi; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF3M1QYCz3dBk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:11 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id l11so3289279plk.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hhm8D0ijfuqb2YJw4nLV1d2c636q460BzD6QJo13ySI=;
 b=O/PYhnOi+cROeaJ0evj8S0R+kAQEMfMEOWx6vb192jX8LgWuy31mjhrVtmt4x/vQAb
 ER3D9nWF3HoALZvdYIBz8qLDwpdQ/M95YOXTlBQWVzP31tiF1p06T5l3FZI6YqB4N4QS
 iYEUIH5PtSfTUMY1rjyqV/XMFqQjPI5qniRQseLc6/gWJ4aP1MhKIKIm75FRDKS7MdHe
 SR/N8iL9Q8cj7p2UQkqMjbqkb4/tzFPlVJBCy4rgp2OYDOp7umjGXUGgMjfjIOJrBKm0
 9oQrBmvADPduA0Vf2N06vZHPwQCXYy4MUtH7MmILsjAGg7awbaVFsIXo/nRaepwh8WcO
 5CiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hhm8D0ijfuqb2YJw4nLV1d2c636q460BzD6QJo13ySI=;
 b=HEMKwGMhP3IjWRtNfzfo/6ZP11GsE+Ytlxx4M8CbiO8QK3Q/1kL9wooPGi0onIh2lt
 bA/sd0U/qX/Nh5/5r7NvchA5QHBOOyz49guhuKKBEuvErSs+H6uUNDlavCraUnIKlBgJ
 ObKUTCfhvajEyAAfmfGLTE5REPSQmj3uk/SkrhRnXU1Ei5Besz7UYmjUbU2iVfoX/34K
 LPoty/EH72pKnY5Eo8OA/T34mD6ZyIFjooYGRFsM2h2sRH4AM0yLr5lwbykbY7iVHOxI
 0ahDdtTILg5mpqmC385bR8KWzpskKH0mgwyt27cLFVTm1sqCaojgU36f3C+S6xHFtMOW
 Lpdw==
X-Gm-Message-State: AOAM533FSHJjWrGcP9468Q36nE6WQj5NTUd+k0+rTNSB33kntzyU+dbN
 lt88esH0EbJIZ+V+CYa0Izo=
X-Google-Smtp-Source: ABdhPJyNNT65iYW/ogwMSKcnjIxXR0QfTKyF/WcNkSahgKOfyXGqI6VeBZvns19utMDdm4LsvoOelQ==
X-Received: by 2002:a65:5bc9:: with SMTP id o9mr403620pgr.24.1628697789128;
 Wed, 11 Aug 2021 09:03:09 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 32/60] KVM: PPC: Book3S HV P9: Optimise timebase reads
Date: Thu, 12 Aug 2021 02:01:06 +1000
Message-Id: <20210811160134.904987-33-npiggin@gmail.com>
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

Reduce the number of mfTB executed by passing the current timebase
around entry and exit code rather than read it multiple times.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |  2 +-
 arch/powerpc/kvm/book3s_hv.c             | 88 +++++++++++++-----------
 arch/powerpc/kvm/book3s_hv_p9_entry.c    | 33 +++++----
 3 files changed, 65 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 19b6942c6969..f721bb1a5eab 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -154,7 +154,7 @@ static inline bool kvmhv_vcpu_is_radix(struct kvm_vcpu *vcpu)
 	return radix;
 }
 
-int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr);
+int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb);
 
 #define KVM_DEFAULT_HPT_ORDER	24	/* 16MB HPT by default */
 #endif
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 967fa81063aa..a390980b42d8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -276,22 +276,22 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
  * they should never fail.)
  */
 
-static void kvmppc_core_start_stolen(struct kvmppc_vcore *vc)
+static void kvmppc_core_start_stolen(struct kvmppc_vcore *vc, u64 tb)
 {
 	unsigned long flags;
 
 	spin_lock_irqsave(&vc->stoltb_lock, flags);
-	vc->preempt_tb = mftb();
+	vc->preempt_tb = tb;
 	spin_unlock_irqrestore(&vc->stoltb_lock, flags);
 }
 
-static void kvmppc_core_end_stolen(struct kvmppc_vcore *vc)
+static void kvmppc_core_end_stolen(struct kvmppc_vcore *vc, u64 tb)
 {
 	unsigned long flags;
 
 	spin_lock_irqsave(&vc->stoltb_lock, flags);
 	if (vc->preempt_tb != TB_NIL) {
-		vc->stolen_tb += mftb() - vc->preempt_tb;
+		vc->stolen_tb += tb - vc->preempt_tb;
 		vc->preempt_tb = TB_NIL;
 	}
 	spin_unlock_irqrestore(&vc->stoltb_lock, flags);
@@ -301,6 +301,7 @@ static void kvmppc_core_vcpu_load_hv(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	unsigned long flags;
+	u64 now = mftb();
 
 	/*
 	 * We can test vc->runner without taking the vcore lock,
@@ -309,12 +310,12 @@ static void kvmppc_core_vcpu_load_hv(struct kvm_vcpu *vcpu, int cpu)
 	 * ever sets it to NULL.
 	 */
 	if (vc->runner == vcpu && vc->vcore_state >= VCORE_SLEEPING)
-		kvmppc_core_end_stolen(vc);
+		kvmppc_core_end_stolen(vc, now);
 
 	spin_lock_irqsave(&vcpu->arch.tbacct_lock, flags);
 	if (vcpu->arch.state == KVMPPC_VCPU_BUSY_IN_HOST &&
 	    vcpu->arch.busy_preempt != TB_NIL) {
-		vcpu->arch.busy_stolen += mftb() - vcpu->arch.busy_preempt;
+		vcpu->arch.busy_stolen += now - vcpu->arch.busy_preempt;
 		vcpu->arch.busy_preempt = TB_NIL;
 	}
 	spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
@@ -324,13 +325,14 @@ static void kvmppc_core_vcpu_put_hv(struct kvm_vcpu *vcpu)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	unsigned long flags;
+	u64 now = mftb();
 
 	if (vc->runner == vcpu && vc->vcore_state >= VCORE_SLEEPING)
-		kvmppc_core_start_stolen(vc);
+		kvmppc_core_start_stolen(vc, now);
 
 	spin_lock_irqsave(&vcpu->arch.tbacct_lock, flags);
 	if (vcpu->arch.state == KVMPPC_VCPU_BUSY_IN_HOST)
-		vcpu->arch.busy_preempt = mftb();
+		vcpu->arch.busy_preempt = now;
 	spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
 }
 
@@ -685,7 +687,7 @@ static u64 vcore_stolen_time(struct kvmppc_vcore *vc, u64 now)
 }
 
 static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
-				    struct kvmppc_vcore *vc)
+				    struct kvmppc_vcore *vc, u64 tb)
 {
 	struct dtl_entry *dt;
 	struct lppaca *vpa;
@@ -696,7 +698,7 @@ static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
 
 	dt = vcpu->arch.dtl_ptr;
 	vpa = vcpu->arch.vpa.pinned_addr;
-	now = mftb();
+	now = tb;
 	core_stolen = vcore_stolen_time(vc, now);
 	stolen = core_stolen - vcpu->arch.stolen_logged;
 	vcpu->arch.stolen_logged = core_stolen;
@@ -2917,14 +2919,14 @@ static void kvmppc_set_timer(struct kvm_vcpu *vcpu)
 extern int __kvmppc_vcore_entry(void);
 
 static void kvmppc_remove_runnable(struct kvmppc_vcore *vc,
-				   struct kvm_vcpu *vcpu)
+				   struct kvm_vcpu *vcpu, u64 tb)
 {
 	u64 now;
 
 	if (vcpu->arch.state != KVMPPC_VCPU_RUNNABLE)
 		return;
 	spin_lock_irq(&vcpu->arch.tbacct_lock);
-	now = mftb();
+	now = tb;
 	vcpu->arch.busy_stolen += vcore_stolen_time(vc, now) -
 		vcpu->arch.stolen_logged;
 	vcpu->arch.busy_preempt = now;
@@ -3175,14 +3177,14 @@ static void kvmppc_vcore_preempt(struct kvmppc_vcore *vc)
 	}
 
 	/* Start accumulating stolen time */
-	kvmppc_core_start_stolen(vc);
+	kvmppc_core_start_stolen(vc, mftb());
 }
 
 static void kvmppc_vcore_end_preempt(struct kvmppc_vcore *vc)
 {
 	struct preempted_vcore_list *lp;
 
-	kvmppc_core_end_stolen(vc);
+	kvmppc_core_end_stolen(vc, mftb());
 	if (!list_empty(&vc->preempt_list)) {
 		lp = &per_cpu(preempted_vcores, vc->pcpu);
 		spin_lock(&lp->lock);
@@ -3309,7 +3311,7 @@ static void prepare_threads(struct kvmppc_vcore *vc)
 			vcpu->arch.ret = RESUME_GUEST;
 		else
 			continue;
-		kvmppc_remove_runnable(vc, vcpu);
+		kvmppc_remove_runnable(vc, vcpu, mftb());
 		wake_up(&vcpu->arch.cpu_run);
 	}
 }
@@ -3328,7 +3330,7 @@ static void collect_piggybacks(struct core_info *cip, int target_threads)
 			list_del_init(&pvc->preempt_list);
 			if (pvc->runner == NULL) {
 				pvc->vcore_state = VCORE_INACTIVE;
-				kvmppc_core_end_stolen(pvc);
+				kvmppc_core_end_stolen(pvc, mftb());
 			}
 			spin_unlock(&pvc->lock);
 			continue;
@@ -3337,7 +3339,7 @@ static void collect_piggybacks(struct core_info *cip, int target_threads)
 			spin_unlock(&pvc->lock);
 			continue;
 		}
-		kvmppc_core_end_stolen(pvc);
+		kvmppc_core_end_stolen(pvc, mftb());
 		pvc->vcore_state = VCORE_PIGGYBACK;
 		if (cip->total_threads >= target_threads)
 			break;
@@ -3404,7 +3406,7 @@ static void post_guest_process(struct kvmppc_vcore *vc, bool is_master)
 			else
 				++still_running;
 		} else {
-			kvmppc_remove_runnable(vc, vcpu);
+			kvmppc_remove_runnable(vc, vcpu, mftb());
 			wake_up(&vcpu->arch.cpu_run);
 		}
 	}
@@ -3413,7 +3415,7 @@ static void post_guest_process(struct kvmppc_vcore *vc, bool is_master)
 			kvmppc_vcore_preempt(vc);
 		} else if (vc->runner) {
 			vc->vcore_state = VCORE_PREEMPT;
-			kvmppc_core_start_stolen(vc);
+			kvmppc_core_start_stolen(vc, mftb());
 		} else {
 			vc->vcore_state = VCORE_INACTIVE;
 		}
@@ -3544,7 +3546,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	    ((vc->num_threads > threads_per_subcore) || !on_primary_thread())) {
 		for_each_runnable_thread(i, vcpu, vc) {
 			vcpu->arch.ret = -EBUSY;
-			kvmppc_remove_runnable(vc, vcpu);
+			kvmppc_remove_runnable(vc, vcpu, mftb());
 			wake_up(&vcpu->arch.cpu_run);
 		}
 		goto out;
@@ -3676,7 +3678,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		pvc->pcpu = pcpu + thr;
 		for_each_runnable_thread(i, vcpu, pvc) {
 			kvmppc_start_thread(vcpu, pvc);
-			kvmppc_create_dtl_entry(vcpu, pvc);
+			kvmppc_create_dtl_entry(vcpu, pvc, mftb());
 			trace_kvm_guest_enter(vcpu);
 			if (!vcpu->arch.ptid)
 				thr0_done = true;
@@ -4138,20 +4140,17 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
  * Guest entry for POWER9 and later CPUs.
  */
 static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
-			 unsigned long lpcr)
+			 unsigned long lpcr, u64 *tb)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	struct p9_host_os_sprs host_os_sprs;
 	s64 dec;
-	u64 tb, next_timer;
+	u64 next_timer;
 	unsigned long msr;
 	int trap;
 
-	WARN_ON_ONCE(vcpu->arch.ceded);
-
-	tb = mftb();
 	next_timer = timer_get_next_tb();
-	if (tb >= next_timer)
+	if (*tb >= next_timer)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 	if (next_timer < time_limit)
 		time_limit = next_timer;
@@ -4248,7 +4247,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		 *
 		 * XXX: Another day's problem.
 		 */
-		mtspr(SPRN_DEC, kvmppc_dec_expires_host_tb(vcpu) - tb);
+		mtspr(SPRN_DEC, kvmppc_dec_expires_host_tb(vcpu) - *tb);
 
 		mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 		mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
@@ -4264,8 +4263,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		dec = mfspr(SPRN_DEC);
 		if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 			dec = (s32) dec;
-		tb = mftb();
-		vcpu->arch.dec_expires = dec + (tb + vc->tb_offset);
+		*tb = mftb();
+		vcpu->arch.dec_expires = dec + (*tb + vc->tb_offset);
 
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
@@ -4277,7 +4276,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	} else {
 		kvmppc_xive_push_vcpu(vcpu);
-		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr);
+		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr, tb);
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
@@ -4308,6 +4307,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	store_spr_state(vcpu);
 
+	timer_rearm_host_dec(*tb);
+
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
 
 	store_fp_state(&vcpu->arch.fp);
@@ -4327,8 +4328,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	timer_rearm_host_dec(tb);
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
@@ -4570,7 +4569,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		if ((vc->vcore_state == VCORE_PIGGYBACK ||
 		     vc->vcore_state == VCORE_RUNNING) &&
 			   !VCORE_IS_EXITING(vc)) {
-			kvmppc_create_dtl_entry(vcpu, vc);
+			kvmppc_create_dtl_entry(vcpu, vc, mftb());
 			kvmppc_start_thread(vcpu, vc);
 			trace_kvm_guest_enter(vcpu);
 		} else if (vc->vcore_state == VCORE_SLEEPING) {
@@ -4605,7 +4604,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		for_each_runnable_thread(i, v, vc) {
 			kvmppc_core_prepare_to_enter(v);
 			if (signal_pending(v->arch.run_task)) {
-				kvmppc_remove_runnable(vc, v);
+				kvmppc_remove_runnable(vc, v, mftb());
 				v->stat.signal_exits++;
 				v->run->exit_reason = KVM_EXIT_INTR;
 				v->arch.ret = -EINTR;
@@ -4646,7 +4645,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		kvmppc_vcore_end_preempt(vc);
 
 	if (vcpu->arch.state == KVMPPC_VCPU_RUNNABLE) {
-		kvmppc_remove_runnable(vc, vcpu);
+		kvmppc_remove_runnable(vc, vcpu, mftb());
 		vcpu->stat.signal_exits++;
 		run->exit_reason = KVM_EXIT_INTR;
 		vcpu->arch.ret = -EINTR;
@@ -4674,6 +4673,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	unsigned long flags;
+	u64 tb;
 
 	trace_kvmppc_run_vcpu_enter(vcpu);
 
@@ -4684,7 +4684,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc = vcpu->arch.vcore;
 	vcpu->arch.ceded = 0;
 	vcpu->arch.run_task = current;
-	vcpu->arch.stolen_logged = vcore_stolen_time(vc, mftb());
 	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
 	vcpu->arch.busy_preempt = TB_NIL;
 	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
@@ -4709,7 +4708,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	kvmppc_update_vpas(vcpu);
 
 	init_vcore_to_run(vc);
-	vc->preempt_tb = TB_NIL;
 
 	preempt_disable();
 	pcpu = smp_processor_id();
@@ -4719,6 +4717,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	/* flags save not required, but irq_pmu has no disable/enable API */
 	powerpc_local_irq_pmu_save(flags);
+
 	if (signal_pending(current))
 		goto sigpend;
 	if (need_resched() || !kvm->arch.mmu_ready)
@@ -4741,12 +4740,17 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 		goto out;
 	}
 
+	tb = mftb();
+
+	vcpu->arch.stolen_logged = vcore_stolen_time(vc, tb);
+	vc->preempt_tb = TB_NIL;
+
 	kvmppc_clear_host_core(pcpu);
 
 	local_paca->kvm_hstate.napping = 0;
 	local_paca->kvm_hstate.kvm_split_mode = NULL;
 	kvmppc_start_thread(vcpu, vc);
-	kvmppc_create_dtl_entry(vcpu, vc);
+	kvmppc_create_dtl_entry(vcpu, vc, tb);
 	trace_kvm_guest_enter(vcpu);
 
 	vc->vcore_state = VCORE_RUNNING;
@@ -4761,7 +4765,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	/* Tell lockdep that we're about to enable interrupts */
 	trace_hardirqs_on();
 
-	trap = kvmhv_p9_guest_entry(vcpu, time_limit, lpcr);
+	trap = kvmhv_p9_guest_entry(vcpu, time_limit, lpcr, &tb);
 	vcpu->arch.trap = trap;
 
 	trace_hardirqs_off();
@@ -4790,7 +4794,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	 * by L2 and the L1 decrementer is provided in hdec_expires
 	 */
 	if (kvmppc_core_pending_dec(vcpu) &&
-			((get_tb() < kvmppc_dec_expires_host_tb(vcpu)) ||
+			((tb < kvmppc_dec_expires_host_tb(vcpu)) ||
 			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
 			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
 		kvmppc_core_dequeue_dec(vcpu);
@@ -4826,7 +4830,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	trace_kvmppc_run_core(vc, 1);
 
  done:
-	kvmppc_remove_runnable(vc, vcpu);
+	kvmppc_remove_runnable(vc, vcpu, tb);
 	trace_kvmppc_run_vcpu_exit(vcpu);
 
 	return vcpu->arch.ret;
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index e7793bb806eb..2bd96d8256d1 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -183,13 +183,13 @@ static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
 	}
 }
 
-int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr)
+int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	s64 hdec, dec;
-	u64 tb, purr, spurr;
+	u64 purr, spurr;
 	u64 *exsave;
 	bool ri_set;
 	int trap;
@@ -203,8 +203,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	unsigned long host_dawr1;
 	unsigned long host_dawrx1;
 
-	tb = mftb();
-	hdec = time_limit - tb;
+	hdec = time_limit - *tb;
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
@@ -230,11 +229,13 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	}
 
 	if (vc->tb_offset) {
-		u64 new_tb = tb + vc->tb_offset;
+		u64 new_tb = *tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
-		tb = mftb();
-		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-			mtspr(SPRN_TBU40, new_tb + 0x1000000);
+		if ((mftb() & 0xffffff) < (new_tb & 0xffffff)) {
+			new_tb += 0x1000000;
+			mtspr(SPRN_TBU40, new_tb);
+		}
+		*tb = new_tb;
 		vc->tb_offset_applied = vc->tb_offset;
 	}
 
@@ -317,7 +318,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - *tb);
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 tm_return_to_guest:
@@ -466,15 +467,17 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	dec = mfspr(SPRN_DEC);
 	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 		dec = (s32) dec;
-	tb = mftb();
-	vcpu->arch.dec_expires = dec + tb;
+	*tb = mftb();
+	vcpu->arch.dec_expires = dec + *tb;
 
 	if (vc->tb_offset_applied) {
-		u64 new_tb = tb - vc->tb_offset_applied;
+		u64 new_tb = *tb - vc->tb_offset_applied;
 		mtspr(SPRN_TBU40, new_tb);
-		tb = mftb();
-		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-			mtspr(SPRN_TBU40, new_tb + 0x1000000);
+		if ((mftb() & 0xffffff) < (new_tb & 0xffffff)) {
+			new_tb += 0x1000000;
+			mtspr(SPRN_TBU40, new_tb);
+		}
+		*tb = new_tb;
 		vc->tb_offset_applied = 0;
 	}
 
-- 
2.23.0

