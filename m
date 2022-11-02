Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44595617293
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:27:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jhy1D56z3dvY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:27:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FUnEcV14;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3__piywykdkiugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FUnEcV14;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jX13vkbz3bbl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:29 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id p5-20020a170902e74500b001884ba979f8so212509plf.17
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f6XefN5I5ruzVbYrkN1yZMFgJ8nhy1kqU9UZnCdhptg=;
        b=FUnEcV14oY1HhDUwVKN8pTDouw0xzuRbPJ7dVWPyWf7LCB3wz7IYoyHrVonO3c387e
         dI3MHWMYgBJQpreY7yX0zaLup4D/BjMQIPgcJ6/Y5XOKigJWcAdpUzONFvuLPzHtir52
         zdaUHwROL74RXI3mkeR0R+qNmpt1jql/YrTnEJ1Qwsw3qcMId5mcp2klJsam49tVGQME
         t8DMqjC0vOv+z1PP8Nu2ZgbAaFakedT9qRtNqclB+WBnuhzmQLAsPCqjW2pMYt0xh3QD
         h7M2RWadICLZ+5uSGPG4Pb/Tc8N1vrQv0/X5wVejGopVyLeDeBxDnA93aC61xM1KOh59
         ijig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6XefN5I5ruzVbYrkN1yZMFgJ8nhy1kqU9UZnCdhptg=;
        b=xmRxofoQ3EV1Jj2DF7nMXsFmIb1rk7/5sd/1TMc1QjATVyWL1MXvAxHb2C4TdPjqBV
         mfelXcUCoYTbm+79WdXlBQNj3YpmIMgOb2M99/zY9k32qnw8iJ+eoRwofdoLgp14Y4dw
         nOtDfWVKp+fdOsoaYvOX4zPGsda3yx/l7/TczCwQaitWPTlWWbl8PXx+Xj74YzHlYrD7
         UH/tpYbb5SkrqBU2emC/mE450QCt6oWz0VjCYbkfNemz9yI2MH/0v7JjeJFa7SmXy/UL
         pz2lIpafzmjolINGZsxcWN3BmuNxXCkdsYNJhC8WD3qMdOy/S3lZ4OpE6gP0QQjH87/h
         ET1Q==
X-Gm-Message-State: ACrzQf0ftE9puSEYPGDQnMsbgt2ms+/I7Q5WXpmy4KEBh1q6kn1M23MM
	1IlA46lbxRy8O6nDLzpssFKkErJktcM=
X-Google-Smtp-Source: AMsMyM6ZTzi+kKessshttxuP+R00ff+0MGY2J8p0+pI+2b6dGLsSDC25NpLjmF+zSycHkN8AtXN1EQYPl4Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:da86:b0:188:4eab:b782 with SMTP id
 j6-20020a170902da8600b001884eabb782mr2360300plx.171.1667431167708; Wed, 02
 Nov 2022 16:19:27 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:35 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-9-seanjc@google.com>
Subject: [PATCH 08/44] KVM: x86: Move hardware setup/unsetup to init/exit
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
index 9a7702b1c563..80ee580a9cd4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9252,6 +9252,24 @@ static struct notifier_block pvclock_gtod_notifier = {
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
@@ -9325,6 +9343,24 @@ int kvm_arch_init(void *opaque)
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
@@ -9336,8 +9372,32 @@ int kvm_arch_init(void *opaque)
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
@@ -9347,6 +9407,8 @@ int kvm_arch_init(void *opaque)
 
 void kvm_arch_exit(void)
 {
+	kvm_unregister_perf_callbacks();
+
 #ifdef CONFIG_X86_64
 	if (hypervisor_is_type(X86_HYPER_MS_HYPERV))
 		clear_hv_tscchange_cb();
@@ -9362,6 +9424,7 @@ void kvm_arch_exit(void)
 	irq_work_sync(&pvclock_irq_work);
 	cancel_work_sync(&pvclock_gtod_work);
 #endif
+	static_call(kvm_x86_hardware_unsetup)();
 	kvm_x86_ops.hardware_enable = NULL;
 	kvm_mmu_vendor_module_exit();
 	free_percpu(user_return_msrs);
@@ -11922,72 +11985,14 @@ void kvm_arch_hardware_disable(void)
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
2.38.1.431.g37b22c650d-goog

