Return-Path: <linuxppc-dev+bounces-13173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE124BFDC91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 20:13:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csHMY3Mslz30hP;
	Thu, 23 Oct 2025 05:12:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761156777;
	cv=none; b=RO22molpT87gWEILX4VVvshym0z4CO63x7LGuboZNWDWvm5rOmlxbOC/7vcvIM22wYJ83X0hGYMuMOOr69NYhHTHTYsfa7744tRSt3oDqfN+mKGcwCeec9yJGUFl+qAjrmZzDcR+4VVRYs3xPB5i6UJ9xunjqV6jLuy0VGmV6P79cSv2SKwiKJe3OtGC8I5JHlnS8J8u98ljCoi/pX1mWIuooxQ1MbVRdBFY8d+Pl1BqT2uRRc378dnBOulLhzKWLDBmWpkpSLIJ6slH2258wDfc3yVqzENNSXZmzNFxeTgdDpCThSoOzGFyZZv+vojdkq4kSEeDkGdNduW7kJw+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761156777; c=relaxed/relaxed;
	bh=V5F7t24lC7jgleOK3FW+MwSMdfYKm48DJa8i0z/06to=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eegeDNXSw26GobXXd1aco2Urdxkk69ycxnX2UdiPpuxaNQbXVizGAxb5vaDOsgdDgxSPglIlU8XmBF9hUP6WuBHA/rVkLgN6XCj1iIhbl1R2cNk3X9O1SJel2tM8ymRqhvSFGMSsLN3RR0AqDBJLpO2PTbhlkev6VjSpcAfy4LefduHyQ2RXjVrJf1PabSIq0EVfqL55NRzbgzL9Ru5jY3KrgmwlHqgEVJ9TAqSFAYPlfl8XSPU7BJN6zgCkG/mHVtGEvvrg1WXbB9V9HXlnhOwqeUcsd/YYaAosTTiL/XDrqWGavzwtkamc0gupu0EIUf6KqvsqWTLBuID1UMCWSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SBLa3piU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ob75aaykdbe9vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SBLa3piU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ob75aaykdbe9vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csHMW4hD3z2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 05:12:54 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33428befc08so4004373a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 11:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761156772; x=1761761572; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V5F7t24lC7jgleOK3FW+MwSMdfYKm48DJa8i0z/06to=;
        b=SBLa3piUIzxz+jSBIj6/Xs8njdsm0KtggYPJ1WNATzIwidMZlQZtq6JrqsRUxpx1NG
         p6pYMTUom8BLMjC0AAw6BQzEY4QK4sDznUFfwXrKcZmpvxeGMWHx1cbrderU/bntmhCB
         rTrD/OhF7jv5h7jd4AJvOimX6HkkH+RDvM6Sq6QaZYqhvQ3Kk6UJWGz4Cs1HCQ1AJJ5a
         d1CMqBdindq63nYfTSZLe5heqTbce7LgsoinpQsKzNpxaSPqCDoL98pwQwUwE+w9slEO
         QdiEpgzGfqrxXWrWldzUmKNMCS60ztNndkefLo697/5UVol9WiZITJc5MYuWigtZPjNE
         itaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761156772; x=1761761572;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5F7t24lC7jgleOK3FW+MwSMdfYKm48DJa8i0z/06to=;
        b=WOMwFBi3rM+N3mB0gxs9j1a2f6tZMyxMn68YQ6hWXsNT6O4fzIWgKhcfPf5N8MYOmB
         L0aHZfooxv7VoIvkRIHURBiVenyg/g5oULfUupwEvqn+uHZjqufEDJRDHCqAJ1hAVmwC
         bRvDKUfupn5qjtPJXXygUgnmWEWW997w6BSPeMJgXmfkSymedM22mn4qLJEpRXgENdSd
         N/kIghujdu+5ApTdwHpj1XfqpQgYx8uh8t/T/9bHyKA7E+UQQtAA6TSq8jSBd8ztYQwQ
         SM5u04GJx/ob1KuyRP533Y4H8xjEypRCGHAOn6z74NdLwyGkz+deio4yXUZdaYAEFw+s
         dQMg==
X-Forwarded-Encrypted: i=1; AJvYcCWp7IZbGdtk4o8lwhunZ7IETFDNSzNlMQHc2P2ef4xq3mlokfb/SO3JM1rLHeAwS23mDNhOPzSzMKZAzV0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuQxz6PoW9bbjMCjghSYIVN+1opGSFuUuxodHbGdBQsTy2HClg
	jbaQtTV52IFIn4Wn6VGGhtdVc7TDDX17vPVqpIy91moFtu7YWkJcm0N04+5TZL2jY2tsK3oybcF
	m3nhFBw==
X-Google-Smtp-Source: AGHT+IFAZr0wpbGx7b8wp6kFow05WwkzX+gl9q/tJGKoWGxIdF2WxHsL5OqcbuH+85tLuHrz8145UQS6wJM=
X-Received: from pjbnm19.prod.google.com ([2002:a17:90b:19d3:b0:33d:cdb9:9adf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f8d:b0:33b:be31:8193
 with SMTP id 98e67ed59e1d1-33bcf85d59dmr30647063a91.6.1761156768896; Wed, 22
 Oct 2025 11:12:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:12:47 -0700
In-Reply-To: <aPiQYBoDlUmrQxEw@yzhao56-desk.sh.intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-5-seanjc@google.com>
 <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com> <aPe2pDYSpVFxDRWv@google.com> <aPiQYBoDlUmrQxEw@yzhao56-desk.sh.intel.com>
Message-ID: <aPken0s-0MfdSd5o@google.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 22, 2025, Yan Zhao wrote:
> On Tue, Oct 21, 2025 at 09:36:52AM -0700, Sean Christopherson wrote:
> > On Tue, Oct 21, 2025, Yan Zhao wrote:
> > > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > index 18d69d48bc55..ba5cca825a7f 100644
> > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > > @@ -5014,6 +5014,65 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> > > >  	return min(range->size, end - range->gpa);
> > > >  }
> > > >  
> > > > +int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> > > > +{
> > > > +	struct kvm_page_fault fault = {
> > > > +		.addr = gfn_to_gpa(gfn),
> > > > +		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
> > > > +		.prefetch = true,
> > > > +		.is_tdp = true,
> > > > +		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
> > > > +
> > > > +		.max_level = PG_LEVEL_4K,
> > > > +		.req_level = PG_LEVEL_4K,
> > > > +		.goal_level = PG_LEVEL_4K,
> > > > +		.is_private = true,
> > > > +
> > > > +		.gfn = gfn,
> > > > +		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
> > > > +		.pfn = pfn,
> > > > +		.map_writable = true,
> > > > +	};
> > > > +	struct kvm *kvm = vcpu->kvm;
> > > > +	int r;
> > > > +
> > > > +	lockdep_assert_held(&kvm->slots_lock);
> > > Do we need to assert that filemap_invalidate_lock() is held as well?
> > 
> > Hrm, a lockdep assertion would be nice to have, but it's obviously not strictly
> > necessary, and I'm not sure it's worth the cost.  To safely assert, KVM would need
> Not sure. Maybe just add a comment?
> But even with kvm_assert_gmem_invalidate_lock_held() and
> lockdep_assert_held(&kvm->slots_lock), it seems that
> kvm_tdp_mmu_map_private_pfn() still can't guarantee that the pfn is not stale.

At some point we have to assume correctness.  E.g. one could also argue that
holding every locking in the universe still doesn't ensure the pfn is fresh,
because theoretically guest_memfd could violate the locking scheme.

Aha!  And to further harden and document this code, this API can be gated on
CONFIG_KVM_GUEST_MEMFD=y, as pointed out by the amazing-as-always test bot:

https://lore.kernel.org/all/202510221928.ikBXHGCf-lkp@intel.com

We could go a step further and gate it on CONFIG_KVM_INTEL_TDX=y, but I don't
like that idea as I think it'd would be a net negative in terms of documenation,
compared to checking CONFIG_KVM_GUEST_MEMFD.  And in general I don't want to set
a precedent of ifdef-ing common x86 based on what vendor code _currently_ needs
an API.

> e.g., if hypothetically those locks were released and re-acquired after getting
> the pfn.
> 
> > to first assert that the file refcount is elevated, e.g. to guard against
> > guest_memfd _really_ screwing up and not grabbing a reference to the underlying
> > file.
> > 
> > E.g. it'd have to be something like this:
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 94d7f32a03b6..5d46b2ac0292 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -5014,6 +5014,18 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >         return min(range->size, end - range->gpa);
> >  }
> >  
> > +static void kvm_assert_gmem_invalidate_lock_held(struct kvm_memory_slot *slot)
> > +{
> > +#ifdef CONFIG_PROVE_LOCKING
> > +       if (WARN_ON_ONCE(!kvm_slot_has_gmem(slot)) ||
> > +           WARN_ON_ONCE(!slot->gmem.file) ||
> > +           WARN_ON_ONCE(!file_count(slot->gmem.file)))
> > +               return;
> > +
> > +       lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
> 	  lockdep_assert_held(&file_inode(slot->gmem.file)->i_mapping->invalidate_lock);
> > +#endif
> > +}
> > +
> >  int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> >  {
> >         struct kvm_page_fault fault = {
> > @@ -5038,6 +5050,8 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> >  
> >         lockdep_assert_held(&kvm->slots_lock);
> >  
> > +       kvm_assert_gmem_invalidate_lock_held(fault.slot);
> > +
> >         if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
> >                 return -EIO;
> > --
> > 
> > Which I suppose isn't that terrible?
> Is it good if we test is_page_fault_stale()? e.g.,

No, because it can only get false positives, e.g. if an mmu_notifier invalidation
on shared, non-guest_memfd memory.  Though a sanity check would be nice to have;
I believe we can simply do:

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c5734ca5c17d..440fd8f80397 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1273,6 +1273,8 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
        struct kvm_mmu_page *sp;
        int ret = RET_PF_RETRY;
 
+       KVM_MMU_WARN_ON(!root || root->role.invalid);
+
        kvm_mmu_hugepage_adjust(vcpu, fault);
 
        trace_kvm_mmu_spte_requested(fault);

