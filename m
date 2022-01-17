Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E71490A3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 15:26:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcvND1dNGz3bPK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 01:26:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eC+zw/s9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eC+zw/s9; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcvLF2Qm1z30KW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 01:24:37 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 8so11017410pgc.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 06:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQsgfs5w/k3SeQSpNOnvXICVwIbKtUGAhPYtHv9h4Uk=;
 b=eC+zw/s9kL+MX7EUMrS2nnjQ5+YbKSBfBE22uXTvYg653zDavSxeIpyLi3lBP++62d
 ZEzeKH9eKYUgiQZd8ro4trdjx8cJjwSbBdn0jI0hr5XFQzMbQg5Oo8UXsn42Xx5lJh+q
 NlCrdivJ0xby5/AMTjf6b9FwJORxRWJmZUnwXg2offcQKII4ppCWW0mkpvLVCp7d5sfI
 J3bBsKyVc7Jg0eVuRRMLrS7ephE3t42J4Ubx4QMs5cWGMrYS06/virlk6KKtZdQUZKcI
 23QSUl+gTb6ZtphSRnC4Cpklsy8Zup45aWeWdDIL4bU2RBiGJSXuZlT6AkT9h++DLUn1
 KyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JQsgfs5w/k3SeQSpNOnvXICVwIbKtUGAhPYtHv9h4Uk=;
 b=1cH1cGwfmdo6JV3byNvuhnJFjkbWleDDi58H9UhTrxP6wrZhYIpieNaRdT8x5GAi5p
 0gV1kofgnczuQtiE78Tth4fWK6ADu+ylNkvaoKNh4ZMGWZXQQ9uUpS5xp4ljqlCTZUGv
 F4WOpHImWAulaCduu+UvwL5kJ5tpwFWjsJGFq70Bnl2JdUKP8VFd4j4w/XQmoSE7DFRg
 XIxl6o3I/GKYgqxGLAyiZLLWd+jud1STgo40XBB2F2iTRiNr/4PI39NIrenm41QxbDVw
 WkIM32sSBh3HXP/TeAQ4djU5Zy89yVXUZG5IndXTOqzdz7HLEqkRIzmYWRlK38XhdXvV
 Qt9Q==
X-Gm-Message-State: AOAM531ZlcsPzezffCejEdDgoblha3Qx0PaOBoaaaMi8UyDzfYrCjUPH
 /ofR1GXm4iHRdkG6hQ1fdw1Wn/HpGSE=
X-Google-Smtp-Source: ABdhPJwuo/rleqA/Az9dszlKGLw7ytMaEvlkwG4ecTYO6dHWjJ8rCYMKc4ZLelFylbBkz8lugLlYDw==
X-Received: by 2002:a63:587:: with SMTP id 129mr11976298pgf.378.1642429475106; 
 Mon, 17 Jan 2022 06:24:35 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id ga1sm7086325pjb.24.2022.01.17.06.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:24:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/3] KVM: PPC: Book3S PR: Disable SCV when running AIL is
 disabled
Date: Tue, 18 Jan 2022 00:24:23 +1000
Message-Id: <20220117142423.3038570-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220117142423.3038570-1-npiggin@gmail.com>
References: <20220117142423.3038570-1-npiggin@gmail.com>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PR KVM does not support running with AIL enabled, and SCV does is not
supported with AIL disabled.

When PR KVM disables AIL on a system that has SCV enabled, the guest can
crash the host if it executes scv, or the host can crash itself if
another CPU executes scv while AIL is disabled (e.g., in the pseries
case).

Fix this by disabling the SCV facility when PR KVM disables AIL. The
facility unavailable handler will emulate it.

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

---
This is not well tested at the moment, and PR KVM would need to emulate
scv for the guest for a complete implementation. At least it should
prevent host crashes.

 arch/powerpc/kernel/exceptions-64s.S  |  5 +++
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 14 ++++++--
 arch/powerpc/kvm/book3s_pr.c          | 52 ++++++++++++++++++++++-----
 3 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 55caeee37c08..9985d061f9bf 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -809,6 +809,11 @@ __start_interrupts:
  * - MSR_EE|MSR_RI is clear (no reentrant exceptions)
  * - Standard kernel environment is set up (stack, paca, etc)
  *
+ * KVM:
+ * These interrupts do not elevate HV 0->1, so HV is not involved. PR disables
+ * the FSCR[SCV] facility before running the guest so scv becomes a program
+ * interrupt and where it can be emulated by the OS.
+ *
  * Call convention:
  *
  * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index a28e5b3daabd..611dd34cf708 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -373,6 +373,12 @@ void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 }
 EXPORT_SYMBOL_GPL(save_p9_host_os_sprs);
 
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
+bool pr_kvm_disabled_reloc_exc(void);
+#else
+static inline bool pr_kvm_disabled_reloc_exc(void) { return false; }
+#endif
+
 /* vcpu guest regs must already be saved */
 void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 			     struct p9_host_os_sprs *host_os_sprs)
@@ -395,8 +401,12 @@ void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 		mtspr(SPRN_UAMOR, 0);
 	if (host_os_sprs->amr != vcpu->arch.amr)
 		mtspr(SPRN_AMR, host_os_sprs->amr);
-	if (current->thread.fscr != vcpu->arch.fscr)
-		mtspr(SPRN_FSCR, current->thread.fscr);
+	if (current->thread.fscr != vcpu->arch.fscr) {
+		if (pr_kvm_disabled_reloc_exc())
+			mtspr(SPRN_FSCR, current->thread.fscr & ~FSCR_SCV);
+		else
+			mtspr(SPRN_FSCR, current->thread.fscr);
+	}
 	if (current->thread.dscr != vcpu->arch.dscr)
 		mtspr(SPRN_DSCR, current->thread.dscr);
 	if (vcpu->arch.pspb != 0)
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 6bc9425acb32..d608afb3376b 100644
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
@@ -1990,6 +1998,21 @@ static int kvm_vm_ioctl_get_smmu_info_pr(struct kvm *kvm,
 static unsigned int kvm_global_user_count = 0;
 static DEFINE_SPINLOCK(kvm_global_user_count_lock);
 
+bool pr_kvm_disabled_reloc_exc(void)
+{
+	return kvm_global_user_count != 0;
+}
+
+static void disable_scv(void *dummy)
+{
+	mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) & ~FSCR_SCV);
+}
+
+static void enable_scv(void *dummy)
+{
+	mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) | FSCR_SCV);
+}
+
 static int kvmppc_core_init_vm_pr(struct kvm *kvm)
 {
 	mutex_init(&kvm->arch.hpt_mutex);
@@ -2001,8 +2024,17 @@ static int kvmppc_core_init_vm_pr(struct kvm *kvm)
 
 	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
 		spin_lock(&kvm_global_user_count_lock);
-		if (++kvm_global_user_count == 1)
+		if (++kvm_global_user_count == 1) {
+			/*
+			 * FSCR isn't context switched except for KVM HV
+			 * entry/exit, so only have to care to keep that
+			 * part up to date.
+			 */
+			if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
+				smp_call_function(disable_scv, NULL, 0);
+			/* SCV must be disabled first */
 			pseries_disable_reloc_on_exc();
+		}
 		spin_unlock(&kvm_global_user_count_lock);
 	}
 	return 0;
@@ -2017,8 +2049,12 @@ static void kvmppc_core_destroy_vm_pr(struct kvm *kvm)
 	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
 		spin_lock(&kvm_global_user_count_lock);
 		BUG_ON(kvm_global_user_count == 0);
-		if (--kvm_global_user_count == 0)
+		if (--kvm_global_user_count == 0) {
 			pseries_enable_reloc_on_exc();
+			/* reloc must be enabled irst */
+			if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
+				smp_call_function(enable_scv, NULL, 0);
+		}
 		spin_unlock(&kvm_global_user_count_lock);
 	}
 }
-- 
2.23.0

