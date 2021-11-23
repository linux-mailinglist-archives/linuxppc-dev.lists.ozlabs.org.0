Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536F0459FEC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:17:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0S71H9xz3gNT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:17:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L6t54EHI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L6t54EHI; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzxS1mdvz3cVf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:04 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id o4so18907532pfp.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t9mSOqkc/IA3ZjU35mx2ifCm5ZhTdgmqPLbflm6BjsE=;
 b=L6t54EHIBQoiUZxUuZBvzXNd9Dzp6ZCeakfbE+MIFcwr+htPePBiot/pVW5crJdkMl
 RBnnmwpihCp/CbZfeKg2KcrH4rbGBoTS+aRE70KyR4eNFLxDEbX1cv6YjqB5ZKtZY+wF
 9rZtYCsFGA1z01Ri7Gb07Vuu8iX6B46VSLf/I41zijo0vaNB7yQC1RQoLqNONYYUubsz
 RRw4fiEOnP6JKZ6VHoTyfP4nhEyazoILwjbrZsbj41aYehpbnsw2MryvmAx4/+oPi97p
 22bcVUaMBUQXjaLr20gP4g1AbrDommvIJFxXh7+OotFRpsWKow6frkrtE28xf2uqwR9x
 5l2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t9mSOqkc/IA3ZjU35mx2ifCm5ZhTdgmqPLbflm6BjsE=;
 b=2fGgEAZuJMhQSes3/fNGDiku50u8TnMkBRSc5Dze1NpPLzNZSlcSoc4PkTrpBm6WhO
 z/DK6MsyxuQWCfU84WYUhUuOOTc2Y+aNEI54a4LqIb4L8etl8zWwpYLWpu2HmhGcgEzC
 Z5Kqh71SVkMYX4Ocyy3PT1NjESD53oIye3AY8g9TIIykhIm0uK7bDnJKjMb+lHpNb7zs
 tsOZ1phjRXM/t8xiT7ZNQBAJd8x+827HTahfZxIT/n92o5ETeV+QtbUN1y1GkAVV2WTA
 3bkw9L3X0FE4YZW/RO/YRuhAPKcO9noLKQbnM2p8P66+m66sIaW0aMv5IyWornn02xkG
 z1uA==
X-Gm-Message-State: AOAM532NdILkrXcQgvNf5T2MU5igKVzYeKQ1Ul7d+uykxH02KCrzSsDW
 0WGqNzEev5YoK93qylv9mNxYWGAEDYXtAA==
X-Google-Smtp-Source: ABdhPJzkoyJTUGGvAkpkjPvUh/NKD0zbKu1yw/ZHOpiFnAYSh7+lAp0zhJZh/8/gaiEmenmELdjjgw==
X-Received: by 2002:a05:6a00:23c7:b0:4a2:ca32:9a27 with SMTP id
 g7-20020a056a0023c700b004a2ca329a27mr4211588pfc.71.1637661242313; 
 Tue, 23 Nov 2021 01:54:02 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 37/53] KVM: PPC: Book3S HV P9: Demand fault TM facility
 registers
Date: Tue, 23 Nov 2021 19:52:15 +1000
Message-Id: <20211123095231.1036501-38-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use HFSCR facility disabling to implement demand faulting for TM, with
a hysteresis counter similar to the load_fp etc counters in context
switching that implement the equivalent demand faulting for userspace
facilities.

This speeds up guest entry/exit by avoiding the register save/restore
when a guest is not frequently using them. When a guest does use them
often, there will be some additional demand fault overhead, but these
are not commonly used facilities.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h   |  3 +++
 arch/powerpc/kvm/book3s_hv.c          | 26 ++++++++++++++++++++------
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 15 +++++++++++----
 3 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 7a55b19eb6c0..d7004412b859 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -580,6 +580,9 @@ struct kvm_vcpu_arch {
 	ulong ppr;
 	u32 pspb;
 	u8 load_ebb;
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	u8 load_tm;
+#endif
 	ulong fscr;
 	ulong shadow_fscr;
 	ulong ebbhr;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index da29cf9236c8..198f6d997330 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1446,6 +1446,16 @@ static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
 	return RESUME_GUEST;
 }
 
+static int kvmppc_tm_unavailable(struct kvm_vcpu *vcpu)
+{
+	if (!(vcpu->arch.hfscr_permitted & HFSCR_TM))
+		return EMULATE_FAIL;
+
+	vcpu->arch.hfscr |= HFSCR_TM;
+
+	return RESUME_GUEST;
+}
+
 static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				 struct task_struct *tsk)
 {
@@ -1739,6 +1749,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				r = kvmppc_pmu_unavailable(vcpu);
 			if (cause == FSCR_EBB_LG)
 				r = kvmppc_ebb_unavailable(vcpu);
+			if (cause == FSCR_TM_LG)
+				r = kvmppc_tm_unavailable(vcpu);
 		}
 		if (r == EMULATE_FAIL) {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
@@ -2783,9 +2795,9 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfscr_permitted = vcpu->arch.hfscr;
 
 	/*
-	 * PM, EBB is demand-faulted so start with it clear.
+	 * PM, EBB, TM are demand-faulted so start with it clear.
 	 */
-	vcpu->arch.hfscr &= ~(HFSCR_PM | HFSCR_EBB);
+	vcpu->arch.hfscr &= ~(HFSCR_PM | HFSCR_EBB | HFSCR_TM);
 
 	kvmppc_mmu_book3s_hv_init(vcpu);
 
@@ -3868,8 +3880,9 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 		msr |= MSR_VEC;
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr |= MSR_VSX;
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+	if ((cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
+			(vcpu->arch.hfscr & HFSCR_TM))
 		msr |= MSR_TM;
 	msr = msr_check_and_set(msr);
 
@@ -4608,8 +4621,9 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		msr |= MSR_VEC;
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr |= MSR_VSX;
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+	if ((cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
+			(vcpu->arch.hfscr & HFSCR_TM))
 		msr |= MSR_TM;
 	msr = msr_check_and_set(msr);
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 929a7c336b09..8499e8a9ca8f 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -310,7 +310,7 @@ bool load_vcpu_state(struct kvm_vcpu *vcpu,
 		if (MSR_TM_ACTIVE(guest_msr)) {
 			kvmppc_restore_tm_hv(vcpu, guest_msr, true);
 			ret = true;
-		} else {
+		} else if (vcpu->arch.hfscr & HFSCR_TM) {
 			mtspr(SPRN_TEXASR, vcpu->arch.texasr);
 			mtspr(SPRN_TFHAR, vcpu->arch.tfhar);
 			mtspr(SPRN_TFIAR, vcpu->arch.tfiar);
@@ -346,10 +346,16 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
 		unsigned long guest_msr = vcpu->arch.shregs.msr;
 		if (MSR_TM_ACTIVE(guest_msr)) {
 			kvmppc_save_tm_hv(vcpu, guest_msr, true);
-		} else {
+		} else if (vcpu->arch.hfscr & HFSCR_TM) {
 			vcpu->arch.texasr = mfspr(SPRN_TEXASR);
 			vcpu->arch.tfhar = mfspr(SPRN_TFHAR);
 			vcpu->arch.tfiar = mfspr(SPRN_TFIAR);
+
+			if (!vcpu->arch.nested) {
+				vcpu->arch.load_tm++; /* see load_ebb comment */
+				if (!vcpu->arch.load_tm)
+					vcpu->arch.hfscr &= ~HFSCR_TM;
+			}
 		}
 	}
 #endif
@@ -641,8 +647,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		msr |= MSR_VEC;
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr |= MSR_VSX;
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+	if ((cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
+			(vcpu->arch.hfscr & HFSCR_TM))
 		msr |= MSR_TM;
 	msr = msr_check_and_set(msr);
 	/* Save MSR for restore. This is after hard disable, so EE is clear. */
-- 
2.23.0

