Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632863E552
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:18:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwB16dJMz3bjd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:18:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JuWXpM0b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3wokhywykdmc5rn0wpt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JuWXpM0b;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw026zzSz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:09:54 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id j21-20020a63fc15000000b00476d6932baeso46947pgi.23
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nmMptCS8YZEPOp1SM7yoU6q5iaRJQO3NrlrYAQWO+a8=;
        b=JuWXpM0bMK8VER9+OGUSNDnZf2HL36MYj31/5LPLwu+NrVKFhe6qDokHzxW7RyCIgv
         u/TyG8pc37CvrbL2EAZu6Q5HvnCkAPrjNv+Qg5V6oxMBkLFcEzo/GlhuS/tXlRhcmNEr
         bsl0Ka/RsohKiyGx278rhuOanxLx5+2vTVzFJkjaizuQjhmt4i05eF5Ig+rCxQ6neCKd
         ky0blS51gKSGEocg1l3fD396rqGAwUN79gJXslUxP1QaC2s/V7SObH5ZR7IpJR+hbtd6
         K51J31qsvhmLLTZqnziQAWli992HnKt09bprSQ8M4E3c11sD7wmSAyfD+Bh8H6OvXG4R
         0UgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmMptCS8YZEPOp1SM7yoU6q5iaRJQO3NrlrYAQWO+a8=;
        b=WSwIUHpKSu39QeHC/V0RZMMo576marftonG0frYVTnUefShBnngQ3yXpbnGMBiDsyI
         I0Aph2YDhd1IICr1FPfX3HPNe6S+42UmJQnoEIU6Hhmbuk/M49nWScNDjaSOLDsrOoOH
         sKTsZEZI3kUgULGLPw8BTniiGpR+VDo/CfrEeoeh9pvALhos7YE8eDljZJJS9zUaP2Ep
         I7e+2cxbzreKSZW9rzDxFxjDEfnsH0OkmrR6Ou4gII3m9ImP/40kg58EsAYrjW1rxRlD
         +vfP4P911JaYEPzQ6X/CkM0zTNZBxUvkqpGPnMrRni3KAV2+BxyCRxWFhO678Xguchw9
         MYrw==
X-Gm-Message-State: ANoB5plovDkz9FvXquxiOWfyrpL3iCXuVZ2z75fI7Y5u/GHo9C1zgHtD
	36RajdZgfNxg6RR6M09J1r52Lp8lgDw=
X-Google-Smtp-Source: AA0mqf4fb1TSp8N93RINcDD/4e1r1Fekoz3if5YZKZX0WZK9gNpVprT5tLUd6s1Pf13F0U3bnCjZAcHRkHo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:2e0c:b0:218:c1d3:4cd8 with SMTP id
 q12-20020a17090a2e0c00b00218c1d34cd8mr48011029pjd.37.1669849792978; Wed, 30
 Nov 2022 15:09:52 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:53 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-10-seanjc@google.com>
Subject: [PATCH v2 09/50] KVM: Drop arch hardware (un)setup hooks
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

Drop kvm_arch_hardware_setup() and kvm_arch_hardware_unsetup() now that
all implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>	# s390
Acked-by: Anup Patel <anup@brainfault.org>
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
index 7b107fa540fa..c6732ac329ca 100644
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
index 04494a4fb37a..5faf69421f13 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -440,11 +440,6 @@ int kvm_arch_hardware_enable(void)
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
index 97c7ccd189eb..829e6e046003 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -329,16 +329,6 @@ static struct notifier_block kvm_clock_notifier = {
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
index fe5f2e49b5eb..915d57c3b41d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12020,16 +12020,6 @@ void kvm_arch_hardware_disable(void)
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
index 8f874a964313..f2e0e78d2d92 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1463,8 +1463,6 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 
 int kvm_arch_hardware_enable(void);
 void kvm_arch_hardware_disable(void);
-int kvm_arch_hardware_setup(void *opaque);
-void kvm_arch_hardware_unsetup(void);
 int kvm_arch_check_processor_compat(void *opaque);
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 988f7d92db2e..0e62887e8ce1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5862,10 +5862,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	if (r)
 		return r;
 
-	r = kvm_arch_hardware_setup(opaque);
-	if (r < 0)
-		goto err_hw_setup;
-
 	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
 		r = -ENOMEM;
 		goto err_hw_enabled;
@@ -5958,8 +5954,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 out_free_2:
 	free_cpumask_var(cpus_hardware_enabled);
 err_hw_enabled:
-	kvm_arch_hardware_unsetup();
-err_hw_setup:
 	kvm_arch_exit();
 	return r;
 }
@@ -5988,7 +5982,6 @@ void kvm_exit(void)
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
 	free_cpumask_var(cpus_hardware_enabled);
-	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
-- 
2.38.1.584.g0f3c55d4c2-goog

