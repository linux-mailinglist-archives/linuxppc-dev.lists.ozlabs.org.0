Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F5853015
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 13:03:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ0NX5Gpgz3dHV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 23:03:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ0N420HWz3bn0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 23:03:29 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1341DA7;
	Tue, 13 Feb 2024 04:03:36 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.36.130])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 045093F762;
	Tue, 13 Feb 2024 04:02:51 -0800 (PST)
Date: Tue, 13 Feb 2024 12:02:49 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
Message-ID: <ZctaaeVFF8TpjA8Z@FVFF77S0Q05N.cambridge.arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-20-ryan.roberts@arm.com>
 <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
 <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 12, 2024 at 12:59:57PM +0000, Ryan Roberts wrote:
> On 12/02/2024 12:00, Mark Rutland wrote:
> > Hi Ryan,

[...]

> >> +static inline void set_pte(pte_t *ptep, pte_t pte)
> >> +{
> >> +	/*
> >> +	 * We don't have the mm or vaddr so cannot unfold contig entries (since
> >> +	 * it requires tlb maintenance). set_pte() is not used in core code, so
> >> +	 * this should never even be called. Regardless do our best to service
> >> +	 * any call and emit a warning if there is any attempt to set a pte on
> >> +	 * top of an existing contig range.
> >> +	 */
> >> +	pte_t orig_pte = __ptep_get(ptep);
> >> +
> >> +	WARN_ON_ONCE(pte_valid_cont(orig_pte));
> >> +	__set_pte(ptep, pte_mknoncont(pte));
> >> +}
> >> +
> >> +#define set_ptes set_ptes
> >> +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
> >> +				pte_t *ptep, pte_t pte, unsigned int nr)
> >> +{
> >> +	pte = pte_mknoncont(pte);
> > 
> > Why do we have to clear the contiguous bit here? Is that for the same reason as
> > set_pte(), or do we expect callers to legitimately call this with the
> > contiguous bit set in 'pte'?
> > 
> > I think you explained this to me in-person, and IIRC we don't expect callers to
> > go set the bit themselves, but since it 'leaks' out to them via __ptep_get() we
> > have to clear it here to defer the decision of whether to set/clear it when
> > modifying entries. It would be nice if we could have a description of why/when
> > we need to clear this, e.g. in the 'public API' comment block above.
> 
> Yes, I think you've got it, but just to ram home the point: The PTE_CONT bit is
> private to the architecture code and is never set directly by core code. If the
> public API ever receives a pte that happens to have the PTE_CONT bit set, it
> would be bad news if we then accidentally set that in the pgtable.
> 
> Ideally, we would just uncondidtionally clear the bit before a getter returns
> the pte (e.g. ptep_get(), ptep_get_lockless(), ptep_get_and_clear(), ...). That
> way, the code code is guarranteed never to see a pte with the PTE_CONT bit set
> and can therefore never accidentally pass such a pte into a setter function.
> However, there is existing functionality that relies on being able to get a pte,
> then pass it to pte_leaf_size(), and arch function that checks the PTE_CONT bit
> to determine how big the leaf is. This is used in perf_get_pgtable_size().
> 
> So to allow perf_get_pgtable_size() to continue to see the "real" page size, I
> decided to allow PTE_CONT to leak through the getters and instead
> unconditionally clear the bit when a pte is passed to any of the setters.
> 
> I'll add a (slightly less verbose) comment as you suggest.

Great, thanks!

[...]

> >> +static inline bool mm_is_user(struct mm_struct *mm)
> >> +{
> >> +	/*
> >> +	 * Don't attempt to apply the contig bit to kernel mappings, because
> >> +	 * dynamically adding/removing the contig bit can cause page faults.
> >> +	 * These racing faults are ok for user space, since they get serialized
> >> +	 * on the PTL. But kernel mappings can't tolerate faults.
> >> +	 */
> >> +	return mm != &init_mm;
> >> +}
> > 
> > We also have the efi_mm as a non-user mm, though I don't think we manipulate
> > that while it is live, and I'm not sure if that needs any special handling.
> 
> Well we never need this function in the hot (order-0 folio) path, so I think I
> could add a check for efi_mm here with performance implication. It's probably
> safest to explicitly exclude it? What do you think?

That sounds ok to me.

Otherwise, if we (somehow) know that we avoid calling this at all with an EFI
mm (e.g. because of the way we construct that), I'd be happy with a comment.

Probably best to Cc Ard for whatever we do here.

> >> +static inline pte_t *contpte_align_down(pte_t *ptep)
> >> +{
> >> +	return (pte_t *)(ALIGN_DOWN((unsigned long)ptep >> 3, CONT_PTES) << 3);
> > 
> > I think this can be:
> > 
> > static inline pte_t *contpte_align_down(pte_t *ptep)
> > {
> > 	return PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
> > }
> 
> Yep - that's much less ugly - thanks!
> 
> > 
> >> +
> >> +static void contpte_convert(struct mm_struct *mm, unsigned long addr,
> >> +			    pte_t *ptep, pte_t pte)
> >> +{
> >> +	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
> >> +	unsigned long start_addr;
> >> +	pte_t *start_ptep;
> >> +	int i;
> >> +
> >> +	start_ptep = ptep = contpte_align_down(ptep);
> >> +	start_addr = addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
> >> +	pte = pfn_pte(ALIGN_DOWN(pte_pfn(pte), CONT_PTES), pte_pgprot(pte));
> >> +
> >> +	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE) {
> >> +		pte_t ptent = __ptep_get_and_clear(mm, addr, ptep);
> >> +
> >> +		if (pte_dirty(ptent))
> >> +			pte = pte_mkdirty(pte);
> >> +
> >> +		if (pte_young(ptent))
> >> +			pte = pte_mkyoung(pte);
> >> +	}
> > 
> > Not a big deal either way, but I wonder if it makes more sense to accumulate
> > the 'ptent' dirty/young values, then modify 'pte' once, i.e.
> > 
> > 	bool dirty = false, young = false;
> > 
> > 	for (...) {
> > 		pte_t ptent = __ptep_get_and_clear(mm, addr, ptep);
> > 		dirty |= pte_dirty(ptent);
> > 		young |= pte_young(ptent);
> > 	}
> > 
> > 	if (dirty)
> > 		pte_mkdirty(pte);
> > 	if (young)
> > 		pte_mkyoung(pte);
> > 
> > I suspect that might generate slightly better code, but I'm also happy with the
> > current form if people thnk that's more legible (I have no strong feelings
> > either way).
> 
> I kept it this way, because its the same pattern used in arm64's hugetlbpage.c.
> We also had the same comment against David's batching patches recently, and he
> opted to stick with the former version:
> 
> https://lore.kernel.org/linux-mm/d83309fa-4daa-430f-ae52-4e72162bca9a@redhat.com/
> 
> So I'm inclined to leave it as is, since you're not insisting :)

That rationale is reasonable, and I'm fine with this as-is.

[...]

> >> +pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >> +{
> >> +	/*
> >> +	 * Gather access/dirty bits, which may be populated in any of the ptes
> >> +	 * of the contig range. We may not be holding the PTL, so any contiguous
> >> +	 * range may be unfolded/modified/refolded under our feet. Therefore we
> >> +	 * ensure we read a _consistent_ contpte range by checking that all ptes
> >> +	 * in the range are valid and have CONT_PTE set, that all pfns are
> >> +	 * contiguous and that all pgprots are the same (ignoring access/dirty).
> >> +	 * If we find a pte that is not consistent, then we must be racing with
> >> +	 * an update so start again. If the target pte does not have CONT_PTE
> >> +	 * set then that is considered consistent on its own because it is not
> >> +	 * part of a contpte range.
> >> +	 */
> >> +
> >> +	pgprot_t orig_prot;
> >> +	unsigned long pfn;
> >> +	pte_t orig_pte;
> >> +	pgprot_t prot;
> >> +	pte_t *ptep;
> >> +	pte_t pte;
> >> +	int i;
> >> +
> >> +retry:
> >> +	orig_pte = __ptep_get(orig_ptep);
> >> +
> >> +	if (!pte_valid_cont(orig_pte))
> >> +		return orig_pte;
> >> +
> >> +	orig_prot = pte_pgprot(pte_mkold(pte_mkclean(orig_pte)));
> >> +	ptep = contpte_align_down(orig_ptep);
> >> +	pfn = pte_pfn(orig_pte) - (orig_ptep - ptep);
> >> +
> >> +	for (i = 0; i < CONT_PTES; i++, ptep++, pfn++) {
> >> +		pte = __ptep_get(ptep);
> >> +		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
> >> +
> >> +		if (!pte_valid_cont(pte) ||
> >> +		   pte_pfn(pte) != pfn ||
> >> +		   pgprot_val(prot) != pgprot_val(orig_prot))
> >> +			goto retry;
> >> +
> >> +		if (pte_dirty(pte))
> >> +			orig_pte = pte_mkdirty(orig_pte);
> >> +
> >> +		if (pte_young(pte))
> >> +			orig_pte = pte_mkyoung(orig_pte);
> >> +	}
> >> +
> >> +	return orig_pte;
> >> +}
> >> +EXPORT_SYMBOL(contpte_ptep_get_lockless);
> > 
> > I'm struggling to convince myself that this is safe in general, as it really
> > depends on how the caller will use this value. Which caller(s) actually care
> > about the access/dirty bits, given those could change at any time anyway?
> 
> I think your points below are valid, and agree we should try to make this work
> without needing access/dirty if possible. But can you elaborate on why you don't
> think it's safe?

Having mulled this over, I think it is safe as-is, and I was being overly
cautious.

I had a general fear of potential problems stemming from the fact that (a) the
accumulation of access/dirty bits isn't atomic and (b) the loop is unbounded.
From looking at how this is used today, I think (a) is essentially the same as
reading a stale non-contiguous entry, and I'm being overly cautious there. For
(b), I think that's largely a performance concern and the would only retry
indefinitely in the presence of mis-programmed entries or consistent racing
with a writer under heavy contention.

I think it's still desirable to avoid the accumulation in most cases (to avoid
redundant work and to minimize the potential for unbounded retries), but I'm
happy with that being a follow-up improvement.

> > I took a quick scan, and AFAICT:
> 
> Thanks for enumerating these; Saves me from having to refresh my memory :)
> > 
> > * For perf_get_pgtable_size(), we only care about whether the entry is valid
> >   and has the contig bit set. We could clean that up with a new interface, e.g.
> >   something like a new ptep_get_size_lockless().
> > 
> > * For gup_pte_range(), I'm not sure we actually need the access/dirty bits when
> >   we look at the pte to start with, since we only care where we can logically
> >   write to the page at that point.
> > 
> >   I see that we later follow up with:
> > 
> >     with pte_val(pte) != pte_val(ptep_get(ptep)))
> > 
> >   ... is that why we need ptep_get_lockless() to accumulate the access/dirty
> >   bits? So that shape of lockless-try...locked-compare sequence works?
> > 
> > * For huge_pte_alloc(), arm64 doesn't select CONFIG_ARCH_WANT_GENERAL_HUGETLB,
> >   so this doesn' seem to matter.
> > 
> > * For __collapse_huge_page_swapin(), we only care if the pte is a swap pte,
> >   which means the pte isn't valid, and we'll return the orig_pte as-is anyway.
> > 
> > * For pte_range_none() the access/dirty bits don't matter.
> > 
> > * For handle_pte_fault() I think we have the same shape of
> >   lockless-try...locked-compare sequence as for gup_pte_range(), where we don't
> >   care about the acess/dirty bits before we reach the locked compare step.
> > 
> > * For ptdump_pte_entry() I think it's arguable that we should continue to
> >   report the access/dirty bits separately for each PTE, as we have done until
> >   now, to give an accurate representation of the contents of the translation
> >   tables.
> > 
> > * For swap_vma_readahead() and unuse_pte_range() we only care if the PTE is a
> >   swap entry, the access/dirty bits don't matter.
> > 
> > So AFAICT this only really matters for gup_pte_range() and handle_pte_fault(),
> > and IIUC that's only so that the locklessly-loaded pte value can be compared
> > with a subsequently locked-loaded entry (for which the access/dirty bits will
> > be accumulated). Have I understood that correctly?
> 
> Yes, I agree with what you are saying. My approach was to try to implement the
> existing APIs accurately though, the argument being that it reduces the chances
> of getting it wrong. But if you think the implementation is unsafe, then I guess
> it blows that out of the water...

I think your approach makes sense, and as above I'm happy to defer the API
changes/additions to avoid the accumulation of access/dirty bits.

> > If so, I wonder if we could instead do that comparison modulo the access/dirty
> > bits, 
> 
> I think that would work - but will need to think a bit more on it.
> 
> > and leave ptep_get_lockless() only reading a single entry?
> 
> I think we will need to do something a bit less fragile. ptep_get() does collect
> the access/dirty bits so its confusing if ptep_get_lockless() doesn't IMHO. So
> we will likely want to rename the function and make its documentation explicit
> that it does not return those bits.
> 
> ptep_get_lockless_noyoungdirty()? yuk... Any ideas?
> 
> Of course if I could convince you the current implementation is safe, I might be
> able to sidestep this optimization until a later date?

Yep. :)

Mark.
