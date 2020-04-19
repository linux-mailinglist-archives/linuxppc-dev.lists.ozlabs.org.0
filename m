Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EFE1AF889
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 09:53:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494hsq2WJgzDr1X
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 17:53:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133;
 helo=out30-133.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494hpv4LsQzDqws
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 17:51:19 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04427;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0Tvyj7vB_1587282668; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0Tvyj7vB_1587282668) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 19 Apr 2020 15:51:08 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: pbonzini@redhat.com, tsbogend@alpha.franken.de, paulus@ozlabs.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 heiko.carstens@de.ibm.com, gor@linux.ibm.com,
 sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
Subject: [PATCH 1/7] KVM: s390: clean up redundant 'kvm_run' parameters
Date: Sun, 19 Apr 2020 15:51:00 +0800
Message-Id: <20200419075106.16248-2-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200419075106.16248-1-tianjia.zhang@linux.alibaba.com>
References: <20200419075106.16248-1-tianjia.zhang@linux.alibaba.com>
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
Cc: linux-s390@vger.kernel.org, tianjia.zhang@linux.alibaba.com,
 kvm@vger.kernel.org, linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
structure. Earlier than historical reasons, many kvm-related function
parameters retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time.
This patch does a unified cleanup of these remaining redundant parameters.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 arch/s390/kvm/kvm-s390.c | 127 +++++++++++++++++++++------------------
 1 file changed, 67 insertions(+), 60 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 443af3ead739..cf420d013ba3 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -4173,24 +4173,25 @@ static int __vcpu_run(struct kvm_vcpu *vcpu)
 	return rc;
 }
 
-static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
+static void sync_regs_fmt2(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	struct runtime_instr_cb *riccb;
 	struct gs_cb *gscb;
 
-	riccb = (struct runtime_instr_cb *) &kvm_run->s.regs.riccb;
-	gscb = (struct gs_cb *) &kvm_run->s.regs.gscb;
-	vcpu->arch.sie_block->gpsw.mask = kvm_run->psw_mask;
-	vcpu->arch.sie_block->gpsw.addr = kvm_run->psw_addr;
-	if (kvm_run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
-		vcpu->arch.sie_block->todpr = kvm_run->s.regs.todpr;
-		vcpu->arch.sie_block->pp = kvm_run->s.regs.pp;
-		vcpu->arch.sie_block->gbea = kvm_run->s.regs.gbea;
-	}
-	if (kvm_run->kvm_dirty_regs & KVM_SYNC_PFAULT) {
-		vcpu->arch.pfault_token = kvm_run->s.regs.pft;
-		vcpu->arch.pfault_select = kvm_run->s.regs.pfs;
-		vcpu->arch.pfault_compare = kvm_run->s.regs.pfc;
+	riccb = (struct runtime_instr_cb *) &run->s.regs.riccb;
+	gscb = (struct gs_cb *) &run->s.regs.gscb;
+	vcpu->arch.sie_block->gpsw.mask = run->psw_mask;
+	vcpu->arch.sie_block->gpsw.addr = run->psw_addr;
+	if (run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
+		vcpu->arch.sie_block->todpr = run->s.regs.todpr;
+		vcpu->arch.sie_block->pp = run->s.regs.pp;
+		vcpu->arch.sie_block->gbea = run->s.regs.gbea;
+	}
+	if (run->kvm_dirty_regs & KVM_SYNC_PFAULT) {
+		vcpu->arch.pfault_token = run->s.regs.pft;
+		vcpu->arch.pfault_select = run->s.regs.pfs;
+		vcpu->arch.pfault_compare = run->s.regs.pfc;
 		if (vcpu->arch.pfault_token == KVM_S390_PFAULT_TOKEN_INVALID)
 			kvm_clear_async_pf_completion_queue(vcpu);
 	}
@@ -4198,7 +4199,7 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
 	 * If userspace sets the riccb (e.g. after migration) to a valid state,
 	 * we should enable RI here instead of doing the lazy enablement.
 	 */
-	if ((kvm_run->kvm_dirty_regs & KVM_SYNC_RICCB) &&
+	if ((run->kvm_dirty_regs & KVM_SYNC_RICCB) &&
 	    test_kvm_facility(vcpu->kvm, 64) &&
 	    riccb->v &&
 	    !(vcpu->arch.sie_block->ecb3 & ECB3_RI)) {
@@ -4209,7 +4210,7 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
 	 * If userspace sets the gscb (e.g. after migration) to non-zero,
 	 * we should enable GS here instead of doing the lazy enablement.
 	 */
-	if ((kvm_run->kvm_dirty_regs & KVM_SYNC_GSCB) &&
+	if ((run->kvm_dirty_regs & KVM_SYNC_GSCB) &&
 	    test_kvm_facility(vcpu->kvm, 133) &&
 	    gscb->gssm &&
 	    !vcpu->arch.gs_enabled) {
@@ -4218,10 +4219,10 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
 		vcpu->arch.sie_block->ecd |= ECD_HOSTREGMGMT;
 		vcpu->arch.gs_enabled = 1;
 	}
-	if ((kvm_run->kvm_dirty_regs & KVM_SYNC_BPBC) &&
+	if ((run->kvm_dirty_regs & KVM_SYNC_BPBC) &&
 	    test_kvm_facility(vcpu->kvm, 82)) {
 		vcpu->arch.sie_block->fpf &= ~FPF_BPBC;
-		vcpu->arch.sie_block->fpf |= kvm_run->s.regs.bpbc ? FPF_BPBC : 0;
+		vcpu->arch.sie_block->fpf |= run->s.regs.bpbc ? FPF_BPBC : 0;
 	}
 	if (MACHINE_HAS_GS) {
 		preempt_disable();
@@ -4232,45 +4233,47 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
 		}
 		if (vcpu->arch.gs_enabled) {
 			current->thread.gs_cb = (struct gs_cb *)
-						&vcpu->run->s.regs.gscb;
+						&run->s.regs.gscb;
 			restore_gs_cb(current->thread.gs_cb);
 		}
 		preempt_enable();
 	}
-	/* SIE will load etoken directly from SDNX and therefore kvm_run */
+	/* SIE will load etoken directly from SDNX and therefore run */
 }
 
-static void sync_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
+static void sync_regs(struct kvm_vcpu *vcpu)
 {
-	if (kvm_run->kvm_dirty_regs & KVM_SYNC_PREFIX)
-		kvm_s390_set_prefix(vcpu, kvm_run->s.regs.prefix);
-	if (kvm_run->kvm_dirty_regs & KVM_SYNC_CRS) {
-		memcpy(&vcpu->arch.sie_block->gcr, &kvm_run->s.regs.crs, 128);
+	struct kvm_run *run = vcpu->run;
+
+	if (run->kvm_dirty_regs & KVM_SYNC_PREFIX)
+		kvm_s390_set_prefix(vcpu, run->s.regs.prefix);
+	if (run->kvm_dirty_regs & KVM_SYNC_CRS) {
+		memcpy(&vcpu->arch.sie_block->gcr, &run->s.regs.crs, 128);
 		/* some control register changes require a tlb flush */
 		kvm_make_request(KVM_REQ_TLB_FLUSH, vcpu);
 	}
-	if (kvm_run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
-		kvm_s390_set_cpu_timer(vcpu, kvm_run->s.regs.cputm);
-		vcpu->arch.sie_block->ckc = kvm_run->s.regs.ckc;
+	if (run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
+		kvm_s390_set_cpu_timer(vcpu, run->s.regs.cputm);
+		vcpu->arch.sie_block->ckc = run->s.regs.ckc;
 	}
 	save_access_regs(vcpu->arch.host_acrs);
-	restore_access_regs(vcpu->run->s.regs.acrs);
+	restore_access_regs(run->s.regs.acrs);
 	/* save host (userspace) fprs/vrs */
 	save_fpu_regs();
 	vcpu->arch.host_fpregs.fpc = current->thread.fpu.fpc;
 	vcpu->arch.host_fpregs.regs = current->thread.fpu.regs;
 	if (MACHINE_HAS_VX)
-		current->thread.fpu.regs = vcpu->run->s.regs.vrs;
+		current->thread.fpu.regs = run->s.regs.vrs;
 	else
-		current->thread.fpu.regs = vcpu->run->s.regs.fprs;
-	current->thread.fpu.fpc = vcpu->run->s.regs.fpc;
+		current->thread.fpu.regs = run->s.regs.fprs;
+	current->thread.fpu.fpc = run->s.regs.fpc;
 	if (test_fp_ctl(current->thread.fpu.fpc))
 		/* User space provided an invalid FPC, let's clear it */
 		current->thread.fpu.fpc = 0;
 
 	/* Sync fmt2 only data */
 	if (likely(!kvm_s390_pv_cpu_is_protected(vcpu))) {
-		sync_regs_fmt2(vcpu, kvm_run);
+		sync_regs_fmt2(vcpu);
 	} else {
 		/*
 		 * In several places we have to modify our internal view to
@@ -4282,19 +4285,21 @@ static void sync_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
 		 * do only accept the condition code from userspace.
 		 */
 		vcpu->arch.sie_block->gpsw.mask &= ~PSW_MASK_CC;
-		vcpu->arch.sie_block->gpsw.mask |= kvm_run->psw_mask &
+		vcpu->arch.sie_block->gpsw.mask |= run->psw_mask &
 						   PSW_MASK_CC;
 	}
 
-	kvm_run->kvm_dirty_regs = 0;
+	run->kvm_dirty_regs = 0;
 }
 
-static void store_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
+static void store_regs_fmt2(struct kvm_vcpu *vcpu)
 {
-	kvm_run->s.regs.todpr = vcpu->arch.sie_block->todpr;
-	kvm_run->s.regs.pp = vcpu->arch.sie_block->pp;
-	kvm_run->s.regs.gbea = vcpu->arch.sie_block->gbea;
-	kvm_run->s.regs.bpbc = (vcpu->arch.sie_block->fpf & FPF_BPBC) == FPF_BPBC;
+	struct kvm_run *run = vcpu->run;
+
+	run->s.regs.todpr = vcpu->arch.sie_block->todpr;
+	run->s.regs.pp = vcpu->arch.sie_block->pp;
+	run->s.regs.gbea = vcpu->arch.sie_block->gbea;
+	run->s.regs.bpbc = (vcpu->arch.sie_block->fpf & FPF_BPBC) == FPF_BPBC;
 	if (MACHINE_HAS_GS) {
 		__ctl_set_bit(2, 4);
 		if (vcpu->arch.gs_enabled)
@@ -4310,39 +4315,41 @@ static void store_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
 	/* SIE will save etoken directly into SDNX and therefore kvm_run */
 }
 
-static void store_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
+static void store_regs(struct kvm_vcpu *vcpu)
 {
-	kvm_run->psw_mask = vcpu->arch.sie_block->gpsw.mask;
-	kvm_run->psw_addr = vcpu->arch.sie_block->gpsw.addr;
-	kvm_run->s.regs.prefix = kvm_s390_get_prefix(vcpu);
-	memcpy(&kvm_run->s.regs.crs, &vcpu->arch.sie_block->gcr, 128);
-	kvm_run->s.regs.cputm = kvm_s390_get_cpu_timer(vcpu);
-	kvm_run->s.regs.ckc = vcpu->arch.sie_block->ckc;
-	kvm_run->s.regs.pft = vcpu->arch.pfault_token;
-	kvm_run->s.regs.pfs = vcpu->arch.pfault_select;
-	kvm_run->s.regs.pfc = vcpu->arch.pfault_compare;
-	save_access_regs(vcpu->run->s.regs.acrs);
+	struct kvm_run *run = vcpu->run;
+
+	run->psw_mask = vcpu->arch.sie_block->gpsw.mask;
+	run->psw_addr = vcpu->arch.sie_block->gpsw.addr;
+	run->s.regs.prefix = kvm_s390_get_prefix(vcpu);
+	memcpy(&run->s.regs.crs, &vcpu->arch.sie_block->gcr, 128);
+	run->s.regs.cputm = kvm_s390_get_cpu_timer(vcpu);
+	run->s.regs.ckc = vcpu->arch.sie_block->ckc;
+	run->s.regs.pft = vcpu->arch.pfault_token;
+	run->s.regs.pfs = vcpu->arch.pfault_select;
+	run->s.regs.pfc = vcpu->arch.pfault_compare;
+	save_access_regs(run->s.regs.acrs);
 	restore_access_regs(vcpu->arch.host_acrs);
 	/* Save guest register state */
 	save_fpu_regs();
-	vcpu->run->s.regs.fpc = current->thread.fpu.fpc;
+	run->s.regs.fpc = current->thread.fpu.fpc;
 	/* Restore will be done lazily at return */
 	current->thread.fpu.fpc = vcpu->arch.host_fpregs.fpc;
 	current->thread.fpu.regs = vcpu->arch.host_fpregs.regs;
 	if (likely(!kvm_s390_pv_cpu_is_protected(vcpu)))
-		store_regs_fmt2(vcpu, kvm_run);
+		store_regs_fmt2(vcpu);
 }
 
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
-	struct kvm_run *kvm_run = vcpu->run;
+	struct kvm_run *run = vcpu->run;
 	int rc;
 
-	if (kvm_run->immediate_exit)
+	if (run->immediate_exit)
 		return -EINTR;
 
-	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
-	    kvm_run->kvm_dirty_regs & ~KVM_SYNC_S390_VALID_FIELDS)
+	if (run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
+	    run->kvm_dirty_regs & ~KVM_SYNC_S390_VALID_FIELDS)
 		return -EINVAL;
 
 	vcpu_load(vcpu);
@@ -4368,14 +4375,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		goto out;
 	}
 
-	sync_regs(vcpu, kvm_run);
+	sync_regs(vcpu);
 	enable_cpu_timer_accounting(vcpu);
 
 	might_fault();
 	rc = __vcpu_run(vcpu);
 
 	if (signal_pending(current) && !rc) {
-		kvm_run->exit_reason = KVM_EXIT_INTR;
+		run->exit_reason = KVM_EXIT_INTR;
 		rc = -EINTR;
 	}
 
@@ -4390,7 +4397,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	}
 
 	disable_cpu_timer_accounting(vcpu);
-	store_regs(vcpu, kvm_run);
+	store_regs(vcpu);
 
 	kvm_sigset_deactivate(vcpu);
 
-- 
2.17.1

