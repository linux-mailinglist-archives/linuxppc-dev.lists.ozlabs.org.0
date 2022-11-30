Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8159563E5D4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:53:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwyX308Cz3gWy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:53:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pSTNuIvD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=39ekhywykdpwwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pSTNuIvD;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw131WqKz3bym
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:47 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a5-20020a25af05000000b006e450a5e507so18066014ybh.22
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=53xJtsXwAsu74EweEvqLfwwo7zzTtOoMYgP2NXGBEKw=;
        b=pSTNuIvDzqWnjZTy4TWEvDb45JzvrqoAq5tphcGqjnpEcv+R/E8uYQMST763yB4Xzg
         GkjPiFx7QlczEj89uSRUJy1png4jJ9iumTum3a/8jGXB1FnzXD35IJr9mI2whDJDhum0
         qqGEC2oYlXUbEoxJq0t7seuQA6WP2YG6MJ6xz4hTptg9EaGLExMA91pOMDzEebdIi476
         ahiRNeQ8UwgfXn5rGMohKmKN/szmS9AmNNZW9RQV9eetqIRLS1npGSVnlb5ZtYYiTmP+
         65N61m0sWNWw60bzjuPOHysag10RaRkCocITH75cYqgtvbV64S2g0ywUnBBLVcnK+ahX
         iwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53xJtsXwAsu74EweEvqLfwwo7zzTtOoMYgP2NXGBEKw=;
        b=iVZUz1rukzkwYjmnob3rLodxxU0hwN8HxAk9ttnvcwZkAdhALvx2/42BFsgyI+Y8VK
         lM5NXlAww4WcbmopgyOBNLNcZJyW+qhLgGX4y3ViX6MJ5LRw1JpNzts157fps14+iPNB
         dcMRYNe+mYBe4SAGIA2AFBnKXP+Q6MKeDO1Q8t1XGMAf0kYcsrcFuDQl6K0QySByfiin
         6pYa1uC6fBE5Npm4GCFV2GyfF8yQ+IEiO7WXPtyfG6ssNpXPXwisHBeLVUrEzsp1dJnt
         +TPEgm8X+wkAvJfy3XZU0dZz744xn2MsMXHHC/Ps2yQ27tAMtS6kVdM+wZQ5M7A8pP0O
         /YpA==
X-Gm-Message-State: ANoB5pmfTyRXTkGWLTl4g9Kf4HtPmXfagIjD9i7g2pFHUOnHlvQAv1BJ
	yL8JNpWn9qg4APJbFePdPEmtkpGtxfs=
X-Google-Smtp-Source: AA0mqf62G3WEsILjLTjpGVsE3QUTfdWzqwQbUzQ3G5NPce2lGkYDgeTJs0U0N9V7g53Te4Rh8/MCAEMDECQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ab05:0:b0:6ca:1823:ab0d with SMTP id
 u5-20020a25ab05000000b006ca1823ab0dmr47624596ybi.99.1669849845153; Wed, 30
 Nov 2022 15:10:45 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:23 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-40-seanjc@google.com>
Subject: [PATCH v2 39/50] KVM: x86: Move CPU compat checks hook to kvm_x86_ops
 (from kvm_x86_init_ops)
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the .check_processor_compatibility() callback from kvm_x86_init_ops
to kvm_x86_ops to allow a future patch to do compatibility checks during
CPU hotplug.

Do kvm_ops_update() before compat checks so that static_call() can be
used during compat checks.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  3 ++-
 arch/x86/kvm/svm/svm.c             |  5 +++--
 arch/x86/kvm/vmx/vmx.c             | 16 +++++++--------
 arch/x86/kvm/x86.c                 | 31 +++++++++++-------------------
 5 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index abccd51dcfca..dba2909e5ae2 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -14,6 +14,7 @@ BUILD_BUG_ON(1)
  * to make a definition optional, but in this case the default will
  * be __static_call_return0.
  */
+KVM_X86_OP(check_processor_compatibility)
 KVM_X86_OP(hardware_enable)
 KVM_X86_OP(hardware_disable)
 KVM_X86_OP(hardware_unsetup)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index d79aedf70908..ba74fea6850b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1518,6 +1518,8 @@ static inline u16 kvm_lapic_irq_dest_mode(bool dest_mode_logical)
 struct kvm_x86_ops {
 	const char *name;
 
+	int (*check_processor_compatibility)(void);
+
 	int (*hardware_enable)(void);
 	void (*hardware_disable)(void);
 	void (*hardware_unsetup)(void);
@@ -1729,7 +1731,6 @@ struct kvm_x86_nested_ops {
 };
 
 struct kvm_x86_init_ops {
-	int (*check_processor_compatibility)(void);
 	int (*hardware_setup)(void);
 	unsigned int (*handle_intel_pt_intr)(void);
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 9f94efcb9aa6..c2e95c0d9fd8 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -543,7 +543,7 @@ static bool kvm_is_svm_supported(void)
 	return true;
 }
 
-static int __init svm_check_processor_compat(void)
+static int svm_check_processor_compat(void)
 {
 	if (!kvm_is_svm_supported())
 		return -EIO;
@@ -4695,6 +4695,8 @@ static int svm_vm_init(struct kvm *kvm)
 static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.name = KBUILD_MODNAME,
 
+	.check_processor_compatibility = svm_check_processor_compat,
+
 	.hardware_unsetup = svm_hardware_unsetup,
 	.hardware_enable = svm_hardware_enable,
 	.hardware_disable = svm_hardware_disable,
@@ -5079,7 +5081,6 @@ static __init int svm_hardware_setup(void)
 
 static struct kvm_x86_init_ops svm_init_ops __initdata = {
 	.hardware_setup = svm_hardware_setup,
-	.check_processor_compatibility = svm_check_processor_compat,
 
 	.runtime_ops = &svm_x86_ops,
 	.pmu_ops = &amd_pmu_ops,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 2a8a6e481c76..6416ed5b7f89 100644
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
@@ -2710,7 +2709,7 @@ static __init int setup_vmcs_config(struct vmcs_config *vmcs_conf,
 	return 0;
 }
 
-static bool __init kvm_is_vmx_supported(void)
+static bool kvm_is_vmx_supported(void)
 {
 	if (!cpu_has_vmx()) {
 		pr_err("CPU doesn't support VMX\n");
@@ -2726,7 +2725,7 @@ static bool __init kvm_is_vmx_supported(void)
 	return true;
 }
 
-static int __init vmx_check_processor_compat(void)
+static int vmx_check_processor_compat(void)
 {
 	struct vmcs_config vmcs_conf;
 	struct vmx_capability vmx_cap;
@@ -8104,6 +8103,8 @@ static void vmx_vm_destroy(struct kvm *kvm)
 static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.name = KBUILD_MODNAME,
 
+	.check_processor_compatibility = vmx_check_processor_compat,
+
 	.hardware_unsetup = vmx_hardware_unsetup,
 
 	.hardware_enable = vmx_hardware_enable,
@@ -8501,7 +8502,6 @@ static __init int hardware_setup(void)
 }
 
 static struct kvm_x86_init_ops vmx_init_ops __initdata = {
-	.check_processor_compatibility = vmx_check_processor_compat,
 	.hardware_setup = hardware_setup,
 	.handle_intel_pt_intr = NULL,
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5551f3552f08..ee9af412ffd4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9279,12 +9279,7 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 	kvm_pmu_ops_update(ops->pmu_ops);
 }
 
-struct kvm_cpu_compat_check {
-	struct kvm_x86_init_ops *ops;
-	int *ret;
-};
-
-static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
+static int kvm_x86_check_processor_compatibility(void)
 {
 	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
 
@@ -9294,19 +9289,16 @@ static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
 	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
 		return -EIO;
 
-	return ops->check_processor_compatibility();
+	return static_call(kvm_x86_check_processor_compatibility)();
 }
 
-static void kvm_x86_check_cpu_compat(void *data)
+static void kvm_x86_check_cpu_compat(void *ret)
 {
-	struct kvm_cpu_compat_check *c = data;
-
-	*c->ret = kvm_x86_check_processor_compatibility(c->ops);
+	*(int *)ret = kvm_x86_check_processor_compatibility();
 }
 
 static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 {
-	struct kvm_cpu_compat_check c;
 	u64 host_pat;
 	int r, cpu;
 
@@ -9377,12 +9369,12 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	if (r != 0)
 		goto out_mmu_exit;
 
-	c.ret = &r;
-	c.ops = ops;
+	kvm_ops_update(ops);
+
 	for_each_online_cpu(cpu) {
-		smp_call_function_single(cpu, kvm_x86_check_cpu_compat, &c, 1);
+		smp_call_function_single(cpu, kvm_x86_check_cpu_compat, &r, 1);
 		if (r < 0)
-			goto out_hardware_unsetup;
+			goto out_unwind_ops;
 	}
 
 	/*
@@ -9390,8 +9382,6 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	 * absolutely necessary, as most operations from this point forward
 	 * require unwinding.
 	 */
-	kvm_ops_update(ops);
-
 	kvm_timer_init();
 
 	if (pi_inject_timer == -1)
@@ -9427,8 +9417,9 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	kvm_init_msr_list();
 	return 0;
 
-out_hardware_unsetup:
-	ops->runtime_ops->hardware_unsetup();
+out_unwind_ops:
+	kvm_x86_ops.hardware_enable = NULL;
+	static_call(kvm_x86_hardware_unsetup)();
 out_mmu_exit:
 	kvm_mmu_vendor_module_exit();
 out_free_percpu:
-- 
2.38.1.584.g0f3c55d4c2-goog

