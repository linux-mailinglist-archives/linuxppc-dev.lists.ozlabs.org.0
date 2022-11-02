Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6561729E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:28:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jjz0gjmz3f9x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:28:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=N/AO+DlA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3aftiywykdkqwierngksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=N/AO+DlA;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jX31jj8z3c2j
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:31 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id v18-20020a637a12000000b0046ed84b94efso94439pgc.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SRqZjl0CVbTa6NG2E64G3dLAUo/Pz8pk6hIhLm2VMUc=;
        b=N/AO+DlAJnQ9J/vtwHmeA+LWmW2X38Xvh1eLG4RWzywbm32Vf0IsEJKwUIfrABuxFl
         0EKhIzYrEfkzCVSFK3biZb9XwWk4XwwJS/OnHHvaR70SNUpWUpE57FN4sbTk/TPj35x/
         cAJkeY4R4md/H6BBXnN0tlgqyVYRq72kGCHMOXzsnn+VDv0nws/iLVsXJU1fSeeLEY4w
         /5W7IzSHqdo5Jkh7TgJ/2kp0Wml2Tqdg9OOSx8bwuC9pmrXmMmqnDL37uTYdYPfVtwii
         poXkBmFS7imW8u09oi9MQ4pJzJGTl8VmWIvB/CfRCk2mynsmxJDVg6mdWRwKUMtA9Dq0
         KkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRqZjl0CVbTa6NG2E64G3dLAUo/Pz8pk6hIhLm2VMUc=;
        b=0KLssFnlRVlcpf8s7Uj1dWq3ScBdIUgGJGKHqyvZrm7VBapUl8JCHRa3H3NH6t5rbD
         Kj0nZ0utwqeNE3jHL3ULtT/+DTlVC1ltbQykIjZr9ie6dk5xWs6Swf1bxIptJulCrUCI
         iyyBPoZoLQMREHjVZIgYwIxmTwFYvCPVT/xzr7VjCxvAGg1CScTWDlglfOaQg8gn+jH/
         h56j0LcuRW/cjGaHr5pzYZFOABAQZdmuYAd386BRJVGvN514l5pHjwjKD+r4IAbUYPFI
         UXq8g2A2gnCZTxn7yjJCpnT0Vc0m9EVbXzvChSP/Ad8BNSvGyJNwoB2hqfb8XdfbocEJ
         eubw==
X-Gm-Message-State: ACrzQf0HhHdJqfTGzikcRvsBX92CNoTikZyZy5ckVz4+cT3TfiGTGOGZ
	OlumTAfu9Fi4J4lT+BZJQpvGQk+QY34=
X-Google-Smtp-Source: AMsMyM4EhVfOAXnvh3uqqR+GrfRtTcz5EdIn8ldyko2v+yjX0B25rXaAkhDgO2YLd/AhKl4jKmJJf3AFTk4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1d89:b0:56c:a2b:f1c2 with SMTP id
 z9-20020a056a001d8900b0056c0a2bf1c2mr27838704pfw.45.1667431169395; Wed, 02
 Nov 2022 16:19:29 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:36 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-10-seanjc@google.com>
Subject: [PATCH 09/44] KVM: Drop arch hardware (un)setup hooks
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

Drop kvm_arch_hardware_setup() and kvm_arch_hardware_unsetup() now that
all implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h   |  1 -
 arch/arm64/kvm/arm.c                |  5 -----
 arch/mips/include/asm/kvm_host.h    |  1 -
 arch/mips/kvm/mips.c                |  5 -----
 arch/powerpc/include/asm/kvm_host.h |  1 -
 arch/powerpc/kvm/powerpc.c          |  5 -----
 arch/riscv/include/asm/kvm_host.h   |  1 -
 arch/riscv/kvm/main.c               |  5 -----
 arch/s390/kvm/kvm-s390.c            | 10 ----------
 arch/x86/kvm/x86.c                  | 10 ----------
 include/linux/kvm_host.h            |  2 --
 virt/kvm/kvm_main.c                 |  7 -------
 12 files changed, 53 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 45e2136322ba..5d5a887e63a5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -859,7 +859,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 
 void kvm_arm_vcpu_ptrauth_trap(struct kvm_vcpu *vcpu);
 
-static inline void kvm_arch_hardware_unsetup(void) {}
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 94d33e296e10..2ee729f54ce0 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -63,11 +63,6 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
 }
 
-int kvm_arch_hardware_setup(void *opaque)
-{
-	return 0;
-}
-
 int kvm_arch_check_processor_compat(void *opaque)
 {
 	return 0;
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 5cedb28e8a40..28f0ba97db71 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -888,7 +888,6 @@ extern unsigned long kvm_mips_get_ramsize(struct kvm *kvm);
 extern int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
 			     struct kvm_mips_interrupt *irq);
 
-static inline void kvm_arch_hardware_unsetup(void) {}
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a25e0b73ee70..af29490d9740 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -135,11 +135,6 @@ void kvm_arch_hardware_disable(void)
 	kvm_mips_callbacks->hardware_disable();
 }
 
-int kvm_arch_hardware_setup(void *opaque)
-{
-	return 0;
-}
-
 int kvm_arch_check_processor_compat(void *opaque)
 {
 	return 0;
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index caea15dcb91d..5d2c3a487e73 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -877,7 +877,6 @@ struct kvm_vcpu_arch {
 #define __KVM_HAVE_CREATE_DEVICE
 
 static inline void kvm_arch_hardware_disable(void) {}
-static inline void kvm_arch_hardware_unsetup(void) {}
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index b850b0efa201..74ea5687ecbc 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -441,11 +441,6 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-int kvm_arch_hardware_setup(void *opaque)
-{
-	return 0;
-}
-
 int kvm_arch_check_processor_compat(void *opaque)
 {
 	return kvmppc_core_check_processor_compat();
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index dbbf43d52623..8c771fc4f5d2 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -229,7 +229,6 @@ struct kvm_vcpu_arch {
 	bool pause;
 };
 
-static inline void kvm_arch_hardware_unsetup(void) {}
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index df2d8716851f..a146fa0ce4d2 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -25,11 +25,6 @@ int kvm_arch_check_processor_compat(void *opaque)
 	return 0;
 }
 
-int kvm_arch_hardware_setup(void *opaque)
-{
-	return 0;
-}
-
 int kvm_arch_hardware_enable(void)
 {
 	unsigned long hideleg, hedeleg;
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 1aaee15211f2..7fcd2d3b3558 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -321,16 +321,6 @@ static struct notifier_block kvm_clock_notifier = {
 	.notifier_call = kvm_clock_sync,
 };
 
-int kvm_arch_hardware_setup(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_hardware_unsetup(void)
-{
-
-}
-
 static void allow_cpu_feat(unsigned long nr)
 {
 	set_bit_inv(nr, kvm_s390_available_cpu_feat);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 80ee580a9cd4..40d4bfaa17a4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11985,16 +11985,6 @@ void kvm_arch_hardware_disable(void)
 	drop_user_return_notifiers();
 }
 
-int kvm_arch_hardware_setup(void *opaque)
-{
-	return 0;
-}
-
-void kvm_arch_hardware_unsetup(void)
-{
-
-}
-
 int kvm_arch_check_processor_compat(void *opaque)
 {
 	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 18592bdf4c1b..9b52bd40be56 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1447,8 +1447,6 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 
 int kvm_arch_hardware_enable(void);
 void kvm_arch_hardware_disable(void);
-int kvm_arch_hardware_setup(void *opaque);
-void kvm_arch_hardware_unsetup(void);
 int kvm_arch_check_processor_compat(void *opaque);
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f592dd4ce8f2..27ce263a80e4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5843,10 +5843,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	if (r)
 		return r;
 
-	r = kvm_arch_hardware_setup(opaque);
-	if (r < 0)
-		goto err_hw_setup;
-
 	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
 		r = -ENOMEM;
 		goto err_hw_enabled;
@@ -5939,8 +5935,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 out_free_2:
 	free_cpumask_var(cpus_hardware_enabled);
 err_hw_enabled:
-	kvm_arch_hardware_unsetup();
-err_hw_setup:
 	kvm_arch_exit();
 	return r;
 }
@@ -5969,7 +5963,6 @@ void kvm_exit(void)
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
 	free_cpumask_var(cpus_hardware_enabled);
-	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
-- 
2.38.1.431.g37b22c650d-goog

