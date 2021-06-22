Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD543B0281
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:13:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8P0J6jpkz3gfB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:13:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XJ8S7bel;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XJ8S7bel; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Ngw0Hm4z3cBL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:23 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so2028119pjo.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQDf5ymbUokqKmHzn5bbmlBykivDsgLCRJlQ36KLUmc=;
 b=XJ8S7belHbzKE6HhD0jARY/4EvdE3hmuUD7FKErxhljP/jLCDT5cVvN5bNEFN/rAJy
 9mkllKNyw/6uorPfmBFvgFtTCfz1YK+VLPDfrYEu+/8BxqXdTQj7Y98BBiLS33gyASyi
 zKiSsnBKy6pc1htJUoj5+Kxa6sUYIj7cWLE8mrlUmE1a/5v7+vWsP5DqB+wnq17bOCp2
 W36G54KMnAsYtjJCAXbgyF+ph2gKZDyiw1/Qgo8GbHcjhMEVynZvfqHUWJLFPmTiYXsX
 Su1EO3u/uyiisz4+mOiIV3aTrfE4k+yRUoPM7TKol57LzKQEzU2wkp+CAo7+LmqQSIVz
 P25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQDf5ymbUokqKmHzn5bbmlBykivDsgLCRJlQ36KLUmc=;
 b=U8nGzEQHxjWMFHuTUU4trN3O/xgoY7W9ZXSYYFUiyyjr+P2fdkHtRYL7HPbFfrmhpi
 D4Nn+tRS1UBq9fiBX3IRsj2iLhRoma6F96fIc/odIGOnBkm95ffwj1QR2lOd3EY1iY7u
 H0cfvPdLnbMawbjI0HKn9nYILol3lMeKeFqsjjZfRBZ+7lyUrirtMgvRGrNM0Xrf99rM
 GSaKv53r6Mv0meAOaaxokKmcjl9MA4kDOsOSsDLTP8EzZ6PurlMDYsqL2UVdHTbqs48h
 m/6YxzvMhIwSG5NGe98o95J8l6L5w9g/0Yy2gzyF9uXp+nP946qudptpDzoYX58aX7MT
 Fi/Q==
X-Gm-Message-State: AOAM532tdncTore7I9iXZ5bdt+YvueWHa8alwuXWxgtYWvT0Gz5LCPWP
 q6W7yYGKQsCcNDprBfCMAuJz+KiwhF4=
X-Google-Smtp-Source: ABdhPJxRcooqquD0EPs0oZYwhh6tNDuesL+qj1fO4uhBBAkLY2SUXSYQxWx+WwXBzvo2KEm0aROG3g==
X-Received: by 2002:a17:90b:4905:: with SMTP id
 kr5mr3184880pjb.161.1624359560867; 
 Tue, 22 Jun 2021 03:59:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:59:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 35/43] KVM: PPC: Book3S HV P9: Demand fault TM facility
 registers
Date: Tue, 22 Jun 2021 20:57:28 +1000
Message-Id: <20210622105736.633352-36-npiggin@gmail.com>
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

Use HFSCR facility disabling to implement demand faulting for TM, with
a hysteresis counter similar to the load_fp etc counters in context
switching that implement the equivalent demand faulting for userspace
facilities.

This speeds up guest entry/exit by avoiding the register save/restore
when a guest is not frequently using them. When a guest does use them
often, there will be some additional demand fault overhead, but these
are not commonly used facilities.

-304 cycles (6681) POWER9 virt-mode NULL hcall with the previous patch

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h   |  1 +
 arch/powerpc/kvm/book3s_hv.c          | 21 +++++++++++++++++----
 arch/powerpc/kvm/book3s_hv_nested.c   |  2 +-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 18 ++++++++++++------
 4 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index bee95106c1f2..d79f0b1b1578 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -586,6 +586,7 @@ struct kvm_vcpu_arch {
 	ulong ppr;
 	u32 pspb;
 	u8 load_ebb;
+	u8 load_tm;
 	ulong fscr;
 	ulong shadow_fscr;
 	ulong ebbhr;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 99e9da078e7d..2430725f29f7 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1373,6 +1373,13 @@ static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
 	return RESUME_GUEST;
 }
 
+static int kvmppc_tm_unavailable(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.hfscr |= HFSCR_TM;
+
+	return RESUME_GUEST;
+}
+
 static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				 struct task_struct *tsk)
 {
@@ -1654,6 +1661,8 @@ XXX benchmark guest exits
 				r = kvmppc_pmu_unavailable(vcpu);
 			if (cause == FSCR_EBB_LG)
 				r = kvmppc_ebb_unavailable(vcpu);
+			if (cause == FSCR_TM_LG)
+				r = kvmppc_tm_unavailable(vcpu);
 		}
 		if (r == EMULATE_FAIL) {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
@@ -1775,6 +1784,8 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 			r = kvmppc_pmu_unavailable(vcpu);
 		if (cause == FSCR_EBB_LG && (vcpu->arch.nested_hfscr & HFSCR_EBB))
 			r = kvmppc_ebb_unavailable(vcpu);
+		if (cause == FSCR_TM_LG && (vcpu->arch.nested_hfscr & HFSCR_TM))
+			r = kvmppc_tm_unavailable(vcpu);
 
 		if (r == EMULATE_FAIL)
 			r = RESUME_HOST;
@@ -3737,8 +3748,9 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
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
 
@@ -4453,8 +4465,9 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
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
 
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index ee8668f056f9..5a534f7924f2 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -168,7 +168,7 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 	 * but preserve the interrupt cause field and facilities that might
 	 * be disabled for demand faulting in the L1.
 	 */
-	hr->hfscr &= (HFSCR_INTR_CAUSE | HFSCR_PM | HFSCR_EBB |
+	hr->hfscr &= (HFSCR_INTR_CAUSE | HFSCR_PM | HFSCR_TM | HFSCR_EBB |
 			vcpu->arch.hfscr);
 
 	/* Don't let data address watchpoint match in hypervisor state */
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index cf41261daa97..653f2765a399 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -284,8 +284,9 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 void load_vcpu_state(struct kvm_vcpu *vcpu,
 			   struct p9_host_os_sprs *host_os_sprs)
 {
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
+	if ((cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
+		       (vcpu->arch.hfscr & HFSCR_TM)) {
 		unsigned long msr = vcpu->arch.shregs.msr;
 		if (MSR_TM_ACTIVE(msr)) {
 			kvmppc_restore_tm_hv(vcpu, msr, true);
@@ -316,8 +317,9 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
 #endif
 	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
 
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
+	if ((cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
+		       (vcpu->arch.hfscr & HFSCR_TM)) {
 		unsigned long msr = vcpu->arch.shregs.msr;
 		if (MSR_TM_ACTIVE(msr)) {
 			kvmppc_save_tm_hv(vcpu, msr, true);
@@ -326,6 +328,9 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
 			vcpu->arch.tfhar = mfspr(SPRN_TFHAR);
 			vcpu->arch.tfiar = mfspr(SPRN_TFIAR);
 		}
+		vcpu->arch.load_tm++; /* see load_ebb comment for details */
+		if (!vcpu->arch.load_tm)
+			vcpu->arch.hfscr &= ~HFSCR_TM;
 	}
 }
 EXPORT_SYMBOL_GPL(store_vcpu_state);
@@ -615,8 +620,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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

