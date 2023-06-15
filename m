Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA37320BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 22:13:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=cjOb0S9s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhtlc47tMz3bjK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 06:13:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=cjOb0S9s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::14a; helo=mail-il1-x14a.google.com; envelope-from=37felzaykdpmnzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qhtkh49dYz304M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 06:12:42 +1000 (AEST)
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-33d5df1a8ddso70506385ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686859960; x=1689451960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5j0wCZPnfsM4/SjEwwVDfexZdOw0uK6iqseA0HQUzE=;
        b=cjOb0S9sfN5Dm3Cf1WY0DkwbmA6R+QlgCw3vdPhkn8D0ezXT5ocJkx3HC19I1vu1xT
         ge8DNo1GSbuSM6caWCOC1J3GTrMuu8UArcX66Uy+mms0p9IDyFXCU7BhZ2eWpqMVJuik
         YxuIsRYFJFgIuLOJ/6jVfh/Mf4if3vCZBwuzCSoTeE61zrcYIR2GawPLt1BFwHuB/U/o
         72qRrwMuRJJZf3YFuArFwQ/KrRBbJzxOF8+G3A71eTB2dOnYpvg0oPYU5HyDVNeUr5ZA
         bf0lnz12kyav9MStqopIoj3feU6msQY6OVVexSRXEMsA4KhAqoEvw0Yz2ha7rsS8Az8I
         X3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686859960; x=1689451960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5j0wCZPnfsM4/SjEwwVDfexZdOw0uK6iqseA0HQUzE=;
        b=k8SrCigPqX9dCxE+xGTeUhMwi2Fe/ZctzrIxUXE1uH6g3GA6sXydAHqwg94mx6TS4+
         l/gLBaQ8+GjMqLsZ00BWbhKQt132jAqse6V9sXcDaPWcNY+LDwUdFajjwzaMf1FCu9S5
         JCSxlxFvbGOPv6D6RYyIas9XV+SetHON7ZFxvcV7V3SzNQpvB5Lyjy8PFtbwbfla+gPQ
         /hDeQh0b0wTyHPbB1DTWff4QRaZdSzR2ABlGmtmKEiWht01fWfia9+jsXk8WxCD6szfv
         1HCjoae5zTr368lsNyTe6BwbZiwTk7mz3jy5aclVmmEu9OHrI9LS9X+d24H85PU/1Cux
         h3Cg==
X-Gm-Message-State: AC+VfDyvSmEXAFLBP2SUWgsjORs3WBRznf0IQjPRqVCNvDbnxw0IL2Ck
	Kp1IYHxuBOXFBa80glVA5XzK0fWj63I=
X-Google-Smtp-Source: ACHHUZ4XblfvtELYfPfTXYv/mZguDzYqVYK+D/wTZAy9MdyrQSECLLlB+UmOM8NMKOmXv6Fwf6a/c1+W5jI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:a70f:b0:1b5:64:1862 with SMTP id
 w15-20020a170902a70f00b001b500641862mr893196plq.9.1686853612603; Thu, 15 Jun
 2023 11:26:52 -0700 (PDT)
Date: Thu, 15 Jun 2023 11:26:51 -0700
In-Reply-To: <20230526234435.662652-10-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-10-yuzhao@google.com>
Message-ID: <ZItX64Bbx5vdjo9M@google.com>
Subject: Re: [PATCH mm-unstable v2 09/10] kvm/x86: add kvm_arch_test_clear_young()
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 26, 2023, Yu Zhao wrote:
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 08340219c35a..6875a819e007 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1232,6 +1232,40 @@ bool kvm_tdp_mmu_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  	return kvm_tdp_mmu_handle_gfn(kvm, range, test_age_gfn);
>  }
>  
> +bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	struct kvm_mmu_page *root;
> +	int offset = ffs(shadow_accessed_mask) - 1;
> +
> +	if (kvm_shadow_root_allocated(kvm))

This needs a comment.

> +		return true;
> +
> +	rcu_read_lock();
> +
> +	list_for_each_entry_rcu(root, &kvm->arch.tdp_mmu_roots, link) {

As requested in v1[1], please add a macro for a lockless walk.

[1] https://lkml.kernel.org/r/Y%2Fed0XYAPx%2B7pukA%40google.com

> +		struct tdp_iter iter;
> +
> +		if (kvm_mmu_page_as_id(root) != range->slot->as_id)
> +			continue;
> +
> +		tdp_root_for_each_leaf_pte(iter, root, range->start, range->end) {
> +			u64 *sptep = rcu_dereference(iter.sptep);
> +
> +			VM_WARN_ON_ONCE(!page_count(virt_to_page(sptep)));

Hrm, I don't like adding this in KVM.  The primary MMU might guarantee that this
callback is invoked if and only if the SPTE is backed by struct page memory, but
there's no reason to assume that's true in KVM.  If we want the sanity check, then
this needs to use kvm_pfn_to_refcounted_page().

And it should use KVM's MMU_WARN_ON(), which is a mess and effectively dead code,
but I'm working on changing that[*], i.e. by the time this gets to Linus' tree,
the sanity check should have a much cleaner implementation.

[2] https://lore.kernel.org/all/20230511235917.639770-8-seanjc@google.com

> +
> +			if (!(iter.old_spte & shadow_accessed_mask))
> +				continue;
> +
> +			if (kvm_should_clear_young(range, iter.gfn))
> +				clear_bit(offset, (unsigned long *)sptep);

If/when you rebase on https://github.com/kvm-x86/linux/tree/next, can you pull
out the atomic bits of tdp_mmu_clear_spte_bits() and use that new helper? E.g.

diff --git a/arch/x86/kvm/mmu/tdp_iter.h b/arch/x86/kvm/mmu/tdp_iter.h
index fae559559a80..914c34518829 100644
--- a/arch/x86/kvm/mmu/tdp_iter.h
+++ b/arch/x86/kvm/mmu/tdp_iter.h
@@ -58,15 +58,18 @@ static inline u64 kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 old_spte,
        return old_spte;
 }
 
+static inline u64 tdp_mmu_clear_spte_bits_atomic(tdp_ptep_t sptep, u64 mask)
+{
+       atomic64_t *sptep_atomic = (atomic64_t *)rcu_dereference(sptep);
+
+       return (u64)atomic64_fetch_and(~mask, sptep_atomic);
+}
+
 static inline u64 tdp_mmu_clear_spte_bits(tdp_ptep_t sptep, u64 old_spte,
                                          u64 mask, int level)
 {
-       atomic64_t *sptep_atomic;
-
-       if (kvm_tdp_mmu_spte_need_atomic_write(old_spte, level)) {
-               sptep_atomic = (atomic64_t *)rcu_dereference(sptep);
-               return (u64)atomic64_fetch_and(~mask, sptep_atomic);
-       }
+       if (kvm_tdp_mmu_spte_need_atomic_write(old_spte, level))
+               return tdp_mmu_clear_spte_bits_atomic(sptep, mask);
 
        __kvm_tdp_mmu_write_spte(sptep, old_spte & ~mask);
        return old_spte;

