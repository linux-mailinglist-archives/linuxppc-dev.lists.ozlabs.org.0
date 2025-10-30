Return-Path: <linuxppc-dev+bounces-13580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79814C22230
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:10:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFbD19RRz3dVR;
	Fri, 31 Oct 2025 07:10:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855016;
	cv=none; b=gIXgGNtjqPNBa5mJVVjTT5/qrEOG44nWMdu9o5MnuT5eN7IjY8lIorQSqNiQDTaL6UvlYBFAiFUXEE2Gz1nXNUGWG87n2eL0+JlEMXk6ffsCx9MQ6RE3mt6iX1Px+X9icVGKgkYVPPAfTjXz9ss06cQUx1xeor4K3H7ptXRONCPren72cNBooW8CuY3DKGLO3/5Rc62TtbYSCNwk1svw3JrsoQsEmqz6E1eeLhTvIbr5d8fhK/4NLOvbpgTo1iRMq/JyDQOg4Lz2D15B0NAj3zN6ZYf7v1JPef+WKlBovfq7U0iL+W/oOYtZljjQVh7pCDpFIm5AJI3p2LgKhewyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855016; c=relaxed/relaxed;
	bh=LWKZ6GH7M+zzFa/XrLh2XF2IHEzo52dgkoqprkhASvM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c+sS1eTXL76osOGAlnkT575hV6S06aJJimbcheifWQJHqHwflBZ0FQ6it97NZcNRCI2C+pkyKDJ2mEjXDT9ftwuQlB5Rh3hrWxrD407+x+YIOznt5UKqQaFAhdT2NbX+QFRHHzGfaIYUu3/bcOTFngR3wrNL261FNGTJXppo7DBapL4RlB53ME31PbS/EGpfQ/0Jn/TSTV1M25gpXUm+4vHln0zAe43ewtXoKBfs+skmQg70Bt26BYfS7jmwyL2Hq8sl7fJU5zjWSYSHlXMMiKJzmKyREwTE5ONPB02h2g+bmxQ0dZw+/HqfeqJoDQsJHqubnMsdnJ38IhW5Wk2jTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K7SPBZzO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3jcydaqykdba8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K7SPBZzO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3jcydaqykdba8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFbC2wl0z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:15 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-340299e05easo1358336a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855014; x=1762459814; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LWKZ6GH7M+zzFa/XrLh2XF2IHEzo52dgkoqprkhASvM=;
        b=K7SPBZzOOjRq2iTyTHhRx/z10n2iSuzDjwdzUcIId/zpgSDmZL8CkAiSzvzmUhw+Je
         MgwiB970ayjKU9qvHzd2hWlDJMYXsl/2QEg5XGYavNTFu1yim5wH1U9ph59Q/nRkMgoo
         Su6F5DtgB9QtiMMgCoVBx0aa4c/zYpJgUL/QXHlYjC0PSCqV3NnL6uR+Rsff62GPyfsp
         Zj0JNa5dmRIALDrIOH9hUKhCe+9WW+OPjXWnFjGAKv4foeG+G+rbeNkEUB3bhv6jg7rY
         4Qd9UbentDWYZgJBEu7u83+WFI8eR9hvka4ZUr0QeLZOYvdobEzJM3g4GbSPNSSNZ1gP
         o6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855014; x=1762459814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWKZ6GH7M+zzFa/XrLh2XF2IHEzo52dgkoqprkhASvM=;
        b=fI9GyyBILpW3PSYfjSQPB//lyto6wAZTReECoS2g7YLZ3WtnN67nCuUKpApNC/8oRF
         xYO06gJG8fRF4MpzfOYHsRTlcm2LNYyVhy/ddmTHJF5yydRLdFTa11pFDp+agOnbzYzK
         YC7h2PvNpjR7S7KuGjLEsD2OndVqkdhXOZ6reirU51PtqeMzRxV6N3/ZKZ2584xP2FIW
         MItLuLYStUO50Sm1zkeJ2stDhJsl5SRGEW3/rjXvl96eQhkJjVhTiEZc9+fJvvj/VyLo
         onEAGMDRTfb+9ilE1DadaZJCuQKHqKR1oC7gEgD+UcCnLs+Hj6dLOrnU0X3PGXJ6mVpt
         cbBg==
X-Forwarded-Encrypted: i=1; AJvYcCVwmYTKXzj55IVNFkrt6Jmj19AR9Klc8eTDxXdNkzCaXPBDFM/ZdOfoI0Yznl5qIWON/8NL1Zki5Wt+lPg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHAtD0+S5UshLD2Avy31X4+O+ddkXYj476o4pQuohNNOFEflAf
	u+OCOaZ/M/tAMFjli8K7eY/2sF04BB3PFtJVldyyedoQjc+P2DcTU4z6QBQp0i++d3YzR6bns3t
	ikccPWQ==
X-Google-Smtp-Source: AGHT+IG7uuixnfesLu6aOkm8lY1M0UiQHdZ1syGC1fH0ExXdaI9kZ+0pX4GRNJah3kEFWI4QtyuhY8kfLfE=
X-Received: from pjrx14.prod.google.com ([2002:a17:90a:bc8e:b0:332:7fae:e138])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:530d:b0:330:797a:f4ea
 with SMTP id 98e67ed59e1d1-3408308b46emr1245875a91.29.1761855013586; Thu, 30
 Oct 2025 13:10:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:29 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
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
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-7-seanjc@google.com>
Subject: [PATCH v4 06/28] Revert "KVM: x86/tdp_mmu: Add a helper function to
 walk down the TDP MMU"
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove the helper and exports that were added to allow TDX code to reuse
kvm_tdp_map_page() for its gmem post-populate flow now that a dedicated
TDP MMU API is provided to install a mapping given a gfn+pfn pair.

This reverts commit 2608f105760115e94a03efd9f12f8fbfd1f9af4b.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu.h         |  2 --
 arch/x86/kvm/mmu/mmu.c     |  4 ++--
 arch/x86/kvm/mmu/tdp_mmu.c | 37 +++++--------------------------------
 3 files changed, 7 insertions(+), 36 deletions(-)

diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 2f108e381959..9e5045a60d8b 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -257,8 +257,6 @@ extern bool tdp_mmu_enabled;
 #define tdp_mmu_enabled false
 #endif
 
-bool kvm_tdp_mmu_gpa_is_mapped(struct kvm_vcpu *vcpu, u64 gpa);
-int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level);
 int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn);
 
 static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index bad0480bdb0d..3a5104e4127a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4924,7 +4924,8 @@ int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	return direct_page_fault(vcpu, fault);
 }
 
-int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level)
+static int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code,
+			    u8 *level)
 {
 	int r;
 
@@ -4966,7 +4967,6 @@ int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level
 		return -EIO;
 	}
 }
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_map_page);
 
 long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range)
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 440fd8f80397..e735d2f8367b 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1941,13 +1941,16 @@ bool kvm_tdp_mmu_write_protect_gfn(struct kvm *kvm,
  *
  * Must be called between kvm_tdp_mmu_walk_lockless_{begin,end}.
  */
-static int __kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
-				  struct kvm_mmu_page *root)
+int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
+			 int *root_level)
 {
+	struct kvm_mmu_page *root = root_to_sp(vcpu->arch.mmu->root.hpa);
 	struct tdp_iter iter;
 	gfn_t gfn = addr >> PAGE_SHIFT;
 	int leaf = -1;
 
+	*root_level = vcpu->arch.mmu->root_role.level;
+
 	for_each_tdp_pte(iter, vcpu->kvm, root, gfn, gfn + 1) {
 		leaf = iter.level;
 		sptes[leaf] = iter.old_spte;
@@ -1956,36 +1959,6 @@ static int __kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
 	return leaf;
 }
 
-int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
-			 int *root_level)
-{
-	struct kvm_mmu_page *root = root_to_sp(vcpu->arch.mmu->root.hpa);
-	*root_level = vcpu->arch.mmu->root_role.level;
-
-	return __kvm_tdp_mmu_get_walk(vcpu, addr, sptes, root);
-}
-
-bool kvm_tdp_mmu_gpa_is_mapped(struct kvm_vcpu *vcpu, u64 gpa)
-{
-	struct kvm *kvm = vcpu->kvm;
-	bool is_direct = kvm_is_addr_direct(kvm, gpa);
-	hpa_t root = is_direct ? vcpu->arch.mmu->root.hpa :
-				 vcpu->arch.mmu->mirror_root_hpa;
-	u64 sptes[PT64_ROOT_MAX_LEVEL + 1], spte;
-	int leaf;
-
-	lockdep_assert_held(&kvm->mmu_lock);
-	rcu_read_lock();
-	leaf = __kvm_tdp_mmu_get_walk(vcpu, gpa, sptes, root_to_sp(root));
-	rcu_read_unlock();
-	if (leaf < 0)
-		return false;
-
-	spte = sptes[leaf];
-	return is_shadow_present_pte(spte) && is_last_spte(spte, leaf);
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_mmu_gpa_is_mapped);
-
 /*
  * Returns the last level spte pointer of the shadow page walk for the given
  * gpa, and sets *spte to the spte value. This spte may be non-preset. If no
-- 
2.51.1.930.gacf6e81ea2-goog


