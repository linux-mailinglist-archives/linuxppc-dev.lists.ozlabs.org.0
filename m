Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD763E547
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:17:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMw9135Rbz3bgm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:17:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RHjA8cOA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3v-khywykdmy4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RHjA8cOA;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0151mTz3bbK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:09:53 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id s21-20020a63ff55000000b00477f5ae7320so60165pgk.18
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=esfNuzSAi/jMqEjqcJNo6bIy6sJwzrzidHm2yeELoEE=;
        b=RHjA8cOArqP2LyeykqmAhEEzgihArYtCw4eZPNsGjabk6EQQDpguK3dzIBeh0ut2C7
         PPDN/VqxLVg8WLs42m8fnp/J4Rw/PqEx2bEWgR/G8bafWlBBHGcYbV6d5pPiGmkb2pzW
         9MQwIZ/R/X2SvMhJdYca9rHP411MfEi5HhKen+9TmeridULcN9q+xVvOizSgO5aHdLNB
         OfUR1PLANgTJwrCH2LfR2DV1ZiL4M/R+MN/04sld9hh0pGP7jhvIgwq004EtxJ2aer+5
         G+wvXxp+5g9bTFYHRVhBvg6+cjfBRSwHIVy9QtEk1wovK+KCS0HL1G3XNYXWGocr8Ait
         87XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esfNuzSAi/jMqEjqcJNo6bIy6sJwzrzidHm2yeELoEE=;
        b=1Wd/VJiVRQu2iQb/bzb7Zc3wtmhFQx4UNfkGd31zSR9VWv2aLHVQwK+r46PyWKIJ6s
         PwwueFa2CWnS21Q5gTSDpMQV5QgTlQd/BEm6pCbBIiJlUhZ/chpsf4Vjv+wvZkYSlYfq
         KfvgBJFtSE54kj2os5IzHjm5ndnDjMWNjO+aGSJdPaDeK5SXqbpULdPg7v72SnEqTYSZ
         rWZK63F/dxx0kThWUNTNNnv5BhWQgZsjmnxpWvFOOPySXXi8xC0d96xMNLyBdCm1thZf
         LrvVcEqsTjJn4stOsd7vz7rNL/NAGRysrgMRiNXAcbxxerkc+oxYCMJXTVGehxxQzT75
         ptuw==
X-Gm-Message-State: ANoB5pl51PK1F4AqiSxJS1rseVJDxrTFzU7YWaK4TQzQmElUQieUFxWu
	zjaFkWrm1DKsPXUcOm7fytRk7ngX8ZQ=
X-Google-Smtp-Source: AA0mqf6VCCRS4k0TLjDpnoby5i4cra48ljK8Gw56qbYi0tKiUNfM4Har78Bt4viDX2riIS5uhRMjlWJGOTo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:238b:b0:219:7904:6de with SMTP id
 mr11-20020a17090b238b00b00219790406demr111983pjb.136.1669849791256; Wed, 30
 Nov 2022 15:09:51 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:52 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-9-seanjc@google.com>
Subject: [PATCH v2 08/50] KVM: x86: Move hardware setup/unsetup to init/exit
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

Now that kvm_arch_hardware_setup() is called immediately after
kvm_arch_init(), fold the guts of kvm_arch_hardware_(un)setup() into
kvm_arch_{init,exit}() as a step towards dropping one of the hooks.

To avoid having to unwind various setup, e.g registration of several
notifiers, slot in the vendor hardware setup before the registration of
said notifiers and callbacks.  Introducing a functional change while
moving code is less than ideal, but the alternative is adding a pile of
unwinding code, which is much more error prone, e.g. several attempts to
move the setup code verbatim all introduced bugs.

Add a comment to document that kvm_ops_update() is effectively the point
of no return, e.g. it sets the kvm_x86_ops.hardware_enable canary and so
needs to be unwound.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 121 +++++++++++++++++++++++----------------------
 1 file changed, 63 insertions(+), 58 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a873618564cd..fe5f2e49b5eb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9258,6 +9258,24 @@ static struct notifier_block pvclock_gtod_notifier = {
 };
 #endif
 
+static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
+{
+	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
+
+#define __KVM_X86_OP(func) \
+	static_call_update(kvm_x86_##func, kvm_x86_ops.func);
+#define KVM_X86_OP(func) \
+	WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
+#define KVM_X86_OP_OPTIONAL __KVM_X86_OP
+#define KVM_X86_OP_OPTIONAL_RET0(func) \
+	static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
+					   (void *)__static_call_return0);
+#include <asm/kvm-x86-ops.h>
+#undef __KVM_X86_OP
+
+	kvm_pmu_ops_update(ops->pmu_ops);
+}
+
 int kvm_arch_init(void *opaque)
 {
 	struct kvm_x86_init_ops *ops = opaque;
@@ -9331,6 +9349,24 @@ int kvm_arch_init(void *opaque)
 		kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
 	}
 
+	rdmsrl_safe(MSR_EFER, &host_efer);
+
+	if (boot_cpu_has(X86_FEATURE_XSAVES))
+		rdmsrl(MSR_IA32_XSS, host_xss);
+
+	kvm_init_pmu_capability();
+
+	r = ops->hardware_setup();
+	if (r != 0)
+		goto out_mmu_exit;
+
+	/*
+	 * Point of no return!  DO NOT add error paths below this point unless
+	 * absolutely necessary, as most operations from this point forward
+	 * require unwinding.
+	 */
+	kvm_ops_update(ops);
+
 	kvm_timer_init();
 
 	if (pi_inject_timer == -1)
@@ -9342,8 +9378,32 @@ int kvm_arch_init(void *opaque)
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
 #endif
 
+	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
+
+	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
+		kvm_caps.supported_xss = 0;
+
+#define __kvm_cpu_cap_has(UNUSED_, f) kvm_cpu_cap_has(f)
+	cr4_reserved_bits = __cr4_reserved_bits(__kvm_cpu_cap_has, UNUSED_);
+#undef __kvm_cpu_cap_has
+
+	if (kvm_caps.has_tsc_control) {
+		/*
+		 * Make sure the user can only configure tsc_khz values that
+		 * fit into a signed integer.
+		 * A min value is not calculated because it will always
+		 * be 1 on all machines.
+		 */
+		u64 max = min(0x7fffffffULL,
+			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
+		kvm_caps.max_guest_tsc_khz = max;
+	}
+	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
+	kvm_init_msr_list();
 	return 0;
 
+out_mmu_exit:
+	kvm_mmu_vendor_module_exit();
 out_free_percpu:
 	free_percpu(user_return_msrs);
 out_free_x86_emulator_cache:
@@ -9353,6 +9413,8 @@ int kvm_arch_init(void *opaque)
 
 void kvm_arch_exit(void)
 {
+	kvm_unregister_perf_callbacks();
+
 #ifdef CONFIG_X86_64
 	if (hypervisor_is_type(X86_HYPER_MS_HYPERV))
 		clear_hv_tscchange_cb();
@@ -9368,6 +9430,7 @@ void kvm_arch_exit(void)
 	irq_work_sync(&pvclock_irq_work);
 	cancel_work_sync(&pvclock_gtod_work);
 #endif
+	static_call(kvm_x86_hardware_unsetup)();
 	kvm_x86_ops.hardware_enable = NULL;
 	kvm_mmu_vendor_module_exit();
 	free_percpu(user_return_msrs);
@@ -11957,72 +12020,14 @@ void kvm_arch_hardware_disable(void)
 	drop_user_return_notifiers();
 }
 
-static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
-{
-	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
-
-#define __KVM_X86_OP(func) \
-	static_call_update(kvm_x86_##func, kvm_x86_ops.func);
-#define KVM_X86_OP(func) \
-	WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
-#define KVM_X86_OP_OPTIONAL __KVM_X86_OP
-#define KVM_X86_OP_OPTIONAL_RET0(func) \
-	static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
-					   (void *)__static_call_return0);
-#include <asm/kvm-x86-ops.h>
-#undef __KVM_X86_OP
-
-	kvm_pmu_ops_update(ops->pmu_ops);
-}
-
 int kvm_arch_hardware_setup(void *opaque)
 {
-	struct kvm_x86_init_ops *ops = opaque;
-	int r;
-
-	rdmsrl_safe(MSR_EFER, &host_efer);
-
-	if (boot_cpu_has(X86_FEATURE_XSAVES))
-		rdmsrl(MSR_IA32_XSS, host_xss);
-
-	kvm_init_pmu_capability();
-
-	r = ops->hardware_setup();
-	if (r != 0)
-		return r;
-
-	kvm_ops_update(ops);
-
-	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
-
-	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
-		kvm_caps.supported_xss = 0;
-
-#define __kvm_cpu_cap_has(UNUSED_, f) kvm_cpu_cap_has(f)
-	cr4_reserved_bits = __cr4_reserved_bits(__kvm_cpu_cap_has, UNUSED_);
-#undef __kvm_cpu_cap_has
-
-	if (kvm_caps.has_tsc_control) {
-		/*
-		 * Make sure the user can only configure tsc_khz values that
-		 * fit into a signed integer.
-		 * A min value is not calculated because it will always
-		 * be 1 on all machines.
-		 */
-		u64 max = min(0x7fffffffULL,
-			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
-		kvm_caps.max_guest_tsc_khz = max;
-	}
-	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
-	kvm_init_msr_list();
 	return 0;
 }
 
 void kvm_arch_hardware_unsetup(void)
 {
-	kvm_unregister_perf_callbacks();
 
-	static_call(kvm_x86_hardware_unsetup)();
 }
 
 int kvm_arch_check_processor_compat(void *opaque)
-- 
2.38.1.584.g0f3c55d4c2-goog

