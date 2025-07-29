Return-Path: <linuxppc-dev+bounces-10440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44678B15238
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 19:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bs2k53NPTz3blg;
	Wed, 30 Jul 2025 03:42:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753810973;
	cv=none; b=Q1q/DlU7odQaHKamnyoUG+py7wy+ZZz0E6Aw43b6k5Cz8oqEHUS8j+hIbW2SDd8SlhvewGA0/A68aN1b8JP9GhZb0glG5qGQr5GjZ/wyUG90J+mVbRU9I+s57dwNv+H9sRxeXDl9lP8em2yHVTt1nlGQwc8yWEh5zlYiIp49y+kFdW/RsDfksQkuy7KjUD1iu1qRWOIQJL3W/3IbCjJ9mcRPCjR4tqcG+ucPmxpG5Bad00MJXfQAUQPb6xW3wI5AbULVitJrKEe9h2ZzNExlJR3f+2ayZuxNeMeZ+ANc3b/KDwktcLuLQwsSffvZERO0dvEQ1GP9icI37su/yAFUug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753810973; c=relaxed/relaxed;
	bh=t+AC7E9I24esp/Sjwl5BYNMQOPOzHoVt4sFTMTHWtmk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EbEs5cSk8YFyW5eqe8Yx5MQS8vCnaCbQwSCR5DbVzKbSu835KkGYiFeM2gNhfl6/iKjMgRdhpVxvjruTgFcCHorAoBWNZy8HjPDfHvQcckXd486hKxSCn6Br1DL6IaYXHH8omb7TbGU7rzA+SITw696kn8aIrCbuhmMizO1ud7A7aOmGNW+1joDtkSRz59/K9emThaflfpBwqEyweyNL9uXN0WglEv0PakDU+miyNm/h96wPinbG4/5e7I2Hk3KSlCgiKvzoAoO/rS6jh9gYPCZDl8yIeWtj6HVfyN9rq6+Lt0LlHiEOXOpBFhj8w+aJeg55mNqClic89p/ddTlqVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=A3WBxtvm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3ggijaaykdjkl73gc59hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=A3WBxtvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3ggijaaykdjkl73gc59hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bs2k373Bdz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 03:42:51 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31ed9a17f22so4159961a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753810970; x=1754415770; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t+AC7E9I24esp/Sjwl5BYNMQOPOzHoVt4sFTMTHWtmk=;
        b=A3WBxtvmflAlQmIVSmdujybBQg0sOQ1wP0vnqIOAHRA9CRO0AkILgAjzc4G76zeZyJ
         6rRDI/L2eWugF4TdNV9k2kInABDK5ygibr/spQLyVtdldas2DP0ea4lSdkvKURmqbZe8
         WxOcDd8vee+n+JS9siYOWlBQ9XAAvVHzz5GnbzQO9hkyYUux00DwJC1EGf2Ei35h6e6M
         k+Db0dVucrvcd4fBoEUOX8p9zWyEsZz+66nXQ5SDbxU0P0ubOlLH5cjwPjfAsqPk0iGs
         9PYExNAI61I84tFr7QoSdbs42g6FGshus6k244wiISJxnUZ1JMq9oQ+8X/U+NwOVN+Pa
         gT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810970; x=1754415770;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+AC7E9I24esp/Sjwl5BYNMQOPOzHoVt4sFTMTHWtmk=;
        b=Qiaif39zvb/wpOtUrc7ocIwpDgyTf7bJ4qtTistbqaJRFsE+in3j7yw4/i+8pISvSO
         vMZAly8cKGA5V3vb6COLd2xd6tkTDTKbHhlyrdoc17xGbpR0PZ/2EVk90uD0DkTHDQlQ
         zwoccSkMLzPUPfGkslpZgCU7VumUeRoOk7fyXgeCwHhkyn71vaeW6gCJLCj/T4PqSsYT
         sQricJpA0bBUgZWWLhGNmdZxi7kS/Mw/xc5VWcLVgTL47NY//e4H1WvFrGn+WosGZLUo
         BA2EEp8ynyV4TtLD3RevCtgO8p1nPHlTxSn00/qgDD+w9A8YyMHFt7pzer2Bb2gfOBPY
         KjVg==
X-Gm-Message-State: AOJu0YyaL1hE5l1MWcbwASVWpJ0k+Cm+7RnAL7m1eQJtpsufc3CH1q6j
	qJR/3qNFGqNrc+mUoHzxp5VcFjA0IsaDfoK2veIasXcpTZvPsEwxXJlvn3sP2FCJhgICz4pmvD4
	7pL+/7w==
X-Google-Smtp-Source: AGHT+IECf+rl4HLK7HTjFpeO3lZ7FmEDeKcnSNu/+0lTTTGcIgwlPqWTQNJSOrK5dJIajV6UTm7HBHpquHU=
X-Received: from pjee15.prod.google.com ([2002:a17:90b:578f:b0:31e:fe0d:f464])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b09:b0:31f:32cd:97f0
 with SMTP id 98e67ed59e1d1-31f5ddb750dmr501726a91.1.1753810970348; Tue, 29
 Jul 2025 10:42:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Jul 2025 10:42:37 -0700
In-Reply-To: <20250729174238.593070-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20250729174238.593070-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729174238.593070-6-seanjc@google.com>
Subject: [PATCH 5/6] KVM: x86: Export KVM-internal symbols for sub-modules only
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-sgx@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Rework almost all of KVM x86's exports to expose symbols only to KVM's
vendor modules, i.e. to kvm-{amd,intel}.ko.  Keep the generic exports that
are guarded by CONFIG_KVM_EXTERNAL_WRITE_TRACKING=y, as they're explicitly
designed/intended for external usage.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/cpuid.c        |  10 +-
 arch/x86/kvm/hyperv.c       |   4 +-
 arch/x86/kvm/irq.c          |   6 +-
 arch/x86/kvm/kvm_onhyperv.c |   6 +-
 arch/x86/kvm/lapic.c        |  38 +++----
 arch/x86/kvm/mmu/mmu.c      |  36 +++----
 arch/x86/kvm/mmu/spte.c     |  10 +-
 arch/x86/kvm/mmu/tdp_mmu.c  |   2 +-
 arch/x86/kvm/pmu.c          |   8 +-
 arch/x86/kvm/smm.c          |   2 +-
 arch/x86/kvm/x86.c          | 208 ++++++++++++++++++------------------
 11 files changed, 165 insertions(+), 165 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index e2836a255b16..1ff431915d2b 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -34,7 +34,7 @@
  * aligned to sizeof(unsigned long) because it's not accessed via bitops.
  */
 u32 kvm_cpu_caps[NR_KVM_CPU_CAPS] __read_mostly;
-EXPORT_SYMBOL_GPL(kvm_cpu_caps);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_cpu_caps);
 
 struct cpuid_xstate_sizes {
 	u32 eax;
@@ -131,7 +131,7 @@ struct kvm_cpuid_entry2 *kvm_find_cpuid_entry2(
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(kvm_find_cpuid_entry2);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_find_cpuid_entry2);
 
 static int kvm_check_cpuid(struct kvm_vcpu *vcpu)
 {
@@ -1222,7 +1222,7 @@ void kvm_set_cpu_caps(void)
 		kvm_cpu_cap_clear(X86_FEATURE_RDPID);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_set_cpu_caps);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_cpu_caps);
 
 #undef F
 #undef SCATTERED_F
@@ -2045,7 +2045,7 @@ bool kvm_cpuid(struct kvm_vcpu *vcpu, u32 *eax, u32 *ebx,
 			used_max_basic);
 	return exact;
 }
-EXPORT_SYMBOL_GPL(kvm_cpuid);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_cpuid);
 
 int kvm_emulate_cpuid(struct kvm_vcpu *vcpu)
 {
@@ -2063,4 +2063,4 @@ int kvm_emulate_cpuid(struct kvm_vcpu *vcpu)
 	kvm_rdx_write(vcpu, edx);
 	return kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_cpuid);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_cpuid);
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 72b19a88a776..a0b9096d5b14 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -923,7 +923,7 @@ bool kvm_hv_assist_page_enabled(struct kvm_vcpu *vcpu)
 		return false;
 	return vcpu->arch.pv_eoi.msr_val & KVM_MSR_ENABLED;
 }
-EXPORT_SYMBOL_GPL(kvm_hv_assist_page_enabled);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_hv_assist_page_enabled);
 
 int kvm_hv_get_assist_page(struct kvm_vcpu *vcpu)
 {
@@ -935,7 +935,7 @@ int kvm_hv_get_assist_page(struct kvm_vcpu *vcpu)
 	return kvm_read_guest_cached(vcpu->kvm, &vcpu->arch.pv_eoi.data,
 				     &hv_vcpu->vp_assist_page, sizeof(struct hv_vp_assist_page));
 }
-EXPORT_SYMBOL_GPL(kvm_hv_get_assist_page);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_hv_get_assist_page);
 
 static void stimer_prepare_msg(struct kvm_vcpu_hv_stimer *stimer)
 {
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index a1a388c00187..67a07dce96cf 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -103,7 +103,7 @@ int kvm_cpu_has_injectable_intr(struct kvm_vcpu *v)
 
 	return kvm_apic_has_interrupt(v) != -1; /* LAPIC */
 }
-EXPORT_SYMBOL_GPL(kvm_cpu_has_injectable_intr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_cpu_has_injectable_intr);
 
 /*
  * check if there is pending interrupt without
@@ -119,7 +119,7 @@ int kvm_cpu_has_interrupt(struct kvm_vcpu *v)
 
 	return kvm_apic_has_interrupt(v) != -1;	/* LAPIC */
 }
-EXPORT_SYMBOL_GPL(kvm_cpu_has_interrupt);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_cpu_has_interrupt);
 
 /*
  * Read pending interrupt(from non-APIC source)
@@ -148,7 +148,7 @@ int kvm_cpu_get_extint(struct kvm_vcpu *v)
 	WARN_ON_ONCE(!irqchip_split(v->kvm));
 	return get_userspace_extint(v);
 }
-EXPORT_SYMBOL_GPL(kvm_cpu_get_extint);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_cpu_get_extint);
 
 /*
  * Read pending interrupt vector and intack.
diff --git a/arch/x86/kvm/kvm_onhyperv.c b/arch/x86/kvm/kvm_onhyperv.c
index ded0bd688c65..34c7e7342e30 100644
--- a/arch/x86/kvm/kvm_onhyperv.c
+++ b/arch/x86/kvm/kvm_onhyperv.c
@@ -101,13 +101,13 @@ int hv_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, gfn_t nr_pages)
 
 	return __hv_flush_remote_tlbs_range(kvm, &range);
 }
-EXPORT_SYMBOL_GPL(hv_flush_remote_tlbs_range);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs_range);
 
 int hv_flush_remote_tlbs(struct kvm *kvm)
 {
 	return __hv_flush_remote_tlbs_range(kvm, NULL);
 }
-EXPORT_SYMBOL_GPL(hv_flush_remote_tlbs);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs);
 
 void hv_track_root_tdp(struct kvm_vcpu *vcpu, hpa_t root_tdp)
 {
@@ -121,4 +121,4 @@ void hv_track_root_tdp(struct kvm_vcpu *vcpu, hpa_t root_tdp)
 		spin_unlock(&kvm_arch->hv_root_tdp_lock);
 	}
 }
-EXPORT_SYMBOL_GPL(hv_track_root_tdp);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(hv_track_root_tdp);
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 20f7a7d0c422..185473dcf898 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -102,7 +102,7 @@ bool kvm_apic_pending_eoi(struct kvm_vcpu *vcpu, int vector)
 }
 
 __read_mostly DEFINE_STATIC_KEY_FALSE(kvm_has_noapic_vcpu);
-EXPORT_SYMBOL_GPL(kvm_has_noapic_vcpu);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_has_noapic_vcpu);
 
 __read_mostly DEFINE_STATIC_KEY_DEFERRED_FALSE(apic_hw_disabled, HZ);
 __read_mostly DEFINE_STATIC_KEY_DEFERRED_FALSE(apic_sw_disabled, HZ);
@@ -642,7 +642,7 @@ bool __kvm_apic_update_irr(unsigned long *pir, void *regs, int *max_irr)
 	return ((max_updated_irr != -1) &&
 		(max_updated_irr == *max_irr));
 }
-EXPORT_SYMBOL_GPL(__kvm_apic_update_irr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(__kvm_apic_update_irr);
 
 bool kvm_apic_update_irr(struct kvm_vcpu *vcpu, unsigned long *pir, int *max_irr)
 {
@@ -653,7 +653,7 @@ bool kvm_apic_update_irr(struct kvm_vcpu *vcpu, unsigned long *pir, int *max_irr
 		apic->irr_pending = true;
 	return irr_updated;
 }
-EXPORT_SYMBOL_GPL(kvm_apic_update_irr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_update_irr);
 
 static inline int apic_search_irr(struct kvm_lapic *apic)
 {
@@ -693,7 +693,7 @@ void kvm_apic_clear_irr(struct kvm_vcpu *vcpu, int vec)
 {
 	apic_clear_irr(vec, vcpu->arch.apic);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_clear_irr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_clear_irr);
 
 static void *apic_vector_to_isr(int vec, struct kvm_lapic *apic)
 {
@@ -775,7 +775,7 @@ void kvm_apic_update_hwapic_isr(struct kvm_vcpu *vcpu)
 
 	kvm_x86_call(hwapic_isr_update)(vcpu, apic_find_highest_isr(apic));
 }
-EXPORT_SYMBOL_GPL(kvm_apic_update_hwapic_isr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_update_hwapic_isr);
 
 int kvm_lapic_find_highest_irr(struct kvm_vcpu *vcpu)
 {
@@ -786,7 +786,7 @@ int kvm_lapic_find_highest_irr(struct kvm_vcpu *vcpu)
 	 */
 	return apic_find_highest_irr(vcpu->arch.apic);
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_find_highest_irr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_lapic_find_highest_irr);
 
 static int __apic_accept_irq(struct kvm_lapic *apic, int delivery_mode,
 			     int vector, int level, int trig_mode,
@@ -948,7 +948,7 @@ void kvm_apic_update_ppr(struct kvm_vcpu *vcpu)
 {
 	apic_update_ppr(vcpu->arch.apic);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_update_ppr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_update_ppr);
 
 static void apic_set_tpr(struct kvm_lapic *apic, u32 tpr)
 {
@@ -1059,7 +1059,7 @@ bool kvm_apic_match_dest(struct kvm_vcpu *vcpu, struct kvm_lapic *source,
 		return false;
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_apic_match_dest);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_match_dest);
 
 int kvm_vector_to_index(u32 vector, u32 dest_vcpus,
 		       const unsigned long *bitmap, u32 bitmap_size)
@@ -1507,7 +1507,7 @@ void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, int vector)
 	kvm_ioapic_send_eoi(apic, vector);
 	kvm_make_request(KVM_REQ_EVENT, apic->vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_set_eoi_accelerated);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_set_eoi_accelerated);
 
 void kvm_apic_send_ipi(struct kvm_lapic *apic, u32 icr_low, u32 icr_high)
 {
@@ -1532,7 +1532,7 @@ void kvm_apic_send_ipi(struct kvm_lapic *apic, u32 icr_low, u32 icr_high)
 
 	kvm_irq_delivery_to_apic(apic->vcpu->kvm, apic, &irq, NULL);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_send_ipi);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_send_ipi);
 
 static u32 apic_get_tmcct(struct kvm_lapic *apic)
 {
@@ -1649,7 +1649,7 @@ u64 kvm_lapic_readable_reg_mask(struct kvm_lapic *apic)
 
 	return valid_reg_mask;
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_readable_reg_mask);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_lapic_readable_reg_mask);
 
 static int kvm_lapic_reg_read(struct kvm_lapic *apic, u32 offset, int len,
 			      void *data)
@@ -1890,7 +1890,7 @@ void kvm_wait_lapic_expire(struct kvm_vcpu *vcpu)
 	    lapic_timer_int_injected(vcpu))
 		__kvm_wait_lapic_expire(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_wait_lapic_expire);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_wait_lapic_expire);
 
 static void kvm_apic_inject_pending_timer_irqs(struct kvm_lapic *apic)
 {
@@ -2204,7 +2204,7 @@ void kvm_lapic_expired_hv_timer(struct kvm_vcpu *vcpu)
 out:
 	preempt_enable();
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_expired_hv_timer);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_lapic_expired_hv_timer);
 
 void kvm_lapic_switch_to_hv_timer(struct kvm_vcpu *vcpu)
 {
@@ -2457,7 +2457,7 @@ void kvm_lapic_set_eoi(struct kvm_vcpu *vcpu)
 {
 	kvm_lapic_reg_write(vcpu->arch.apic, APIC_EOI, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_set_eoi);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_lapic_set_eoi);
 
 #define X2APIC_ICR_RESERVED_BITS (GENMASK_ULL(31, 20) | GENMASK_ULL(17, 16) | BIT(13))
 
@@ -2517,7 +2517,7 @@ void kvm_apic_write_nodecode(struct kvm_vcpu *vcpu, u32 offset)
 	else
 		kvm_lapic_reg_write(apic, offset, kvm_lapic_get_reg(apic, offset));
 }
-EXPORT_SYMBOL_GPL(kvm_apic_write_nodecode);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_write_nodecode);
 
 void kvm_free_lapic(struct kvm_vcpu *vcpu)
 {
@@ -2655,7 +2655,7 @@ int kvm_apic_set_base(struct kvm_vcpu *vcpu, u64 value, bool host_initiated)
 	kvm_recalculate_apic_map(vcpu->kvm);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_apic_set_base);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_set_base);
 
 void kvm_apic_update_apicv(struct kvm_vcpu *vcpu)
 {
@@ -2706,7 +2706,7 @@ int kvm_alloc_apic_access_page(struct kvm *kvm)
 	mutex_unlock(&kvm->slots_lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(kvm_alloc_apic_access_page);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_alloc_apic_access_page);
 
 void kvm_inhibit_apic_access_page(struct kvm_vcpu *vcpu)
 {
@@ -2970,7 +2970,7 @@ int kvm_apic_has_interrupt(struct kvm_vcpu *vcpu)
 	__apic_update_ppr(apic, &ppr);
 	return apic_has_interrupt_for_ppr(apic, ppr);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_has_interrupt);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_has_interrupt);
 
 int kvm_apic_accept_pic_intr(struct kvm_vcpu *vcpu)
 {
@@ -3029,7 +3029,7 @@ void kvm_apic_ack_interrupt(struct kvm_vcpu *vcpu, int vector)
 	}
 
 }
-EXPORT_SYMBOL_GPL(kvm_apic_ack_interrupt);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apic_ack_interrupt);
 
 static int kvm_apic_state_fixup(struct kvm_vcpu *vcpu,
 		struct kvm_lapic_state *s, bool set)
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6e838cb6c9e1..b3b8786969f4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -110,7 +110,7 @@ static bool __ro_after_init tdp_mmu_allowed;
 #ifdef CONFIG_X86_64
 bool __read_mostly tdp_mmu_enabled = true;
 module_param_named(tdp_mmu, tdp_mmu_enabled, bool, 0444);
-EXPORT_SYMBOL_GPL(tdp_mmu_enabled);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(tdp_mmu_enabled);
 #endif
 
 static int max_huge_page_level __read_mostly;
@@ -3810,7 +3810,7 @@ void kvm_mmu_free_roots(struct kvm *kvm, struct kvm_mmu *mmu,
 		write_unlock(&kvm->mmu_lock);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_free_roots);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_free_roots);
 
 void kvm_mmu_free_guest_mode_roots(struct kvm *kvm, struct kvm_mmu *mmu)
 {
@@ -3837,7 +3837,7 @@ void kvm_mmu_free_guest_mode_roots(struct kvm *kvm, struct kvm_mmu *mmu)
 
 	kvm_mmu_free_roots(kvm, mmu, roots_to_free);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_free_guest_mode_roots);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_free_guest_mode_roots);
 
 static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, int quadrant,
 			    u8 level)
@@ -4852,7 +4852,7 @@ int kvm_handle_page_fault(struct kvm_vcpu *vcpu, u64 error_code,
 
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvm_handle_page_fault);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_handle_page_fault);
 
 #ifdef CONFIG_X86_64
 static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
@@ -4942,7 +4942,7 @@ int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level
 		return -EIO;
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_tdp_map_page);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_tdp_map_page);
 
 long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range)
@@ -5138,7 +5138,7 @@ void kvm_mmu_new_pgd(struct kvm_vcpu *vcpu, gpa_t new_pgd)
 			__clear_sp_write_flooding_count(sp);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_new_pgd);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_new_pgd);
 
 static bool sync_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, gfn_t gfn,
 			   unsigned int access)
@@ -5784,7 +5784,7 @@ void kvm_init_shadow_npt_mmu(struct kvm_vcpu *vcpu, unsigned long cr0,
 	shadow_mmu_init_context(vcpu, context, cpu_role, root_role);
 	kvm_mmu_new_pgd(vcpu, nested_cr3);
 }
-EXPORT_SYMBOL_GPL(kvm_init_shadow_npt_mmu);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_init_shadow_npt_mmu);
 
 static union kvm_cpu_role
 kvm_calc_shadow_ept_root_page_role(struct kvm_vcpu *vcpu, bool accessed_dirty,
@@ -5838,7 +5838,7 @@ void kvm_init_shadow_ept_mmu(struct kvm_vcpu *vcpu, bool execonly,
 
 	kvm_mmu_new_pgd(vcpu, new_eptp);
 }
-EXPORT_SYMBOL_GPL(kvm_init_shadow_ept_mmu);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_init_shadow_ept_mmu);
 
 static void init_kvm_softmmu(struct kvm_vcpu *vcpu,
 			     union kvm_cpu_role cpu_role)
@@ -5903,7 +5903,7 @@ void kvm_init_mmu(struct kvm_vcpu *vcpu)
 	else
 		init_kvm_softmmu(vcpu, cpu_role);
 }
-EXPORT_SYMBOL_GPL(kvm_init_mmu);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_init_mmu);
 
 void kvm_mmu_after_set_cpuid(struct kvm_vcpu *vcpu)
 {
@@ -5939,7 +5939,7 @@ void kvm_mmu_reset_context(struct kvm_vcpu *vcpu)
 	kvm_mmu_unload(vcpu);
 	kvm_init_mmu(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_reset_context);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_reset_context);
 
 int kvm_mmu_load(struct kvm_vcpu *vcpu)
 {
@@ -5973,7 +5973,7 @@ int kvm_mmu_load(struct kvm_vcpu *vcpu)
 out:
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_load);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_load);
 
 void kvm_mmu_unload(struct kvm_vcpu *vcpu)
 {
@@ -6035,7 +6035,7 @@ void kvm_mmu_free_obsolete_roots(struct kvm_vcpu *vcpu)
 	__kvm_mmu_free_obsolete_roots(vcpu->kvm, &vcpu->arch.root_mmu);
 	__kvm_mmu_free_obsolete_roots(vcpu->kvm, &vcpu->arch.guest_mmu);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_free_obsolete_roots);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_free_obsolete_roots);
 
 static u64 mmu_pte_write_fetch_gpte(struct kvm_vcpu *vcpu, gpa_t *gpa,
 				    int *bytes)
@@ -6361,7 +6361,7 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 err
 	return x86_emulate_instruction(vcpu, cr2_or_gpa, emulation_type, insn,
 				       insn_len);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_page_fault);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_page_fault);
 
 void kvm_mmu_print_sptes(struct kvm_vcpu *vcpu, gpa_t gpa, const char *msg)
 {
@@ -6377,7 +6377,7 @@ void kvm_mmu_print_sptes(struct kvm_vcpu *vcpu, gpa_t gpa, const char *msg)
 		pr_cont(", spte[%d] = 0x%llx", level, sptes[level]);
 	pr_cont("\n");
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_print_sptes);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_print_sptes);
 
 static void __kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
 				      u64 addr, hpa_t root_hpa)
@@ -6443,7 +6443,7 @@ void kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
 			__kvm_mmu_invalidate_addr(vcpu, mmu, addr, mmu->prev_roots[i].hpa);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_invalidate_addr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_invalidate_addr);
 
 void kvm_mmu_invlpg(struct kvm_vcpu *vcpu, gva_t gva)
 {
@@ -6460,7 +6460,7 @@ void kvm_mmu_invlpg(struct kvm_vcpu *vcpu, gva_t gva)
 	kvm_mmu_invalidate_addr(vcpu, vcpu->arch.walk_mmu, gva, KVM_MMU_ROOTS_ALL);
 	++vcpu->stat.invlpg;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_invlpg);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_invlpg);
 
 
 void kvm_mmu_invpcid_gva(struct kvm_vcpu *vcpu, gva_t gva, unsigned long pcid)
@@ -6513,7 +6513,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 	else
 		max_huge_page_level = PG_LEVEL_2M;
 }
-EXPORT_SYMBOL_GPL(kvm_configure_mmu);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_configure_mmu);
 
 static void free_mmu_pages(struct kvm_mmu *mmu)
 {
@@ -7179,7 +7179,7 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
 
 	return need_tlb_flush;
 }
-EXPORT_SYMBOL_GPL(kvm_zap_gfn_range);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_zap_gfn_range);
 
 static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
 					   const struct kvm_memory_slot *slot)
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index df31039b5d63..4b4dc3e40f6a 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -22,7 +22,7 @@
 bool __read_mostly enable_mmio_caching = true;
 static bool __ro_after_init allow_mmio_caching;
 module_param_named(mmio_caching, enable_mmio_caching, bool, 0444);
-EXPORT_SYMBOL_GPL(enable_mmio_caching);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(enable_mmio_caching);
 
 bool __read_mostly kvm_ad_enabled;
 
@@ -470,13 +470,13 @@ void kvm_mmu_set_mmio_spte_mask(u64 mmio_value, u64 mmio_mask, u64 access_mask)
 	shadow_mmio_mask  = mmio_mask;
 	shadow_mmio_access_mask = access_mask;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_set_mmio_spte_mask);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_set_mmio_spte_mask);
 
 void kvm_mmu_set_mmio_spte_value(struct kvm *kvm, u64 mmio_value)
 {
 	kvm->arch.shadow_mmio_value = mmio_value;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_set_mmio_spte_value);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_set_mmio_spte_value);
 
 void kvm_mmu_set_me_spte_mask(u64 me_value, u64 me_mask)
 {
@@ -487,7 +487,7 @@ void kvm_mmu_set_me_spte_mask(u64 me_value, u64 me_mask)
 	shadow_me_value = me_value;
 	shadow_me_mask = me_mask;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_set_me_spte_mask);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_set_me_spte_mask);
 
 void kvm_mmu_set_ept_masks(bool has_ad_bits, bool has_exec_only)
 {
@@ -513,7 +513,7 @@ void kvm_mmu_set_ept_masks(bool has_ad_bits, bool has_exec_only)
 	kvm_mmu_set_mmio_spte_mask(VMX_EPT_MISCONFIG_WX_VALUE,
 				   VMX_EPT_RWX_MASK | VMX_EPT_SUPPRESS_VE_BIT, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_set_ept_masks);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_set_ept_masks);
 
 void kvm_mmu_reset_all_pte_masks(void)
 {
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7f3d7229b2c1..353f0e84a8ef 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1953,7 +1953,7 @@ bool kvm_tdp_mmu_gpa_is_mapped(struct kvm_vcpu *vcpu, u64 gpa)
 	spte = sptes[leaf];
 	return is_shadow_present_pte(spte) && is_last_spte(spte, leaf);
 }
-EXPORT_SYMBOL_GPL(kvm_tdp_mmu_gpa_is_mapped);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_tdp_mmu_gpa_is_mapped);
 
 /*
  * Returns the last level spte pointer of the shadow page walk for the given
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 75e9cfc689f8..0a2267958c4f 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -27,10 +27,10 @@
 #define KVM_PMU_EVENT_FILTER_MAX_EVENTS 300
 
 struct x86_pmu_capability __read_mostly kvm_pmu_cap;
-EXPORT_SYMBOL_GPL(kvm_pmu_cap);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_pmu_cap);
 
 struct kvm_pmu_emulated_event_selectors __read_mostly kvm_pmu_eventsel;
-EXPORT_SYMBOL_GPL(kvm_pmu_eventsel);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_pmu_eventsel);
 
 /* Precise Distribution of Instructions Retired (PDIR) */
 static const struct x86_cpu_id vmx_pebs_pdir_cpu[] = {
@@ -318,7 +318,7 @@ void pmc_write_counter(struct kvm_pmc *pmc, u64 val)
 	pmc->counter &= pmc_bitmask(pmc);
 	pmc_update_sample_period(pmc);
 }
-EXPORT_SYMBOL_GPL(pmc_write_counter);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(pmc_write_counter);
 
 static int filter_cmp(const void *pa, const void *pb, u64 mask)
 {
@@ -897,7 +897,7 @@ void kvm_pmu_trigger_event(struct kvm_vcpu *vcpu, u64 eventsel)
 		kvm_pmu_incr_counter(pmc);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_pmu_trigger_event);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_pmu_trigger_event);
 
 static bool is_masked_filter_valid(const struct kvm_x86_pmu_event_filter *filter)
 {
diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index 9864c057187d..9058c5bacf93 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -131,7 +131,7 @@ void kvm_smm_changed(struct kvm_vcpu *vcpu, bool entering_smm)
 
 	kvm_mmu_reset_context(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_smm_changed);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_smm_changed);
 
 void process_smi(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 14c0e03b48ae..3d9573cac39f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -97,10 +97,10 @@
  * vendor module being reloaded with different module parameters.
  */
 struct kvm_caps kvm_caps __read_mostly;
-EXPORT_SYMBOL_GPL(kvm_caps);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_caps);
 
 struct kvm_host_values kvm_host __read_mostly;
-EXPORT_SYMBOL_GPL(kvm_host);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_host);
 
 #define  ERR_PTR_USR(e)  ((void __user *)ERR_PTR(e))
 
@@ -152,7 +152,7 @@ module_param(ignore_msrs, bool, 0644);
 
 bool __read_mostly report_ignored_msrs = true;
 module_param(report_ignored_msrs, bool, 0644);
-EXPORT_SYMBOL_GPL(report_ignored_msrs);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(report_ignored_msrs);
 
 unsigned int min_timer_period_us = 200;
 module_param(min_timer_period_us, uint, 0644);
@@ -169,7 +169,7 @@ module_param(vector_hashing, bool, 0444);
 
 bool __read_mostly enable_vmware_backdoor = false;
 module_param(enable_vmware_backdoor, bool, 0444);
-EXPORT_SYMBOL_GPL(enable_vmware_backdoor);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(enable_vmware_backdoor);
 
 /*
  * Flags to manipulate forced emulation behavior (any non-zero value will
@@ -184,7 +184,7 @@ module_param(pi_inject_timer, bint, 0644);
 
 /* Enable/disable PMU virtualization */
 bool __read_mostly enable_pmu = true;
-EXPORT_SYMBOL_GPL(enable_pmu);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(enable_pmu);
 module_param(enable_pmu, bool, 0444);
 
 bool __read_mostly eager_page_split = true;
@@ -211,7 +211,7 @@ struct kvm_user_return_msrs {
 };
 
 u32 __read_mostly kvm_nr_uret_msrs;
-EXPORT_SYMBOL_GPL(kvm_nr_uret_msrs);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_nr_uret_msrs);
 static u32 __read_mostly kvm_uret_msrs_list[KVM_MAX_NR_USER_RETURN_MSRS];
 static struct kvm_user_return_msrs __percpu *user_return_msrs;
 
@@ -221,16 +221,16 @@ static struct kvm_user_return_msrs __percpu *user_return_msrs;
 				| XFEATURE_MASK_PKRU | XFEATURE_MASK_XTILE)
 
 bool __read_mostly allow_smaller_maxphyaddr = 0;
-EXPORT_SYMBOL_GPL(allow_smaller_maxphyaddr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(allow_smaller_maxphyaddr);
 
 bool __read_mostly enable_apicv = true;
-EXPORT_SYMBOL_GPL(enable_apicv);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(enable_apicv);
 
 bool __read_mostly enable_ipiv = true;
-EXPORT_SYMBOL_GPL(enable_ipiv);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(enable_ipiv);
 
 bool __read_mostly enable_device_posted_irqs = true;
-EXPORT_SYMBOL_GPL(enable_device_posted_irqs);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(enable_device_posted_irqs);
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
@@ -614,7 +614,7 @@ int kvm_add_user_return_msr(u32 msr)
 	kvm_uret_msrs_list[kvm_nr_uret_msrs] = msr;
 	return kvm_nr_uret_msrs++;
 }
-EXPORT_SYMBOL_GPL(kvm_add_user_return_msr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_add_user_return_msr);
 
 int kvm_find_user_return_msr(u32 msr)
 {
@@ -626,7 +626,7 @@ int kvm_find_user_return_msr(u32 msr)
 	}
 	return -1;
 }
-EXPORT_SYMBOL_GPL(kvm_find_user_return_msr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_find_user_return_msr);
 
 static void kvm_user_return_msr_cpu_online(void)
 {
@@ -666,7 +666,7 @@ int kvm_set_user_return_msr(unsigned slot, u64 value, u64 mask)
 	kvm_user_return_register_notifier(msrs);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_user_return_msr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_user_return_msr);
 
 void kvm_user_return_msr_update_cache(unsigned int slot, u64 value)
 {
@@ -675,7 +675,7 @@ void kvm_user_return_msr_update_cache(unsigned int slot, u64 value)
 	msrs->values[slot].curr = value;
 	kvm_user_return_register_notifier(msrs);
 }
-EXPORT_SYMBOL_GPL(kvm_user_return_msr_update_cache);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_user_return_msr_update_cache);
 
 static void drop_user_return_notifiers(void)
 {
@@ -697,7 +697,7 @@ noinstr void kvm_spurious_fault(void)
 	/* Fault while not rebooting.  We want the trace. */
 	BUG_ON(!kvm_rebooting);
 }
-EXPORT_SYMBOL_GPL(kvm_spurious_fault);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_spurious_fault);
 
 #define EXCPT_BENIGN		0
 #define EXCPT_CONTRIBUTORY	1
@@ -802,7 +802,7 @@ void kvm_deliver_exception_payload(struct kvm_vcpu *vcpu,
 	ex->has_payload = false;
 	ex->payload = 0;
 }
-EXPORT_SYMBOL_GPL(kvm_deliver_exception_payload);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_deliver_exception_payload);
 
 static void kvm_queue_exception_vmexit(struct kvm_vcpu *vcpu, unsigned int vector,
 				       bool has_error_code, u32 error_code,
@@ -886,7 +886,7 @@ void kvm_queue_exception(struct kvm_vcpu *vcpu, unsigned nr)
 {
 	kvm_multiple_exception(vcpu, nr, false, 0, false, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_queue_exception);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_queue_exception);
 
 
 void kvm_queue_exception_p(struct kvm_vcpu *vcpu, unsigned nr,
@@ -894,7 +894,7 @@ void kvm_queue_exception_p(struct kvm_vcpu *vcpu, unsigned nr,
 {
 	kvm_multiple_exception(vcpu, nr, false, 0, true, payload);
 }
-EXPORT_SYMBOL_GPL(kvm_queue_exception_p);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_queue_exception_p);
 
 static void kvm_queue_exception_e_p(struct kvm_vcpu *vcpu, unsigned nr,
 				    u32 error_code, unsigned long payload)
@@ -929,7 +929,7 @@ void kvm_requeue_exception(struct kvm_vcpu *vcpu, unsigned int nr,
 	vcpu->arch.exception.has_payload = false;
 	vcpu->arch.exception.payload = 0;
 }
-EXPORT_SYMBOL_GPL(kvm_requeue_exception);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_requeue_exception);
 
 int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err)
 {
@@ -940,7 +940,7 @@ int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err)
 
 	return 1;
 }
-EXPORT_SYMBOL_GPL(kvm_complete_insn_gp);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_complete_insn_gp);
 
 static int complete_emulated_insn_gp(struct kvm_vcpu *vcpu, int err)
 {
@@ -990,7 +990,7 @@ void kvm_inject_emulated_page_fault(struct kvm_vcpu *vcpu,
 
 	fault_mmu->inject_page_fault(vcpu, fault);
 }
-EXPORT_SYMBOL_GPL(kvm_inject_emulated_page_fault);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_inject_emulated_page_fault);
 
 void kvm_inject_nmi(struct kvm_vcpu *vcpu)
 {
@@ -1002,7 +1002,7 @@ void kvm_queue_exception_e(struct kvm_vcpu *vcpu, unsigned nr, u32 error_code)
 {
 	kvm_multiple_exception(vcpu, nr, true, error_code, false, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_queue_exception_e);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_queue_exception_e);
 
 /*
  * Checks if cpl <= required_cpl; if true, return true.  Otherwise queue
@@ -1024,7 +1024,7 @@ bool kvm_require_dr(struct kvm_vcpu *vcpu, int dr)
 	kvm_queue_exception(vcpu, UD_VECTOR);
 	return false;
 }
-EXPORT_SYMBOL_GPL(kvm_require_dr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_require_dr);
 
 static inline u64 pdptr_rsvd_bits(struct kvm_vcpu *vcpu)
 {
@@ -1079,7 +1079,7 @@ int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3)
 
 	return 1;
 }
-EXPORT_SYMBOL_GPL(load_pdptrs);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(load_pdptrs);
 
 static bool kvm_is_valid_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 {
@@ -1132,7 +1132,7 @@ void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned lon
 	if ((cr0 ^ old_cr0) & KVM_MMU_CR0_ROLE_BITS)
 		kvm_mmu_reset_context(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_post_set_cr0);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_post_set_cr0);
 
 int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 {
@@ -1173,13 +1173,13 @@ int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_cr0);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_cr0);
 
 void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw)
 {
 	(void)kvm_set_cr0(vcpu, kvm_read_cr0_bits(vcpu, ~0x0eul) | (msw & 0x0f));
 }
-EXPORT_SYMBOL_GPL(kvm_lmsw);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_lmsw);
 
 void kvm_load_guest_xsave_state(struct kvm_vcpu *vcpu)
 {
@@ -1202,7 +1202,7 @@ void kvm_load_guest_xsave_state(struct kvm_vcpu *vcpu)
 	     kvm_is_cr4_bit_set(vcpu, X86_CR4_PKE)))
 		wrpkru(vcpu->arch.pkru);
 }
-EXPORT_SYMBOL_GPL(kvm_load_guest_xsave_state);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_load_guest_xsave_state);
 
 void kvm_load_host_xsave_state(struct kvm_vcpu *vcpu)
 {
@@ -1228,7 +1228,7 @@ void kvm_load_host_xsave_state(struct kvm_vcpu *vcpu)
 	}
 
 }
-EXPORT_SYMBOL_GPL(kvm_load_host_xsave_state);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_load_host_xsave_state);
 
 #ifdef CONFIG_X86_64
 static inline u64 kvm_guest_supported_xfd(struct kvm_vcpu *vcpu)
@@ -1293,7 +1293,7 @@ int kvm_emulate_xsetbv(struct kvm_vcpu *vcpu)
 
 	return kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_xsetbv);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_xsetbv);
 
 static bool kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 {
@@ -1341,7 +1341,7 @@ void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned lon
 		kvm_make_request(KVM_REQ_TLB_FLUSH_CURRENT, vcpu);
 
 }
-EXPORT_SYMBOL_GPL(kvm_post_set_cr4);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_post_set_cr4);
 
 int kvm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 {
@@ -1372,7 +1372,7 @@ int kvm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_cr4);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_cr4);
 
 static void kvm_invalidate_pcid(struct kvm_vcpu *vcpu, unsigned long pcid)
 {
@@ -1464,7 +1464,7 @@ int kvm_set_cr3(struct kvm_vcpu *vcpu, unsigned long cr3)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_cr3);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_cr3);
 
 int kvm_set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8)
 {
@@ -1476,7 +1476,7 @@ int kvm_set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8)
 		vcpu->arch.cr8 = cr8;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_cr8);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_cr8);
 
 unsigned long kvm_get_cr8(struct kvm_vcpu *vcpu)
 {
@@ -1485,7 +1485,7 @@ unsigned long kvm_get_cr8(struct kvm_vcpu *vcpu)
 	else
 		return vcpu->arch.cr8;
 }
-EXPORT_SYMBOL_GPL(kvm_get_cr8);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_get_cr8);
 
 static void kvm_update_dr0123(struct kvm_vcpu *vcpu)
 {
@@ -1510,7 +1510,7 @@ void kvm_update_dr7(struct kvm_vcpu *vcpu)
 	if (dr7 & DR7_BP_EN_MASK)
 		vcpu->arch.switch_db_regs |= KVM_DEBUGREG_BP_ENABLED;
 }
-EXPORT_SYMBOL_GPL(kvm_update_dr7);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_update_dr7);
 
 static u64 kvm_dr6_fixed(struct kvm_vcpu *vcpu)
 {
@@ -1551,7 +1551,7 @@ int kvm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long val)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_dr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_dr);
 
 unsigned long kvm_get_dr(struct kvm_vcpu *vcpu, int dr)
 {
@@ -1568,7 +1568,7 @@ unsigned long kvm_get_dr(struct kvm_vcpu *vcpu, int dr)
 		return vcpu->arch.dr7;
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_get_dr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_get_dr);
 
 int kvm_emulate_rdpmc(struct kvm_vcpu *vcpu)
 {
@@ -1584,7 +1584,7 @@ int kvm_emulate_rdpmc(struct kvm_vcpu *vcpu)
 	kvm_rdx_write(vcpu, data >> 32);
 	return kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_rdpmc);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_rdpmc);
 
 /*
  * Some IA32_ARCH_CAPABILITIES bits have dependencies on MSRs that KVM
@@ -1723,7 +1723,7 @@ bool kvm_valid_efer(struct kvm_vcpu *vcpu, u64 efer)
 
 	return __kvm_valid_efer(vcpu, efer);
 }
-EXPORT_SYMBOL_GPL(kvm_valid_efer);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_valid_efer);
 
 static int set_efer(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 {
@@ -1766,7 +1766,7 @@ void kvm_enable_efer_bits(u64 mask)
 {
        efer_reserved_bits &= ~mask;
 }
-EXPORT_SYMBOL_GPL(kvm_enable_efer_bits);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_enable_efer_bits);
 
 bool kvm_msr_allowed(struct kvm_vcpu *vcpu, u32 index, u32 type)
 {
@@ -1809,7 +1809,7 @@ bool kvm_msr_allowed(struct kvm_vcpu *vcpu, u32 index, u32 type)
 
 	return allowed;
 }
-EXPORT_SYMBOL_GPL(kvm_msr_allowed);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_msr_allowed);
 
 /*
  * Write @data into the MSR specified by @index.  Select MSR specific fault
@@ -1938,7 +1938,7 @@ int kvm_get_msr_with_filter(struct kvm_vcpu *vcpu, u32 index, u64 *data)
 		return KVM_MSR_RET_FILTERED;
 	return kvm_get_msr_ignored_check(vcpu, index, data, false);
 }
-EXPORT_SYMBOL_GPL(kvm_get_msr_with_filter);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_get_msr_with_filter);
 
 int kvm_set_msr_with_filter(struct kvm_vcpu *vcpu, u32 index, u64 data)
 {
@@ -1946,19 +1946,19 @@ int kvm_set_msr_with_filter(struct kvm_vcpu *vcpu, u32 index, u64 data)
 		return KVM_MSR_RET_FILTERED;
 	return kvm_set_msr_ignored_check(vcpu, index, data, false);
 }
-EXPORT_SYMBOL_GPL(kvm_set_msr_with_filter);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_msr_with_filter);
 
 int kvm_get_msr(struct kvm_vcpu *vcpu, u32 index, u64 *data)
 {
 	return kvm_get_msr_ignored_check(vcpu, index, data, false);
 }
-EXPORT_SYMBOL_GPL(kvm_get_msr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_get_msr);
 
 int kvm_set_msr(struct kvm_vcpu *vcpu, u32 index, u64 data)
 {
 	return kvm_set_msr_ignored_check(vcpu, index, data, false);
 }
-EXPORT_SYMBOL_GPL(kvm_set_msr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_msr);
 
 static void complete_userspace_rdmsr(struct kvm_vcpu *vcpu)
 {
@@ -2047,7 +2047,7 @@ int kvm_emulate_rdmsr(struct kvm_vcpu *vcpu)
 
 	return kvm_x86_call(complete_emulated_msr)(vcpu, r);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_rdmsr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_rdmsr);
 
 int kvm_emulate_wrmsr(struct kvm_vcpu *vcpu)
 {
@@ -2072,7 +2072,7 @@ int kvm_emulate_wrmsr(struct kvm_vcpu *vcpu)
 
 	return kvm_x86_call(complete_emulated_msr)(vcpu, r);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_wrmsr);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_wrmsr);
 
 int kvm_emulate_as_nop(struct kvm_vcpu *vcpu)
 {
@@ -2084,14 +2084,14 @@ int kvm_emulate_invd(struct kvm_vcpu *vcpu)
 	/* Treat an INVD instruction as a NOP and just skip it. */
 	return kvm_emulate_as_nop(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_invd);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_invd);
 
 int kvm_handle_invalid_op(struct kvm_vcpu *vcpu)
 {
 	kvm_queue_exception(vcpu, UD_VECTOR);
 	return 1;
 }
-EXPORT_SYMBOL_GPL(kvm_handle_invalid_op);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_handle_invalid_op);
 
 
 static int kvm_emulate_monitor_mwait(struct kvm_vcpu *vcpu, const char *insn)
@@ -2117,13 +2117,13 @@ int kvm_emulate_mwait(struct kvm_vcpu *vcpu)
 {
 	return kvm_emulate_monitor_mwait(vcpu, "MWAIT");
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_mwait);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_mwait);
 
 int kvm_emulate_monitor(struct kvm_vcpu *vcpu)
 {
 	return kvm_emulate_monitor_mwait(vcpu, "MONITOR");
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_monitor);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_monitor);
 
 static inline bool kvm_vcpu_exit_request(struct kvm_vcpu *vcpu)
 {
@@ -2200,7 +2200,7 @@ fastpath_t handle_fastpath_set_msr_irqoff(struct kvm_vcpu *vcpu)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(handle_fastpath_set_msr_irqoff);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(handle_fastpath_set_msr_irqoff);
 
 /*
  * Adapt set_msr() to msr_io()'s calling convention
@@ -2566,7 +2566,7 @@ u64 kvm_read_l1_tsc(struct kvm_vcpu *vcpu, u64 host_tsc)
 	return vcpu->arch.l1_tsc_offset +
 		kvm_scale_tsc(host_tsc, vcpu->arch.l1_tsc_scaling_ratio);
 }
-EXPORT_SYMBOL_GPL(kvm_read_l1_tsc);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_read_l1_tsc);
 
 u64 kvm_calc_nested_tsc_offset(u64 l1_offset, u64 l2_offset, u64 l2_multiplier)
 {
@@ -2581,7 +2581,7 @@ u64 kvm_calc_nested_tsc_offset(u64 l1_offset, u64 l2_offset, u64 l2_multiplier)
 	nested_offset += l2_offset;
 	return nested_offset;
 }
-EXPORT_SYMBOL_GPL(kvm_calc_nested_tsc_offset);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_calc_nested_tsc_offset);
 
 u64 kvm_calc_nested_tsc_multiplier(u64 l1_multiplier, u64 l2_multiplier)
 {
@@ -2591,7 +2591,7 @@ u64 kvm_calc_nested_tsc_multiplier(u64 l1_multiplier, u64 l2_multiplier)
 
 	return l1_multiplier;
 }
-EXPORT_SYMBOL_GPL(kvm_calc_nested_tsc_multiplier);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_calc_nested_tsc_multiplier);
 
 static void kvm_vcpu_write_tsc_offset(struct kvm_vcpu *vcpu, u64 l1_offset)
 {
@@ -3669,7 +3669,7 @@ void kvm_service_local_tlb_flush_requests(struct kvm_vcpu *vcpu)
 	if (kvm_check_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu))
 		kvm_vcpu_flush_tlb_guest(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_service_local_tlb_flush_requests);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_service_local_tlb_flush_requests);
 
 static void record_steal_time(struct kvm_vcpu *vcpu)
 {
@@ -4161,7 +4161,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_msr_common);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_msr_common);
 
 static int get_msr_mce(struct kvm_vcpu *vcpu, u32 msr, u64 *pdata, bool host)
 {
@@ -4510,7 +4510,7 @@ int kvm_get_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_get_msr_common);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_get_msr_common);
 
 /*
  * Read or write a bunch of msrs. All parameters are kernel addresses.
@@ -7484,7 +7484,7 @@ gpa_t kvm_mmu_gva_to_gpa_read(struct kvm_vcpu *vcpu, gva_t gva,
 	u64 access = (kvm_x86_call(get_cpl)(vcpu) == 3) ? PFERR_USER_MASK : 0;
 	return mmu->gva_to_gpa(vcpu, mmu, gva, access, exception);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_gva_to_gpa_read);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_gva_to_gpa_read);
 
 gpa_t kvm_mmu_gva_to_gpa_write(struct kvm_vcpu *vcpu, gva_t gva,
 			       struct x86_exception *exception)
@@ -7495,7 +7495,7 @@ gpa_t kvm_mmu_gva_to_gpa_write(struct kvm_vcpu *vcpu, gva_t gva,
 	access |= PFERR_WRITE_MASK;
 	return mmu->gva_to_gpa(vcpu, mmu, gva, access, exception);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_gva_to_gpa_write);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_mmu_gva_to_gpa_write);
 
 /* uses this to access any guest's mapped memory without checking CPL */
 gpa_t kvm_mmu_gva_to_gpa_system(struct kvm_vcpu *vcpu, gva_t gva,
@@ -7581,7 +7581,7 @@ int kvm_read_guest_virt(struct kvm_vcpu *vcpu,
 	return kvm_read_guest_virt_helper(addr, val, bytes, vcpu, access,
 					  exception);
 }
-EXPORT_SYMBOL_GPL(kvm_read_guest_virt);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_read_guest_virt);
 
 static int emulator_read_std(struct x86_emulate_ctxt *ctxt,
 			     gva_t addr, void *val, unsigned int bytes,
@@ -7653,7 +7653,7 @@ int kvm_write_guest_virt_system(struct kvm_vcpu *vcpu, gva_t addr, void *val,
 	return kvm_write_guest_virt_helper(addr, val, bytes, vcpu,
 					   PFERR_WRITE_MASK, exception);
 }
-EXPORT_SYMBOL_GPL(kvm_write_guest_virt_system);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_write_guest_virt_system);
 
 static int kvm_check_emulate_insn(struct kvm_vcpu *vcpu, int emul_type,
 				  void *insn, int insn_len)
@@ -7687,7 +7687,7 @@ int handle_ud(struct kvm_vcpu *vcpu)
 
 	return kvm_emulate_instruction(vcpu, emul_type);
 }
-EXPORT_SYMBOL_GPL(handle_ud);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(handle_ud);
 
 static int vcpu_is_mmio_gpa(struct kvm_vcpu *vcpu, unsigned long gva,
 			    gpa_t gpa, bool write)
@@ -8166,7 +8166,7 @@ int kvm_emulate_wbinvd(struct kvm_vcpu *vcpu)
 	kvm_emulate_wbinvd_noskip(vcpu);
 	return kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_wbinvd);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_wbinvd);
 
 
 
@@ -8661,7 +8661,7 @@ void kvm_inject_realmode_interrupt(struct kvm_vcpu *vcpu, int irq, int inc_eip)
 		kvm_set_rflags(vcpu, ctxt->eflags);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_inject_realmode_interrupt);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_inject_realmode_interrupt);
 
 static void prepare_emulation_failure_exit(struct kvm_vcpu *vcpu, u64 *data,
 					   u8 ndata, u8 *insn_bytes, u8 insn_size)
@@ -8726,13 +8726,13 @@ void __kvm_prepare_emulation_failure_exit(struct kvm_vcpu *vcpu, u64 *data,
 {
 	prepare_emulation_failure_exit(vcpu, data, ndata, NULL, 0);
 }
-EXPORT_SYMBOL_GPL(__kvm_prepare_emulation_failure_exit);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(__kvm_prepare_emulation_failure_exit);
 
 void kvm_prepare_emulation_failure_exit(struct kvm_vcpu *vcpu)
 {
 	__kvm_prepare_emulation_failure_exit(vcpu, NULL, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_prepare_emulation_failure_exit);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_prepare_emulation_failure_exit);
 
 void kvm_prepare_event_vectoring_exit(struct kvm_vcpu *vcpu, gpa_t gpa)
 {
@@ -8754,7 +8754,7 @@ void kvm_prepare_event_vectoring_exit(struct kvm_vcpu *vcpu, gpa_t gpa)
 	run->internal.suberror = KVM_INTERNAL_ERROR_DELIVERY_EV;
 	run->internal.ndata = ndata;
 }
-EXPORT_SYMBOL_GPL(kvm_prepare_event_vectoring_exit);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_prepare_event_vectoring_exit);
 
 static int handle_emulation_failure(struct kvm_vcpu *vcpu, int emulation_type)
 {
@@ -8878,7 +8878,7 @@ int kvm_skip_emulated_instruction(struct kvm_vcpu *vcpu)
 		r = kvm_vcpu_do_singlestep(vcpu);
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvm_skip_emulated_instruction);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_skip_emulated_instruction);
 
 static bool kvm_is_code_breakpoint_inhibited(struct kvm_vcpu *vcpu)
 {
@@ -9009,7 +9009,7 @@ int x86_decode_emulated_instruction(struct kvm_vcpu *vcpu, int emulation_type,
 
 	return r;
 }
-EXPORT_SYMBOL_GPL(x86_decode_emulated_instruction);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(x86_decode_emulated_instruction);
 
 int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 			    int emulation_type, void *insn, int insn_len)
@@ -9226,14 +9226,14 @@ int kvm_emulate_instruction(struct kvm_vcpu *vcpu, int emulation_type)
 {
 	return x86_emulate_instruction(vcpu, 0, emulation_type, NULL, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_instruction);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_instruction);
 
 int kvm_emulate_instruction_from_buffer(struct kvm_vcpu *vcpu,
 					void *insn, int insn_len)
 {
 	return x86_emulate_instruction(vcpu, 0, 0, insn, insn_len);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_instruction_from_buffer);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_instruction_from_buffer);
 
 static int complete_fast_pio_out_port_0x7e(struct kvm_vcpu *vcpu)
 {
@@ -9328,7 +9328,7 @@ int kvm_fast_pio(struct kvm_vcpu *vcpu, int size, unsigned short port, int in)
 		ret = kvm_fast_pio_out(vcpu, size, port);
 	return ret && kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_fast_pio);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_fast_pio);
 
 static int kvmclock_cpu_down_prep(unsigned int cpu)
 {
@@ -9760,7 +9760,7 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	kmem_cache_destroy(x86_emulator_cache);
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvm_x86_vendor_init);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_x86_vendor_init);
 
 void kvm_x86_vendor_exit(void)
 {
@@ -9794,7 +9794,7 @@ void kvm_x86_vendor_exit(void)
 	kvm_x86_ops.enable_virtualization_cpu = NULL;
 	mutex_unlock(&vendor_module_lock);
 }
-EXPORT_SYMBOL_GPL(kvm_x86_vendor_exit);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_x86_vendor_exit);
 
 #ifdef CONFIG_X86_64
 static int kvm_pv_clock_pairing(struct kvm_vcpu *vcpu, gpa_t paddr,
@@ -9858,7 +9858,7 @@ bool kvm_apicv_activated(struct kvm *kvm)
 {
 	return (READ_ONCE(kvm->arch.apicv_inhibit_reasons) == 0);
 }
-EXPORT_SYMBOL_GPL(kvm_apicv_activated);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_apicv_activated);
 
 bool kvm_vcpu_apicv_activated(struct kvm_vcpu *vcpu)
 {
@@ -9868,7 +9868,7 @@ bool kvm_vcpu_apicv_activated(struct kvm_vcpu *vcpu)
 
 	return (vm_reasons | vcpu_reasons) == 0;
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_apicv_activated);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_vcpu_apicv_activated);
 
 static void set_or_clear_apicv_inhibit(unsigned long *inhibits,
 				       enum kvm_apicv_inhibit reason, bool set)
@@ -10041,7 +10041,7 @@ int ____kvm_emulate_hypercall(struct kvm_vcpu *vcpu, int cpl,
 	vcpu->run->hypercall.ret = ret;
 	return 1;
 }
-EXPORT_SYMBOL_GPL(____kvm_emulate_hypercall);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(____kvm_emulate_hypercall);
 
 int kvm_emulate_hypercall(struct kvm_vcpu *vcpu)
 {
@@ -10054,7 +10054,7 @@ int kvm_emulate_hypercall(struct kvm_vcpu *vcpu)
 	return __kvm_emulate_hypercall(vcpu, kvm_x86_call(get_cpl)(vcpu),
 				       complete_hypercall_exit);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_hypercall);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_hypercall);
 
 static int emulator_fix_hypercall(struct x86_emulate_ctxt *ctxt)
 {
@@ -10497,7 +10497,7 @@ void __kvm_vcpu_update_apicv(struct kvm_vcpu *vcpu)
 	preempt_enable();
 	up_read(&vcpu->kvm->arch.apicv_update_lock);
 }
-EXPORT_SYMBOL_GPL(__kvm_vcpu_update_apicv);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(__kvm_vcpu_update_apicv);
 
 static void kvm_vcpu_update_apicv(struct kvm_vcpu *vcpu)
 {
@@ -10573,7 +10573,7 @@ void kvm_set_or_clear_apicv_inhibit(struct kvm *kvm,
 	__kvm_set_or_clear_apicv_inhibit(kvm, reason, set);
 	up_write(&kvm->arch.apicv_update_lock);
 }
-EXPORT_SYMBOL_GPL(kvm_set_or_clear_apicv_inhibit);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_or_clear_apicv_inhibit);
 
 static void vcpu_scan_ioapic(struct kvm_vcpu *vcpu)
 {
@@ -11123,7 +11123,7 @@ bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 
 	return false;
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_has_events);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_vcpu_has_events);
 
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 {
@@ -11276,7 +11276,7 @@ int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu)
 {
 	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_halt_noskip);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_halt_noskip);
 
 int kvm_emulate_halt(struct kvm_vcpu *vcpu)
 {
@@ -11287,7 +11287,7 @@ int kvm_emulate_halt(struct kvm_vcpu *vcpu)
 	 */
 	return kvm_emulate_halt_noskip(vcpu) && ret;
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_halt);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_halt);
 
 fastpath_t handle_fastpath_hlt(struct kvm_vcpu *vcpu)
 {
@@ -11305,7 +11305,7 @@ fastpath_t handle_fastpath_hlt(struct kvm_vcpu *vcpu)
 
 	return EXIT_FASTPATH_EXIT_HANDLED;
 }
-EXPORT_SYMBOL_GPL(handle_fastpath_hlt);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(handle_fastpath_hlt);
 
 int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu)
 {
@@ -11314,7 +11314,7 @@ int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu)
 	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD,
 					KVM_EXIT_AP_RESET_HOLD) && ret;
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_ap_reset_hold);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_emulate_ap_reset_hold);
 
 bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu)
 {
@@ -11846,7 +11846,7 @@ int kvm_task_switch(struct kvm_vcpu *vcpu, u16 tss_selector, int idt_index,
 	kvm_set_rflags(vcpu, ctxt->eflags);
 	return 1;
 }
-EXPORT_SYMBOL_GPL(kvm_task_switch);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_task_switch);
 
 static bool kvm_is_valid_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
 {
@@ -12526,7 +12526,7 @@ void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
 	if (init_event)
 		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_reset);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_vcpu_reset);
 
 void kvm_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, u8 vector)
 {
@@ -12538,7 +12538,7 @@ void kvm_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, u8 vector)
 	kvm_set_segment(vcpu, &cs, VCPU_SREG_CS);
 	kvm_rip_write(vcpu, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_deliver_sipi_vector);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_vcpu_deliver_sipi_vector);
 
 void kvm_arch_enable_virtualization(void)
 {
@@ -12656,7 +12656,7 @@ bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
 {
 	return vcpu->kvm->arch.bsp_vcpu_id == vcpu->vcpu_id;
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_is_reset_bsp);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_vcpu_is_reset_bsp);
 
 bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu)
 {
@@ -12820,7 +12820,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 
 	return (void __user *)hva;
 }
-EXPORT_SYMBOL_GPL(__x86_set_memory_region);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(__x86_set_memory_region);
 
 void kvm_arch_pre_destroy_vm(struct kvm *kvm)
 {
@@ -13228,13 +13228,13 @@ unsigned long kvm_get_linear_rip(struct kvm_vcpu *vcpu)
 	return (u32)(get_segment_base(vcpu, VCPU_SREG_CS) +
 		     kvm_rip_read(vcpu));
 }
-EXPORT_SYMBOL_GPL(kvm_get_linear_rip);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_get_linear_rip);
 
 bool kvm_is_linear_rip(struct kvm_vcpu *vcpu, unsigned long linear_rip)
 {
 	return kvm_get_linear_rip(vcpu) == linear_rip;
 }
-EXPORT_SYMBOL_GPL(kvm_is_linear_rip);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_is_linear_rip);
 
 unsigned long kvm_get_rflags(struct kvm_vcpu *vcpu)
 {
@@ -13245,7 +13245,7 @@ unsigned long kvm_get_rflags(struct kvm_vcpu *vcpu)
 		rflags &= ~X86_EFLAGS_TF;
 	return rflags;
 }
-EXPORT_SYMBOL_GPL(kvm_get_rflags);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_get_rflags);
 
 static void __kvm_set_rflags(struct kvm_vcpu *vcpu, unsigned long rflags)
 {
@@ -13260,7 +13260,7 @@ void kvm_set_rflags(struct kvm_vcpu *vcpu, unsigned long rflags)
 	__kvm_set_rflags(vcpu, rflags);
 	kvm_make_request(KVM_REQ_EVENT, vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_set_rflags);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_set_rflags);
 
 static inline u32 kvm_async_pf_hash_fn(gfn_t gfn)
 {
@@ -13503,7 +13503,7 @@ bool kvm_arch_has_noncoherent_dma(struct kvm *kvm)
 {
 	return atomic_read(&kvm->arch.noncoherent_dma_count);
 }
-EXPORT_SYMBOL_GPL(kvm_arch_has_noncoherent_dma);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_arch_has_noncoherent_dma);
 
 bool kvm_vector_hashing_enabled(void)
 {
@@ -13553,7 +13553,7 @@ int kvm_spec_ctrl_test_value(u64 value)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(kvm_spec_ctrl_test_value);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_spec_ctrl_test_value);
 
 void kvm_fixup_and_inject_pf_error(struct kvm_vcpu *vcpu, gva_t gva, u16 error_code)
 {
@@ -13578,7 +13578,7 @@ void kvm_fixup_and_inject_pf_error(struct kvm_vcpu *vcpu, gva_t gva, u16 error_c
 	}
 	vcpu->arch.walk_mmu->inject_page_fault(vcpu, &fault);
 }
-EXPORT_SYMBOL_GPL(kvm_fixup_and_inject_pf_error);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_fixup_and_inject_pf_error);
 
 /*
  * Handles kvm_read/write_guest_virt*() result and either injects #PF or returns
@@ -13607,7 +13607,7 @@ int kvm_handle_memory_failure(struct kvm_vcpu *vcpu, int r,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_handle_memory_failure);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_handle_memory_failure);
 
 int kvm_handle_invpcid(struct kvm_vcpu *vcpu, unsigned long type, gva_t gva)
 {
@@ -13671,7 +13671,7 @@ int kvm_handle_invpcid(struct kvm_vcpu *vcpu, unsigned long type, gva_t gva)
 		return 1;
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_handle_invpcid);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_handle_invpcid);
 
 static int complete_sev_es_emulated_mmio(struct kvm_vcpu *vcpu)
 {
@@ -13756,7 +13756,7 @@ int kvm_sev_es_mmio_write(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_sev_es_mmio_write);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_sev_es_mmio_write);
 
 int kvm_sev_es_mmio_read(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 			 void *data)
@@ -13794,7 +13794,7 @@ int kvm_sev_es_mmio_read(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_sev_es_mmio_read);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_sev_es_mmio_read);
 
 static void advance_sev_es_emulated_pio(struct kvm_vcpu *vcpu, unsigned count, int size)
 {
@@ -13882,7 +13882,7 @@ int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
 	return in ? kvm_sev_es_ins(vcpu, size, port)
 		  : kvm_sev_es_outs(vcpu, size, port);
 }
-EXPORT_SYMBOL_GPL(kvm_sev_es_string_io);
+EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(kvm_sev_es_string_io);
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_entry);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_exit);
-- 
2.50.1.552.g942d659e1b-goog


