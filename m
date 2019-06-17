Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C2E479B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 07:32:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S0Gg6LZSzDqKW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 15:32:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S0Dw2BlNzDqTw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 15:31:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="jkus+um0"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45S0Dt5YTVz9sBr; Mon, 17 Jun 2019 15:31:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560749470; bh=lu5tLzpTIuP7SAD2hJCgjD6o3PI3Z3AU1ddnYIWPxKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jkus+um0JDg502lcrULwMT3JKhnQCxDYvL7qOwOWZ1WFpyNd1hZxyFJLOns2jPmsl
 VysoUfSO/kePG8qojBjl3TcsJPa5JcZIiEUBDMaT6oICWGPshkm2hSBiYmKJt9HKbx
 wwlpXSkCRAaOEDm5UqgN4vHEPb4gqvQC+vP1+ksBbWaYgaJeYS7Mc6r1ndunkiZsxe
 5OgJ9/RmlzDEe3ROWKbpS2faiI/XcoBZLC+oKQCTrUE4kfOqHZZB0e4+GhsvKU71/z
 PH2e4QNgXGZKMP3MYxic8k8fJt3vijyhJwTraBJxMARt+DSCvsf5Mat6R6XxLyqj+b
 i9geK5pcpAPuw==
Date: Mon, 17 Jun 2019 15:31:06 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v4 1/6] kvmppc: HMM backend driver to manage pages of
 secure guest
Message-ID: <20190617053106.lqwzibpsz4d2464z@oak.ozlabs.ibm.com>
References: <20190528064933.23119-1-bharata@linux.ibm.com>
 <20190528064933.23119-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528064933.23119-2-bharata@linux.ibm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2019 at 12:19:28PM +0530, Bharata B Rao wrote:
> HMM driver for KVM PPC to manage page transitions of
> secure guest via H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.
> 
> H_SVM_PAGE_IN: Move the content of a normal page to secure page
> H_SVM_PAGE_OUT: Move the content of a secure page to normal page

Comments below...

> @@ -4421,6 +4435,7 @@ static void kvmppc_core_free_memslot_hv(struct kvm_memory_slot *free,
>  					struct kvm_memory_slot *dont)
>  {
>  	if (!dont || free->arch.rmap != dont->arch.rmap) {
> +		kvmppc_hmm_release_pfns(free);

I don't think this is the right place to do this.  The memslot will
have no pages mapped by this time, because higher levels of code will
have called kvmppc_core_flush_memslot_hv() before calling this.
Releasing the pfns should be done in that function.

> diff --git a/arch/powerpc/kvm/book3s_hv_hmm.c b/arch/powerpc/kvm/book3s_hv_hmm.c
> new file mode 100644
> index 000000000000..713806003da3

...

> +#define KVMPPC_PFN_HMM		(0x1ULL << 61)
> +
> +static inline bool kvmppc_is_hmm_pfn(unsigned long pfn)
> +{
> +	return !!(pfn & KVMPPC_PFN_HMM);
> +}

Since you are putting in these values in the rmap entries, you need to
be careful about overlaps between these values and the other uses of
rmap entries.  The value you have chosen would be in the middle of the
LPID field for an rmap entry for a guest that has nested guests, and
in fact kvmhv_remove_nest_rmap_range() effectively assumes that a
non-zero rmap entry must be a list of L2 guest mappings.  (This is for
radix guests; HPT guests use the rmap entry differently, but I am
assuming that we will enforce that only radix guests can be secure
guests.)

Maybe it is true that the rmap entry will be non-zero only for those
guest pages which are not mapped on the host side, that is,
kvmppc_radix_flush_memslot() will see !pte_present(*ptep) for any page
of a secure guest where the rmap entry contains a HMM pfn.  If that is
so and is a deliberate part of the design, then I would like to see it
written down in comments and commit messages so it's clear to others
working on the code in future.

Suraj is working on support for nested HPT guests, which will involve
changing the rmap format to indicate more explicitly what sort of
entry each rmap entry is.  Please work with him to define a format for
your rmap entries that is clearly distinguishable from the others.

I think it is reasonable to say that a secure guest can't have nested
guests, at least for now, but then we should make sure to kill all
nested guests when a guest goes secure.

...

> +/*
> + * Move page from normal memory to secure memory.
> + */
> +unsigned long
> +kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
> +		     unsigned long flags, unsigned long page_shift)
> +{
> +	unsigned long addr, end;
> +	unsigned long src_pfn, dst_pfn;
> +	struct kvmppc_hmm_migrate_args args;
> +	struct vm_area_struct *vma;
> +	int srcu_idx;
> +	unsigned long gfn = gpa >> page_shift;
> +	struct kvm_memory_slot *slot;
> +	unsigned long *rmap;
> +	int ret = H_SUCCESS;
> +
> +	if (page_shift != PAGE_SHIFT)
> +		return H_P3;
> +
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	slot = gfn_to_memslot(kvm, gfn);
> +	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
> +	addr = gfn_to_hva(kvm, gpa >> page_shift);
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);

Shouldn't we keep the srcu read lock until we have finished working on
the page?

> +	if (kvm_is_error_hva(addr))
> +		return H_PARAMETER;
> +
> +	end = addr + (1UL << page_shift);
> +
> +	if (flags)
> +		return H_P2;
> +
> +	args.rmap = rmap;
> +	args.lpid = kvm->arch.lpid;
> +	args.gpa = gpa;
> +	args.page_shift = page_shift;
> +
> +	down_read(&kvm->mm->mmap_sem);
> +	vma = find_vma_intersection(kvm->mm, addr, end);
> +	if (!vma || vma->vm_start > addr || vma->vm_end < end) {
> +		ret = H_PARAMETER;
> +		goto out;
> +	}
> +	ret = migrate_vma(&kvmppc_hmm_migrate_ops, vma, addr, end,
> +			  &src_pfn, &dst_pfn, &args);
> +	if (ret < 0)
> +		ret = H_PARAMETER;
> +out:
> +	up_read(&kvm->mm->mmap_sem);
> +	return ret;
> +}

...

> +/*
> + * Move page from secure memory to normal memory.
> + */
> +unsigned long
> +kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
> +		      unsigned long flags, unsigned long page_shift)
> +{
> +	unsigned long addr, end;
> +	struct vm_area_struct *vma;
> +	unsigned long src_pfn, dst_pfn = 0;
> +	int srcu_idx;
> +	int ret = H_SUCCESS;
> +
> +	if (page_shift != PAGE_SHIFT)
> +		return H_P3;
> +
> +	if (flags)
> +		return H_P2;
> +
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	addr = gfn_to_hva(kvm, gpa >> page_shift);
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);

and likewise here, shouldn't we unlock later, after the migrate_vma()
call perhaps?

> +	if (kvm_is_error_hva(addr))
> +		return H_PARAMETER;
> +
> +	end = addr + (1UL << page_shift);
> +
> +	down_read(&kvm->mm->mmap_sem);
> +	vma = find_vma_intersection(kvm->mm, addr, end);
> +	if (!vma || vma->vm_start > addr || vma->vm_end < end) {
> +		ret = H_PARAMETER;
> +		goto out;
> +	}
> +	ret = migrate_vma(&kvmppc_hmm_fault_migrate_ops, vma, addr, end,
> +			  &src_pfn, &dst_pfn, NULL);
> +	if (ret < 0)
> +		ret = H_PARAMETER;
> +out:
> +	up_read(&kvm->mm->mmap_sem);
> +	return ret;
> +}
> +

Paul.
