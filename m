Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80B718A9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 21:57:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWg5v1qRzz3fDY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 05:57:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wWn3rVwK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::c; helo=out-12.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wWn3rVwK;
	dkim-atps=neutral
Received: from out-12.mta1.migadu.com (out-12.mta1.migadu.com [IPv6:2001:41d0:203:375::c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWg4m5mNjz3fCL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 05:56:24 +1000 (AEST)
Date: Wed, 31 May 2023 19:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685562972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aRNgNEUqm1SPBB6Tqx56M21rQPMX216mPdSexIMkYNE=;
	b=wWn3rVwKrW7Hyl01464BDLIeiVKkARMgI8cIpNCWnDBQRJiWn1oks6cGv+JrGGWfp67baR
	5exjC4xrR7EFkkZEm3pF0koPOiSqiH+yZY26vrG0hc6p3BjpnVNKiFrpA70KUIggolrzza
	hmyoQpoAADBmV1w9KnDt4SrGzgWi+c0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH mm-unstable v2 05/10] kvm/arm64: add
 kvm_arch_test_clear_young()
Message-ID: <ZHemUc3DiSbxQbxJ@linux.dev>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-6-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526234435.662652-6-yuzhao@google.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fab
 iano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yu,

On Fri, May 26, 2023 at 05:44:30PM -0600, Yu Zhao wrote:
> Implement kvm_arch_test_clear_young() to support the fast path in
> mmu_notifier_ops->test_clear_young().
> 
> It focuses on a simple case, i.e., hardware sets the accessed bit in
> KVM PTEs and VMs are not protected, where it can rely on RCU and
> cmpxchg to safely clear the accessed bit without taking
> kvm->mmu_lock. Complex cases fall back to the existing slow path
> where kvm->mmu_lock is then taken.
> 
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h |  6 ++++++
>  arch/arm64/kvm/mmu.c              | 36 +++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7e7e19ef6993..da32b0890716 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1113,4 +1113,10 @@ static inline void kvm_hyp_reserve(void) { }
>  void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
>  bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
>  
> +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> +static inline bool kvm_arch_has_test_clear_young(void)
> +{
> +	return cpu_has_hw_af() && !is_protected_kvm_enabled();
> +}

I would *strongly* suggest you consider supporting test_clear_young on
systems that do software Access Flag management. FEAT_HAFDBS is an
*optional* extension to the architecture, so we're going to support
software AF management for a very long time in KVM. It is also a valid
fallback option in the case of hardware errata which render HAFDBS
broken.

So, we should expect (and support) systems of all shapes and sizes that
do software AF. I'm sure we'll hear about more in the not-too-distant
future...

For future reference (even though I'm suggesting you support software
AF), decisions such of these need an extremely verbose comment
describing the rationale behind the decision.

> +
>  #endif /* __ARM64_KVM_HOST_H__ */
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c3b3e2afe26f..26a8d955b49c 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c

Please do not implement page table walkers outside of hyp/pgtable.c

> @@ -1678,6 +1678,42 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  					   range->start << PAGE_SHIFT);
>  }
>  
> +static int stage2_test_clear_young(const struct kvm_pgtable_visit_ctx *ctx,
> +				   enum kvm_pgtable_walk_flags flags)
> +{
> +	kvm_pte_t new = ctx->old & ~KVM_PTE_LEAF_ATTR_LO_S2_AF;
> +
> +	VM_WARN_ON_ONCE(!page_count(virt_to_page(ctx->ptep)));

This sort of sanity checking is a bit excessive. Isn't there a risk of
false negatives here too? IOW, if we tragically mess up RCU in the page
table code, what's stopping a prematurely freed page from being
allocated to another user?

> +	if (!kvm_pte_valid(new))
> +		return 0;
> +
> +	if (new == ctx->old)
> +		return 0;
> +
> +	if (kvm_should_clear_young(ctx->arg, ctx->addr / PAGE_SIZE))
> +		stage2_try_set_pte(ctx, new);
> +
> +	return 0;
> +}
> +
> +bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	u64 start = range->start * PAGE_SIZE;
> +	u64 end = range->end * PAGE_SIZE;
> +	struct kvm_pgtable_walker walker = {
> +		.cb	= stage2_test_clear_young,
> +		.arg	= range,
> +		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_SHARED,
> +	};
> +
> +	BUILD_BUG_ON(is_hyp_code());

Delete this assertion.

> +	kvm_pgtable_walk(kvm->arch.mmu.pgt, start, end - start, &walker);
> +
> +	return false;
> +}
> +
>  phys_addr_t kvm_mmu_get_httbr(void)
>  {
>  	return __pa(hyp_pgtable->pgd);
> -- 
> 2.41.0.rc0.172.g3f132b7071-goog
> 

-- 
Thanks,
Oliver
