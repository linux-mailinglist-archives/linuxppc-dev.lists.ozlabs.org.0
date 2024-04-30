Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5F28B80A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 21:35:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4nWONibH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTVlz34G7z3dCt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 05:35:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4nWONibH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3oecxzgykdmm1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTVhB4Cpyz3cRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 05:32:10 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61bd64c9eadso44534077b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 12:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714505529; x=1715110329; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zlyEud5d/bhoGiNpMEEmnNOfWYjdDQf4ZBXlBrFZHdU=;
        b=4nWONibHRktFa7+7RsNM9UIGgH12R+0r5iXjosjVVg5anlngH9GjqcUF+++9OU1WZk
         Xdgh0J+kgweSY9y/vvj1ezonpzfV5JSjVwlw51cVdcq1hb1zWRw39MwhydmHyEqFyr2n
         psk5bguPqeX1Za901s4C/zJvYSwu/jXpgLQkv0Ba3vxF3ngdSaK8iaobOGu+L4rOrzQx
         UuMW6/+QEBSenin2Rp3cvWFMliy4DigABARWhLYv6rWGLmnSyAGwYQB5nyR9V6GyyNsE
         wLSBEYY5rSDn0KdrfSOPMcdbCLqTw9ibENMqrgJTn0CSkv7sU8UIzpMcIVIP9LlyNgbZ
         kmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714505529; x=1715110329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlyEud5d/bhoGiNpMEEmnNOfWYjdDQf4ZBXlBrFZHdU=;
        b=k2zNxhk7Pwy+09S8CLfE1g953/auCrL+sJBHk8WJp8OguVGYpgruGvw2gAp2IpaLF2
         Ryg47gjgB79ty4F2MZyqSZXUWUEL59Q0HjBZqhbKPVHdQzRXrByLGIgNTGqdGzKecz5I
         EqrDIoPWZMTG4IXIK2OTx1GPVRmgascZ/IWJtxLtF/Xxa5+Fy64c0lZnulbaM6Mrw2Bk
         hxAD5iQtXc6/wz1bMCZEqzO7VockTrjJJIgPCkcDz8hf/ZhYYvT3oT6EdpjdSw8L9pbh
         S/F9N+eQI8+IyGsQ2Ml4zhyP8HluXDWvlRUcXYmT1fUL6NnXp4T+394Om9pJNO61r1ht
         W0ug==
X-Forwarded-Encrypted: i=1; AJvYcCV5bf7Oiv77sh0NPcRs6IlvvWy5KXu6hFDwIg2W2q39vwn+A+7CB2kJwJRK6hQaGwnQC/VmLXvi++PXjGkPjkr9y6JM5yKKp4QHbNpk8A==
X-Gm-Message-State: AOJu0YxpdTpmWet5/yfnuOQ2yZb1AzWQPh4/ECwYeiIqn03cV/kgQ0yq
	ftBV7lfc5qndI0OiNhEFtCqY/9wE0kZccpXV2Ax/bieFSxSOOWdtqTMPPhyoAEOmyzMp79JFoup
	YQQ==
X-Google-Smtp-Source: AGHT+IG4cB2+idKWRATGCb6OVW7YEX4JltpUlzKwSOtT4qBlUznDsr14mRRca16T5tdKvIRNLf2VCRL2BMM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d2c5:0:b0:61d:3304:c25e with SMTP id
 u188-20020a0dd2c5000000b0061d3304c25emr134509ywd.7.1714505528716; Tue, 30 Apr
 2024 12:32:08 -0700 (PDT)
Date: Tue, 30 Apr 2024 12:31:57 -0700
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240430193157.419425-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430193157.419425-5-seanjc@google.com>
Subject: [PATCH 4/4] KVM: Delete the now unused kvm_arch_sched_in()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Delete kvm_arch_sched_in() now that all implementations are nops.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h     | 1 -
 arch/loongarch/include/asm/kvm_host.h | 1 -
 arch/mips/include/asm/kvm_host.h      | 1 -
 arch/powerpc/include/asm/kvm_host.h   | 1 -
 arch/riscv/include/asm/kvm_host.h     | 1 -
 arch/s390/include/asm/kvm_host.h      | 1 -
 arch/x86/kvm/pmu.c                    | 6 +++---
 arch/x86/kvm/x86.c                    | 5 -----
 include/linux/kvm_host.h              | 2 --
 virt/kvm/kvm_main.c                   | 1 -
 10 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 9e8a496fb284..a12d3bb0b590 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1180,7 +1180,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 }
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 
 void kvm_arm_init_debug(void);
 void kvm_arm_vcpu_init_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 69305441f40d..64ca60a3ce24 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -228,7 +228,6 @@ static inline bool kvm_is_ifetch_fault(struct kvm_vcpu_arch *arch)
 static inline void kvm_arch_hardware_unsetup(void) {}
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 179f320cc231..6743a57c1ab4 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -890,7 +890,6 @@ static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 8abac532146e..c4fb6a27fb92 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -897,7 +897,6 @@ struct kvm_vcpu_arch {
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 484d04a92fa6..6cd7a576ef14 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -272,7 +272,6 @@ struct kvm_vcpu_arch {
 };
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 
 #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
 
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index 95990461888f..e9fcaf4607a6 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -1045,7 +1045,6 @@ extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
 extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index c397b28e3d1b..75346a588e13 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -521,9 +521,9 @@ void kvm_pmu_handle_event(struct kvm_vcpu *vcpu)
 	}
 
 	/*
-	 * Unused perf_events are only released if the corresponding MSRs
-	 * weren't accessed during the last vCPU time slice. kvm_arch_sched_in
-	 * triggers KVM_REQ_PMU if cleanup is needed.
+	 * Release unused perf_events if the corresponding guest MSRs weren't
+	 * accessed during the last vCPU time slice (need_cleanup is set when
+	 * the vCPU is scheduled back in).
 	 */
 	if (unlikely(pmu->need_cleanup))
 		kvm_pmu_cleanup(vcpu);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9b0a21f2e56e..17d6ce0d4fa6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12577,11 +12577,6 @@ bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu)
 	return (vcpu->arch.apic_base & MSR_IA32_APICBASE_BSP) != 0;
 }
 
-void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu)
-{
-
-}
-
 void kvm_arch_free_vm(struct kvm *kvm)
 {
 #if IS_ENABLED(CONFIG_HYPERV)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2f5e35eb7eab..85b6dd7927fe 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1496,8 +1496,6 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 					struct kvm_guest_debug *dbg);
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
 
-void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu);
-
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4a4b29a9bace..b154b22a3b84 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6278,7 +6278,6 @@ static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 	WRITE_ONCE(vcpu->ready, false);
 
 	__this_cpu_write(kvm_running_vcpu, vcpu);
-	kvm_arch_sched_in(vcpu, cpu);
 	kvm_arch_vcpu_load(vcpu, cpu, true);
 }
 
-- 
2.45.0.rc0.197.gbae5840b3b-goog

