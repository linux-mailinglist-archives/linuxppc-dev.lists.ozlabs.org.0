Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD0459FC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:08:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0G53J1yz3dg3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:08:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EHpytgl3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EHpytgl3; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzwy0B03z3bY9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:38 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id o4so18906576pfp.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FfvWgGgg0IGdII+JElwT/1xaysU7INkY5b441FSqv8U=;
 b=EHpytgl3besFpeJ+Cu2SRHO8sLP1aCagG6TlYmoSEGfySGgUhN9pKJJhFsji+9WOgX
 YISGPBoQ2Ss4UtiAar68Zv7f8VHyGpc1i4Q3rC3zqTl4A3jbWE2SQ4xlSmyHf8WV0NI1
 8SkQuKVOrjNVYOIOhJBL3j2fYsCnWZGPCp/j7bHhROdkgD5F7szurju76G5SzVu7/1bH
 4jWbn7205q9AGRdYlCy8y6jy+B6WbirlUiKBPAVZP/jPCkcHKENso1msmW8TEU5jzrzL
 UcKO1DAyq1n17a73Bf7g4pMRu28L2Mv0+YhMtVCbmsgYcIuP5VF5HTbkslUCslgHlGZZ
 7UVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FfvWgGgg0IGdII+JElwT/1xaysU7INkY5b441FSqv8U=;
 b=NW48IJCO+V/d7HRbLoa8vYbEoocnlTIzUWXv6r77qm5yNbUzC5RCM0uWWUfFT2rOzl
 L7NyA8yGjchawMgpyeASfQtGXFPjA096mCx3UxzzVqNeFAFK3IZnT9kMFSJEVlov6dM5
 co/anyyG8KPWOnBBGBvHcYfRo7M7qVay1ydrcoGgPEF/+/SpHK9d6RXs2TZ3Pr+xuI/k
 ghriB3LhKdiqSki5r93oGwrzefKGgE4RBf78+VGYx4PRXgME7nIdiVtgX+3HH+sRI/2t
 hEBGPTiTUC7oVb678Dlv1GB6nnmA+340HPdSr4Wo0OwM9OAvmd/A99815p/xta5zSuwk
 sNOg==
X-Gm-Message-State: AOAM531Vs2f3cVQEfFH6MV0+/i2HnxrdLnJ3bdSoXlrlaFa2o5QjHWju
 WEkHAMuNsDgQrPs0qS+QZEoNnCA0MP/spw==
X-Google-Smtp-Source: ABdhPJygO1+lb4B2aHITqt7MkCiPB2a/fGVfxqlMPp2A5UDhVLD5mtosBZx42thzyHC25SLZIau7Gw==
X-Received: by 2002:a63:481d:: with SMTP id v29mr2839247pga.209.1637661216195; 
 Tue, 23 Nov 2021 01:53:36 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:35 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 24/53] KVM: PPC: Book3S HV P9: Optimise timebase reads
Date: Tue, 23 Nov 2021 19:52:02 +1000
Message-Id: <20211123095231.1036501-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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

Reduce the number of mfTB executed by passing the current timebase
around entry and exit code rather than read it multiple times.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |  2 +-
 arch/powerpc/kvm/book3s_hv.c             | 88 +++++++++++++-----------
 arch/powerpc/kvm/book3s_hv_p9_entry.c    | 33 +++++----
 3 files changed, 65 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index fff391b9b97b..0a319ed9c2fd 100644
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
index bc4afec760ca..3a9447f75a9e 100644
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
@@ -2914,14 +2916,14 @@ static void kvmppc_set_timer(struct kvm_vcpu *vcpu)
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
@@ -3172,14 +3174,14 @@ static void kvmppc_vcore_preempt(struct kvmppc_vcore *vc)
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
@@ -3306,7 +3308,7 @@ static void prepare_threads(struct kvmppc_vcore *vc)
 			vcpu->arch.ret = RESUME_GUEST;
 		else
 			continue;
-		kvmppc_remove_runnable(vc, vcpu);
+		kvmppc_remove_runnable(vc, vcpu, mftb());
 		wake_up(&vcpu->arch.cpu_run);
 	}
 }
@@ -3325,7 +3327,7 @@ static void collect_piggybacks(struct core_info *cip, int target_threads)
 			list_del_init(&pvc->preempt_list);
 			if (pvc->runner == NULL) {
 				pvc->vcore_state = VCORE_INACTIVE;
-				kvmppc_core_end_stolen(pvc);
+				kvmppc_core_end_stolen(pvc, mftb());
 			}
 			spin_unlock(&pvc->lock);
 			continue;
@@ -3334,7 +3336,7 @@ static void collect_piggybacks(struct core_info *cip, int target_threads)
 			spin_unlock(&pvc->lock);
 			continue;
 		}
-		kvmppc_core_end_stolen(pvc);
+		kvmppc_core_end_stolen(pvc, mftb());
 		pvc->vcore_state = VCORE_PIGGYBACK;
 		if (cip->total_threads >= target_threads)
 			break;
@@ -3401,7 +3403,7 @@ static void post_guest_process(struct kvmppc_vcore *vc, bool is_master)
 			else
 				++still_running;
 		} else {
-			kvmppc_remove_runnable(vc, vcpu);
+			kvmppc_remove_runnable(vc, vcpu, mftb());
 			wake_up(&vcpu->arch.cpu_run);
 		}
 	}
@@ -3410,7 +3412,7 @@ static void post_guest_process(struct kvmppc_vcore *vc, bool is_master)
 			kvmppc_vcore_preempt(vc);
 		} else if (vc->runner) {
 			vc->vcore_state = VCORE_PREEMPT;
-			kvmppc_core_start_stolen(vc);
+			kvmppc_core_start_stolen(vc, mftb());
 		} else {
 			vc->vcore_state = VCORE_INACTIVE;
 		}
@@ -3541,7 +3543,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	    ((vc->num_threads > threads_per_subcore) || !on_primary_thread())) {
 		for_each_runnable_thread(i, vcpu, vc) {
 			vcpu->arch.ret = -EBUSY;
-			kvmppc_remove_runnable(vc, vcpu);
+			kvmppc_remove_runnable(vc, vcpu, mftb());
 			wake_up(&vcpu->arch.cpu_run);
 		}
 		goto out;
@@ -3673,7 +3675,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		pvc->pcpu = pcpu + thr;
 		for_each_runnable_thread(i, vcpu, pvc) {
 			kvmppc_start_thread(vcpu, pvc);
-			kvmppc_create_dtl_entry(vcpu, pvc);
+			kvmppc_create_dtl_entry(vcpu, pvc, mftb());
 			trace_kvm_guest_enter(vcpu);
 			if (!vcpu->arch.ptid)
 				thr0_done = true;
@@ -4152,20 +4154,17 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
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
@@ -4262,7 +4261,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		 *
 		 * XXX: Another day's problem.
 		 */
-		mtspr(SPRN_DEC, kvmppc_dec_expires_host_tb(vcpu) - tb);
+		mtspr(SPRN_DEC, kvmppc_dec_expires_host_tb(vcpu) - *tb);
 
 		mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 		mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
@@ -4278,8 +4277,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		dec = mfspr(SPRN_DEC);
 		if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 			dec = (s32) dec;
-		tb = mftb();
-		vcpu->arch.dec_expires = dec + (tb + vc->tb_offset);
+		*tb = mftb();
+		vcpu->arch.dec_expires = dec + (*tb + vc->tb_offset);
 
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
@@ -4291,7 +4290,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	} else {
 		kvmppc_xive_push_vcpu(vcpu);
-		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr);
+		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr, tb);
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
@@ -4322,6 +4321,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	store_spr_state(vcpu);
 
+	timer_rearm_host_dec(*tb);
+
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
 
 	store_fp_state(&vcpu->arch.fp);
@@ -4341,8 +4342,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	timer_rearm_host_dec(tb);
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
@@ -4596,7 +4595,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		if ((vc->vcore_state == VCORE_PIGGYBACK ||
 		     vc->vcore_state == VCORE_RUNNING) &&
 			   !VCORE_IS_EXITING(vc)) {
-			kvmppc_create_dtl_entry(vcpu, vc);
+			kvmppc_create_dtl_entry(vcpu, vc, mftb());
 			kvmppc_start_thread(vcpu, vc);
 			trace_kvm_guest_enter(vcpu);
 		} else if (vc->vcore_state == VCORE_SLEEPING) {
@@ -4631,7 +4630,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		for_each_runnable_thread(i, v, vc) {
 			kvmppc_core_prepare_to_enter(v);
 			if (signal_pending(v->arch.run_task)) {
-				kvmppc_remove_runnable(vc, v);
+				kvmppc_remove_runnable(vc, v, mftb());
 				v->stat.signal_exits++;
 				v->run->exit_reason = KVM_EXIT_INTR;
 				v->arch.ret = -EINTR;
@@ -4672,7 +4671,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		kvmppc_vcore_end_preempt(vc);
 
 	if (vcpu->arch.state == KVMPPC_VCPU_RUNNABLE) {
-		kvmppc_remove_runnable(vc, vcpu);
+		kvmppc_remove_runnable(vc, vcpu, mftb());
 		vcpu->stat.signal_exits++;
 		run->exit_reason = KVM_EXIT_INTR;
 		vcpu->arch.ret = -EINTR;
@@ -4700,6 +4699,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	unsigned long flags;
+	u64 tb;
 
 	trace_kvmppc_run_vcpu_enter(vcpu);
 
@@ -4710,7 +4710,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc = vcpu->arch.vcore;
 	vcpu->arch.ceded = 0;
 	vcpu->arch.run_task = current;
-	vcpu->arch.stolen_logged = vcore_stolen_time(vc, mftb());
 	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
 	vcpu->arch.busy_preempt = TB_NIL;
 	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
@@ -4735,7 +4734,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	kvmppc_update_vpas(vcpu);
 
 	init_vcore_to_run(vc);
-	vc->preempt_tb = TB_NIL;
 
 	preempt_disable();
 	pcpu = smp_processor_id();
@@ -4745,6 +4743,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	/* flags save not required, but irq_pmu has no disable/enable API */
 	powerpc_local_irq_pmu_save(flags);
+
 	if (signal_pending(current))
 		goto sigpend;
 	if (need_resched() || !kvm->arch.mmu_ready)
@@ -4767,12 +4766,17 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4787,7 +4791,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	/* Tell lockdep that we're about to enable interrupts */
 	trace_hardirqs_on();
 
-	trap = kvmhv_p9_guest_entry(vcpu, time_limit, lpcr);
+	trap = kvmhv_p9_guest_entry(vcpu, time_limit, lpcr, &tb);
 	vcpu->arch.trap = trap;
 
 	trace_hardirqs_off();
@@ -4829,7 +4833,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	 * by L2 and the L1 decrementer is provided in hdec_expires
 	 */
 	if (kvmppc_core_pending_dec(vcpu) &&
-			((get_tb() < kvmppc_dec_expires_host_tb(vcpu)) ||
+			((tb < kvmppc_dec_expires_host_tb(vcpu)) ||
 			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
 			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
 		kvmppc_core_dequeue_dec(vcpu);
@@ -4865,7 +4869,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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

