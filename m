Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981A421406
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:25:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNR06313Hz3gBv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:25:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WpCXD4wi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WpCXD4wi; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQTf4Nr5z303D
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:30 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 me5-20020a17090b17c500b0019af76b7bb4so4830673pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fq87rfMDwDfdeH36xguI8Sx1EqHcJXrKBlZ1OzcLmnA=;
 b=WpCXD4wi/JI5J9ibOIBdVVZ0N5PAqJddWLsrhhWtAGvTAK8HiI+aJUGd671MHfe+/8
 0EvIltI4Zm6O7rM0jvNygX3+LyfIXolv7Ln5h519+x2sseaauZ7+ixU90yQ1LrZL9AUK
 3F/KI0sEnaGBRdTCa/idSsO5BABqcsPAVksPEXDoU//aG6rxcIaYeO4axxrJkVu2P6Rx
 yVVxPqXTsP9aEdY5cpd+IgNzN1ufwjAqcy2kVD6gnRDA9ThzOJLyg3uv2EHaATTFoDUW
 6U5fL6Rf/FWIgwlZiHev1eqIeqUMnho85KkB8qA0o622zoQjXqVGonxqcLSTdOQbsLON
 BT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fq87rfMDwDfdeH36xguI8Sx1EqHcJXrKBlZ1OzcLmnA=;
 b=m1h8Thqhf5MQAtmLugaaudo6Gnf3+3ZldvE6Ax53HuYCGw3soavrCMBkehhUJWBAtK
 2/zDi5hZWv02MyjloXcywmReIe0YgZxlKNc8uoE7YbcVhPv8EVfBvg9G1HrlLOp8oYQc
 AEawF3j9w9Y4hPqmQmUsLP043WouvZiq5zjy/ujmVBMGoLAxi1UWOAQ9MsSSMNLRnNIX
 Ju4cCivj3zVYUdh1RqXUHGCgdAwZ1yGuteMcYXvrhtHj9d9sYbs70r4h0mv6Z9Lceu9X
 mQe9lAj+IoIY4FijTPUSDnPWwrEXz4tUk9uvpsrGvKPV9TQUX53NQAdOUEJXWbeEP5ib
 xoqw==
X-Gm-Message-State: AOAM533c1v242P0CVYao6T9WNno8lCNPPDXDf7mcjjsBCTbTUtKSF08n
 Kk5LXGqGXEilUV2Td/1zxC2aCQ+DLdU=
X-Google-Smtp-Source: ABdhPJwehgfWWGzyLyrKMEkByEkD9YvBHWhENI58G7BW0sEb2h7rAE9jlDKCpERH+RyvGgKKToOEXw==
X-Received: by 2002:a17:902:7e84:b0:13e:d793:20d8 with SMTP id
 z4-20020a1709027e8400b0013ed79320d8mr400306pla.67.1633363348816; 
 Mon, 04 Oct 2021 09:02:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 36/52] KVM: PPC: Book3S HV P9: Demand fault EBB facility
 registers
Date: Tue,  5 Oct 2021 02:00:33 +1000
Message-Id: <20211004160049.1338837-37-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use HFSCR facility disabling to implement demand faulting for EBB, with
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
 arch/powerpc/include/asm/kvm_host.h   |  1 +
 arch/powerpc/kvm/book3s_hv.c          | 16 +++++++++++++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 28 +++++++++++++++++++++------
 3 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index c5fc4d016695..9c63eff35812 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -579,6 +579,7 @@ struct kvm_vcpu_arch {
 	ulong cfar;
 	ulong ppr;
 	u32 pspb;
+	u8 load_ebb;
 	ulong fscr;
 	ulong shadow_fscr;
 	ulong ebbhr;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6fb941aa77f1..070469867bf5 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1436,6 +1436,16 @@ static int kvmppc_pmu_unavailable(struct kvm_vcpu *vcpu)
 	return RESUME_GUEST;
 }
 
+static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
+{
+	if (!(vcpu->arch.hfscr_permitted & HFSCR_EBB))
+		return EMULATE_FAIL;
+
+	vcpu->arch.hfscr |= HFSCR_EBB;
+
+	return RESUME_GUEST;
+}
+
 static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				 struct task_struct *tsk)
 {
@@ -1727,6 +1737,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				r = kvmppc_emulate_doorbell_instr(vcpu);
 			if (cause == FSCR_PM_LG)
 				r = kvmppc_pmu_unavailable(vcpu);
+			if (cause == FSCR_EBB_LG)
+				r = kvmppc_ebb_unavailable(vcpu);
 		}
 		if (r == EMULATE_FAIL) {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
@@ -2771,9 +2783,9 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfscr_permitted = vcpu->arch.hfscr;
 
 	/*
-	 * PM is demand-faulted so start with it clear.
+	 * PM, EBB is demand-faulted so start with it clear.
 	 */
-	vcpu->arch.hfscr &= ~HFSCR_PM;
+	vcpu->arch.hfscr &= ~(HFSCR_PM | HFSCR_EBB);
 
 	kvmppc_mmu_book3s_hv_init(vcpu);
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index a23f09fa7d2d..929a7c336b09 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -232,9 +232,12 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
 				struct p9_host_os_sprs *host_os_sprs)
 {
 	mtspr(SPRN_TAR, vcpu->arch.tar);
-	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
-	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
-	mtspr(SPRN_BESCR, vcpu->arch.bescr);
+
+	if (vcpu->arch.hfscr & HFSCR_EBB) {
+		mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
+		mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
+		mtspr(SPRN_BESCR, vcpu->arch.bescr);
+	}
 
 	if (cpu_has_feature(CPU_FTR_P9_TIDR))
 		mtspr(SPRN_TIDR, vcpu->arch.tid);
@@ -265,9 +268,22 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
 static void store_spr_state(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.tar = mfspr(SPRN_TAR);
-	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
-	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
-	vcpu->arch.bescr = mfspr(SPRN_BESCR);
+
+	if (vcpu->arch.hfscr & HFSCR_EBB) {
+		vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
+		vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
+		vcpu->arch.bescr = mfspr(SPRN_BESCR);
+		/*
+		 * This is like load_fp in context switching, turn off the
+		 * facility after it wraps the u8 to try avoiding saving
+		 * and restoring the registers each partition switch.
+		 */
+		if (!vcpu->arch.nested) {
+			vcpu->arch.load_ebb++;
+			if (!vcpu->arch.load_ebb)
+				vcpu->arch.hfscr &= ~HFSCR_EBB;
+		}
+	}
 
 	if (cpu_has_feature(CPU_FTR_P9_TIDR))
 		vcpu->arch.tid = mfspr(SPRN_TIDR);
-- 
2.23.0

