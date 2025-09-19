Return-Path: <linuxppc-dev+bounces-12407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE128B877C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 02:33:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSYQG6zqPz3cgd;
	Fri, 19 Sep 2025 10:33:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758242006;
	cv=none; b=OEEayP0FY++MOrxwRHQnaLsyPfKXcu0ZE1y3oOv+eNcye17gVFgCL+irMSRIDIHppwYBVUrWXoHkREKm/fTr/hKP92iFx0vSZ5thp0P3Y++qBwaobU3VorLlT8psq1M527BzsFSnc6Gjo0XRgkkUwgk2mVEY7+CHQu3SmqPPnhsT8MVSFwJPCfDgNqsLBFKb4WvV8+Ja06xv7YMKnKkjt1+KJJOOm3Kco/EkUQR4bK+d61UF2eaW0FJvEKReOvB/L/ixPx2YyjnnjojW6gO5qhd3TEP1GC6nliAbt/s8RiLFwctYuDuxrKn2b1wWqT4jMFzXh5IVfba2rIEXgu1ZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758242006; c=relaxed/relaxed;
	bh=iWtIqknTatw78RNMwtt34Lt98UAdTdmQo7Vp0jVxdAc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aQ6nkVaEB5jCAjX0xDgdE3nosc1FQ2zJF8FQyU1EdXofYgmU7M/dfHxhX43pXy1YrYVWTAhhdN5TBjD440aJYot3sVepfR5boL4bQUBloYWvLAOi9VeNBtL45aPVkvXhkeBtvccTyTDqk+FNPXX9LjJYkQbaP8MUKg4vCywXjxCU0XnX2bqx/EF9kcLCPifAsNBzRQdtqew90KHY+EXQfZ3pUjZkrBAH1WJwAj1Z8YEN0pvcr2i1Pz3VGTKZm0QXuC3yl2dC/zK0DXQsCBhYPjkSEcKtVYE/zudQECKqWN4i84DyDe2fGbcicc/QpwhR0S3JtL2LnLc5D2oCrzq4Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xuqWx3Jc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=306tmaaykdjwoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xuqWx3Jc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=306tmaaykdjwoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSYQF2vDmz3cfL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 10:33:25 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-77e5a77a25aso416588b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 17:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758242003; x=1758846803; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=iWtIqknTatw78RNMwtt34Lt98UAdTdmQo7Vp0jVxdAc=;
        b=xuqWx3JcSFxxGuTlL5LrD0TQX6q7dAALqpsFmFflTp/iR/Obko1IOP9fJry0MzBhT+
         lrOvM6n9/1YXx0cS0/HQRRehLcSh/QDHUkA+IFAKsTq9jDgFVYW/x2IrxxCi+ACi4QBG
         hUlnLz42P2+eYxiebc5f8jEt50Bq2PFp457LL4rRGUSJlm167qyFUFijiOj7jwrLqJFk
         XhXoB62hjl+tpgLOG1VPgmlRz5JPecXz510W54GSeWHNHKOmjIiU98Vg/WJxHmdpI1U9
         h9Uurk3BLBeHyGeaz3hwh1fFswYn39nCNujAynggAjVemBCre5pSswfBSq8p4ZfnedOq
         t+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758242003; x=1758846803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWtIqknTatw78RNMwtt34Lt98UAdTdmQo7Vp0jVxdAc=;
        b=K4OHvvLGT0YXR7qLlJhCSrQtPtePOFovINzxq7JOBLaIHmvDZbG8aBwVj1k75aljPG
         HZ4wx2KbXq+9jQyhUUMuL9rd2y0HE10WwRRq9IRMio5PBO7hHdqx9qUqnKkhRhhM9l6Z
         cZrHnddNJFWh2HsdbrN+67Qw3iMhChJFzU87Fhctf+R7HgYN2Re5OuFQ6D16I1HGHtpa
         as78trEdwv9nCDJaq3Pl6pXkGAxDtVUjrTsnPOM/wM4jXiW/LSCMFyPoKcmgH+ZXfelU
         sCw/PYVEOe0CJ+ZIXfVinib+80/ybhuXIQ3oLrHVG/9YHaKI4JBpiPQOS99fnh29J6sX
         +1hQ==
X-Gm-Message-State: AOJu0YwGxya7vREQFNbbOW3k8F9yiajENThMeAIWP3c340lqynsmVLWx
	xp+i2ASrlF1duKVtbe/8b/1sxHegGjKNMSrqzUO+v+XEZbGMv9+H4SnHwew76zXCidfhTAfpBjr
	uvhXPoA==
X-Google-Smtp-Source: AGHT+IGXuOLqd69Ccm9uJ6dotAIyGTLvu0YrSbfdR2aJ+sIyrCygY61Z1DCMCWBSxpqRdDQhx6u43Cz5Dy4=
X-Received: from pfbfw3.prod.google.com ([2002:a05:6a00:61c3:b0:77c:1814:c8d4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:10d0:b0:772:270f:58ab
 with SMTP id d2e1a72fcca58-77e4e8acfa9mr1706676b3a.15.1758242003097; Thu, 18
 Sep 2025 17:33:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 18 Sep 2025 17:33:03 -0700
In-Reply-To: <20250919003303.1355064-1-seanjc@google.com>
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
References: <20250919003303.1355064-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250919003303.1355064-6-seanjc@google.com>
Subject: [PATCH v2 5/5] KVM: x86: Export KVM-internal symbols for sub-modules only
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
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
 arch/x86/kvm/lapic.c        |  40 +++----
 arch/x86/kvm/mmu/mmu.c      |  36 +++---
 arch/x86/kvm/mmu/spte.c     |  10 +-
 arch/x86/kvm/mmu/tdp_mmu.c  |   2 +-
 arch/x86/kvm/pmu.c          |  10 +-
 arch/x86/kvm/smm.c          |   2 +-
 arch/x86/kvm/x86.c          | 216 ++++++++++++++++++------------------
 11 files changed, 171 insertions(+), 171 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index efee08fad72e..b5ba207f1aa5 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -34,7 +34,7 @@
  * aligned to sizeof(unsigned long) because it's not accessed via bitops.
  */
 u32 kvm_cpu_caps[NR_KVM_CPU_CAPS] __read_mostly;
-EXPORT_SYMBOL_GPL(kvm_cpu_caps);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_cpu_caps);
 
 struct cpuid_xstate_sizes {
 	u32 eax;
@@ -131,7 +131,7 @@ struct kvm_cpuid_entry2 *kvm_find_cpuid_entry2(
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(kvm_find_cpuid_entry2);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_find_cpuid_entry2);
 
 static int kvm_check_cpuid(struct kvm_vcpu *vcpu)
 {
@@ -1228,7 +1228,7 @@ void kvm_set_cpu_caps(void)
 		kvm_cpu_cap_clear(X86_FEATURE_RDPID);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_set_cpu_caps);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cpu_caps);
 
 #undef F
 #undef SCATTERED_F
@@ -2052,7 +2052,7 @@ bool kvm_cpuid(struct kvm_vcpu *vcpu, u32 *eax, u32 *ebx,
 			used_max_basic);
 	return exact;
 }
-EXPORT_SYMBOL_GPL(kvm_cpuid);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_cpuid);
 
 int kvm_emulate_cpuid(struct kvm_vcpu *vcpu)
 {
@@ -2070,4 +2070,4 @@ int kvm_emulate_cpuid(struct kvm_vcpu *vcpu)
 	kvm_rdx_write(vcpu, edx);
 	return kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_cpuid);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_cpuid);
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index a471900c7325..38595ecb990d 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -923,7 +923,7 @@ bool kvm_hv_assist_page_enabled(struct kvm_vcpu *vcpu)
 		return false;
 	return vcpu->arch.pv_eoi.msr_val & KVM_MSR_ENABLED;
 }
-EXPORT_SYMBOL_GPL(kvm_hv_assist_page_enabled);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_hv_assist_page_enabled);
 
 int kvm_hv_get_assist_page(struct kvm_vcpu *vcpu)
 {
@@ -935,7 +935,7 @@ int kvm_hv_get_assist_page(struct kvm_vcpu *vcpu)
 	return kvm_read_guest_cached(vcpu->kvm, &vcpu->arch.pv_eoi.data,
 				     &hv_vcpu->vp_assist_page, sizeof(struct hv_vp_assist_page));
 }
-EXPORT_SYMBOL_GPL(kvm_hv_get_assist_page);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_hv_get_assist_page);
 
 static void stimer_prepare_msg(struct kvm_vcpu_hv_stimer *stimer)
 {
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 153134893301..7cc8950005b6 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -103,7 +103,7 @@ int kvm_cpu_has_injectable_intr(struct kvm_vcpu *v)
 
 	return kvm_apic_has_interrupt(v) != -1; /* LAPIC */
 }
-EXPORT_SYMBOL_GPL(kvm_cpu_has_injectable_intr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_cpu_has_injectable_intr);
 
 /*
  * check if there is pending interrupt without
@@ -119,7 +119,7 @@ int kvm_cpu_has_interrupt(struct kvm_vcpu *v)
 
 	return kvm_apic_has_interrupt(v) != -1;	/* LAPIC */
 }
-EXPORT_SYMBOL_GPL(kvm_cpu_has_interrupt);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_cpu_has_interrupt);
 
 /*
  * Read pending interrupt(from non-APIC source)
@@ -148,7 +148,7 @@ int kvm_cpu_get_extint(struct kvm_vcpu *v)
 	WARN_ON_ONCE(!irqchip_split(v->kvm));
 	return get_userspace_extint(v);
 }
-EXPORT_SYMBOL_GPL(kvm_cpu_get_extint);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_cpu_get_extint);
 
 /*
  * Read pending interrupt vector and intack.
diff --git a/arch/x86/kvm/kvm_onhyperv.c b/arch/x86/kvm/kvm_onhyperv.c
index ded0bd688c65..ee53e75a60cb 100644
--- a/arch/x86/kvm/kvm_onhyperv.c
+++ b/arch/x86/kvm/kvm_onhyperv.c
@@ -101,13 +101,13 @@ int hv_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, gfn_t nr_pages)
 
 	return __hv_flush_remote_tlbs_range(kvm, &range);
 }
-EXPORT_SYMBOL_GPL(hv_flush_remote_tlbs_range);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs_range);
 
 int hv_flush_remote_tlbs(struct kvm *kvm)
 {
 	return __hv_flush_remote_tlbs_range(kvm, NULL);
 }
-EXPORT_SYMBOL_GPL(hv_flush_remote_tlbs);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs);
 
 void hv_track_root_tdp(struct kvm_vcpu *vcpu, hpa_t root_tdp)
 {
@@ -121,4 +121,4 @@ void hv_track_root_tdp(struct kvm_vcpu *vcpu, hpa_t root_tdp)
 		spin_unlock(&kvm_arch->hv_root_tdp_lock);
 	}
 }
-EXPORT_SYMBOL_GPL(hv_track_root_tdp);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_track_root_tdp);
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index b5e47c523164..0ae7f913d782 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -106,7 +106,7 @@ bool kvm_apic_pending_eoi(struct kvm_vcpu *vcpu, int vector)
 }
 
 __read_mostly DEFINE_STATIC_KEY_FALSE(kvm_has_noapic_vcpu);
-EXPORT_SYMBOL_GPL(kvm_has_noapic_vcpu);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_has_noapic_vcpu);
 
 __read_mostly DEFINE_STATIC_KEY_DEFERRED_FALSE(apic_hw_disabled, HZ);
 __read_mostly DEFINE_STATIC_KEY_DEFERRED_FALSE(apic_sw_disabled, HZ);
@@ -646,7 +646,7 @@ bool __kvm_apic_update_irr(unsigned long *pir, void *regs, int *max_irr)
 	return ((max_updated_irr != -1) &&
 		(max_updated_irr == *max_irr));
 }
-EXPORT_SYMBOL_GPL(__kvm_apic_update_irr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(__kvm_apic_update_irr);
 
 bool kvm_apic_update_irr(struct kvm_vcpu *vcpu, unsigned long *pir, int *max_irr)
 {
@@ -657,7 +657,7 @@ bool kvm_apic_update_irr(struct kvm_vcpu *vcpu, unsigned long *pir, int *max_irr
 		apic->irr_pending = true;
 	return irr_updated;
 }
-EXPORT_SYMBOL_GPL(kvm_apic_update_irr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_update_irr);
 
 static inline int apic_search_irr(struct kvm_lapic *apic)
 {
@@ -697,7 +697,7 @@ void kvm_apic_clear_irr(struct kvm_vcpu *vcpu, int vec)
 {
 	apic_clear_irr(vec, vcpu->arch.apic);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_clear_irr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_clear_irr);
 
 static void *apic_vector_to_isr(int vec, struct kvm_lapic *apic)
 {
@@ -779,7 +779,7 @@ void kvm_apic_update_hwapic_isr(struct kvm_vcpu *vcpu)
 
 	kvm_x86_call(hwapic_isr_update)(vcpu, apic_find_highest_isr(apic));
 }
-EXPORT_SYMBOL_GPL(kvm_apic_update_hwapic_isr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_update_hwapic_isr);
 
 int kvm_lapic_find_highest_irr(struct kvm_vcpu *vcpu)
 {
@@ -790,7 +790,7 @@ int kvm_lapic_find_highest_irr(struct kvm_vcpu *vcpu)
 	 */
 	return apic_find_highest_irr(vcpu->arch.apic);
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_find_highest_irr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_lapic_find_highest_irr);
 
 static int __apic_accept_irq(struct kvm_lapic *apic, int delivery_mode,
 			     int vector, int level, int trig_mode,
@@ -954,7 +954,7 @@ void kvm_apic_update_ppr(struct kvm_vcpu *vcpu)
 {
 	apic_update_ppr(vcpu->arch.apic);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_update_ppr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_update_ppr);
 
 static void apic_set_tpr(struct kvm_lapic *apic, u32 tpr)
 {
@@ -1065,7 +1065,7 @@ bool kvm_apic_match_dest(struct kvm_vcpu *vcpu, struct kvm_lapic *source,
 		return false;
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_apic_match_dest);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_match_dest);
 
 static int kvm_vector_to_index(u32 vector, u32 dest_vcpus,
 			       const unsigned long *bitmap, u32 bitmap_size)
@@ -1292,7 +1292,7 @@ bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
 
 	return r == 1;
 }
-EXPORT_SYMBOL_GPL(kvm_intr_is_single_vcpu);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_intr_is_single_vcpu);
 
 int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
 			     struct kvm_lapic_irq *irq, struct dest_map *dest_map)
@@ -1569,7 +1569,7 @@ void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, int vector)
 	kvm_ioapic_send_eoi(apic, vector);
 	kvm_make_request(KVM_REQ_EVENT, apic->vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_set_eoi_accelerated);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_set_eoi_accelerated);
 
 static void kvm_icr_to_lapic_irq(struct kvm_lapic *apic, u32 icr_low,
 				 u32 icr_high, struct kvm_lapic_irq *irq)
@@ -1600,7 +1600,7 @@ void kvm_apic_send_ipi(struct kvm_lapic *apic, u32 icr_low, u32 icr_high)
 
 	kvm_irq_delivery_to_apic(apic->vcpu->kvm, apic, &irq, NULL);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_send_ipi);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_send_ipi);
 
 static u32 apic_get_tmcct(struct kvm_lapic *apic)
 {
@@ -1717,7 +1717,7 @@ u64 kvm_lapic_readable_reg_mask(struct kvm_lapic *apic)
 
 	return valid_reg_mask;
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_readable_reg_mask);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_lapic_readable_reg_mask);
 
 static int kvm_lapic_reg_read(struct kvm_lapic *apic, u32 offset, int len,
 			      void *data)
@@ -1958,7 +1958,7 @@ void kvm_wait_lapic_expire(struct kvm_vcpu *vcpu)
 	    lapic_timer_int_injected(vcpu))
 		__kvm_wait_lapic_expire(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_wait_lapic_expire);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_wait_lapic_expire);
 
 static void kvm_apic_inject_pending_timer_irqs(struct kvm_lapic *apic)
 {
@@ -2272,7 +2272,7 @@ void kvm_lapic_expired_hv_timer(struct kvm_vcpu *vcpu)
 out:
 	preempt_enable();
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_expired_hv_timer);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_lapic_expired_hv_timer);
 
 void kvm_lapic_switch_to_hv_timer(struct kvm_vcpu *vcpu)
 {
@@ -2525,7 +2525,7 @@ void kvm_lapic_set_eoi(struct kvm_vcpu *vcpu)
 {
 	kvm_lapic_reg_write(vcpu->arch.apic, APIC_EOI, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_set_eoi);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_lapic_set_eoi);
 
 #define X2APIC_ICR_RESERVED_BITS (GENMASK_ULL(31, 20) | GENMASK_ULL(17, 16) | BIT(13))
 
@@ -2608,7 +2608,7 @@ void kvm_apic_write_nodecode(struct kvm_vcpu *vcpu, u32 offset)
 	else
 		kvm_lapic_reg_write(apic, offset, kvm_lapic_get_reg(apic, offset));
 }
-EXPORT_SYMBOL_GPL(kvm_apic_write_nodecode);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_write_nodecode);
 
 void kvm_free_lapic(struct kvm_vcpu *vcpu)
 {
@@ -2746,7 +2746,7 @@ int kvm_apic_set_base(struct kvm_vcpu *vcpu, u64 value, bool host_initiated)
 	kvm_recalculate_apic_map(vcpu->kvm);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_apic_set_base);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_set_base);
 
 void kvm_apic_update_apicv(struct kvm_vcpu *vcpu)
 {
@@ -2794,7 +2794,7 @@ int kvm_alloc_apic_access_page(struct kvm *kvm)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_alloc_apic_access_page);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_alloc_apic_access_page);
 
 void kvm_inhibit_apic_access_page(struct kvm_vcpu *vcpu)
 {
@@ -3058,7 +3058,7 @@ int kvm_apic_has_interrupt(struct kvm_vcpu *vcpu)
 	__apic_update_ppr(apic, &ppr);
 	return apic_has_interrupt_for_ppr(apic, ppr);
 }
-EXPORT_SYMBOL_GPL(kvm_apic_has_interrupt);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_has_interrupt);
 
 int kvm_apic_accept_pic_intr(struct kvm_vcpu *vcpu)
 {
@@ -3117,7 +3117,7 @@ void kvm_apic_ack_interrupt(struct kvm_vcpu *vcpu, int vector)
 	}
 
 }
-EXPORT_SYMBOL_GPL(kvm_apic_ack_interrupt);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_ack_interrupt);
 
 static int kvm_apic_state_fixup(struct kvm_vcpu *vcpu,
 		struct kvm_lapic_state *s, bool set)
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 55335dbd70ce..667d66cf76d5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -110,7 +110,7 @@ static bool __ro_after_init tdp_mmu_allowed;
 #ifdef CONFIG_X86_64
 bool __read_mostly tdp_mmu_enabled = true;
 module_param_named(tdp_mmu, tdp_mmu_enabled, bool, 0444);
-EXPORT_SYMBOL_GPL(tdp_mmu_enabled);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(tdp_mmu_enabled);
 #endif
 
 static int max_huge_page_level __read_mostly;
@@ -3865,7 +3865,7 @@ void kvm_mmu_free_roots(struct kvm *kvm, struct kvm_mmu *mmu,
 		write_unlock(&kvm->mmu_lock);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_free_roots);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_free_roots);
 
 void kvm_mmu_free_guest_mode_roots(struct kvm *kvm, struct kvm_mmu *mmu)
 {
@@ -3892,7 +3892,7 @@ void kvm_mmu_free_guest_mode_roots(struct kvm *kvm, struct kvm_mmu *mmu)
 
 	kvm_mmu_free_roots(kvm, mmu, roots_to_free);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_free_guest_mode_roots);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_free_guest_mode_roots);
 
 static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, int quadrant,
 			    u8 level)
@@ -4876,7 +4876,7 @@ int kvm_handle_page_fault(struct kvm_vcpu *vcpu, u64 error_code,
 
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvm_handle_page_fault);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_handle_page_fault);
 
 #ifdef CONFIG_X86_64
 static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
@@ -4966,7 +4966,7 @@ int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level
 		return -EIO;
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_tdp_map_page);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_map_page);
 
 long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range)
@@ -5162,7 +5162,7 @@ void kvm_mmu_new_pgd(struct kvm_vcpu *vcpu, gpa_t new_pgd)
 			__clear_sp_write_flooding_count(sp);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_new_pgd);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_new_pgd);
 
 static bool sync_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, gfn_t gfn,
 			   unsigned int access)
@@ -5808,7 +5808,7 @@ void kvm_init_shadow_npt_mmu(struct kvm_vcpu *vcpu, unsigned long cr0,
 	shadow_mmu_init_context(vcpu, context, cpu_role, root_role);
 	kvm_mmu_new_pgd(vcpu, nested_cr3);
 }
-EXPORT_SYMBOL_GPL(kvm_init_shadow_npt_mmu);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_init_shadow_npt_mmu);
 
 static union kvm_cpu_role
 kvm_calc_shadow_ept_root_page_role(struct kvm_vcpu *vcpu, bool accessed_dirty,
@@ -5862,7 +5862,7 @@ void kvm_init_shadow_ept_mmu(struct kvm_vcpu *vcpu, bool execonly,
 
 	kvm_mmu_new_pgd(vcpu, new_eptp);
 }
-EXPORT_SYMBOL_GPL(kvm_init_shadow_ept_mmu);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_init_shadow_ept_mmu);
 
 static void init_kvm_softmmu(struct kvm_vcpu *vcpu,
 			     union kvm_cpu_role cpu_role)
@@ -5927,7 +5927,7 @@ void kvm_init_mmu(struct kvm_vcpu *vcpu)
 	else
 		init_kvm_softmmu(vcpu, cpu_role);
 }
-EXPORT_SYMBOL_GPL(kvm_init_mmu);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_init_mmu);
 
 void kvm_mmu_after_set_cpuid(struct kvm_vcpu *vcpu)
 {
@@ -5963,7 +5963,7 @@ void kvm_mmu_reset_context(struct kvm_vcpu *vcpu)
 	kvm_mmu_unload(vcpu);
 	kvm_init_mmu(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_reset_context);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_reset_context);
 
 int kvm_mmu_load(struct kvm_vcpu *vcpu)
 {
@@ -5997,7 +5997,7 @@ int kvm_mmu_load(struct kvm_vcpu *vcpu)
 out:
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_load);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_load);
 
 void kvm_mmu_unload(struct kvm_vcpu *vcpu)
 {
@@ -6059,7 +6059,7 @@ void kvm_mmu_free_obsolete_roots(struct kvm_vcpu *vcpu)
 	__kvm_mmu_free_obsolete_roots(vcpu->kvm, &vcpu->arch.root_mmu);
 	__kvm_mmu_free_obsolete_roots(vcpu->kvm, &vcpu->arch.guest_mmu);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_free_obsolete_roots);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_free_obsolete_roots);
 
 static u64 mmu_pte_write_fetch_gpte(struct kvm_vcpu *vcpu, gpa_t *gpa,
 				    int *bytes)
@@ -6385,7 +6385,7 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 err
 	return x86_emulate_instruction(vcpu, cr2_or_gpa, emulation_type, insn,
 				       insn_len);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_page_fault);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_page_fault);
 
 void kvm_mmu_print_sptes(struct kvm_vcpu *vcpu, gpa_t gpa, const char *msg)
 {
@@ -6401,7 +6401,7 @@ void kvm_mmu_print_sptes(struct kvm_vcpu *vcpu, gpa_t gpa, const char *msg)
 		pr_cont(", spte[%d] = 0x%llx", level, sptes[level]);
 	pr_cont("\n");
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_print_sptes);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_print_sptes);
 
 static void __kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
 				      u64 addr, hpa_t root_hpa)
@@ -6467,7 +6467,7 @@ void kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
 			__kvm_mmu_invalidate_addr(vcpu, mmu, addr, mmu->prev_roots[i].hpa);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_invalidate_addr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_invalidate_addr);
 
 void kvm_mmu_invlpg(struct kvm_vcpu *vcpu, gva_t gva)
 {
@@ -6484,7 +6484,7 @@ void kvm_mmu_invlpg(struct kvm_vcpu *vcpu, gva_t gva)
 	kvm_mmu_invalidate_addr(vcpu, vcpu->arch.walk_mmu, gva, KVM_MMU_ROOTS_ALL);
 	++vcpu->stat.invlpg;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_invlpg);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_invlpg);
 
 
 void kvm_mmu_invpcid_gva(struct kvm_vcpu *vcpu, gva_t gva, unsigned long pcid)
@@ -6537,7 +6537,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 	else
 		max_huge_page_level = PG_LEVEL_2M;
 }
-EXPORT_SYMBOL_GPL(kvm_configure_mmu);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_configure_mmu);
 
 static void free_mmu_pages(struct kvm_mmu *mmu)
 {
@@ -7204,7 +7204,7 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
 
 	return need_tlb_flush;
 }
-EXPORT_SYMBOL_GPL(kvm_zap_gfn_range);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_zap_gfn_range);
 
 static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
 					   const struct kvm_memory_slot *slot)
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index df31039b5d63..37647afde7d3 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -22,7 +22,7 @@
 bool __read_mostly enable_mmio_caching = true;
 static bool __ro_after_init allow_mmio_caching;
 module_param_named(mmio_caching, enable_mmio_caching, bool, 0444);
-EXPORT_SYMBOL_GPL(enable_mmio_caching);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_mmio_caching);
 
 bool __read_mostly kvm_ad_enabled;
 
@@ -470,13 +470,13 @@ void kvm_mmu_set_mmio_spte_mask(u64 mmio_value, u64 mmio_mask, u64 access_mask)
 	shadow_mmio_mask  = mmio_mask;
 	shadow_mmio_access_mask = access_mask;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_set_mmio_spte_mask);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_set_mmio_spte_mask);
 
 void kvm_mmu_set_mmio_spte_value(struct kvm *kvm, u64 mmio_value)
 {
 	kvm->arch.shadow_mmio_value = mmio_value;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_set_mmio_spte_value);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_set_mmio_spte_value);
 
 void kvm_mmu_set_me_spte_mask(u64 me_value, u64 me_mask)
 {
@@ -487,7 +487,7 @@ void kvm_mmu_set_me_spte_mask(u64 me_value, u64 me_mask)
 	shadow_me_value = me_value;
 	shadow_me_mask = me_mask;
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_set_me_spte_mask);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_set_me_spte_mask);
 
 void kvm_mmu_set_ept_masks(bool has_ad_bits, bool has_exec_only)
 {
@@ -513,7 +513,7 @@ void kvm_mmu_set_ept_masks(bool has_ad_bits, bool has_exec_only)
 	kvm_mmu_set_mmio_spte_mask(VMX_EPT_MISCONFIG_WX_VALUE,
 				   VMX_EPT_RWX_MASK | VMX_EPT_SUPPRESS_VE_BIT, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_set_ept_masks);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_set_ept_masks);
 
 void kvm_mmu_reset_all_pte_masks(void)
 {
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7059ac9d58e2..c5734ca5c17d 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1982,7 +1982,7 @@ bool kvm_tdp_mmu_gpa_is_mapped(struct kvm_vcpu *vcpu, u64 gpa)
 	spte = sptes[leaf];
 	return is_shadow_present_pte(spte) && is_last_spte(spte, leaf);
 }
-EXPORT_SYMBOL_GPL(kvm_tdp_mmu_gpa_is_mapped);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_mmu_gpa_is_mapped);
 
 /*
  * Returns the last level spte pointer of the shadow page walk for the given
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index b7dc5bd981ba..40ac4cb44ed2 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -31,7 +31,7 @@ static struct x86_pmu_capability __read_mostly kvm_host_pmu;
 
 /* KVM's PMU capabilities, i.e. the intersection of KVM and hardware support. */
 struct x86_pmu_capability __read_mostly kvm_pmu_cap;
-EXPORT_SYMBOL_GPL(kvm_pmu_cap);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_pmu_cap);
 
 struct kvm_pmu_emulated_event_selectors {
 	u64 INSTRUCTIONS_RETIRED;
@@ -373,7 +373,7 @@ void pmc_write_counter(struct kvm_pmc *pmc, u64 val)
 	pmc->counter &= pmc_bitmask(pmc);
 	pmc_update_sample_period(pmc);
 }
-EXPORT_SYMBOL_GPL(pmc_write_counter);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(pmc_write_counter);
 
 static int filter_cmp(const void *pa, const void *pb, u64 mask)
 {
@@ -581,7 +581,7 @@ void kvm_pmu_recalc_pmc_emulation(struct kvm_pmu *pmu, struct kvm_pmc *pmc)
 	if (pmc_is_event_match(pmc, kvm_pmu_eventsel.BRANCH_INSTRUCTIONS_RETIRED))
 		bitmap_set(pmu->pmc_counting_branches, pmc->idx, 1);
 }
-EXPORT_SYMBOL_GPL(kvm_pmu_recalc_pmc_emulation);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_pmu_recalc_pmc_emulation);
 
 void kvm_pmu_handle_event(struct kvm_vcpu *vcpu)
 {
@@ -996,13 +996,13 @@ void kvm_pmu_instruction_retired(struct kvm_vcpu *vcpu)
 {
 	kvm_pmu_trigger_event(vcpu, vcpu_to_pmu(vcpu)->pmc_counting_instructions);
 }
-EXPORT_SYMBOL_GPL(kvm_pmu_instruction_retired);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_pmu_instruction_retired);
 
 void kvm_pmu_branch_retired(struct kvm_vcpu *vcpu)
 {
 	kvm_pmu_trigger_event(vcpu, vcpu_to_pmu(vcpu)->pmc_counting_branches);
 }
-EXPORT_SYMBOL_GPL(kvm_pmu_branch_retired);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_pmu_branch_retired);
 
 static bool is_masked_filter_valid(const struct kvm_x86_pmu_event_filter *filter)
 {
diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index 5dd8a1646800..f04674cad9ef 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -131,7 +131,7 @@ void kvm_smm_changed(struct kvm_vcpu *vcpu, bool entering_smm)
 
 	kvm_mmu_reset_context(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_smm_changed);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_smm_changed);
 
 void process_smi(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ea0fffb24d4d..69934531cc1c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -97,10 +97,10 @@
  * vendor module being reloaded with different module parameters.
  */
 struct kvm_caps kvm_caps __read_mostly;
-EXPORT_SYMBOL_GPL(kvm_caps);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_caps);
 
 struct kvm_host_values kvm_host __read_mostly;
-EXPORT_SYMBOL_GPL(kvm_host);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_host);
 
 #define  ERR_PTR_USR(e)  ((void __user *)ERR_PTR(e))
 
@@ -152,7 +152,7 @@ module_param(ignore_msrs, bool, 0644);
 
 bool __read_mostly report_ignored_msrs = true;
 module_param(report_ignored_msrs, bool, 0644);
-EXPORT_SYMBOL_GPL(report_ignored_msrs);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(report_ignored_msrs);
 
 unsigned int min_timer_period_us = 200;
 module_param(min_timer_period_us, uint, 0644);
@@ -166,7 +166,7 @@ module_param(tsc_tolerance_ppm, uint, 0644);
 
 bool __read_mostly enable_vmware_backdoor = false;
 module_param(enable_vmware_backdoor, bool, 0444);
-EXPORT_SYMBOL_GPL(enable_vmware_backdoor);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_vmware_backdoor);
 
 /*
  * Flags to manipulate forced emulation behavior (any non-zero value will
@@ -181,7 +181,7 @@ module_param(pi_inject_timer, bint, 0644);
 
 /* Enable/disable PMU virtualization */
 bool __read_mostly enable_pmu = true;
-EXPORT_SYMBOL_GPL(enable_pmu);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_pmu);
 module_param(enable_pmu, bool, 0444);
 
 bool __read_mostly eager_page_split = true;
@@ -208,7 +208,7 @@ struct kvm_user_return_msrs {
 };
 
 u32 __read_mostly kvm_nr_uret_msrs;
-EXPORT_SYMBOL_GPL(kvm_nr_uret_msrs);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_nr_uret_msrs);
 static u32 __read_mostly kvm_uret_msrs_list[KVM_MAX_NR_USER_RETURN_MSRS];
 static struct kvm_user_return_msrs __percpu *user_return_msrs;
 
@@ -218,16 +218,16 @@ static struct kvm_user_return_msrs __percpu *user_return_msrs;
 				| XFEATURE_MASK_PKRU | XFEATURE_MASK_XTILE)
 
 bool __read_mostly allow_smaller_maxphyaddr = 0;
-EXPORT_SYMBOL_GPL(allow_smaller_maxphyaddr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(allow_smaller_maxphyaddr);
 
 bool __read_mostly enable_apicv = true;
-EXPORT_SYMBOL_GPL(enable_apicv);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_apicv);
 
 bool __read_mostly enable_ipiv = true;
-EXPORT_SYMBOL_GPL(enable_ipiv);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_ipiv);
 
 bool __read_mostly enable_device_posted_irqs = true;
-EXPORT_SYMBOL_GPL(enable_device_posted_irqs);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_device_posted_irqs);
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
@@ -612,7 +612,7 @@ int kvm_add_user_return_msr(u32 msr)
 	kvm_uret_msrs_list[kvm_nr_uret_msrs] = msr;
 	return kvm_nr_uret_msrs++;
 }
-EXPORT_SYMBOL_GPL(kvm_add_user_return_msr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_add_user_return_msr);
 
 int kvm_find_user_return_msr(u32 msr)
 {
@@ -624,7 +624,7 @@ int kvm_find_user_return_msr(u32 msr)
 	}
 	return -1;
 }
-EXPORT_SYMBOL_GPL(kvm_find_user_return_msr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_find_user_return_msr);
 
 static void kvm_user_return_msr_cpu_online(void)
 {
@@ -664,7 +664,7 @@ int kvm_set_user_return_msr(unsigned slot, u64 value, u64 mask)
 	kvm_user_return_register_notifier(msrs);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_user_return_msr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_user_return_msr);
 
 void kvm_user_return_msr_update_cache(unsigned int slot, u64 value)
 {
@@ -673,7 +673,7 @@ void kvm_user_return_msr_update_cache(unsigned int slot, u64 value)
 	msrs->values[slot].curr = value;
 	kvm_user_return_register_notifier(msrs);
 }
-EXPORT_SYMBOL_GPL(kvm_user_return_msr_update_cache);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_user_return_msr_update_cache);
 
 static void drop_user_return_notifiers(void)
 {
@@ -695,7 +695,7 @@ noinstr void kvm_spurious_fault(void)
 	/* Fault while not rebooting.  We want the trace. */
 	BUG_ON(!kvm_rebooting);
 }
-EXPORT_SYMBOL_GPL(kvm_spurious_fault);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_spurious_fault);
 
 #define EXCPT_BENIGN		0
 #define EXCPT_CONTRIBUTORY	1
@@ -800,7 +800,7 @@ void kvm_deliver_exception_payload(struct kvm_vcpu *vcpu,
 	ex->has_payload = false;
 	ex->payload = 0;
 }
-EXPORT_SYMBOL_GPL(kvm_deliver_exception_payload);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_deliver_exception_payload);
 
 static void kvm_queue_exception_vmexit(struct kvm_vcpu *vcpu, unsigned int vector,
 				       bool has_error_code, u32 error_code,
@@ -884,7 +884,7 @@ void kvm_queue_exception(struct kvm_vcpu *vcpu, unsigned nr)
 {
 	kvm_multiple_exception(vcpu, nr, false, 0, false, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_queue_exception);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_queue_exception);
 
 
 void kvm_queue_exception_p(struct kvm_vcpu *vcpu, unsigned nr,
@@ -892,7 +892,7 @@ void kvm_queue_exception_p(struct kvm_vcpu *vcpu, unsigned nr,
 {
 	kvm_multiple_exception(vcpu, nr, false, 0, true, payload);
 }
-EXPORT_SYMBOL_GPL(kvm_queue_exception_p);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_queue_exception_p);
 
 static void kvm_queue_exception_e_p(struct kvm_vcpu *vcpu, unsigned nr,
 				    u32 error_code, unsigned long payload)
@@ -927,7 +927,7 @@ void kvm_requeue_exception(struct kvm_vcpu *vcpu, unsigned int nr,
 	vcpu->arch.exception.has_payload = false;
 	vcpu->arch.exception.payload = 0;
 }
-EXPORT_SYMBOL_GPL(kvm_requeue_exception);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_requeue_exception);
 
 int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err)
 {
@@ -938,7 +938,7 @@ int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err)
 
 	return 1;
 }
-EXPORT_SYMBOL_GPL(kvm_complete_insn_gp);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_complete_insn_gp);
 
 static int complete_emulated_insn_gp(struct kvm_vcpu *vcpu, int err)
 {
@@ -988,7 +988,7 @@ void kvm_inject_emulated_page_fault(struct kvm_vcpu *vcpu,
 
 	fault_mmu->inject_page_fault(vcpu, fault);
 }
-EXPORT_SYMBOL_GPL(kvm_inject_emulated_page_fault);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_inject_emulated_page_fault);
 
 void kvm_inject_nmi(struct kvm_vcpu *vcpu)
 {
@@ -1000,7 +1000,7 @@ void kvm_queue_exception_e(struct kvm_vcpu *vcpu, unsigned nr, u32 error_code)
 {
 	kvm_multiple_exception(vcpu, nr, true, error_code, false, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_queue_exception_e);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_queue_exception_e);
 
 /*
  * Checks if cpl <= required_cpl; if true, return true.  Otherwise queue
@@ -1022,7 +1022,7 @@ bool kvm_require_dr(struct kvm_vcpu *vcpu, int dr)
 	kvm_queue_exception(vcpu, UD_VECTOR);
 	return false;
 }
-EXPORT_SYMBOL_GPL(kvm_require_dr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_require_dr);
 
 static inline u64 pdptr_rsvd_bits(struct kvm_vcpu *vcpu)
 {
@@ -1077,7 +1077,7 @@ int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3)
 
 	return 1;
 }
-EXPORT_SYMBOL_GPL(load_pdptrs);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(load_pdptrs);
 
 static bool kvm_is_valid_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 {
@@ -1130,7 +1130,7 @@ void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned lon
 	if ((cr0 ^ old_cr0) & KVM_MMU_CR0_ROLE_BITS)
 		kvm_mmu_reset_context(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_post_set_cr0);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_post_set_cr0);
 
 int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 {
@@ -1171,13 +1171,13 @@ int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_cr0);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr0);
 
 void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw)
 {
 	(void)kvm_set_cr0(vcpu, kvm_read_cr0_bits(vcpu, ~0x0eul) | (msw & 0x0f));
 }
-EXPORT_SYMBOL_GPL(kvm_lmsw);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_lmsw);
 
 void kvm_load_guest_xsave_state(struct kvm_vcpu *vcpu)
 {
@@ -1200,7 +1200,7 @@ void kvm_load_guest_xsave_state(struct kvm_vcpu *vcpu)
 	     kvm_is_cr4_bit_set(vcpu, X86_CR4_PKE)))
 		wrpkru(vcpu->arch.pkru);
 }
-EXPORT_SYMBOL_GPL(kvm_load_guest_xsave_state);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_load_guest_xsave_state);
 
 void kvm_load_host_xsave_state(struct kvm_vcpu *vcpu)
 {
@@ -1226,7 +1226,7 @@ void kvm_load_host_xsave_state(struct kvm_vcpu *vcpu)
 	}
 
 }
-EXPORT_SYMBOL_GPL(kvm_load_host_xsave_state);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_load_host_xsave_state);
 
 #ifdef CONFIG_X86_64
 static inline u64 kvm_guest_supported_xfd(struct kvm_vcpu *vcpu)
@@ -1291,7 +1291,7 @@ int kvm_emulate_xsetbv(struct kvm_vcpu *vcpu)
 
 	return kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_xsetbv);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_xsetbv);
 
 static bool kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 {
@@ -1339,7 +1339,7 @@ void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned lon
 		kvm_make_request(KVM_REQ_TLB_FLUSH_CURRENT, vcpu);
 
 }
-EXPORT_SYMBOL_GPL(kvm_post_set_cr4);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_post_set_cr4);
 
 int kvm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 {
@@ -1370,7 +1370,7 @@ int kvm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_cr4);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr4);
 
 static void kvm_invalidate_pcid(struct kvm_vcpu *vcpu, unsigned long pcid)
 {
@@ -1462,7 +1462,7 @@ int kvm_set_cr3(struct kvm_vcpu *vcpu, unsigned long cr3)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_cr3);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr3);
 
 int kvm_set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8)
 {
@@ -1474,7 +1474,7 @@ int kvm_set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8)
 		vcpu->arch.cr8 = cr8;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_cr8);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr8);
 
 unsigned long kvm_get_cr8(struct kvm_vcpu *vcpu)
 {
@@ -1483,7 +1483,7 @@ unsigned long kvm_get_cr8(struct kvm_vcpu *vcpu)
 	else
 		return vcpu->arch.cr8;
 }
-EXPORT_SYMBOL_GPL(kvm_get_cr8);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_cr8);
 
 static void kvm_update_dr0123(struct kvm_vcpu *vcpu)
 {
@@ -1508,7 +1508,7 @@ void kvm_update_dr7(struct kvm_vcpu *vcpu)
 	if (dr7 & DR7_BP_EN_MASK)
 		vcpu->arch.switch_db_regs |= KVM_DEBUGREG_BP_ENABLED;
 }
-EXPORT_SYMBOL_GPL(kvm_update_dr7);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_update_dr7);
 
 static u64 kvm_dr6_fixed(struct kvm_vcpu *vcpu)
 {
@@ -1549,7 +1549,7 @@ int kvm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long val)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_dr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_dr);
 
 unsigned long kvm_get_dr(struct kvm_vcpu *vcpu, int dr)
 {
@@ -1566,7 +1566,7 @@ unsigned long kvm_get_dr(struct kvm_vcpu *vcpu, int dr)
 		return vcpu->arch.dr7;
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_get_dr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_dr);
 
 int kvm_emulate_rdpmc(struct kvm_vcpu *vcpu)
 {
@@ -1582,7 +1582,7 @@ int kvm_emulate_rdpmc(struct kvm_vcpu *vcpu)
 	kvm_rdx_write(vcpu, data >> 32);
 	return kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_rdpmc);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_rdpmc);
 
 /*
  * Some IA32_ARCH_CAPABILITIES bits have dependencies on MSRs that KVM
@@ -1721,7 +1721,7 @@ bool kvm_valid_efer(struct kvm_vcpu *vcpu, u64 efer)
 
 	return __kvm_valid_efer(vcpu, efer);
 }
-EXPORT_SYMBOL_GPL(kvm_valid_efer);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_valid_efer);
 
 static int set_efer(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 {
@@ -1764,7 +1764,7 @@ void kvm_enable_efer_bits(u64 mask)
 {
        efer_reserved_bits &= ~mask;
 }
-EXPORT_SYMBOL_GPL(kvm_enable_efer_bits);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_enable_efer_bits);
 
 bool kvm_msr_allowed(struct kvm_vcpu *vcpu, u32 index, u32 type)
 {
@@ -1807,7 +1807,7 @@ bool kvm_msr_allowed(struct kvm_vcpu *vcpu, u32 index, u32 type)
 
 	return allowed;
 }
-EXPORT_SYMBOL_GPL(kvm_msr_allowed);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_msr_allowed);
 
 /*
  * Write @data into the MSR specified by @index.  Select MSR specific fault
@@ -1944,13 +1944,13 @@ int __kvm_emulate_msr_read(struct kvm_vcpu *vcpu, u32 index, u64 *data)
 {
 	return kvm_get_msr_ignored_check(vcpu, index, data, false);
 }
-EXPORT_SYMBOL_GPL(__kvm_emulate_msr_read);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(__kvm_emulate_msr_read);
 
 int __kvm_emulate_msr_write(struct kvm_vcpu *vcpu, u32 index, u64 data)
 {
 	return kvm_set_msr_ignored_check(vcpu, index, data, false);
 }
-EXPORT_SYMBOL_GPL(__kvm_emulate_msr_write);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(__kvm_emulate_msr_write);
 
 int kvm_emulate_msr_read(struct kvm_vcpu *vcpu, u32 index, u64 *data)
 {
@@ -1959,7 +1959,7 @@ int kvm_emulate_msr_read(struct kvm_vcpu *vcpu, u32 index, u64 *data)
 
 	return __kvm_emulate_msr_read(vcpu, index, data);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_msr_read);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_msr_read);
 
 int kvm_emulate_msr_write(struct kvm_vcpu *vcpu, u32 index, u64 data)
 {
@@ -1968,7 +1968,7 @@ int kvm_emulate_msr_write(struct kvm_vcpu *vcpu, u32 index, u64 data)
 
 	return __kvm_emulate_msr_write(vcpu, index, data);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_msr_write);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_msr_write);
 
 
 static void complete_userspace_rdmsr(struct kvm_vcpu *vcpu)
@@ -2077,7 +2077,7 @@ int kvm_emulate_rdmsr(struct kvm_vcpu *vcpu)
 	return __kvm_emulate_rdmsr(vcpu, kvm_rcx_read(vcpu), -1,
 				   complete_fast_rdmsr);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_rdmsr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_rdmsr);
 
 int kvm_emulate_rdmsr_imm(struct kvm_vcpu *vcpu, u32 msr, int reg)
 {
@@ -2085,7 +2085,7 @@ int kvm_emulate_rdmsr_imm(struct kvm_vcpu *vcpu, u32 msr, int reg)
 
 	return __kvm_emulate_rdmsr(vcpu, msr, reg, complete_fast_rdmsr_imm);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_rdmsr_imm);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_rdmsr_imm);
 
 static int __kvm_emulate_wrmsr(struct kvm_vcpu *vcpu, u32 msr, u64 data)
 {
@@ -2113,13 +2113,13 @@ int kvm_emulate_wrmsr(struct kvm_vcpu *vcpu)
 	return __kvm_emulate_wrmsr(vcpu, kvm_rcx_read(vcpu),
 				   kvm_read_edx_eax(vcpu));
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_wrmsr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_wrmsr);
 
 int kvm_emulate_wrmsr_imm(struct kvm_vcpu *vcpu, u32 msr, int reg)
 {
 	return __kvm_emulate_wrmsr(vcpu, msr, kvm_register_read(vcpu, reg));
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_wrmsr_imm);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_wrmsr_imm);
 
 int kvm_emulate_as_nop(struct kvm_vcpu *vcpu)
 {
@@ -2131,7 +2131,7 @@ int kvm_emulate_invd(struct kvm_vcpu *vcpu)
 	/* Treat an INVD instruction as a NOP and just skip it. */
 	return kvm_emulate_as_nop(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_invd);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_invd);
 
 fastpath_t handle_fastpath_invd(struct kvm_vcpu *vcpu)
 {
@@ -2140,14 +2140,14 @@ fastpath_t handle_fastpath_invd(struct kvm_vcpu *vcpu)
 
 	return EXIT_FASTPATH_REENTER_GUEST;
 }
-EXPORT_SYMBOL_GPL(handle_fastpath_invd);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(handle_fastpath_invd);
 
 int kvm_handle_invalid_op(struct kvm_vcpu *vcpu)
 {
 	kvm_queue_exception(vcpu, UD_VECTOR);
 	return 1;
 }
-EXPORT_SYMBOL_GPL(kvm_handle_invalid_op);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_handle_invalid_op);
 
 
 static int kvm_emulate_monitor_mwait(struct kvm_vcpu *vcpu, const char *insn)
@@ -2173,13 +2173,13 @@ int kvm_emulate_mwait(struct kvm_vcpu *vcpu)
 {
 	return kvm_emulate_monitor_mwait(vcpu, "MWAIT");
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_mwait);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_mwait);
 
 int kvm_emulate_monitor(struct kvm_vcpu *vcpu)
 {
 	return kvm_emulate_monitor_mwait(vcpu, "MONITOR");
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_monitor);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_monitor);
 
 static inline bool kvm_vcpu_exit_request(struct kvm_vcpu *vcpu)
 {
@@ -2217,13 +2217,13 @@ fastpath_t handle_fastpath_wrmsr(struct kvm_vcpu *vcpu)
 	return __handle_fastpath_wrmsr(vcpu, kvm_rcx_read(vcpu),
 				       kvm_read_edx_eax(vcpu));
 }
-EXPORT_SYMBOL_GPL(handle_fastpath_wrmsr);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(handle_fastpath_wrmsr);
 
 fastpath_t handle_fastpath_wrmsr_imm(struct kvm_vcpu *vcpu, u32 msr, int reg)
 {
 	return __handle_fastpath_wrmsr(vcpu, msr, kvm_register_read(vcpu, reg));
 }
-EXPORT_SYMBOL_GPL(handle_fastpath_wrmsr_imm);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(handle_fastpath_wrmsr_imm);
 
 /*
  * Adapt set_msr() to msr_io()'s calling convention
@@ -2589,7 +2589,7 @@ u64 kvm_read_l1_tsc(struct kvm_vcpu *vcpu, u64 host_tsc)
 	return vcpu->arch.l1_tsc_offset +
 		kvm_scale_tsc(host_tsc, vcpu->arch.l1_tsc_scaling_ratio);
 }
-EXPORT_SYMBOL_GPL(kvm_read_l1_tsc);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_read_l1_tsc);
 
 u64 kvm_calc_nested_tsc_offset(u64 l1_offset, u64 l2_offset, u64 l2_multiplier)
 {
@@ -2604,7 +2604,7 @@ u64 kvm_calc_nested_tsc_offset(u64 l1_offset, u64 l2_offset, u64 l2_multiplier)
 	nested_offset += l2_offset;
 	return nested_offset;
 }
-EXPORT_SYMBOL_GPL(kvm_calc_nested_tsc_offset);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_calc_nested_tsc_offset);
 
 u64 kvm_calc_nested_tsc_multiplier(u64 l1_multiplier, u64 l2_multiplier)
 {
@@ -2614,7 +2614,7 @@ u64 kvm_calc_nested_tsc_multiplier(u64 l1_multiplier, u64 l2_multiplier)
 
 	return l1_multiplier;
 }
-EXPORT_SYMBOL_GPL(kvm_calc_nested_tsc_multiplier);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_calc_nested_tsc_multiplier);
 
 static void kvm_vcpu_write_tsc_offset(struct kvm_vcpu *vcpu, u64 l1_offset)
 {
@@ -3692,7 +3692,7 @@ void kvm_service_local_tlb_flush_requests(struct kvm_vcpu *vcpu)
 	if (kvm_check_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu))
 		kvm_vcpu_flush_tlb_guest(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_service_local_tlb_flush_requests);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_service_local_tlb_flush_requests);
 
 static void record_steal_time(struct kvm_vcpu *vcpu)
 {
@@ -4184,7 +4184,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_set_msr_common);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_msr_common);
 
 static int get_msr_mce(struct kvm_vcpu *vcpu, u32 msr, u64 *pdata, bool host)
 {
@@ -4533,7 +4533,7 @@ int kvm_get_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_get_msr_common);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_msr_common);
 
 /*
  * Read or write a bunch of msrs. All parameters are kernel addresses.
@@ -7521,7 +7521,7 @@ gpa_t kvm_mmu_gva_to_gpa_read(struct kvm_vcpu *vcpu, gva_t gva,
 	u64 access = (kvm_x86_call(get_cpl)(vcpu) == 3) ? PFERR_USER_MASK : 0;
 	return mmu->gva_to_gpa(vcpu, mmu, gva, access, exception);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_gva_to_gpa_read);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_gva_to_gpa_read);
 
 gpa_t kvm_mmu_gva_to_gpa_write(struct kvm_vcpu *vcpu, gva_t gva,
 			       struct x86_exception *exception)
@@ -7532,7 +7532,7 @@ gpa_t kvm_mmu_gva_to_gpa_write(struct kvm_vcpu *vcpu, gva_t gva,
 	access |= PFERR_WRITE_MASK;
 	return mmu->gva_to_gpa(vcpu, mmu, gva, access, exception);
 }
-EXPORT_SYMBOL_GPL(kvm_mmu_gva_to_gpa_write);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_gva_to_gpa_write);
 
 /* uses this to access any guest's mapped memory without checking CPL */
 gpa_t kvm_mmu_gva_to_gpa_system(struct kvm_vcpu *vcpu, gva_t gva,
@@ -7618,7 +7618,7 @@ int kvm_read_guest_virt(struct kvm_vcpu *vcpu,
 	return kvm_read_guest_virt_helper(addr, val, bytes, vcpu, access,
 					  exception);
 }
-EXPORT_SYMBOL_GPL(kvm_read_guest_virt);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_read_guest_virt);
 
 static int emulator_read_std(struct x86_emulate_ctxt *ctxt,
 			     gva_t addr, void *val, unsigned int bytes,
@@ -7690,7 +7690,7 @@ int kvm_write_guest_virt_system(struct kvm_vcpu *vcpu, gva_t addr, void *val,
 	return kvm_write_guest_virt_helper(addr, val, bytes, vcpu,
 					   PFERR_WRITE_MASK, exception);
 }
-EXPORT_SYMBOL_GPL(kvm_write_guest_virt_system);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_write_guest_virt_system);
 
 static int kvm_check_emulate_insn(struct kvm_vcpu *vcpu, int emul_type,
 				  void *insn, int insn_len)
@@ -7724,7 +7724,7 @@ int handle_ud(struct kvm_vcpu *vcpu)
 
 	return kvm_emulate_instruction(vcpu, emul_type);
 }
-EXPORT_SYMBOL_GPL(handle_ud);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(handle_ud);
 
 static int vcpu_is_mmio_gpa(struct kvm_vcpu *vcpu, unsigned long gva,
 			    gpa_t gpa, bool write)
@@ -8203,7 +8203,7 @@ int kvm_emulate_wbinvd(struct kvm_vcpu *vcpu)
 	kvm_emulate_wbinvd_noskip(vcpu);
 	return kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_wbinvd);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_wbinvd);
 
 
 
@@ -8692,7 +8692,7 @@ void kvm_inject_realmode_interrupt(struct kvm_vcpu *vcpu, int irq, int inc_eip)
 		kvm_set_rflags(vcpu, ctxt->eflags);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_inject_realmode_interrupt);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_inject_realmode_interrupt);
 
 static void prepare_emulation_failure_exit(struct kvm_vcpu *vcpu, u64 *data,
 					   u8 ndata, u8 *insn_bytes, u8 insn_size)
@@ -8757,13 +8757,13 @@ void __kvm_prepare_emulation_failure_exit(struct kvm_vcpu *vcpu, u64 *data,
 {
 	prepare_emulation_failure_exit(vcpu, data, ndata, NULL, 0);
 }
-EXPORT_SYMBOL_GPL(__kvm_prepare_emulation_failure_exit);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(__kvm_prepare_emulation_failure_exit);
 
 void kvm_prepare_emulation_failure_exit(struct kvm_vcpu *vcpu)
 {
 	__kvm_prepare_emulation_failure_exit(vcpu, NULL, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_prepare_emulation_failure_exit);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_prepare_emulation_failure_exit);
 
 void kvm_prepare_event_vectoring_exit(struct kvm_vcpu *vcpu, gpa_t gpa)
 {
@@ -8785,7 +8785,7 @@ void kvm_prepare_event_vectoring_exit(struct kvm_vcpu *vcpu, gpa_t gpa)
 	run->internal.suberror = KVM_INTERNAL_ERROR_DELIVERY_EV;
 	run->internal.ndata = ndata;
 }
-EXPORT_SYMBOL_GPL(kvm_prepare_event_vectoring_exit);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_prepare_event_vectoring_exit);
 
 static int handle_emulation_failure(struct kvm_vcpu *vcpu, int emulation_type)
 {
@@ -8909,7 +8909,7 @@ int kvm_skip_emulated_instruction(struct kvm_vcpu *vcpu)
 		r = kvm_vcpu_do_singlestep(vcpu);
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvm_skip_emulated_instruction);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_skip_emulated_instruction);
 
 static bool kvm_is_code_breakpoint_inhibited(struct kvm_vcpu *vcpu)
 {
@@ -9040,7 +9040,7 @@ int x86_decode_emulated_instruction(struct kvm_vcpu *vcpu, int emulation_type,
 
 	return r;
 }
-EXPORT_SYMBOL_GPL(x86_decode_emulated_instruction);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(x86_decode_emulated_instruction);
 
 int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 			    int emulation_type, void *insn, int insn_len)
@@ -9264,14 +9264,14 @@ int kvm_emulate_instruction(struct kvm_vcpu *vcpu, int emulation_type)
 {
 	return x86_emulate_instruction(vcpu, 0, emulation_type, NULL, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_instruction);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_instruction);
 
 int kvm_emulate_instruction_from_buffer(struct kvm_vcpu *vcpu,
 					void *insn, int insn_len)
 {
 	return x86_emulate_instruction(vcpu, 0, 0, insn, insn_len);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_instruction_from_buffer);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_instruction_from_buffer);
 
 static int complete_fast_pio_out_port_0x7e(struct kvm_vcpu *vcpu)
 {
@@ -9366,7 +9366,7 @@ int kvm_fast_pio(struct kvm_vcpu *vcpu, int size, unsigned short port, int in)
 		ret = kvm_fast_pio_out(vcpu, size, port);
 	return ret && kvm_skip_emulated_instruction(vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_fast_pio);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_fast_pio);
 
 static int kvmclock_cpu_down_prep(unsigned int cpu)
 {
@@ -9798,7 +9798,7 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	kmem_cache_destroy(x86_emulator_cache);
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvm_x86_vendor_init);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_x86_vendor_init);
 
 void kvm_x86_vendor_exit(void)
 {
@@ -9832,7 +9832,7 @@ void kvm_x86_vendor_exit(void)
 	kvm_x86_ops.enable_virtualization_cpu = NULL;
 	mutex_unlock(&vendor_module_lock);
 }
-EXPORT_SYMBOL_GPL(kvm_x86_vendor_exit);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_x86_vendor_exit);
 
 #ifdef CONFIG_X86_64
 static int kvm_pv_clock_pairing(struct kvm_vcpu *vcpu, gpa_t paddr,
@@ -9896,7 +9896,7 @@ bool kvm_apicv_activated(struct kvm *kvm)
 {
 	return (READ_ONCE(kvm->arch.apicv_inhibit_reasons) == 0);
 }
-EXPORT_SYMBOL_GPL(kvm_apicv_activated);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apicv_activated);
 
 bool kvm_vcpu_apicv_activated(struct kvm_vcpu *vcpu)
 {
@@ -9906,7 +9906,7 @@ bool kvm_vcpu_apicv_activated(struct kvm_vcpu *vcpu)
 
 	return (vm_reasons | vcpu_reasons) == 0;
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_apicv_activated);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_apicv_activated);
 
 static void set_or_clear_apicv_inhibit(unsigned long *inhibits,
 				       enum kvm_apicv_inhibit reason, bool set)
@@ -10082,7 +10082,7 @@ int ____kvm_emulate_hypercall(struct kvm_vcpu *vcpu, int cpl,
 	vcpu->run->hypercall.ret = ret;
 	return 1;
 }
-EXPORT_SYMBOL_GPL(____kvm_emulate_hypercall);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(____kvm_emulate_hypercall);
 
 int kvm_emulate_hypercall(struct kvm_vcpu *vcpu)
 {
@@ -10095,7 +10095,7 @@ int kvm_emulate_hypercall(struct kvm_vcpu *vcpu)
 	return __kvm_emulate_hypercall(vcpu, kvm_x86_call(get_cpl)(vcpu),
 				       complete_hypercall_exit);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_hypercall);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_hypercall);
 
 static int emulator_fix_hypercall(struct x86_emulate_ctxt *ctxt)
 {
@@ -10538,7 +10538,7 @@ void __kvm_vcpu_update_apicv(struct kvm_vcpu *vcpu)
 	preempt_enable();
 	up_read(&vcpu->kvm->arch.apicv_update_lock);
 }
-EXPORT_SYMBOL_GPL(__kvm_vcpu_update_apicv);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(__kvm_vcpu_update_apicv);
 
 static void kvm_vcpu_update_apicv(struct kvm_vcpu *vcpu)
 {
@@ -10614,7 +10614,7 @@ void kvm_set_or_clear_apicv_inhibit(struct kvm *kvm,
 	__kvm_set_or_clear_apicv_inhibit(kvm, reason, set);
 	up_write(&kvm->arch.apicv_update_lock);
 }
-EXPORT_SYMBOL_GPL(kvm_set_or_clear_apicv_inhibit);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_or_clear_apicv_inhibit);
 
 static void vcpu_scan_ioapic(struct kvm_vcpu *vcpu)
 {
@@ -11159,7 +11159,7 @@ bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 
 	return false;
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_has_events);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_has_events);
 
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 {
@@ -11312,7 +11312,7 @@ int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu)
 {
 	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_halt_noskip);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_halt_noskip);
 
 int kvm_emulate_halt(struct kvm_vcpu *vcpu)
 {
@@ -11323,7 +11323,7 @@ int kvm_emulate_halt(struct kvm_vcpu *vcpu)
 	 */
 	return kvm_emulate_halt_noskip(vcpu) && ret;
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_halt);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_halt);
 
 fastpath_t handle_fastpath_hlt(struct kvm_vcpu *vcpu)
 {
@@ -11335,7 +11335,7 @@ fastpath_t handle_fastpath_hlt(struct kvm_vcpu *vcpu)
 
 	return EXIT_FASTPATH_EXIT_HANDLED;
 }
-EXPORT_SYMBOL_GPL(handle_fastpath_hlt);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(handle_fastpath_hlt);
 
 int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu)
 {
@@ -11344,7 +11344,7 @@ int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu)
 	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD,
 					KVM_EXIT_AP_RESET_HOLD) && ret;
 }
-EXPORT_SYMBOL_GPL(kvm_emulate_ap_reset_hold);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_ap_reset_hold);
 
 bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu)
 {
@@ -11876,7 +11876,7 @@ int kvm_task_switch(struct kvm_vcpu *vcpu, u16 tss_selector, int idt_index,
 	kvm_set_rflags(vcpu, ctxt->eflags);
 	return 1;
 }
-EXPORT_SYMBOL_GPL(kvm_task_switch);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_task_switch);
 
 static bool kvm_is_valid_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
 {
@@ -12576,7 +12576,7 @@ void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
 	if (init_event)
 		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_reset);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_reset);
 
 void kvm_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, u8 vector)
 {
@@ -12588,7 +12588,7 @@ void kvm_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, u8 vector)
 	kvm_set_segment(vcpu, &cs, VCPU_SREG_CS);
 	kvm_rip_write(vcpu, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_deliver_sipi_vector);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_deliver_sipi_vector);
 
 void kvm_arch_enable_virtualization(void)
 {
@@ -12706,7 +12706,7 @@ bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
 {
 	return vcpu->kvm->arch.bsp_vcpu_id == vcpu->vcpu_id;
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_is_reset_bsp);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_is_reset_bsp);
 
 bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu)
 {
@@ -12870,7 +12870,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 
 	return (void __user *)hva;
 }
-EXPORT_SYMBOL_GPL(__x86_set_memory_region);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(__x86_set_memory_region);
 
 void kvm_arch_pre_destroy_vm(struct kvm *kvm)
 {
@@ -13278,13 +13278,13 @@ unsigned long kvm_get_linear_rip(struct kvm_vcpu *vcpu)
 	return (u32)(get_segment_base(vcpu, VCPU_SREG_CS) +
 		     kvm_rip_read(vcpu));
 }
-EXPORT_SYMBOL_GPL(kvm_get_linear_rip);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_linear_rip);
 
 bool kvm_is_linear_rip(struct kvm_vcpu *vcpu, unsigned long linear_rip)
 {
 	return kvm_get_linear_rip(vcpu) == linear_rip;
 }
-EXPORT_SYMBOL_GPL(kvm_is_linear_rip);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_is_linear_rip);
 
 unsigned long kvm_get_rflags(struct kvm_vcpu *vcpu)
 {
@@ -13295,7 +13295,7 @@ unsigned long kvm_get_rflags(struct kvm_vcpu *vcpu)
 		rflags &= ~X86_EFLAGS_TF;
 	return rflags;
 }
-EXPORT_SYMBOL_GPL(kvm_get_rflags);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_rflags);
 
 static void __kvm_set_rflags(struct kvm_vcpu *vcpu, unsigned long rflags)
 {
@@ -13310,7 +13310,7 @@ void kvm_set_rflags(struct kvm_vcpu *vcpu, unsigned long rflags)
 	__kvm_set_rflags(vcpu, rflags);
 	kvm_make_request(KVM_REQ_EVENT, vcpu);
 }
-EXPORT_SYMBOL_GPL(kvm_set_rflags);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_rflags);
 
 static inline u32 kvm_async_pf_hash_fn(gfn_t gfn)
 {
@@ -13553,7 +13553,7 @@ bool kvm_arch_has_noncoherent_dma(struct kvm *kvm)
 {
 	return atomic_read(&kvm->arch.noncoherent_dma_count);
 }
-EXPORT_SYMBOL_GPL(kvm_arch_has_noncoherent_dma);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_arch_has_noncoherent_dma);
 
 bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 {
@@ -13609,7 +13609,7 @@ int kvm_spec_ctrl_test_value(u64 value)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(kvm_spec_ctrl_test_value);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_spec_ctrl_test_value);
 
 void kvm_fixup_and_inject_pf_error(struct kvm_vcpu *vcpu, gva_t gva, u16 error_code)
 {
@@ -13634,7 +13634,7 @@ void kvm_fixup_and_inject_pf_error(struct kvm_vcpu *vcpu, gva_t gva, u16 error_c
 	}
 	vcpu->arch.walk_mmu->inject_page_fault(vcpu, &fault);
 }
-EXPORT_SYMBOL_GPL(kvm_fixup_and_inject_pf_error);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_fixup_and_inject_pf_error);
 
 /*
  * Handles kvm_read/write_guest_virt*() result and either injects #PF or returns
@@ -13663,7 +13663,7 @@ int kvm_handle_memory_failure(struct kvm_vcpu *vcpu, int r,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_handle_memory_failure);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_handle_memory_failure);
 
 int kvm_handle_invpcid(struct kvm_vcpu *vcpu, unsigned long type, gva_t gva)
 {
@@ -13727,7 +13727,7 @@ int kvm_handle_invpcid(struct kvm_vcpu *vcpu, unsigned long type, gva_t gva)
 		return 1;
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_handle_invpcid);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_handle_invpcid);
 
 static int complete_sev_es_emulated_mmio(struct kvm_vcpu *vcpu)
 {
@@ -13812,7 +13812,7 @@ int kvm_sev_es_mmio_write(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_sev_es_mmio_write);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_sev_es_mmio_write);
 
 int kvm_sev_es_mmio_read(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 			 void *data)
@@ -13850,7 +13850,7 @@ int kvm_sev_es_mmio_read(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvm_sev_es_mmio_read);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_sev_es_mmio_read);
 
 static void advance_sev_es_emulated_pio(struct kvm_vcpu *vcpu, unsigned count, int size)
 {
@@ -13938,7 +13938,7 @@ int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
 	return in ? kvm_sev_es_ins(vcpu, size, port)
 		  : kvm_sev_es_outs(vcpu, size, port);
 }
-EXPORT_SYMBOL_GPL(kvm_sev_es_string_io);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_sev_es_string_io);
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_entry);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_exit);
-- 
2.51.0.470.ga7dc726c21-goog


