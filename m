Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F43E95D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:21:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFSf2RZvz3f5M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:21:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vYQtGput;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vYQtGput; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF3H0W76z3d9H
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:06 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so5350727pje.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tqi0zbyzPJ0VguohP2pBEXBrA7DtvBIu6X3xbhJzi5U=;
 b=vYQtGputncVGoyWp5VcnypAufbYXhjOZh6luw4kRw7mQtcHeB5Pn1HoRuy84UCXKRM
 jUwwd0KaSTmVRKq6W9p383y2TBfDS1VQA4NAioJsFLNsOgXoe7J2t9n1qXJhFw0E1F/o
 DCvYgatqznb2DBalJIwcOB/7Q3aybO8CzktVoyAcQ0udaFMT15P7tLDuQeupQoBDV7L+
 kD01SVXOygGc8NuFMDU6bQwS0JDvgnSem2nNCJVoeVeHLCLCt+MqkraMT6h7eX8bL1N8
 jXkkKYFjjfxn8pBG0wWipj+I5v+Z0PvyU2SkvqVsrQDsuD31JGvWV/jDa+yYayv6Il/7
 QQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tqi0zbyzPJ0VguohP2pBEXBrA7DtvBIu6X3xbhJzi5U=;
 b=eW/ukAiKowpAbvdZe3zkyfsQxITdDIkmHDeMGAjLcH9j0kvjg2ZoiJsrf/yP8Tmpv+
 skTzfh83vcHe5zB2BWxH+Ovvy4Gm8GpgoYB6uygKDUbO3wjl8sQfxhWfg4whtcPkNpYC
 Ldy7b96P0jvUwRl5J4C0lfTucqaaoIBD8N89H1p+IzhZoKMj+aNWin60xe08qE7DwDpf
 Z9YfbotqifYuc0XyWQxdBwBS3a2ZE7+WQohoBNp/ezhe5Ma34K8Puj1gLsYpzZ0DVvqF
 Rdd+OUyXXVcxvWQJsqcirk1OXO1L0yWgCtbexCdlDRM1P1VVwCAFwIFgBZPeuwHgHbr3
 ieiw==
X-Gm-Message-State: AOAM5309GBvBqVHmYx62yko4thSBAw99OgsZue1KPCoHINHb4vDVkSsO
 C+uHk8Uex9EWQRlLrmeoZPAq1cKuibI=
X-Google-Smtp-Source: ABdhPJzgAHWg7lvxv0R57aySk5+nId2yCBSPQK7MLLJtnGvVA34I0/EeRyf3+AZxL+bxu/799XeoMA==
X-Received: by 2002:a65:438c:: with SMTP id m12mr1017106pgp.163.1628697783847; 
 Wed, 11 Aug 2021 09:03:03 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 30/60] KVM: PPC: Book3S HV: Change dec_expires to be
 relative to guest timebase
Date: Thu, 12 Aug 2021 02:01:04 +1000
Message-Id: <20210811160134.904987-31-npiggin@gmail.com>
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

Change dec_expires to be relative to the guest timebase, and allow
it to be moved into low level P9 guest entry functions, to improve
SPR access scheduling.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s.h   |  6 +++
 arch/powerpc/include/asm/kvm_host.h     |  2 +-
 arch/powerpc/kvm/book3s_hv.c            | 58 +++++++++++++------------
 arch/powerpc/kvm/book3s_hv_nested.c     |  3 ++
 arch/powerpc/kvm/book3s_hv_p9_entry.c   | 10 ++++-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 13 ------
 6 files changed, 49 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index caaa0f592d8e..15b573671f99 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -406,6 +406,12 @@ static inline ulong kvmppc_get_fault_dar(struct kvm_vcpu *vcpu)
 	return vcpu->arch.fault_dar;
 }
 
+/* Expiry time of vcpu DEC relative to host TB */
+static inline u64 kvmppc_dec_expires_host_tb(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.dec_expires - vcpu->arch.vcore->tb_offset;
+}
+
 static inline bool is_kvmppc_resume_guest(int r)
 {
 	return (r == RESUME_GUEST || r == RESUME_GUEST_NV);
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index a779f7849cfb..89216e247e8b 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -742,7 +742,7 @@ struct kvm_vcpu_arch {
 
 	struct hrtimer dec_timer;
 	u64 dec_jiffies;
-	u64 dec_expires;
+	u64 dec_expires;	/* Relative to guest timebase. */
 	unsigned long pending_exceptions;
 	u8 ceded;
 	u8 prodded;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e25eccfe1501..967fa81063aa 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2264,8 +2264,7 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.vcore->arch_compat);
 		break;
 	case KVM_REG_PPC_DEC_EXPIRY:
-		*val = get_reg_val(id, vcpu->arch.dec_expires +
-				   vcpu->arch.vcore->tb_offset);
+		*val = get_reg_val(id, vcpu->arch.dec_expires);
 		break;
 	case KVM_REG_PPC_ONLINE:
 		*val = get_reg_val(id, vcpu->arch.online);
@@ -2517,8 +2516,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		r = kvmppc_set_arch_compat(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DEC_EXPIRY:
-		vcpu->arch.dec_expires = set_reg_val(id, *val) -
-			vcpu->arch.vcore->tb_offset;
+		vcpu->arch.dec_expires = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_ONLINE:
 		i = set_reg_val(id, *val);
@@ -2905,13 +2903,13 @@ static void kvmppc_set_timer(struct kvm_vcpu *vcpu)
 	unsigned long dec_nsec, now;
 
 	now = get_tb();
-	if (now > vcpu->arch.dec_expires) {
+	if (now > kvmppc_dec_expires_host_tb(vcpu)) {
 		/* decrementer has already gone negative */
 		kvmppc_core_queue_dec(vcpu);
 		kvmppc_core_prepare_to_enter(vcpu);
 		return;
 	}
-	dec_nsec = tb_to_ns(vcpu->arch.dec_expires - now);
+	dec_nsec = tb_to_ns(kvmppc_dec_expires_host_tb(vcpu) - now);
 	hrtimer_start(&vcpu->arch.dec_timer, dec_nsec, HRTIMER_MODE_REL);
 	vcpu->arch.timer_running = 1;
 }
@@ -3383,7 +3381,7 @@ static void post_guest_process(struct kvmppc_vcore *vc, bool is_master)
 		 */
 		spin_unlock(&vc->lock);
 		/* cancel pending dec exception if dec is positive */
-		if (now < vcpu->arch.dec_expires &&
+		if (now < kvmppc_dec_expires_host_tb(vcpu) &&
 		    kvmppc_core_pending_dec(vcpu))
 			kvmppc_core_dequeue_dec(vcpu);
 
@@ -4210,20 +4208,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	load_spr_state(vcpu);
 
-	/*
-	 * When setting DEC, we must always deal with irq_work_raise via NMI vs
-	 * setting DEC. The problem occurs right as we switch into guest mode
-	 * if a NMI hits and sets pending work and sets DEC, then that will
-	 * apply to the guest and not bring us back to the host.
-	 *
-	 * irq_work_raise could check a flag (or possibly LPCR[HDICE] for
-	 * example) and set HDEC to 1? That wouldn't solve the nested hv
-	 * case which needs to abort the hcall or zero the time limit.
-	 *
-	 * XXX: Another day's problem.
-	 */
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
-
 	if (kvmhv_on_pseries()) {
 		/*
 		 * We need to save and restore the guest visible part of the
@@ -4249,6 +4233,23 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			hvregs.vcpu_token = vcpu->vcpu_id;
 		}
 		hvregs.hdec_expiry = time_limit;
+
+		/*
+		 * When setting DEC, we must always deal with irq_work_raise
+		 * via NMI vs setting DEC. The problem occurs right as we
+		 * switch into guest mode if a NMI hits and sets pending work
+		 * and sets DEC, then that will apply to the guest and not
+		 * bring us back to the host.
+		 *
+		 * irq_work_raise could check a flag (or possibly LPCR[HDICE]
+		 * for example) and set HDEC to 1? That wouldn't solve the
+		 * nested hv case which needs to abort the hcall or zero the
+		 * time limit.
+		 *
+		 * XXX: Another day's problem.
+		 */
+		mtspr(SPRN_DEC, kvmppc_dec_expires_host_tb(vcpu) - tb);
+
 		mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 		mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 		trap = plpar_hcall_norets(H_ENTER_NESTED, __pa(&hvregs),
@@ -4260,6 +4261,12 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
 		mtspr(SPRN_PSSCR_PR, host_psscr);
 
+		dec = mfspr(SPRN_DEC);
+		if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
+			dec = (s32) dec;
+		tb = mftb();
+		vcpu->arch.dec_expires = dec + (tb + vc->tb_offset);
+
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
 		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
@@ -4267,6 +4274,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			kvmppc_set_gpr(vcpu, 3, 0);
 			trap = 0;
 		}
+
 	} else {
 		kvmppc_xive_push_vcpu(vcpu);
 		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr);
@@ -4298,12 +4306,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			vcpu->arch.slb_max = 0;
 	}
 
-	dec = mfspr(SPRN_DEC);
-	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
-		dec = (s32) dec;
-	tb = mftb();
-	vcpu->arch.dec_expires = dec + tb;
-
 	store_spr_state(vcpu);
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
@@ -4788,7 +4790,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	 * by L2 and the L1 decrementer is provided in hdec_expires
 	 */
 	if (kvmppc_core_pending_dec(vcpu) &&
-			((get_tb() < vcpu->arch.dec_expires) ||
+			((get_tb() < kvmppc_dec_expires_host_tb(vcpu)) ||
 			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
 			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
 		kvmppc_core_dequeue_dec(vcpu);
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index ed8a2c9f5629..7bed0b91245e 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -358,6 +358,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	/* convert TB values/offsets to host (L0) values */
 	hdec_exp = l2_hv.hdec_expiry - vc->tb_offset;
 	vc->tb_offset += l2_hv.tb_offset;
+	vcpu->arch.dec_expires += l2_hv.tb_offset;
 
 	/* set L1 state to L2 state */
 	vcpu->arch.nested = l2;
@@ -399,6 +400,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	if (l2_regs.msr & MSR_TS_MASK)
 		vcpu->arch.shregs.msr |= MSR_TS_S;
 	vc->tb_offset = saved_l1_hv.tb_offset;
+	/* XXX: is this always the same delta as saved_l1_hv.tb_offset? */
+	vcpu->arch.dec_expires -= l2_hv.tb_offset;
 	restore_hv_regs(vcpu, &saved_l1_hv);
 	vcpu->arch.purr += delta_purr;
 	vcpu->arch.spurr += delta_spurr;
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index fb9cb34445ea..814b0dfd590f 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -188,7 +188,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-	s64 hdec;
+	s64 hdec, dec;
 	u64 tb, purr, spurr;
 	u64 *exsave;
 	bool ri_set;
@@ -317,6 +317,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 tm_return_to_guest:
 #endif
@@ -461,6 +463,12 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	vcpu->arch.shregs.sprg2 = mfspr(SPRN_SPRG2);
 	vcpu->arch.shregs.sprg3 = mfspr(SPRN_SPRG3);
 
+	dec = mfspr(SPRN_DEC);
+	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
+		dec = (s32) dec;
+	tb = mftb();
+	vcpu->arch.dec_expires = dec + tb;
+
 	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
 	mtspr(SPRN_PSSCR, host_psscr |
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 05be8648937d..f3489584bcfc 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -808,10 +808,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	 * Set the decrementer to the guest decrementer.
 	 */
 	ld	r8,VCPU_DEC_EXPIRES(r4)
-	/* r8 is a host timebase value here, convert to guest TB */
-	ld	r5,HSTATE_KVM_VCORE(r13)
-	ld	r6,VCORE_TB_OFFSET_APPL(r5)
-	add	r8,r8,r6
 	mftb	r7
 	subf	r3,r7,r8
 	mtspr	SPRN_DEC,r3
@@ -1186,9 +1182,6 @@ guest_bypass:
 	mftb	r6
 	extsw	r5,r5
 16:	add	r5,r5,r6
-	/* r5 is a guest timebase value here, convert to host TB */
-	ld	r4,VCORE_TB_OFFSET_APPL(r3)
-	subf	r5,r4,r5
 	std	r5,VCPU_DEC_EXPIRES(r9)
 
 	/* Increment exit count, poke other threads to exit */
@@ -2154,9 +2147,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_TM)
 	/* save expiry time of guest decrementer */
 	add	r3, r3, r5
 	ld	r4, HSTATE_KVM_VCPU(r13)
-	ld	r5, HSTATE_KVM_VCORE(r13)
-	ld	r6, VCORE_TB_OFFSET_APPL(r5)
-	subf	r3, r6, r3	/* convert to host TB value */
 	std	r3, VCPU_DEC_EXPIRES(r4)
 
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
@@ -2253,9 +2243,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_TM)
 
 	/* Restore guest decrementer */
 	ld	r3, VCPU_DEC_EXPIRES(r4)
-	ld	r5, HSTATE_KVM_VCORE(r13)
-	ld	r6, VCORE_TB_OFFSET_APPL(r5)
-	add	r3, r3, r6	/* convert host TB to guest TB value */
 	mftb	r7
 	subf	r3, r7, r3
 	mtspr	SPRN_DEC, r3
-- 
2.23.0

