Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6964BD6CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 08:25:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2DND2XQkz3cjg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 18:25:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S6TQ0mHC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=S6TQ0mHC; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2DLs1fBnz30Mn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 18:24:04 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id i6so7998769pfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 23:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ckR48vt1cgkASlzMuOBw9/smoxoiL+0ygwyW1GVhHh0=;
 b=S6TQ0mHCWlGmwfatQf25qBMO1ixsCMtzl8WQB+gsjNlRMjpfUCn3iCYs0R390uhWMh
 +IHCPPX+41y2jJuHdfQQwWlY3j9Q4/JAj2ixr7GYIXBJh4bSyHAWO8Wl3EVkBhvaMEAA
 qthoghqB0+E5Ynnyd+KuXXXBPDrSdx3NSCBM88WfZG8q1JXUe73sLV4Zo5M+nRDAXXlU
 KZON0llGv2AkdFW2aZZ53Mdnw1fn6bK/gmJRczxbBK9KtrnJGUhUSXeuPjx/UIFIKcbM
 A2qlnSspKExaSvgARF924iZU3CzyIDLysrSD5oZ8WzJxJKekv7nBRqMtAZL21nhBBCVP
 UH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ckR48vt1cgkASlzMuOBw9/smoxoiL+0ygwyW1GVhHh0=;
 b=GMtjVrOKfja7LF7GEwq2S13tgZsXVnYqdMDLyV4Kg3q7UmSkkVBguiGpegF+lC9mhB
 uUN9d6R9Bz1+2TvSXbmDSXP8ybhyrjsSOxbfPxDi03Y23BSOFyPx/5cZCjlQrEGM0hzF
 d9WXilK+iCZazzQYQN9ag408Oyl8/G9tKrnP3zmuvZtEGOV79JYd/eKwbLuv/7Goduuv
 07LBtVPQbPMxmhCX1sCpnvZR11h61K3bItzAPuskyxr7I+6H5MbmgAIF1K6clljiJHxG
 xF5GHESg9YbehanDu4Ilfdj2ZZNlJ+8M7wRFob2OSbO+SzfskCDSLRm3xnH9icGZ26x5
 sU/w==
X-Gm-Message-State: AOAM530KIi+83o2iAx7CnExc1x0Y95MEutpxwZH6KMAPkxf6KLLpXNiE
 DrFlLTS0CVHRd9pOIJ8H6/wIMYlI/2Q=
X-Google-Smtp-Source: ABdhPJzBWbrIrJ/BTSLQ8Za0NRrcb+FIbn2Cv8joldkvOSvEQ/TOD2yOOS/9lRSOe9LUwCJvlT78dQ==
X-Received: by 2002:a63:6cb:0:b0:36c:e2d:8857 with SMTP id
 194-20020a6306cb000000b0036c0e2d8857mr15001857pgg.214.1645428242832; 
 Sun, 20 Feb 2022 23:24:02 -0800 (PST)
Received: from bobo.ibm.com (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id me14sm6825901pjb.41.2022.02.20.23.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:24:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/3] KVM: PPC: Book3S PR: Disable SCV when AIL could be
 disabled
Date: Mon, 21 Feb 2022 17:23:51 +1000
Message-Id: <20220221072353.2219034-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220221072353.2219034-1-npiggin@gmail.com>
References: <20220221072353.2219034-1-npiggin@gmail.com>
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

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S |  4 ++++
 arch/powerpc/kernel/setup_64.c       | 28 ++++++++++++++++++++++++++++
 arch/powerpc/kvm/Kconfig             |  9 +++++++++
 arch/powerpc/kvm/book3s_pr.c         | 26 +++++++++++++++++---------
 4 files changed, 58 insertions(+), 9 deletions(-)

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
index be8577ac9397..d973ae7558e3 100644
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
+		 * - So SCV support is blanket disabled if PR KVM could possibly
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
index 34a801c3604a..7bf9e6ca5c2d 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -137,12 +137,15 @@ static void kvmppc_core_vcpu_load_pr(struct kvm_vcpu *vcpu, int cpu)
 	svcpu->slb_max = to_book3s(vcpu)->slb_shadow_max;
 	svcpu->in_use = 0;
 	svcpu_put(svcpu);
-#endif
 
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
+#endif
 
 	vcpu->cpu = smp_processor_id();
 #ifdef CONFIG_PPC_BOOK3S_32
@@ -165,6 +168,14 @@ static void kvmppc_core_vcpu_put_pr(struct kvm_vcpu *vcpu)
 	memcpy(to_book3s(vcpu)->slb_shadow, svcpu->slb, sizeof(svcpu->slb));
 	to_book3s(vcpu)->slb_shadow_max = svcpu->slb_max;
 	svcpu_put(svcpu);
+
+	/* Enable AIL if supported */
+	if (cpu_has_feature(CPU_FTR_HVMODE)) {
+		if (cpu_has_feature(CPU_FTR_ARCH_207S))
+			mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) | LPCR_AIL_3);
+		if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
+			mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) | FSCR_SCV);
+	}
 #endif
 
 	if (kvmppc_is_split_real(vcpu))
@@ -174,11 +185,6 @@ static void kvmppc_core_vcpu_put_pr(struct kvm_vcpu *vcpu)
 	kvmppc_giveup_fac(vcpu, FSCR_TAR_LG);
 	kvmppc_save_tm_pr(vcpu);
 
-	/* Enable AIL if supported */
-	if (cpu_has_feature(CPU_FTR_HVMODE) &&
-	    cpu_has_feature(CPU_FTR_ARCH_207S))
-		mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) | LPCR_AIL_3);
-
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

