Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2226172AC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:32:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jq7658Yz3f8K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:32:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kJz7hqwm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3cftiywykdkweqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kJz7hqwm;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jXB2TsDz3cHw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:38 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id s15-20020a170902ea0f00b00187050232fcso240794plg.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PC9dehnvav1Aw1v6uWM2bYJDLppf5EyAkT2jOhA9iFY=;
        b=kJz7hqwm050XSKRBNQaPY9TFZPFDWV8ZKejezCs4bGlRqwqH0nhNocHupR2viDbiH6
         OCV2d8s4V8HpVfeG/HWu8q5AcJeZX4IG826MXTSaYozQWigHjbahCUcQ+nhyocBl9X2l
         kd4BlfJthXfJkPz4BmvgOx0mzNiU9K9r9uzLUsVpQY01TDSHRc379IxSr1swj2GU5I8F
         MojlK/an4jUOmdPU57vUkjAqoyyyORaVz+/X+2myLHVoMLE+znQI8+HqKTtt/Xk3eEaP
         qPCFUr0VxHF3Hka+I7U/p6GppeV4xnnq5Sjew0AKQBs9DiBSJQh9O1zP6SUXZu7bL2/m
         FuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PC9dehnvav1Aw1v6uWM2bYJDLppf5EyAkT2jOhA9iFY=;
        b=aHi1SSkXdlEKJHu2aJ6VKi1dTOrhYYOlaCdjbnRs8jaYipAIcd0veBOWrW58ruB5yG
         jmLFYr3ZDx5ppEVG9Ld4O/zhzb7J2gCNOkYZtDRABSB3p4L6BnwE/aKRHvpFTG/SR/gN
         xk15XiRUbMXXq04+IGV+TAV+igix0MyoQeuWq7GZwp0wiQgrr5qrrqS9McxFIyNzoRgT
         AJYnnhWizePG2TpBherF4SGd/f8scR6rv/nzb0suJfBqByJXcpg6tWg1Rlz5Hs5ePvDA
         n77xZVvQRO4eoFaDbTwfAfMepkOYzPQueZUvtDkriH12zEif1k02CdW3V1jaOPElU2ZL
         Kv/A==
X-Gm-Message-State: ACrzQf34VADF+i+6oNra7Fo1IFvT8hranw3nxaDXCD14jks4vy+NjBfy
	R506AK4yZqdtCNRi7psqSQ8xIUBFH6I=
X-Google-Smtp-Source: AMsMyM4aBfkHQXLDDWmlC9x3cCwqRQZmefu3U/iL8VBE55lo0kD5X1hXSo7dBgxOx4diTaTlzVkE/JpLTO0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8cb:b0:52c:6962:2782 with SMTP id
 s11-20020a056a0008cb00b0052c69622782mr27193254pfu.81.1667431177736; Wed, 02
 Nov 2022 16:19:37 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:41 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-15-seanjc@google.com>
Subject: [PATCH 14/44] KVM: arm64: Simplify the CPUHP logic
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

From: Marc Zyngier <maz@kernel.org>

For a number of historical reasons, the KVM/arm64 hotplug setup is pretty
complicated, and we have two extra CPUHP notifiers for vGIC and timers.

It looks pretty pointless, and gets in the way of further changes.
So let's just expose some helpers that can be called from the core
CPUHP callback, and get rid of everything else.

This gives us the opportunity to drop a useless notifier entry,
as well as tidy-up the timer enable/disable, which was a bit odd.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arch_timer.c     | 27 ++++++++++-----------------
 arch/arm64/kvm/arm.c            | 13 +++++++++++++
 arch/arm64/kvm/vgic/vgic-init.c | 19 ++-----------------
 include/kvm/arm_arch_timer.h    |  4 ++++
 include/kvm/arm_vgic.h          |  4 ++++
 include/linux/cpuhotplug.h      |  3 ---
 6 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index bb24a76b4224..33fca1a691a5 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -811,10 +811,18 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
 	ptimer->host_timer_irq_flags = host_ptimer_irq_flags;
 }
 
-static void kvm_timer_init_interrupt(void *info)
+void kvm_timer_cpu_up(void)
 {
 	enable_percpu_irq(host_vtimer_irq, host_vtimer_irq_flags);
-	enable_percpu_irq(host_ptimer_irq, host_ptimer_irq_flags);
+	if (host_ptimer_irq)
+		enable_percpu_irq(host_ptimer_irq, host_ptimer_irq_flags);
+}
+
+void kvm_timer_cpu_down(void)
+{
+	disable_percpu_irq(host_vtimer_irq);
+	if (host_ptimer_irq)
+		disable_percpu_irq(host_ptimer_irq);
 }
 
 int kvm_arm_timer_set_reg(struct kvm_vcpu *vcpu, u64 regid, u64 value)
@@ -976,18 +984,6 @@ void kvm_arm_timer_write_sysreg(struct kvm_vcpu *vcpu,
 	preempt_enable();
 }
 
-static int kvm_timer_starting_cpu(unsigned int cpu)
-{
-	kvm_timer_init_interrupt(NULL);
-	return 0;
-}
-
-static int kvm_timer_dying_cpu(unsigned int cpu)
-{
-	disable_percpu_irq(host_vtimer_irq);
-	return 0;
-}
-
 static int timer_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu)
 {
 	if (vcpu)
@@ -1185,9 +1181,6 @@ int kvm_timer_hyp_init(bool has_gic)
 		goto out_free_irq;
 	}
 
-	cpuhp_setup_state(CPUHP_AP_KVM_ARM_TIMER_STARTING,
-			  "kvm/arm/timer:starting", kvm_timer_starting_cpu,
-			  kvm_timer_dying_cpu);
 	return 0;
 out_free_irq:
 	free_percpu_irq(host_vtimer_irq, kvm_get_running_vcpus());
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 2ee729f54ce0..0c328af064dd 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1670,7 +1670,15 @@ static void _kvm_arch_hardware_enable(void *discard)
 
 int kvm_arch_hardware_enable(void)
 {
+	int was_enabled = __this_cpu_read(kvm_arm_hardware_enabled);
+
 	_kvm_arch_hardware_enable(NULL);
+
+	if (!was_enabled) {
+		kvm_vgic_cpu_up();
+		kvm_timer_cpu_up();
+	}
+
 	return 0;
 }
 
@@ -1684,6 +1692,11 @@ static void _kvm_arch_hardware_disable(void *discard)
 
 void kvm_arch_hardware_disable(void)
 {
+	if (__this_cpu_read(kvm_arm_hardware_enabled)) {
+		kvm_timer_cpu_down();
+		kvm_vgic_cpu_down();
+	}
+
 	if (!is_protected_kvm_enabled())
 		_kvm_arch_hardware_disable(NULL);
 }
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index f6d4f4052555..6c7f6ae21ec0 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -465,17 +465,15 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 
 /* GENERIC PROBE */
 
-static int vgic_init_cpu_starting(unsigned int cpu)
+void kvm_vgic_cpu_up(void)
 {
 	enable_percpu_irq(kvm_vgic_global_state.maint_irq, 0);
-	return 0;
 }
 
 
-static int vgic_init_cpu_dying(unsigned int cpu)
+void kvm_vgic_cpu_down(void)
 {
 	disable_percpu_irq(kvm_vgic_global_state.maint_irq);
-	return 0;
 }
 
 static irqreturn_t vgic_maintenance_handler(int irq, void *data)
@@ -584,19 +582,6 @@ int kvm_vgic_hyp_init(void)
 		return ret;
 	}
 
-	ret = cpuhp_setup_state(CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
-				"kvm/arm/vgic:starting",
-				vgic_init_cpu_starting, vgic_init_cpu_dying);
-	if (ret) {
-		kvm_err("Cannot register vgic CPU notifier\n");
-		goto out_free_irq;
-	}
-
 	kvm_info("vgic interrupt IRQ%d\n", kvm_vgic_global_state.maint_irq);
 	return 0;
-
-out_free_irq:
-	free_percpu_irq(kvm_vgic_global_state.maint_irq,
-			kvm_get_running_vcpus());
-	return ret;
 }
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index cd6d8f260eab..1638418f72dd 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -104,4 +104,8 @@ void kvm_arm_timer_write_sysreg(struct kvm_vcpu *vcpu,
 u32 timer_get_ctl(struct arch_timer_context *ctxt);
 u64 timer_get_cval(struct arch_timer_context *ctxt);
 
+/* CPU HP callbacks */
+void kvm_timer_cpu_up(void);
+void kvm_timer_cpu_down(void);
+
 #endif
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 4df9e73a8bb5..fc4acc91ba06 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -431,4 +431,8 @@ int vgic_v4_load(struct kvm_vcpu *vcpu);
 void vgic_v4_commit(struct kvm_vcpu *vcpu);
 int vgic_v4_put(struct kvm_vcpu *vcpu, bool need_db);
 
+/* CPU HP callbacks */
+void kvm_vgic_cpu_up(void);
+void kvm_vgic_cpu_down(void);
+
 #endif /* __KVM_ARM_VGIC_H */
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index f61447913db9..7337414e4947 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -186,9 +186,6 @@ enum cpuhp_state {
 	CPUHP_AP_TI_GP_TIMER_STARTING,
 	CPUHP_AP_HYPERV_TIMER_STARTING,
 	CPUHP_AP_KVM_STARTING,
-	CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
-	CPUHP_AP_KVM_ARM_VGIC_STARTING,
-	CPUHP_AP_KVM_ARM_TIMER_STARTING,
 	/* Must be the last timer callback */
 	CPUHP_AP_DUMMY_TIMER_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
-- 
2.38.1.431.g37b22c650d-goog

