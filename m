Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF984E2F4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 18:45:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMhpM0b0vz3bYB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 04:44:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U3fE9mvn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U3fE9mvn; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMhnf02Gfz3050
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 04:44:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51F746147C;
 Mon, 21 Mar 2022 17:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FE8C340E8;
 Mon, 21 Mar 2022 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647884656;
 bh=Cc93Sj0aRgEOWTPpRj8NNqcOtJCr+4R/IS5e+PnVDpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U3fE9mvncxRxT9MkMJyY0wRxVjZfmImW2AWeVMS26K1N5AtfUrZ1VUSp/QbiO/uIR
 BFbccvvfaSmWp/4TrOWv/MhNpySrnD3IQq3wzid7KyDktnTbLdSYaFOJLcRZtN4o7N
 aDSP6nZ92OrCdbiQk8QH4DJ9LgjlQ5L1sJF3iyIWFCD3ZQtx29z+angBTrsQGIj6Kn
 DdRfhByEDboFK2Cl786MKfWBivB0FL5zKRy23ALcA8DH4ljl0HYRhoHyjFQ4aXHahG
 qSstj/taGkUf/aMOjalkyn48fWLmLB6kIOwvf2k/g0exuPW+jZpFfMOn1uJibIorNR
 UkF9q9okXpjRg==
Date: Mon, 21 Mar 2022 17:44:05 +0000
From: Will Deacon <will@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <20220321174404.GA11389@willie-the-truck>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com>
 <YjIr9f9qaz4xITVd@arm.com>
 <20220321143802.GC11145@willie-the-truck>
 <ea570f92-f896-7f9b-91c4-ad0a025bb340@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea570f92-f896-7f9b-91c4-ad0a025bb340@redhat.com>
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Paul Mackerras <paulus@samba.org>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Rik van Riel <riel@surriel.com>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>, Pedro Gomes <pedrodemargomes@gmail.com>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 Heiko Carstens <hca@linux.ibm.com>, Shakeel Butt <shakeelb@google.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Donald Dutile <ddutile@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 21, 2022 at 04:07:48PM +0100, David Hildenbrand wrote:
> On 21.03.22 15:38, Will Deacon wrote:
> > On Wed, Mar 16, 2022 at 06:27:01PM +0000, Catalin Marinas wrote:
> >> On Tue, Mar 15, 2022 at 03:18:34PM +0100, David Hildenbrand wrote:
> >>> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> >>> index b1e1b74d993c..62e0ebeed720 100644
> >>> --- a/arch/arm64/include/asm/pgtable-prot.h
> >>> +++ b/arch/arm64/include/asm/pgtable-prot.h
> >>> @@ -14,6 +14,7 @@
> >>>   * Software defined PTE bits definition.
> >>>   */
> >>>  #define PTE_WRITE		(PTE_DBM)		 /* same as DBM (51) */
> >>> +#define PTE_SWP_EXCLUSIVE	(_AT(pteval_t, 1) << 2)	 /* only for swp ptes */
> >>
> >> I think we can use bit 1 here.
> >>
> >>> @@ -909,12 +925,13 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
> >>>  /*
> >>>   * Encode and decode a swap entry:
> >>>   *	bits 0-1:	present (must be zero)
> >>> - *	bits 2-7:	swap type
> >>> + *	bits 2:		remember PG_anon_exclusive
> >>> + *	bits 3-7:	swap type
> >>>   *	bits 8-57:	swap offset
> >>>   *	bit  58:	PTE_PROT_NONE (must be zero)
> >>
> >> I don't remember exactly why we reserved bits 0 and 1 when, from the
> >> hardware perspective, it's sufficient for bit 0 to be 0 and the whole
> >> pte becomes invalid. We use bit 1 as the 'table' bit (when 0 at pmd
> >> level, it's a huge page) but we shouldn't check for this on a swap
> >> entry.
> > 
> > I'm a little worried that when we're dealing with huge mappings at the
> > PMD level we might lose the ability to distinguish them from a pte-level
> > mapping with this new flag set if we use bit 1. A similar issue to this
> > was fixed a long time ago by 59911ca4325d ("ARM64: mm: Move PTE_PROT_NONE
> > bit") when we used to use bit 1 for PTE_PROT_NONE.
> > 
> > Is something like:
> > 
> > 	pmd_to_swp_entry(swp_entry_to_pmd(pmd));
> 
> Note that __HAVE_ARCH_PTE_SWP_EXCLUSIVE currently only applies to actual
> swap entries, not non-swap entries (migration, hwpoison, ...). So it
> really only applies to PTEs -- PMDs are not applicable.

Right, thanks for the clarification.

> So the example you gave cannot possibly have that bit set. From what I
> understand, it should be fine. But I have no real preference: I can also
> just stick to the original patch, whatever you prefer.

I think I'd prefer to stay on the safe side and stick with bit 2 as you
originally proposed. If we need to support crazy numbers of swapfiles
in future then we can revisit the idea of allocating bit 1.

Thanks, and sorry for the trouble.

Will
