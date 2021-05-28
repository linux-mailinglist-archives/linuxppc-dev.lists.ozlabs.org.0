Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B9393FB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:18:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frzck6XfFz3fVl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:18:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kC1kkCYz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kC1kkCYz; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzQ169fHz3c25
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:57 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso2143136pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OnKJh4y5kXTOR3ecJKEiQJFMQnnKoAjceJviPL+WZes=;
 b=kC1kkCYzNaU1UwHgcCyIxOYVav32pD95xQVypy1ZC4XJccHM7xYeAiqy/p2GIHFtIS
 U6BFduasKNct4+eSiIteclntK71XHBPIgwbvPnX7KfaNHcOHxxp27dT066rtlC45pxEd
 GKLyi5hXrczZ6eAXRPQMN1jc9IhzJxI0kc/yOpzgftJQNGp4NlOVXkJLP5wIIh+zsOAR
 Z+UxGOTdVNK6WfbfI4IdX/BAo9QcTXAC4M28pD1Ud/zSho/KJbWfN41ZNHpVFZsZduau
 LLgvn/kesA/tJMf13odzUpVd8M5Wlvnndsuz/dbu5vlCiYZO8dNV79t+ruwt4LJJBRQ0
 Fedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OnKJh4y5kXTOR3ecJKEiQJFMQnnKoAjceJviPL+WZes=;
 b=a2Z443z6nIIZx5det6m4dPaVpGd+zcelnj8UuYDl2fN3eScDBSEPrt7wVs5TJVLDaT
 sEVAAhTkstH6405MfGXoCFKiIq0p7lmjDLF0wooAwCLgcviZtdZc+0dLFIVMqmIahH7V
 iC+NhUqopMz9TJK2L5gE0PBkAs3AInWFW9SlX88Y0Xvnzp3u1VnMkvXGcX2fFp6W6T05
 6FIGVxHwgme0Ja/cJcpq77o5DvS1HL4M01AOgjF1+HdF77kEZvEn3Rg0DkVUbd2YnhIV
 Kh2U3dVqGwyiR8Olq6GVHrY5LteQo7tZHICmWyATh5VpYpDFkPxCBDQE17T4fF/vkHS9
 gfaQ==
X-Gm-Message-State: AOAM532LfzWGSOOORVHwNp4xjtNxm8EggpDK+72VXkTmIXz86mXSIab/
 HbkQZtJsyl+9wVT36irRpSA/8iojwS8=
X-Google-Smtp-Source: ABdhPJzd1SIf+CiXZ6GlwxeXlHPblGpVAhxWBw6f26GT1i+xKX2NCnoMzL8il8DRrdts1icJRR9fqQ==
X-Received: by 2002:a17:90a:c68f:: with SMTP id
 n15mr3177324pjt.112.1622192935404; 
 Fri, 28 May 2021 02:08:55 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 22/32] KVM: PPC: Book3S HV: Remove support for dependent
 threads mode on P9
Date: Fri, 28 May 2021 19:07:42 +1000
Message-Id: <20210528090752.3542186-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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

Dependent-threads mode is the normal KVM mode for pre-POWER9 SMT
processors, where all threads in a core (or subcore) would run the same
partition at the same time, or they would run the host.

This design was mandated by MMU state that is shared between threads in
a processor, so the synchronisation point is in hypervisor real-mode
that has essentially no shared state, so it's safe for multiple threads
to gather and switch to the correct mode.

It is implemented by having the host unplug all secondary threads and
always run in SMT1 mode, and host QEMU threads essentially represent
virtual cores that wake these secondary threads out of unplug when the
ioctl is called to run the guest. This happens via a side-path that is
mostly invisible to the rest of the Linux host and the secondary threads
still appear to be unplugged.

POWER9 / ISA v3.0 has a more flexible MMU design that is independent
per-thread and allows a much simpler KVM implementation. Before the new
"P9 fast path" was added that began to take advantage of this, POWER9
support was implemented in the existing path which has support to run
in the dependent threads mode. So it was not much work to add support to
run POWER9 in this dependent threads mode.

The mode is not required by the POWER9 MMU (although "mixed-mode" hash /
radix MMU limitations of early processors were worked around using this
mode). But it is one way to run SMT guests without running different
guests or guest and host on different threads of the same core, so it
could avoid or reduce some SMT attack surfaces without turning off SMT
entirely.

This security feature has some real, if indeterminate, value. However
the old path is lagging in features (nested HV), and with this series
the new P9 path adds remaining missing features (radix prefetch bug
and hash support, in later patches), so POWER9 dependent threads mode
support would be the only remaining reason to keep that code in and keep
supporting POWER9/POWER10 in the old path. So here we make the call to
drop this feature.

Remove dependent threads mode support for POWER9 and above processors.
Systems can still achieve this security by disabling SMT entirely, but
that would generally come at a larger performance cost for guests.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_asm.h  |  2 +-
 arch/powerpc/include/asm/kvm_host.h |  1 -
 arch/powerpc/kvm/book3s_64_entry.S  |  3 +--
 arch/powerpc/kvm/book3s_hv.c        | 27 +++++----------------------
 4 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_asm.h b/arch/powerpc/include/asm/kvm_asm.h
index 43b1788e1f93..f4ae37810aa9 100644
--- a/arch/powerpc/include/asm/kvm_asm.h
+++ b/arch/powerpc/include/asm/kvm_asm.h
@@ -147,7 +147,7 @@
 #define KVM_GUEST_MODE_SKIP	2
 #define KVM_GUEST_MODE_GUEST_HV	3
 #define KVM_GUEST_MODE_HOST_HV	4
-#define KVM_GUEST_MODE_HV_FAST	5 /* ISA >= v3.0 host+guest radix, indep thr */
+#define KVM_GUEST_MODE_HV_FAST	5 /* ISA >= v3.0 host+guest radix */
 
 #define KVM_INST_FETCH_FAILED	-1
 
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 69add9d662df..6904ce9e8190 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -297,7 +297,6 @@ struct kvm_arch {
 	u8 fwnmi_enabled;
 	u8 secure_guest;
 	u8 svm_enabled;
-	bool threads_indep;
 	bool nested_enable;
 	bool dawr1_enabled;
 	pgd_t *pgtable;
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 177e8fad5c8d..bac664c1a9f7 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -184,8 +184,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
  * void kvmppc_p9_enter_guest(struct vcpu *vcpu);
  *
  * Enter the guest on a ISAv3.0 or later system where we have exactly
- * one vcpu per vcore, and both the host and guest are radix, and threads
- * are set to "indepdent mode".
+ * one vcpu per vcore, and both the host and guest are radix.
  */
 .balign	IFETCH_ALIGN_BYTES
 _GLOBAL(kvmppc_p9_enter_guest)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index eb25605e23b9..acb0c72ea900 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -103,13 +103,9 @@ static int target_smt_mode;
 module_param(target_smt_mode, int, 0644);
 MODULE_PARM_DESC(target_smt_mode, "Target threads per core (0 = max)");
 
-static bool indep_threads_mode = true;
-module_param(indep_threads_mode, bool, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(indep_threads_mode, "Independent-threads mode (only on POWER9)");
-
 static bool one_vm_per_core;
 module_param(one_vm_per_core, bool, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(one_vm_per_core, "Only run vCPUs from the same VM on a core (requires indep_threads_mode=N)");
+MODULE_PARM_DESC(one_vm_per_core, "Only run vCPUs from the same VM on a core (requires POWER8 or older)");
 
 #ifdef CONFIG_KVM_XICS
 static const struct kernel_param_ops module_param_ops = {
@@ -2265,7 +2261,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
  */
 static int threads_per_vcore(struct kvm *kvm)
 {
-	if (kvm->arch.threads_indep)
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
 		return 1;
 	return threads_per_subcore;
 }
@@ -4369,7 +4365,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
-		if (kvm->arch.threads_indep && kvm_is_radix(kvm))
+		if (kvm_is_radix(kvm))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
@@ -4992,21 +4988,8 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 	/*
 	 * Track that we now have a HV mode VM active. This blocks secondary
 	 * CPU threads from coming online.
-	 * On POWER9, we only need to do this if the "indep_threads_mode"
-	 * module parameter has been set to N.
 	 */
-	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
-		if (!indep_threads_mode && !cpu_has_feature(CPU_FTR_HVMODE)) {
-			pr_warn("KVM: Ignoring indep_threads_mode=N in nested hypervisor\n");
-			kvm->arch.threads_indep = true;
-		} else if (!indep_threads_mode && cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
-			pr_warn("KVM: Ignoring indep_threads_mode=N on pre-DD2.2 POWER9\n");
-			kvm->arch.threads_indep = true;
-		} else {
-			kvm->arch.threads_indep = indep_threads_mode;
-		}
-	}
-	if (!kvm->arch.threads_indep)
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		kvm_hv_vm_activated();
 
 	/*
@@ -5047,7 +5030,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 {
 	debugfs_remove_recursive(kvm->arch.debugfs_dir);
 
-	if (!kvm->arch.threads_indep)
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		kvm_hv_vm_deactivated();
 
 	kvmppc_free_vcores(kvm);
-- 
2.23.0

