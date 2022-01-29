Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F294A2C77
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 08:26:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jm5VH66f2z3cWF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 18:26:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZKskIXYf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZKskIXYf; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jm5Sy43ywz2x9g
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 18:25:22 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d1so8143459plh.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 23:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5n0y7aVPOHGlp67fK991hHYZZKl3Dx0iJGRlEvUYug4=;
 b=ZKskIXYfwJqgsm5Bwr7HLeFsxG3RhEhOItgJMBXVy4F7hfuLIcuiXUopl0l/9zttBz
 oLzC9lL+eshCIX8UDCAbqJJDFMrE2OCuO8FGPJl3XVICtBHa7b+VlH2eTAoEU6qGK/4y
 lad/SP1p0ELXqvr9z0jAkK9M8mHOXrhvacFY63na6PaOQoCVcnaG2QTLbKHqhokkH7sn
 UnlEad+2OeOUcAj2+dKXaDWATKu8RCKIV3x4BUUioBmfUZpSzQI8r/WADiMp4RIcdYKp
 gprRGYJq+6clCZXOWMtDxieEWhjK9eoho06LowkfVptdII/4Bo8Pr06tAi8mN3OJ0GBQ
 X8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5n0y7aVPOHGlp67fK991hHYZZKl3Dx0iJGRlEvUYug4=;
 b=miBQZVSLo4KMtXJa/uLt7QQkNmfv5xzAymQzaF3Sg+X5vbxalNMMXSgCn0SEf/SGCa
 ihiA1842wsY9BsBjCVGVZaAa6sSLiXNhKZi7o2JbJrLb9cLrg9+UHS9l8Y14GPoFYUcn
 kQX4NL55fuAh2Xf15E0ttvMZQWWm+tR+EoOk61SQ5e9DyatC1TnxrIgbt8Xol69ZNT1t
 UuYQKSnEJKhucuJWWFQgbZMB7w4axd3jOB7quB/DUO+j26hThMnmwc9M0xRNJiR5Wr1L
 pJNXdrtwSLeuiSfSz7Xca2+ntCY9MavNFvVczO/j56Dh98su0lZ5uzhtY3hGKPtxn2Gs
 QETQ==
X-Gm-Message-State: AOAM533xSMIvxhu735nVGVRgUo5/CM66xMl7YWMRz0FzEXGcZ3w11zsJ
 CFurzBaOyvsuKeOeT6kuAE3yq2AicUkElA==
X-Google-Smtp-Source: ABdhPJz0ganZZXlOFpJa8Gj3jzfso6leCMdDX4aj4PknHpQ3YYBAk60EigDRC3YhoCHKBjoROS8U9A==
X-Received: by 2002:a17:903:32c2:: with SMTP id
 i2mr11941983plr.55.1643441120179; 
 Fri, 28 Jan 2022 23:25:20 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.111.178.100])
 by smtp.gmail.com with ESMTPSA id 12sm3917449pgb.71.2022.01.28.23.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 23:25:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] KVM: PPC: Book3S PR: Disable SCV when AIL could be
 disabled
Date: Sat, 29 Jan 2022 17:25:10 +1000
Message-Id: <20220129072511.105523-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220129072511.105523-1-npiggin@gmail.com>
References: <20220129072511.105523-1-npiggin@gmail.com>
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
supported with AIL disabled. Fix this by ensuring the SCV facility is
disabled with FSCR while a CPU could be running with AIL=0.

The PowerNV host supports disabling AIL on a per-CPU basis, so SCV just
needs to be disabled when a vCPU is being run.

The pSeries machine can only switch AIL on a system-wide basis, so it
must disable SCV support at boot if the configuration can potentially
run a PR KVM guest.

Also ensure a the FSCR[SCV] bit can not be enabled when emulating
mtFSCR for the guest.

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
 arch/powerpc/kernel/setup_64.c       | 28 ++++++++++++++++++++++++++++
 arch/powerpc/kvm/Kconfig             |  9 +++++++++
 arch/powerpc/kvm/book3s_pr.c         | 20 ++++++++++++++------
 4 files changed, 55 insertions(+), 6 deletions(-)

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
index be8577ac9397..7f7da641e551 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -197,6 +197,34 @@ static void __init configure_exceptions(void)
 
 	/* Under a PAPR hypervisor, we need hypercalls */
 	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
+		/*
+		 * - PR KVM does not support AIL mode interrupts in the host
+		 *   while a PR guest is running.
+		 *
+		 * - SCV system call interrupt vectors are only implemented for
+		 *   AIL mode interrupts.
+		 *
+		 * - On pseries, AIL mode can only be enabled and disabled
+		 *   system-wide so when a PR VM is created on a pseries host,
+		 *   all CPUs of the host are set to AIL=0 mode.
+		 *
+		 * - Therefore host CPUs must not execute scv while a PR VM
+		 *   exists.
+		 *
+		 * - SCV support can not be disabled dynamically because the
+		 *   feature is advertised to host userspace. Disabling the
+		 *   facility and emulating it would be possible but is not
+		 *   implemented.
+		 *
+		 * - So SCV support is blanket diabled if PR KVM could possibly
+		 *   run. That is, PR support compiled in, booting on pseries
+		 *   with hash MMU.
+		 */
+		if (IS_ENABLED(CONFIG_KVM_BOOK3S_PR_POSSIBLE) && !radix_enabled()) {
+			init_task.thread.fscr &= ~FSCR_SCV;
+			cur_cpu_spec->cpu_user_features2 &= ~PPC_FEATURE2_SCV;
+		}
+
 		/* Enable AIL if possible */
 		if (!pseries_enable_reloc_on_exc()) {
 			init_task.thread.fscr &= ~FSCR_SCV;
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 18e58085447c..ddd88179110a 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -112,12 +112,21 @@ config KVM_BOOK3S_64_PR
 	  guest in user mode (problem state) and emulating all
 	  privileged instructions and registers.
 
+	  This is only available for hash MMU mode and only supports
+	  guests that use hash MMU mode.
+
 	  This is not as fast as using hypervisor mode, but works on
 	  machines where hypervisor mode is not available or not usable,
 	  and can emulate processors that are different from the host
 	  processor, including emulating 32-bit processors on a 64-bit
 	  host.
 
+	  Selecting this option will cause the SCV facility to be
+	  disabled when the kernel is booted on the pseries platform in
+	  hash MMU mode (regardless of PR VMs running). When any PR VMs
+	  are running, "AIL" mode is disabled which may slow interrupts
+	  and system calls on the host.
+
 config KVM_BOOK3S_HV_EXIT_TIMING
 	bool "Detailed timing for hypervisor real-mode code"
 	depends on KVM_BOOK3S_HV_POSSIBLE && DEBUG_FS
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

