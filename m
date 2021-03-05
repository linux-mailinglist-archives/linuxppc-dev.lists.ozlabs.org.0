Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDF932EE7F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:21:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWfc4J1wz3hHR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:21:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ImpA5Pux;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ImpA5Pux; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWN703TGz3dkl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:08:54 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id t9so2021523pjl.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZ2tZlVqY5qw6Dh/078f/Y4lwHDHawXBYQuwK0GoBI0=;
 b=ImpA5Pux0R/DPWNI5z1QS7x72WreD/F/b02N3ypzR0bllx9K98+10RjozYyJyxbfkV
 oCFgl9+6YkssVYAKvLDwlkmlIcLuJS4ws+6utX2gXZeogYgLhlN+N7dc7hAvQz6zUmqO
 nL8xSVxu0iTNxfdmakUOgko22lp92QXCNjGPdqzy+ScHTlRBw6iHC24UzCjMFLlUyddq
 E+/F3WgE9oqyzUA4UNLazbC8nsaQhvYZg1/TXPbRfXQo3nWeShHJ5iTutDhnBC2KIwtl
 td8CEd8maffzcZCSqbBmPkOROO+n7p25atvwg27Ms2qGUFdBbByWgcY+537HsXO2rBJ0
 xY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZ2tZlVqY5qw6Dh/078f/Y4lwHDHawXBYQuwK0GoBI0=;
 b=HOm/g7ZOxkcj+wbC3PCK3gHJDJSFdTe7PnNh3iiZ/rjov8XU1A8zswtUlrgBCxE2R3
 arVBkFfJb9dv4KGUNaSUlDVvRmwSERLraHc/l/BDvBDh7H2lcPrbZOB6Pa281rmFXAZG
 4232S9olZ5FBaRcNKdtAcDE4j5j+skaJOP4gEZKIJWVVRVII8eQ3DzlcNtWZ6W7nHefp
 wo5Di5ukMTDJnYy84nYyZPth1wocnYyNxsfVMKFFc11ky7kB9idmpWFM5osoMGXy4Wsc
 fJYNeZ47OJCQHgdxLfD9n9DU9rxjFRGEb4/Xm6pkk5m51+TvjQzN9HYYvgkbIWLCHmBU
 B9Zw==
X-Gm-Message-State: AOAM530zyz1xZSVAT/9GFQEsPDhhum4Wu99AXjf0vOYcMEglGvzIvEWe
 d5VLFvMMXzkYkEJcMi21yxU=
X-Google-Smtp-Source: ABdhPJwADWOalbNR5ckfC84qW7CX0DSncfkBcJFPPNB16vrLyXxVuvF4Ni/0RZEnNDzMTPblFETFwg==
X-Received: by 2002:a17:90a:5ae6:: with SMTP id
 n93mr10897502pji.146.1614956933403; 
 Fri, 05 Mar 2021 07:08:53 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:08:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 34/41] KVM: PPC: Book3S HV: Remove support for dependent
 threads mode on P9
Date: Sat,  6 Mar 2021 01:06:31 +1000
Message-Id: <20210305150638.2675513-35-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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

Radix guest support will be removed from the P7/8 path, so disallow
dependent threads mode on P9.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h |  1 -
 arch/powerpc/kvm/book3s_hv.c        | 27 +++++----------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 05fb00d37609..dd017dfa4e65 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -304,7 +304,6 @@ struct kvm_arch {
 	u8 fwnmi_enabled;
 	u8 secure_guest;
 	u8 svm_enabled;
-	bool threads_indep;
 	bool nested_enable;
 	bool dawr1_enabled;
 	pgd_t *pgtable;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index cb428e2f7140..928ed8180d9d 100644
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
@@ -2227,7 +2223,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
  */
 static int threads_per_vcore(struct kvm *kvm)
 {
-	if (kvm->arch.threads_indep)
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
 		return 1;
 	return threads_per_subcore;
 }
@@ -4319,7 +4315,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
-		if (kvm->arch.threads_indep && kvm_is_radix(kvm))
+		if (kvm_is_radix(kvm))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
@@ -4934,21 +4930,8 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
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
@@ -4989,7 +4972,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 {
 	debugfs_remove_recursive(kvm->arch.debugfs_dir);
 
-	if (!kvm->arch.threads_indep)
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		kvm_hv_vm_deactivated();
 
 	kvmppc_free_vcores(kvm);
-- 
2.23.0

