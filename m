Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE5353ACA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:28:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCjT4V9rz3fYm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=emC1GlsJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=emC1GlsJ; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCXl1RKpz3c7Z
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:21:11 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id h20so4926920plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFmaJjBp09ty+mQfvxR7OURCiJbmuhIiXXzajeTk/cc=;
 b=emC1GlsJVEoBKH3tpRm428lR5Q278lI0ICrGiVJe7NkjyOX0Bl8emZC0wATx2YWgEx
 hnoVt3ZwFnFxtq3wxFlLENUAcPa+LOXRPxatyLbvw3wYcafTntKow1UBSbToWr0xWugM
 a3XmrmzrXBwKuFMP2N8GekmvlEi7LXzJRg1rwr5GiW01u9n/Dexr3lx5IGG778+gcBPA
 gXuHuVkNsi7hNfvKBwI2GpcqNnEdHCpjYv0PoYRDJEkb8u67VFsPLqRzdISPYa0xxs3m
 KxWsN1h9clM1G41eZk/lFHksJk/wnKHpJ4fHo3PbUk0FEbF8E9IqzjIBnYix1L3S26om
 Il3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oFmaJjBp09ty+mQfvxR7OURCiJbmuhIiXXzajeTk/cc=;
 b=hTdXMA1u9I/wbr27eQ+9x3E8rDsEWWXdkRAg2jDmjaR1H4dXEOCIxZSCxp6LEHP0Y+
 m+7yc6X+hFVHOK40NWwTC+MQf7nWmVOInxk3CwIEPQmfN8v8++BMiCbV7vi0L8rhk432
 hQDB5wQH0GYnUOMmzjhz2tCrX/aT/fa0RgPs+CRbyyJbrXJ3OCkt5LMfvLdj9+4zk0JO
 YYYgXYpDdUZTiGI9JObFc0OdWLuA+eNnggzGasc5DeIJvD6+mbUBUN5nTIMkg+pYm+s7
 pF9iR+CcLzxT1A3NLwk90Fg3ZlmFtpuIMGVwV6++GdYCzLsq2SD+3pG6Eb7IcrASGoy4
 HMag==
X-Gm-Message-State: AOAM532lxUZN8ff5pvdr0+so/1Ku7DArwZPAbS6WZClZISPqZqHF0Xy7
 jLpzhjnmSyB/lVU8wCOH2o4DPJjzVZFbLg==
X-Google-Smtp-Source: ABdhPJxlXA2dMaC1bmiPAnD/aJpjmgpVbcqRhVvmwr0FERrSeu3xkAl+9eh7rOLt8mBiijtZJh+SlA==
X-Received: by 2002:a17:90a:7786:: with SMTP id
 v6mr24154111pjk.16.1617585669004; 
 Sun, 04 Apr 2021 18:21:09 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:21:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 19/48] KVM: PPC: Book3S HV P9: Move radix MMU switching
 instructions together
Date: Mon,  5 Apr 2021 11:19:19 +1000
Message-Id: <20210405011948.675354-20-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switching the MMU from radix<->radix mode is tricky particularly as the
MMU can remain enabled and requires a certain sequence of SPR updates.
Move these together into their own functions.

This also includes the radix TLB check / flush because it's tied in to
MMU switching due to tlbiel getting LPID from LPIDR.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 66 +++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ed77aff9cdb6..3424b1bfa98e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3478,12 +3478,49 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	trace_kvmppc_run_core(vc, 1);
 }
 
+static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
+{
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	struct kvm_nested_guest *nested = vcpu->arch.nested;
+	u32 lpid;
+
+	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
+
+	/*
+	 * All the isync()s are overkill but trivially follow the ISA
+	 * requirements. Some can likely be replaced with justification
+	 * comment for why they are not needed.
+	 */
+	isync();
+	mtspr(SPRN_LPID, lpid);
+	isync();
+	mtspr(SPRN_LPCR, lpcr);
+	isync();
+	mtspr(SPRN_PID, vcpu->arch.pid);
+	isync();
+
+	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
+	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
+}
+
+static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
+{
+	isync();
+	mtspr(SPRN_PID, pid);
+	isync();
+	mtspr(SPRN_LPID, kvm->arch.host_lpid);
+	isync();
+	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
+	isync();
+}
+
 /*
  * Load up hypervisor-mode registers on P9.
  */
 static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 				     unsigned long lpcr)
 {
+	struct kvm *kvm = vcpu->kvm;
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	s64 hdec;
 	u64 tb, purr, spurr;
@@ -3506,12 +3543,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] = 0,
 	 * so set HDICE before writing HDEC.
 	 */
-	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr | LPCR_HDICE);
+	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
 	isync();
 
 	hdec = time_limit - mftb();
 	if (hdec < 0) {
-		mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
+		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
 		isync();
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 	}
@@ -3546,7 +3583,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
 	mtspr(SPRN_IC, vcpu->arch.ic);
-	mtspr(SPRN_PID, vcpu->arch.pid);
 
 	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
@@ -3560,8 +3596,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	mtspr(SPRN_AMOR, ~0UL);
 
-	mtspr(SPRN_LPCR, lpcr);
-	isync();
+	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 
 	kvmppc_xive_push_vcpu(vcpu);
 
@@ -3600,7 +3635,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		mtspr(SPRN_DAWR1, host_dawr1);
 		mtspr(SPRN_DAWRX1, host_dawrx1);
 	}
-	mtspr(SPRN_PID, host_pidr);
 
 	/*
 	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
@@ -3615,9 +3649,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		asm volatile(PPC_CP_ABORT);
 
-	mtspr(SPRN_LPID, vcpu->kvm->arch.host_lpid);	/* restore host LPID */
-	isync();
-
 	vc->dpdes = mfspr(SPRN_DPDES);
 	vc->vtb = mfspr(SPRN_VTB);
 	mtspr(SPRN_DPDES, 0);
@@ -3634,7 +3665,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 
 	mtspr(SPRN_HDEC, 0x7fffffff);
-	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
+
+	switch_mmu_to_host_radix(kvm, host_pidr);
 
 	return trap;
 }
@@ -4167,7 +4199,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 {
 	struct kvm_run *run = vcpu->run;
 	int trap, r, pcpu;
-	int srcu_idx, lpid;
+	int srcu_idx;
 	struct kvmppc_vcore *vc;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
@@ -4241,13 +4273,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->vcore_state = VCORE_RUNNING;
 	trace_kvmppc_run_core(vc, 0);
 
-	if (cpu_has_feature(CPU_FTR_HVMODE)) {
-		lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
-		mtspr(SPRN_LPID, lpid);
-		isync();
-		kvmppc_check_need_tlb_flush(kvm, pcpu, nested);
-	}
-
 	guest_enter_irqoff();
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -4266,11 +4291,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 
-	if (cpu_has_feature(CPU_FTR_HVMODE)) {
-		mtspr(SPRN_LPID, kvm->arch.host_lpid);
-		isync();
-	}
-
 	set_irq_happened(trap);
 
 	kvmppc_set_host_core(pcpu);
-- 
2.23.0

