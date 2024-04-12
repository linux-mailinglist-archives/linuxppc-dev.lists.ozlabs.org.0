Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A4F8A2CBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 12:45:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q5wzc5tB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGCrB3WjNz3vY4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 20:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q5wzc5tB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGCqS2K3Gz3cLj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 20:44:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9470F6222E;
	Fri, 12 Apr 2024 10:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E150DC2BD10;
	Fri, 12 Apr 2024 10:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712918657;
	bh=1VOBD4fGV0wS/+b3v+F56U0irySBTtLVMq1jk0/3aNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5wzc5tBoiGBsuRhpRnOXn+/JuA2Y0L1EtRojaOy61UqRCGrwmOi61B2T1bcDZaV7
	 NbeRh9B8kksCJt8R7pFX3UfmmSq/2LH88b9pMLZWTv2gnx4GpA7DoH+Ua+/V5vG0Nk
	 hQ9OiK295o+5817rlVHgqnSFpwuxD94ALmfSL/fo+n9Eqg2oPkF9PNzAWoq+5vRQyS
	 L84JYDrUOnGdWUMq7ZD58Z1trqP5rnJGDBgLeKsRca2aKXrhpgBlqIPrNxvH9n1XP1
	 tdm7TK+oNWh6Sghw9RDsr0XR1COHVxmNS79Ysf/5OIwilPqZvdbbq19zgYHTJOcM6C
	 Q1X6HLwip4qhg==
Date: Fri, 12 Apr 2024 11:44:09 +0100
From: Will Deacon <will@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
Message-ID: <20240412104408.GA27645@willie-the-truck>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-2-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405115815.3226315-2-pbonzini@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Marc Zyngier <maz@kernel.org>, linux-trace-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index dc04bc767865..ff17849be9f4 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1768,40 +1768,6 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  	return false;
>  }
>  
> -bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> -{
> -	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
> -
> -	if (!kvm->arch.mmu.pgt)
> -		return false;
> -
> -	WARN_ON(range->end - range->start != 1);
> -
> -	/*
> -	 * If the page isn't tagged, defer to user_mem_abort() for sanitising
> -	 * the MTE tags. The S2 pte should have been unmapped by
> -	 * mmu_notifier_invalidate_range_end().
> -	 */
> -	if (kvm_has_mte(kvm) && !page_mte_tagged(pfn_to_page(pfn)))
> -		return false;
> -
> -	/*
> -	 * We've moved a page around, probably through CoW, so let's treat
> -	 * it just like a translation fault and the map handler will clean
> -	 * the cache to the PoC.
> -	 *
> -	 * The MMU notifiers will have unmapped a huge PMD before calling
> -	 * ->change_pte() (which in turn calls kvm_set_spte_gfn()) and
> -	 * therefore we never need to clear out a huge PMD through this
> -	 * calling path and a memcache is not required.
> -	 */
> -	kvm_pgtable_stage2_map(kvm->arch.mmu.pgt, range->start << PAGE_SHIFT,
> -			       PAGE_SIZE, __pfn_to_phys(pfn),
> -			       KVM_PGTABLE_PROT_R, NULL, 0);
> -
> -	return false;
> -}
> -
>  bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	u64 size = (range->end - range->start) << PAGE_SHIFT;

Thanks. It's nice to see this code retire:

Acked-by: Will Deacon <will@kernel.org>

Also, if you're in the business of hacking the MMU notifier code, it
would be really great to change the .clear_flush_young() callback so
that the architecture could handle the TLB invalidation. At the moment,
the core KVM code invalidates the whole VMID courtesy of 'flush_on_ret'
being set by kvm_handle_hva_range(), whereas we could do a much
lighter-weight and targetted TLBI in the architecture page-table code
when we actually update the ptes for small ranges.

Will
