Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D8E3B0266
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:07:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Nsp4vFVz3fm1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:07:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rC+xXcF1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rC+xXcF1; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NgK5nKNz3c0F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:53 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id bb20so7682843pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gPBy6stdE0DYC92rv1ssD7iGMbxhgUzypj1XuAJ3iY=;
 b=rC+xXcF1VXkh14YvaNy/jlPancr8M6227aWefc319r95OK3gmZNPXEDoBIsFOg0UDR
 rdIifTv7PfIHxziZnl2mCTZeJMEThawchaLIijUWBm66qYlneRkq19m2k++ulOPenA6M
 tCWmqKt1mt5QVJSZ1Lwd7lwfutZZSpLlltVLPhaWa8Zd+mFr+UW14HZbl+ySLmQsZr2b
 ZfD+H0zhqOQHlhSYIygEk+2LqyCy3deVpCAc5cj8mXHBveRojKHrefNQdUqELVgqhmXw
 R0EII2nuL2EzGXiGBLn7cU9rcYD2Gqrl3kWfE2Sa12sR9GeF0WtigRrklAxoSYJmbyBd
 weZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gPBy6stdE0DYC92rv1ssD7iGMbxhgUzypj1XuAJ3iY=;
 b=DM70bB8Kthra79uHImMlAzwNW9CPB3BMSZJ8jiI0mh9nBM/EcauGEFEAwy4cdRayTX
 D1+9MAKY6a65TwsFDtKEyWdhf3mm8CxKXYdEZmLjjkSrWwBNJAcuLQYZjOFrey/XK0SP
 NZWoYO/xn5OzrqgZhoa8ptPjTgu1hKT5biyF46IExEAgis7JHBzEd39U5OtPQpm9CRFH
 7iJ08gYjDJh/2k+u7j5NGiSY/6W+P9oENKXKfr4mzLtbBNq+p6fwoIoo2j5K5QMSAGIG
 GjJua6pPnREiVZYfUM4Lfi8jzxAEN8lbS5CY2EErFLxcGAytNoAvFDxBoEDX10gdKwaI
 kEIQ==
X-Gm-Message-State: AOAM532mJYI07B/O1zO6IgVJqHPcSGXrHxVkF7ejpeCN34wGxKqVRzMA
 QGY+RsLNztxZDOXuS0TdMCYGz6/iBoY=
X-Google-Smtp-Source: ABdhPJwuxtG/maS0qMb9F2UqUP6sRW96b/IZqN832IFOcxR/9iBe2rwLmxV0eGaZR/vAExuIX12F/Q==
X-Received: by 2002:a17:90a:7025:: with SMTP id
 f34mr3296243pjk.95.1624359530948; 
 Tue, 22 Jun 2021 03:58:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 22/43] KVM: PPC: Book3S HV P9: Optimise timebase reads
Date: Tue, 22 Jun 2021 20:57:15 +1000
Message-Id: <20210622105736.633352-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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

-213 cycles (7578) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |  2 +-
 arch/powerpc/kvm/book3s_hv.c             | 88 +++++++++++++-----------
 arch/powerpc/kvm/book3s_hv_p9_entry.c    | 33 +++++----
 3 files changed, 65 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index eaf3a562bf1e..f8a0ed90b853 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -153,7 +153,7 @@ static inline bool kvmhv_vcpu_is_radix(struct kvm_vcpu *vcpu)
 	return radix;
 }
 
-int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr);
+int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb);
 
 #define KVM_DEFAULT_HPT_ORDER	24	/* 16MB HPT by default */
 #endif
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 218dacd78e25..99b19f4e7ed7 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -275,22 +275,22 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
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
@@ -300,6 +300,7 @@ static void kvmppc_core_vcpu_load_hv(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	unsigned long flags;
+	u64 now = mftb();
 
 	/*
 	 * We can test vc->runner without taking the vcore lock,
@@ -308,12 +309,12 @@ static void kvmppc_core_vcpu_load_hv(struct kvm_vcpu *vcpu, int cpu)
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
@@ -323,13 +324,14 @@ static void kvmppc_core_vcpu_put_hv(struct kvm_vcpu *vcpu)
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
 
@@ -684,7 +686,7 @@ static u64 vcore_stolen_time(struct kvmppc_vcore *vc, u64 now)
 }
 
 static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
-				    struct kvmppc_vcore *vc)
+				    struct kvmppc_vcore *vc, u64 tb)
 {
 	struct dtl_entry *dt;
 	struct lppaca *vpa;
@@ -695,7 +697,7 @@ static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
 
 	dt = vcpu->arch.dtl_ptr;
 	vpa = vcpu->arch.vpa.pinned_addr;
-	now = mftb();
+	now = tb;
 	core_stolen = vcore_stolen_time(vc, now);
 	stolen = core_stolen - vcpu->arch.stolen_logged;
 	vcpu->arch.stolen_logged = core_stolen;
@@ -2792,14 +2794,14 @@ static void kvmppc_set_timer(struct kvm_vcpu *vcpu)
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
@@ -3050,14 +3052,14 @@ static void kvmppc_vcore_preempt(struct kvmppc_vcore *vc)
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
@@ -3184,7 +3186,7 @@ static void prepare_threads(struct kvmppc_vcore *vc)
 			vcpu->arch.ret = RESUME_GUEST;
 		else
 			continue;
-		kvmppc_remove_runnable(vc, vcpu);
+		kvmppc_remove_runnable(vc, vcpu, mftb());
 		wake_up(&vcpu->arch.cpu_run);
 	}
 }
@@ -3203,7 +3205,7 @@ static void collect_piggybacks(struct core_info *cip, int target_threads)
 			list_del_init(&pvc->preempt_list);
 			if (pvc->runner == NULL) {
 				pvc->vcore_state = VCORE_INACTIVE;
-				kvmppc_core_end_stolen(pvc);
+				kvmppc_core_end_stolen(pvc, mftb());
 			}
 			spin_unlock(&pvc->lock);
 			continue;
@@ -3212,7 +3214,7 @@ static void collect_piggybacks(struct core_info *cip, int target_threads)
 			spin_unlock(&pvc->lock);
 			continue;
 		}
-		kvmppc_core_end_stolen(pvc);
+		kvmppc_core_end_stolen(pvc, mftb());
 		pvc->vcore_state = VCORE_PIGGYBACK;
 		if (cip->total_threads >= target_threads)
 			break;
@@ -3279,7 +3281,7 @@ static void post_guest_process(struct kvmppc_vcore *vc, bool is_master)
 			else
 				++still_running;
 		} else {
-			kvmppc_remove_runnable(vc, vcpu);
+			kvmppc_remove_runnable(vc, vcpu, mftb());
 			wake_up(&vcpu->arch.cpu_run);
 		}
 	}
@@ -3288,7 +3290,7 @@ static void post_guest_process(struct kvmppc_vcore *vc, bool is_master)
 			kvmppc_vcore_preempt(vc);
 		} else if (vc->runner) {
 			vc->vcore_state = VCORE_PREEMPT;
-			kvmppc_core_start_stolen(vc);
+			kvmppc_core_start_stolen(vc, mftb());
 		} else {
 			vc->vcore_state = VCORE_INACTIVE;
 		}
@@ -3419,7 +3421,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	    ((vc->num_threads > threads_per_subcore) || !on_primary_thread())) {
 		for_each_runnable_thread(i, vcpu, vc) {
 			vcpu->arch.ret = -EBUSY;
-			kvmppc_remove_runnable(vc, vcpu);
+			kvmppc_remove_runnable(vc, vcpu, mftb());
 			wake_up(&vcpu->arch.cpu_run);
 		}
 		goto out;
@@ -3551,7 +3553,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		pvc->pcpu = pcpu + thr;
 		for_each_runnable_thread(i, vcpu, pvc) {
 			kvmppc_start_thread(vcpu, pvc);
-			kvmppc_create_dtl_entry(vcpu, pvc);
+			kvmppc_create_dtl_entry(vcpu, pvc, mftb());
 			trace_kvm_guest_enter(vcpu);
 			if (!vcpu->arch.ptid)
 				thr0_done = true;
@@ -3998,20 +4000,17 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
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
@@ -4106,7 +4105,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		 *
 		 * XXX: Another day's problem.
 		 */
-		mtspr(SPRN_DEC, kvmppc_dec_expires_host_tb(vcpu) - tb);
+		mtspr(SPRN_DEC, kvmppc_dec_expires_host_tb(vcpu) - *tb);
 
 		mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 		mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
@@ -4122,8 +4121,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		dec = mfspr(SPRN_DEC);
 		if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 			dec = (s32) dec;
-		tb = mftb();
-		vcpu->arch.dec_expires = dec + (tb + vc->tb_offset);
+		*tb = mftb();
+		vcpu->arch.dec_expires = dec + (*tb + vc->tb_offset);
 
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
@@ -4135,7 +4134,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	} else {
 		kvmppc_xive_push_vcpu(vcpu);
-		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr);
+		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr, tb);
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
@@ -4166,6 +4165,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	store_spr_state(vcpu);
 
+	timer_rearm_host_dec(*tb);
+
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
 
 	store_fp_state(&vcpu->arch.fp);
@@ -4185,8 +4186,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	timer_rearm_host_dec(tb);
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
@@ -4428,7 +4427,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		if ((vc->vcore_state == VCORE_PIGGYBACK ||
 		     vc->vcore_state == VCORE_RUNNING) &&
 			   !VCORE_IS_EXITING(vc)) {
-			kvmppc_create_dtl_entry(vcpu, vc);
+			kvmppc_create_dtl_entry(vcpu, vc, mftb());
 			kvmppc_start_thread(vcpu, vc);
 			trace_kvm_guest_enter(vcpu);
 		} else if (vc->vcore_state == VCORE_SLEEPING) {
@@ -4463,7 +4462,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		for_each_runnable_thread(i, v, vc) {
 			kvmppc_core_prepare_to_enter(v);
 			if (signal_pending(v->arch.run_task)) {
-				kvmppc_remove_runnable(vc, v);
+				kvmppc_remove_runnable(vc, v, mftb());
 				v->stat.signal_exits++;
 				v->run->exit_reason = KVM_EXIT_INTR;
 				v->arch.ret = -EINTR;
@@ -4504,7 +4503,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		kvmppc_vcore_end_preempt(vc);
 
 	if (vcpu->arch.state == KVMPPC_VCPU_RUNNABLE) {
-		kvmppc_remove_runnable(vc, vcpu);
+		kvmppc_remove_runnable(vc, vcpu, mftb());
 		vcpu->stat.signal_exits++;
 		run->exit_reason = KVM_EXIT_INTR;
 		vcpu->arch.ret = -EINTR;
@@ -4532,6 +4531,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	unsigned long flags;
+	u64 tb;
 
 	trace_kvmppc_run_vcpu_enter(vcpu);
 
@@ -4542,7 +4542,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc = vcpu->arch.vcore;
 	vcpu->arch.ceded = 0;
 	vcpu->arch.run_task = current;
-	vcpu->arch.stolen_logged = vcore_stolen_time(vc, mftb());
 	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
 	vcpu->arch.busy_preempt = TB_NIL;
 	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
@@ -4567,7 +4566,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	kvmppc_update_vpas(vcpu);
 
 	init_vcore_to_run(vc);
-	vc->preempt_tb = TB_NIL;
 
 	preempt_disable();
 	pcpu = smp_processor_id();
@@ -4577,6 +4575,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	/* flags save not required, but irq_pmu has no disable/enable API */
 	powerpc_local_irq_pmu_save(flags);
+
 	if (signal_pending(current))
 		goto sigpend;
 	if (need_resched() || !kvm->arch.mmu_ready)
@@ -4599,12 +4598,17 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4619,7 +4623,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	/* Tell lockdep that we're about to enable interrupts */
 	trace_hardirqs_on();
 
-	trap = kvmhv_p9_guest_entry(vcpu, time_limit, lpcr);
+	trap = kvmhv_p9_guest_entry(vcpu, time_limit, lpcr, &tb);
 	vcpu->arch.trap = trap;
 
 	trace_hardirqs_off();
@@ -4648,7 +4652,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	 * by L2 and the L1 decrementer is provided in hdec_expires
 	 */
 	if (kvmppc_core_pending_dec(vcpu) &&
-			((get_tb() < kvmppc_dec_expires_host_tb(vcpu)) ||
+			((tb < kvmppc_dec_expires_host_tb(vcpu)) ||
 			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
 			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
 		kvmppc_core_dequeue_dec(vcpu);
@@ -4684,7 +4688,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	trace_kvmppc_run_core(vc, 1);
 
  done:
-	kvmppc_remove_runnable(vc, vcpu);
+	kvmppc_remove_runnable(vc, vcpu, tb);
 	trace_kvmppc_run_vcpu_exit(vcpu);
 
 	return vcpu->arch.ret;
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 44ee805875ba..237ea1ef1eab 100644
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
 
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
@@ -451,15 +452,17 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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

