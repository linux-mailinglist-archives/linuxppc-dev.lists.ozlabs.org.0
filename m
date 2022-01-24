Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A9497CFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 11:25:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jj5jG5nG7z3cC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 21:25:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CQhey9Tx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CQhey9Tx; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj5gy5DjQz2xF0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 21:24:30 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so11367524pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 02:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WFzV9XS3Csa6Med5CeBjmDJAop+/yIbEE3PLYgiQyU=;
 b=CQhey9Txde2o8Q1BAMn1GGM0z+JReeeG2iJh4vLTY/TQEqym5GGRu3/XK45h4IFQQX
 rq1L4nKjPWFVM2DkThvhq4WP1dSxcV73/ExnqYTZCMnH/gUhJePMonBSbevjd5hpvZMS
 WY6CjbVu3iUxm3PjVCnIseLNpimz/LLrQn2oLFWVwe7hFaqwx/8sD0zhAPk3C2VMv3W7
 zuzPmUt8gV7s2ug9910W7mRMIW57wGXUezMzNhekV8NZNIpLMG2/exQmxuGZrsNB4huw
 5xygu00CsGfkbIqcWp2WB16UJbtZBVHCEcDn+OjrTWcXeGMF0flwhe/2CV2V33ozNoRj
 jezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WFzV9XS3Csa6Med5CeBjmDJAop+/yIbEE3PLYgiQyU=;
 b=7yRbdhvoitFNfzgfwMvc6EVclsR+Ze2zcdkwtdkWNi7jwTPzgJrXDgqQxN1wzJiF47
 jqf1Y9bFJkkqysgRNWIrYZmPkZZgjaWtuB8BHDy8qjdzo2pzFPllDQEBxYemhoYB9gAq
 3rpJ6QgqQlNdNd8cxb/invt/2lQta5CwXLLEwsJHfD5L99E2lQU1QZNnU243a8QtyJIu
 6ZybzYQph+9Eqkyy3wtX0g4Ajq7usv5U/7rSLDbnR2IWmjMuLZeTZOfDiRBfGOtJbpLW
 TyUKuR7EpDk+k+Ri7f4kb+Geq+vlbPsckxUH/DToizElgJ72uOuQPx2OxQd0STldJNGu
 byXw==
X-Gm-Message-State: AOAM533d1gND3P1QMXG1+dXYNbpfjnKy7BJXGljCeDxybYrCcRUbJQny
 U8q8q7wU04BbPw9v8aOiddh82HYAU10=
X-Google-Smtp-Source: ABdhPJz5K8/ExjR5084/k3Ohi2yzbs8l3wuslROwDhkThGv/cC2CKIDxixiFj9DUTsw4h+5OPe2ERQ==
X-Received: by 2002:a17:902:8498:b0:14a:1b37:9f2b with SMTP id
 c24-20020a170902849800b0014a1b379f2bmr14401801plo.85.1643019867584; 
 Mon, 24 Jan 2022 02:24:27 -0800 (PST)
Received: from bobo.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id z14sm11724081pgr.34.2022.01.24.02.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:24:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] KVM: PPC: Book3S PR: Disable SCV when running AIL is
 disabled
Date: Mon, 24 Jan 2022 20:24:16 +1000
Message-Id: <20220124102417.3741427-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220124102417.3741427-1-npiggin@gmail.com>
References: <20220124102417.3741427-1-npiggin@gmail.com>
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

PR KVM does not support running with AIL enabled, and SCV does is not
supported with AIL disabled.

Fix this by ensuring the SCV facility is disabled with FSCR while a
CPU can be running with AIL=0. PowerNV host supports disabling AIL on a
per-CPU basis, so SCV just needs to be disabled when a vCPU is run.

The pSeries machine can only switch AIL on a system-wide basis, so it
must disable SCV support at boot if the configuration can potentially
run a PR KVM guest.

SCV is not emulated for the PR guest at the moment, this just fixes the
host crashes.

Alternatives considered and rejected:
- SCV support can not be disabled by PR KVM after boot, because it is
  advertised to userspace with HWCAP.
- AIL can not be disabled on a per-CPU basis. At least when running on
  pseries it is a per-LPAR setting.
- Support for real-mode SCV vectors will not be added because they are
  at 0x17000 so making such a large fixed head space causes immediate
  value limits to be exceeded, requiring a lot rework and more code.
- Disabling SCV for any PR KVM possible kernel will cause a slowdown
  when not using PR KVM.
- A boot time option to disable SCV to use PR KVM is user-hostile.
- System call instruction emulation for SCV facility unavailable
  instructions is too complex and old emulation code was subtly broken
  and removed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S |  4 ++++
 arch/powerpc/kernel/setup_64.c       | 15 +++++++++++++++
 arch/powerpc/kvm/book3s_pr.c         | 20 ++++++++++++++------
 3 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 55caeee37c08..b66dd6f775a4 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -809,6 +809,10 @@ __start_interrupts:
  * - MSR_EE|MSR_RI is clear (no reentrant exceptions)
  * - Standard kernel environment is set up (stack, paca, etc)
  *
+ * KVM:
+ * These interrupts do not elevate HV 0->1, so HV is not involved. PR KVM
+ * ensures that FSCR[SCV] is disabled whenever it has to force AIL off.
+ *
  * Call convention:
  *
  * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index be8577ac9397..ac52c69a3811 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -197,6 +197,21 @@ static void __init configure_exceptions(void)
 
 	/* Under a PAPR hypervisor, we need hypercalls */
 	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
+		/*
+		 * PR KVM does not support AIL mode interrupts in the host, and
+		 * SCV system call interrupt vectors are only implemented for
+		 * AIL mode. Under pseries, AIL mode can only be enabled and
+		 * disabled system-wide so when PR KVM is loaded, all CPUs in
+		 * the host are set to AIL=0 mode. SCV can not be disabled
+		 * dynamically because the feature is advertised to host
+		 * userspace, so SCV support must not be enabled if PR KVM can
+		 * possibly be run.
+		 */
+		if (IS_ENABLED(CONFIG_KVM_BOOK3S_PR_POSSIBLE) && !radix_enabled()) {
+			init_task.thread.fscr &= ~FSCR_SCV;
+			cur_cpu_spec->cpu_user_features2 &= ~PPC_FEATURE2_SCV;
+		}
+
 		/* Enable AIL if possible */
 		if (!pseries_enable_reloc_on_exc()) {
 			init_task.thread.fscr &= ~FSCR_SCV;
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 34a801c3604a..4d1c84b94b77 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -140,9 +140,12 @@ static void kvmppc_core_vcpu_load_pr(struct kvm_vcpu *vcpu, int cpu)
 #endif
 
 	/* Disable AIL if supported */
-	if (cpu_has_feature(CPU_FTR_HVMODE) &&
-	    cpu_has_feature(CPU_FTR_ARCH_207S))
-		mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) & ~LPCR_AIL);
+	if (cpu_has_feature(CPU_FTR_HVMODE)) {
+		if (cpu_has_feature(CPU_FTR_ARCH_207S))
+			mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) & ~LPCR_AIL);
+		if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
+			mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) & ~FSCR_SCV);
+	}
 
 	vcpu->cpu = smp_processor_id();
 #ifdef CONFIG_PPC_BOOK3S_32
@@ -175,9 +178,12 @@ static void kvmppc_core_vcpu_put_pr(struct kvm_vcpu *vcpu)
 	kvmppc_save_tm_pr(vcpu);
 
 	/* Enable AIL if supported */
-	if (cpu_has_feature(CPU_FTR_HVMODE) &&
-	    cpu_has_feature(CPU_FTR_ARCH_207S))
-		mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) | LPCR_AIL_3);
+	if (cpu_has_feature(CPU_FTR_HVMODE)) {
+		if (cpu_has_feature(CPU_FTR_ARCH_207S))
+			mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) | LPCR_AIL_3);
+		if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
+			mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) | FSCR_SCV);
+	}
 
 	vcpu->cpu = -1;
 }
@@ -1037,6 +1043,8 @@ static int kvmppc_handle_fac(struct kvm_vcpu *vcpu, ulong fac)
 
 void kvmppc_set_fscr(struct kvm_vcpu *vcpu, u64 fscr)
 {
+	if (fscr & FSCR_SCV)
+		fscr &= ~FSCR_SCV; /* SCV must not be enabled */
 	if ((vcpu->arch.fscr & FSCR_TAR) && !(fscr & FSCR_TAR)) {
 		/* TAR got dropped, drop it in shadow too */
 		kvmppc_giveup_fac(vcpu, FSCR_TAR_LG);
-- 
2.23.0

