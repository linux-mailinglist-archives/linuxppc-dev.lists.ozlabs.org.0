Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE9351612
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:21:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6Mt5Zjzz3h3j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:21:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pAuJTUIi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pAuJTUIi; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB61n4tpzz3cbg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:33 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so3237862pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W3bieuXEZiR5cY5FOsX8DEozCvMfj7pauac9Eo5PjK4=;
 b=pAuJTUIiWlCFKWHZ4GHnPDNl5a2VC4qG01ugT9c1yteZPn4bkkmlH2ZtiwBXL3mqmK
 h2BLqvN9WPsLuZ/KwO8ADo6k20mtAMdOmwC08y80t9MG0Mslc4s3Aiiq24p1fDOruH5i
 TRd3R4MTidJ97QTHFYag5LnvJG2DKGOOOi+YWDF5pytCUl9Ys2VV1XslAKCuGUhMrhdS
 VYqQ4x/7MF9RHUrCxISagjb9IvdZYJsyzQbuK0nDU02SioHeKlraNGjqr07Fj9G2LUGy
 BxOqi9wljEZ715hCGK9+XPRB64t5x9vjGp/xfBy/Bupih5PeVfJ26Uimgc71E2Dk0qA2
 xt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W3bieuXEZiR5cY5FOsX8DEozCvMfj7pauac9Eo5PjK4=;
 b=BYB8VUlljEnoiEN0+Zi0fKrBS2AyBdFFg7ij8OuejUccF/3AFM1KsYjTaJxL3ZsX9k
 CEPsf5z+tYKQbK0tKAFQmV6xm8VZswnqmXcjZuq2MUy6qiIkHnXiiEWxe+gld8VIDdNM
 cNg1vznALrtm7+y+mrk/LnOcOJf5Y0A97Z/7W/CdLxAW1ByIbOJwrevpRz+BYzJ7mec6
 ngN4mjRoyeGD9JDWPnCl8yVjaR6vbpVRwmM8XeutkMlG1qcCH4opJbZjzIh2HW7vJn4R
 GPwujBDADI9QOpOtHmnhKO2uRtXyXU+CKuv5+Q3KjAo+ETSwiKTWpN7RW6Ppq7a30PGn
 lsIQ==
X-Gm-Message-State: AOAM531S8T/wZtxu2IbuLjwS52jBXla/BzPTUQxNP/QnPXMyiI+eZmes
 NVU9k8eRjcmbv2EZpn+SLFI=
X-Google-Smtp-Source: ABdhPJxSkBoYkh1gGr+pUBooTJ2eOs6dfzVVDjXNtkdhyQp43WMATDbF3IsglfXk1Qgo2v7vw8q9HA==
X-Received: by 2002:a17:90a:5d8f:: with SMTP id
 t15mr9217274pji.28.1617289531892; 
 Thu, 01 Apr 2021 08:05:31 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 38/48] KVM: PPC: Book3S HV: Remove support for dependent
 threads mode on P9
Date: Fri,  2 Apr 2021 01:03:15 +1000
Message-Id: <20210401150325.442125-39-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
index 50022c29a0fe..ae5ad93a623f 100644
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
@@ -2258,7 +2254,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
  */
 static int threads_per_vcore(struct kvm *kvm)
 {
-	if (kvm->arch.threads_indep)
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
 		return 1;
 	return threads_per_subcore;
 }
@@ -4354,7 +4350,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
-		if (kvm->arch.threads_indep && kvm_is_radix(kvm))
+		if (kvm_is_radix(kvm))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
@@ -4978,21 +4974,8 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
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
@@ -5033,7 +5016,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 {
 	debugfs_remove_recursive(kvm->arch.debugfs_dir);
 
-	if (!kvm->arch.threads_indep)
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		kvm_hv_vm_deactivated();
 
 	kvmppc_free_vcores(kvm);
-- 
2.23.0

