Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26069857CF8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 13:54:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbsMs0v2gz3vcM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 23:54:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbsMN1c2lz2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 23:54:21 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55182DA7;
	Fri, 16 Feb 2024 04:54:29 -0800 (PST)
Received: from [192.168.68.110] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AEF53F766;
	Fri, 16 Feb 2024 04:53:44 -0800 (PST)
Message-ID: <892caa6a-e4fe-4009-aa33-0570526961c5@arm.com>
Date: Fri, 16 Feb 2024 12:53:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/18] arm64/mm: Wire up PTE_CONT for user mappings
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-13-ryan.roberts@arm.com> <Zc9UQy-mtYAzNWm2@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Zc9UQy-mtYAzNWm2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Catalin,

Thanks for the review! Comments below...


On 16/02/2024 12:25, Catalin Marinas wrote:
> On Thu, Feb 15, 2024 at 10:31:59AM +0000, Ryan Roberts wrote:
>>  arch/arm64/mm/contpte.c          | 285 +++++++++++++++++++++++++++++++
> 
> Nitpick: I think most symbols in contpte.c can be EXPORT_SYMBOL_GPL().
> We don't expect them to be used by random out of tree modules. In fact,
> do we expect them to end up in modules at all? Most seem to be called
> from the core mm code.

The problem is that the contpte_* symbols are called from the ptep_* inline
functions. So where those inlines are called from modules, we need to make sure
the contpte_* symbols are available.

John Hubbard originally reported this problem against v1 and I enumerated all
the drivers that call into the ptep_* inlines here:
https://lore.kernel.org/linux-arm-kernel/b994ff89-1a1f-26ca-9479-b08c77f94be8@arm.com/#t

So they definitely need to be exported. Perhaps we can tighten it to
EXPORT_SYMBOL_GPL(), but I was being cautious as I didn't want to break anything
out-of-tree. I'm not sure what the normal policy is? arm64 seems to use ~equal
amounts of both.

> 
>> +#define ptep_get_lockless ptep_get_lockless
>> +static inline pte_t ptep_get_lockless(pte_t *ptep)
>> +{
>> +	pte_t pte = __ptep_get(ptep);
>> +
>> +	if (likely(!pte_valid_cont(pte)))
>> +		return pte;
>> +
>> +	return contpte_ptep_get_lockless(ptep);
>> +}
> [...]
>> +pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>> +{
>> +	/*
>> +	 * Gather access/dirty bits, which may be populated in any of the ptes
>> +	 * of the contig range. We may not be holding the PTL, so any contiguous
>> +	 * range may be unfolded/modified/refolded under our feet. Therefore we
>> +	 * ensure we read a _consistent_ contpte range by checking that all ptes
>> +	 * in the range are valid and have CONT_PTE set, that all pfns are
>> +	 * contiguous and that all pgprots are the same (ignoring access/dirty).
>> +	 * If we find a pte that is not consistent, then we must be racing with
>> +	 * an update so start again. If the target pte does not have CONT_PTE
>> +	 * set then that is considered consistent on its own because it is not
>> +	 * part of a contpte range.
>> +*/
> 
> I can't get my head around this lockless API. Maybe it works fine (and
> may have been discussed already) but we should document what the races
> are, why it works, what the memory ordering requirements are. For
> example, the generic (well, x86 PAE) ptep_get_lockless() only needs to
> ensure that the low/high 32 bits of a pte are consistent and there are
> some ordering rules on how these are updated.
> 
> Does the arm64 implementation only need to be correct w.r.t. the
> access/dirty bits? Since we can read orig_ptep atomically, I assume the
> only other updates from unfolding would set the dirty/access bits.
> 
>> +
>> +	pgprot_t orig_prot;
>> +	unsigned long pfn;
>> +	pte_t orig_pte;
>> +	pgprot_t prot;
>> +	pte_t *ptep;
>> +	pte_t pte;
>> +	int i;
>> +
>> +retry:
>> +	orig_pte = __ptep_get(orig_ptep);
>> +
>> +	if (!pte_valid_cont(orig_pte))
>> +		return orig_pte;
>> +
>> +	orig_prot = pte_pgprot(pte_mkold(pte_mkclean(orig_pte)));
>> +	ptep = contpte_align_down(orig_ptep);
>> +	pfn = pte_pfn(orig_pte) - (orig_ptep - ptep);
>> +
>> +	for (i = 0; i < CONT_PTES; i++, ptep++, pfn++) {
>> +		pte = __ptep_get(ptep);
>> +		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
> 
> We don't have any ordering guarantees in how the ptes in this range are
> read or written in the contpte_set_ptes() and the fold/unfold functions.
> We might not need them given all the other checks below but it's worth
> adding a comment.
> 
>> +
>> +		if (!pte_valid_cont(pte) ||
>> +		   pte_pfn(pte) != pfn ||
>> +		   pgprot_val(prot) != pgprot_val(orig_prot))
>> +			goto retry;
> 
> I think this also needs some comment. I get the !pte_valid_cont() check
> to attempt retrying when racing with unfolding. Are the other checks
> needed to detect re-folding with different protection or pfn?
> 
>> +
>> +		if (pte_dirty(pte))
>> +			orig_pte = pte_mkdirty(orig_pte);
>> +
>> +		if (pte_young(pte))
>> +			orig_pte = pte_mkyoung(orig_pte);
>> +	}
> 
> After writing the comments above, I think I figured out that the whole
> point of this loop is to check that the ptes in the contig range are
> still consistent and the only variation allowed is the dirty/young
> state to be passed to the orig_pte returned. The original pte may have
> been updated by the time this loop finishes but I don't think it
> matters, it wouldn't be any different than reading a single pte and
> returning it while it is being updated.

Correct. The pte can be updated at any time, before after or during the reads.
That was always the case. But now we have to cope with a whole contpte block
being repainted while we are reading it. So we are just checking to make sure
that all the ptes that we read from the contpte block are consistent with
eachother and therefore we can trust that the access/dirty bits we gathered are
consistent.


> 
> If you can make this easier to parse (in a few years time) with an
> additional patch adding some more comments, that would be great. For
> this patch:

I already have a big block comment at the top, which was trying to explain it.
Clearly not well enough though. I'll add more comments as a follow up patch when
I get back from holiday.

> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!

> 

