Return-Path: <linuxppc-dev+bounces-6443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C7A43163
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 00:56:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1yL75H0Dz30Vk;
	Tue, 25 Feb 2025 10:55:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740441359;
	cv=none; b=ZERPkbVO+sBL9lkQTrdVX8/HkFDw0Bp2M8FXTXZ6Jwug8dKwQXKZH3uJkau+CSWsHSaEemI0/ntTEa+AXQQ6s0aVlpcWELOvc4ZA46Qgbq+dPWEeWfx3DV3b8wg1dReXsKRjsdcpn6dy/lonN7Wagz34jGbFx1Vt7FHexRg9FRMkyV4756Cg4mHuk+MKZ3NKoR7tOjzZtR/hp1ntxJdIC0mc848UFOpw3NpOCTb0494qfdRQBN9KmeX/apEsoCwA4OpSiMOJsGw18rUqts/dQNTna/Fftvk31YQ0NzT/7nf8Cbx+HuD+SSz5PVP58B6GQqTE23FXorP/OLJR1Ife/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740441359; c=relaxed/relaxed;
	bh=N18ZDDRfnjFxKJiD7qnA09wciuUkX/DOLJoxqyHk2n8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WDFClp6N8fteHGdttvWBq2iOJ9kJ1JxsZlgwu4dq/DOu//6xhlYpWQZTN2OseYM9dp1zOeZtuuuxCC+XutbVTZng5vZNv9QXW9N0eEDwiJip6lMOcwDNaQjKndRC8WSjYCKSPWJ9O6t1SxB4mzNXwpOXB5prFxMwZVVWmoRBF7ds+3+IBua9RsCvHRaHBl6ix1/xR+017QBFfmm312qI1lgpEQYV6pGsOg9poN46LKGsVBmxT2QMVIy2fL/o5YLPOm/8a/BD60ibUJv0fwdbs3IevWnYIbeLQA8EHnCVJiGFMDdNo6WYH18hU3ns0gZA98K9YKCSeMh3Oen3pEj/NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kgzBUgXl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3dqe9zwykdfqe0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kgzBUgXl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3dqe9zwykdfqe0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1yL70SGjz30T6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 10:55:59 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso16612149a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 15:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441357; x=1741046157; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=N18ZDDRfnjFxKJiD7qnA09wciuUkX/DOLJoxqyHk2n8=;
        b=kgzBUgXlMHOH+vr6gz6kVFcu3eQeKVNq12/elkTXuCpckQabyVx+CboLXQqIyN2WsS
         QOR/DQpuAJG0WqWib1GS+qk1VtBmVIFhxznwOQovoKzufdKH+15JuydRdzSqcl9aFh7s
         mEIBiS4h2MgAufHezfGiGO6P+sTmHrrjk+VowAHSnC2E8ihXOGlfgMAEhSYapmOxEFW8
         TlVhgJM+gY2Q6MWO+8TBjZJAfbQu+xzDnsptEVz9ln3SChoIKdPEcUypQcyGJ7WIK7uQ
         5N52bZ17CK7HrN0LdLjZkJVzPCmbeeJvyBdxj8bbvhTSLD3Ucgrx5ZcJaJdbjm4i3Tl/
         liPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441357; x=1741046157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N18ZDDRfnjFxKJiD7qnA09wciuUkX/DOLJoxqyHk2n8=;
        b=qcbfDWjxXkz/4dmzAd5OJVLjSWR1PldgcvQiZ7i4ToWOK8Vq9tmouhD2jpVeIT8VtT
         IQn9RjGyBqu6Nc7U107qSNCFb0RMhRYHxjxZAUYhttJjIfM+LwKf0rHuDHl9XotWhmNN
         FwiyAtErvNrhOfHzt1beoEqHbinNREMrWDkF6La3yZpa4APs/uktXEkw3MYnqPK1Ct7K
         iZ2fG/uYKasdmvE49Q35kuvUpwBlFjlhKcd4Cb9sbHEq7kSpPGNms9vlSvgyN7Q33hLP
         ri17QTVd54xo49w/zaiEFCBkQiatxEd9gbE0IQiMbE9bGMeSlpsq7PD6hvwGHstXczGL
         k+rA==
X-Forwarded-Encrypted: i=1; AJvYcCVuGWFN0y3ZNvMLQhlgXKpS8ZYcKBDHLPMASgxLPADJmCy4z3OMRz4EmqhwqTVuEDvci3yhGdXK+maX5Fs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzrwr8xkZ2eONolowWjNinjVT0ceElKTpc6R5pBLuYB0MxOaEQh
	euwP0HrvKKHMEBXy5LzQVCqztBGbQhped8Lxnz7WBRGDkowENNyi4UiRArLvZk71leKImQ973kG
	TJQ==
X-Google-Smtp-Source: AGHT+IFBRvTh2AoRMsZzInrrN+gn6icsuEOKduQCozj1AYhvRpYSpNqeaxExZSkYlXTQzmgl2LLloh+gErw=
X-Received: from pjbpb10.prod.google.com ([2002:a17:90b:3c0a:b0:2fc:11a0:c54d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ec6:b0:2ee:70cb:a500
 with SMTP id 98e67ed59e1d1-2fce77a00c5mr23270511a91.1.1740441357604; Mon, 24
 Feb 2025 15:55:57 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Feb 2025 15:55:42 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
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
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-8-seanjc@google.com>
Subject: [PATCH 7/7] KVM: Drop kvm_arch_sync_events() now that all
 implementations are nops
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove kvm_arch_sync_events() now that x86 no longer uses it (no other
arch has ever used it).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h     | 2 --
 arch/loongarch/include/asm/kvm_host.h | 1 -
 arch/mips/include/asm/kvm_host.h      | 1 -
 arch/powerpc/include/asm/kvm_host.h   | 1 -
 arch/riscv/include/asm/kvm_host.h     | 2 --
 arch/s390/include/asm/kvm_host.h      | 1 -
 arch/x86/kvm/x86.c                    | 5 -----
 include/linux/kvm_host.h              | 1 -
 virt/kvm/kvm_main.c                   | 1 -
 9 files changed, 15 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..40897bd2b4a3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1346,8 +1346,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 	return cpus_have_final_cap(ARM64_SPECTRE_V3A);
 }
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-
 void kvm_init_host_debug_data(void);
 void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu);
 void kvm_vcpu_put_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 590982cd986e..ab5b7001e2ff 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -320,7 +320,6 @@ static inline bool kvm_is_ifetch_fault(struct kvm_vcpu_arch *arch)
 
 /* Misc */
 static inline void kvm_arch_hardware_unsetup(void) {}
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index f7222eb594ea..c14b10821817 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -886,7 +886,6 @@ extern unsigned long kvm_mips_get_ramsize(struct kvm *kvm);
 extern int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
 			     struct kvm_mips_interrupt *irq);
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 6e1108f8fce6..2d139c807577 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -902,7 +902,6 @@ struct kvm_vcpu_arch {
 #define __KVM_HAVE_ARCH_WQP
 #define __KVM_HAVE_CREATE_DEVICE
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index cc33e35cd628..0e9c2fab6378 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -301,8 +301,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
 	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
 }
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-
 #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
 
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index 9a367866cab0..424f899d8163 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -1056,7 +1056,6 @@ bool kvm_s390_pv_cpu_is_protected(struct kvm_vcpu *vcpu);
 extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
 extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ea445e6579f1..454fd6b8f3db 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12770,11 +12770,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	return ret;
 }
 
-void kvm_arch_sync_events(struct kvm *kvm)
-{
-
-}
-
 /**
  * __x86_set_memory_region: Setup KVM internal memory slot
  *
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c28a6aa1f2ed..5438a1b446a6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1747,7 +1747,6 @@ static inline void kvm_unregister_perf_callbacks(void) {}
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type);
 void kvm_arch_destroy_vm(struct kvm *kvm);
-void kvm_arch_sync_events(struct kvm *kvm);
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 991e8111e88b..55153494ac70 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1271,7 +1271,6 @@ static void kvm_destroy_vm(struct kvm *kvm)
 	kvm_destroy_pm_notifier(kvm);
 	kvm_uevent_notify_change(KVM_EVENT_DESTROY_VM, kvm);
 	kvm_destroy_vm_debugfs(kvm);
-	kvm_arch_sync_events(kvm);
 	mutex_lock(&kvm_lock);
 	list_del(&kvm->vm_list);
 	mutex_unlock(&kvm_lock);
-- 
2.48.1.658.g4767266eb4-goog


