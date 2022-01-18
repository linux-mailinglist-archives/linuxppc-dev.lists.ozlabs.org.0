Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E6A491F36
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 07:00:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdJ5y4hwyz3cST
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 17:00:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ghD6idCa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ghD6idCa; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdJ3w0z0Fz2xrD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 16:58:35 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 d10-20020a17090a498a00b001b33bc40d01so856140pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 21:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E0p2IcIEyc/eQWKON69XxQ382HVwtD+ZPEK1c93NQxk=;
 b=ghD6idCaxrY/6MvE7DRNPnFWuJzwCZJTQ+YZFP7iZX6TzN1idGVwvax0s69PgqNo+w
 GK9Z5ihrRNM+1UTHqG+iCpWQxnDCbjIFJdDn4pJ+3tE9zpAS1cNFK3KhAbSsxHUNTfqI
 zvek6OhntDbT2fq8XjoZzmorC33mKr9jIwm8JtV2zhyZ8uI60NDxshGve/unpxaCoTBb
 gnCd2HBQf7EKNQCAQZitWx1Pojkk2+ETlYfb21Wgr6rDuehG6K3Qe8z1W5Hb7aktSghM
 yhjXe68MqXdOs+5ceFGnFRSCdz7hVoVx4+jW9sRo+xvlKmMUlwB5yXHbqgQZ414WQoHf
 1/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E0p2IcIEyc/eQWKON69XxQ382HVwtD+ZPEK1c93NQxk=;
 b=h/qkCVMif30Qtt7a9KLFSudmWjOfMJ3kp6EODb1oR8kTaLQ4SaLrNmo893en5RXutY
 gML8ATfJBeb/A4Z5nx64SIwKqMu+ycayXM/KgmlhNxzGLk4uao/453Yc8g4AQhuVr37E
 LSV5MHns1ifSOfbfwKFhPYEOWLBEkcwWhDJ0gbTVMfSpszuRARe1gkpZG0omhG87BAi5
 wLb1YIdCbFjdReVIUXmMRWkyQj25b9UgwHnFGBIAFi49KA6HzT/gwzVqra2CLPx39RYX
 MrKp53yT8vd5fRuZeyxxAhY5fQdEnkMholWP2mS3kYiWKfqw7HL67MGaSiayT5MgIkvz
 FarA==
X-Gm-Message-State: AOAM5321GpZFS2q0CxDswldLYrDVNYLMjppVUbEGogWq8qKnbXnO/WCf
 k3N3zIXSxBgee46IbZ/YurH5qXZTjj8=
X-Google-Smtp-Source: ABdhPJySyJpZsDfUNvnGFf9eAHH4dj228XsdYUWR1MBJ/F/EIz84/wo3ymLEL9VmXvphpTpLQEsjxQ==
X-Received: by 2002:a17:90b:1806:: with SMTP id
 lw6mr20009662pjb.210.1642485512576; 
 Mon, 17 Jan 2022 21:58:32 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id h2sm1141137pjc.31.2022.01.17.21.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 21:58:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/2] KVM: PPC: Book3S PR: Disable SCV when running AIL is
 disabled
Date: Tue, 18 Jan 2022 15:58:21 +1000
Message-Id: <20220118055821.3065241-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220118055821.3065241-1-npiggin@gmail.com>
References: <20220118055821.3065241-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
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
index d87f7c1103ce..5b8740ece1b2 100644
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
index 6bc9425acb32..9845bd509185 100644
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

