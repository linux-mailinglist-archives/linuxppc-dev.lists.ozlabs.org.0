Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CAB61730E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:52:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2kGW5mGVz3fkQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:52:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iDIyHkMK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3mptiywykdnmh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iDIyHkMK;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jXy10ybz3dtj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:20:18 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-368e6c449f2so1021497b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hVDla26eytMn5VFnbgyTVPls5SmrgGd/F0K2RutwtIE=;
        b=iDIyHkMK4rG4gjhR62NbU2u6gdWGP2OsiuMyUm8igYAHn8Yp75bJ9TkqULzcOkedq9
         lrMjOcoojkzBjBrlWbrxKO2hIi08hnG2vGMjy19X2fXFVzh41QfLnOmL8FwroxgO3U/9
         M/y/STwQ9eY7WF8E0/2v/0v9jH+QmXpfdWTDy77I/CMIhnQwVipOJiVFqKmJ5knT8kO6
         /eER3jJeTkGs/T4H5Ju8HiQ1eI0gIKHtbfqcKoWDK8SihPIEH+EjdUsL3+2iNE+kxZKc
         HsZJGEKFI4GV2S8b1QPqcice4sYcmqQ+Iksou1vJeTEdz8AoPZCMtO8nunZ43hRprA3N
         Kt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVDla26eytMn5VFnbgyTVPls5SmrgGd/F0K2RutwtIE=;
        b=LVdwpy/3nR0EevDO6E1HsDbwn7UHmYxVp5vwSn5j6v8aBpbmPBEwV2Mih9v7xteCIE
         Wb/814zyeS2fPT55FsHek9m9Ml0jRyLh2ouRLQEiQILnxxi+spScIP2jW7mxISYGFyCt
         XkNNS2I/++fW9MmU1BXP/twTcP6Vw6wVWb0XbHkH4KUMMwHjKylGCg2ngsj6+vM0Bak/
         3EgKI1vPr2bP+YggYKNsqbhwUs2Evl5QPbEDSvdYZAIS3QFWxI6kbFWJ87v46et2B1iR
         hHy/S6q4bhqGsj+qnl29B8uYeqXvvqztG7Oa/+jIKfWcNSH11AMURFCyDY12RutfDfm7
         IP9Q==
X-Gm-Message-State: ACrzQf3wLVLetzgPTPhYBe1Jgw/SLEU1ZS9TnmJSVW+0zrd6SmHocFTa
	lFv0JoTKciDWGxoEHEb+wn7kOVar8rA=
X-Google-Smtp-Source: AMsMyM6yoiTEPBcJzZyJoKfkq9RPyOM1vrXjFEM4y195PpXNkSIWWHhhXy8+p52Rv2+c/CoREZHcmA1s9zk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:b10d:0:b0:6cc:3aa3:8cf2 with SMTP id
 g13-20020a25b10d000000b006cc3aa38cf2mr22841832ybj.261.1667431216148; Wed, 02
 Nov 2022 16:20:16 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:03 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-37-seanjc@google.com>
Subject: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chao Gao <chao.gao@intel.com>

Do compatibility checks when enabling hardware to effectively add
compatibility checks when onlining a CPU.  Abort enabling, i.e. the
online process, if the (hotplugged) CPU is incompatible with the known
good setup.

At init time, KVM does compatibility checks to ensure that all online
CPUs support hardware virtualization and a common set of features. But
KVM uses hotplugged CPUs without such compatibility checks. On Intel
CPUs, this leads to #GP if the hotplugged CPU doesn't support VMX, or
VM-Entry failure if the hotplugged CPU doesn't support all features
enabled by KVM.

Note, this is little more than a NOP on SVM, as SVM already checks for
full SVM support during hardware enabling.

Opportunistically add a pr_err() if setup_vmcs_config() fails, and
tweak all error messages to output which CPU failed.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/svm/svm.c          | 20 +++++++++++---------
 arch/x86/kvm/vmx/vmx.c          | 33 +++++++++++++++++++--------------
 arch/x86/kvm/x86.c              |  5 +++--
 4 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f223c845ed6e..c99222b71fcc 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
 };
 
 struct kvm_x86_init_ops {
-	int (*check_processor_compatibility)(void);
+	int (*check_processor_compatibility)(int cpu);
 	int (*hardware_setup)(void);
 	unsigned int (*handle_intel_pt_intr)(void);
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index efda384d29d4..4772835174dd 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -525,13 +525,13 @@ static void svm_init_osvw(struct kvm_vcpu *vcpu)
 		vcpu->arch.osvw.status |= 1;
 }
 
-static bool kvm_is_svm_supported(void)
+static bool kvm_is_svm_supported(int cpu)
 {
 	const char *msg;
 	u64 vm_cr;
 
 	if (!cpu_has_svm(&msg)) {
-		pr_err("SVM not supported, %s\n", msg);
+		pr_err("SVM not supported by CPU %d, %s\n", cpu, msg);
 		return false;
 	}
 
@@ -542,16 +542,16 @@ static bool kvm_is_svm_supported(void)
 
 	rdmsrl(MSR_VM_CR, vm_cr);
 	if (vm_cr & (1 << SVM_VM_CR_SVM_DISABLE)) {
-		pr_err("SVM disabled in MSR_VM_CR\n");
+		pr_err("SVM disabled in MSR_VM_CR on CPU %d\n", cpu);
 		return false;
 	}
 
 	return true;
 }
 
-static int __init svm_check_processor_compat(void)
+static int svm_check_processor_compat(int cpu)
 {
-	if (!kvm_is_svm_supported())
+	if (!kvm_is_svm_supported(cpu))
 		return -EIO;
 
 	return 0;
@@ -588,14 +588,16 @@ static int svm_hardware_enable(void)
 	uint64_t efer;
 	struct desc_struct *gdt;
 	int me = raw_smp_processor_id();
+	int r;
+
+	r = svm_check_processor_compat(me);
+	if (r)
+		return r;
 
 	rdmsrl(MSR_EFER, efer);
 	if (efer & EFER_SVME)
 		return -EBUSY;
 
-	if (!kvm_is_svm_supported())
-		return -EINVAL;
-
 	sd = per_cpu(svm_data, me);
 	if (!sd) {
 		pr_err("%s: svm_data is NULL on %d\n", __func__, me);
@@ -5132,7 +5134,7 @@ static int __init svm_init(void)
 
 	__unused_size_checks();
 
-	if (!kvm_is_svm_supported())
+	if (!kvm_is_svm_supported(raw_smp_processor_id()))
 		return -EOPNOTSUPP;
 
 	r = kvm_x86_vendor_init(&svm_init_ops);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 07d86535c032..2729de93e0ea 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2520,8 +2520,7 @@ static bool cpu_has_perf_global_ctrl_bug(void)
 	return false;
 }
 
-static __init int adjust_vmx_controls(u32 ctl_min, u32 ctl_opt,
-				      u32 msr, u32 *result)
+static int adjust_vmx_controls(u32 ctl_min, u32 ctl_opt, u32 msr, u32 *result)
 {
 	u32 vmx_msr_low, vmx_msr_high;
 	u32 ctl = ctl_min | ctl_opt;
@@ -2539,7 +2538,7 @@ static __init int adjust_vmx_controls(u32 ctl_min, u32 ctl_opt,
 	return 0;
 }
 
-static __init u64 adjust_vmx_controls64(u64 ctl_opt, u32 msr)
+static u64 adjust_vmx_controls64(u64 ctl_opt, u32 msr)
 {
 	u64 allowed;
 
@@ -2548,8 +2547,8 @@ static __init u64 adjust_vmx_controls64(u64 ctl_opt, u32 msr)
 	return  ctl_opt & allowed;
 }
 
-static __init int setup_vmcs_config(struct vmcs_config *vmcs_conf,
-				    struct vmx_capability *vmx_cap)
+static int setup_vmcs_config(struct vmcs_config *vmcs_conf,
+			     struct vmx_capability *vmx_cap)
 {
 	u32 vmx_msr_low, vmx_msr_high;
 	u32 _pin_based_exec_control = 0;
@@ -2710,36 +2709,38 @@ static __init int setup_vmcs_config(struct vmcs_config *vmcs_conf,
 	return 0;
 }
 
-static bool __init kvm_is_vmx_supported(void)
+static bool kvm_is_vmx_supported(int cpu)
 {
 	if (!cpu_has_vmx()) {
-		pr_err("CPU doesn't support VMX\n");
+		pr_err("VMX not supported by CPU %d\n", cpu);
 		return false;
 	}
 
 	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
 	    !boot_cpu_has(X86_FEATURE_VMX)) {
-		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
+		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL on CPU %d\n", cpu);
 		return false;
 	}
 
 	return true;
 }
 
-static int __init vmx_check_processor_compat(void)
+static int vmx_check_processor_compat(int cpu)
 {
 	struct vmcs_config vmcs_conf;
 	struct vmx_capability vmx_cap;
 
-	if (!kvm_is_vmx_supported())
+	if (!kvm_is_vmx_supported(cpu))
 		return -EIO;
 
-	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
+	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0) {
+		pr_err("Failed to setup VMCS config on CPU %d\n", cpu);
 		return -EIO;
+	}
 	if (nested)
 		nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
-	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
-		pr_err("CPU %d feature inconsistency!\n", smp_processor_id());
+	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config))) {
+		pr_err("Inconsistent VMCS config on CPU %d\n", cpu);
 		return -EIO;
 	}
 	return 0;
@@ -2771,6 +2772,10 @@ static int vmx_hardware_enable(void)
 	u64 phys_addr = __pa(per_cpu(vmxarea, cpu));
 	int r;
 
+	r = vmx_check_processor_compat(cpu);
+	if (r)
+		return r;
+
 	if (cr4_read_shadow() & X86_CR4_VMXE)
 		return -EBUSY;
 
@@ -8517,7 +8522,7 @@ static int __init vmx_init(void)
 {
 	int r, cpu;
 
-	if (!kvm_is_vmx_supported())
+	if (!kvm_is_vmx_supported(raw_smp_processor_id()))
 		return -EOPNOTSUPP;
 
 	hv_setup_evmcs();
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0c1778f3308a..a7b1d916ecb2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9280,7 +9280,8 @@ struct kvm_cpu_compat_check {
 
 static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
 {
-	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
+	int cpu = smp_processor_id();
+	struct cpuinfo_x86 *c = &cpu_data(cpu);
 
 	WARN_ON(!irqs_disabled());
 
@@ -9288,7 +9289,7 @@ static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
 	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
 		return -EIO;
 
-	return ops->check_processor_compatibility();
+	return ops->check_processor_compatibility(cpu);
 }
 
 static void kvm_x86_check_cpu_compat(void *data)
-- 
2.38.1.431.g37b22c650d-goog

