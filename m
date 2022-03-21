Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD984E2B08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 15:40:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMcjT21SBz3bNy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 01:40:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYmgDU7F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NYmgDU7F; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMchv1PFvz2yxV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 01:39:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD73FB8170E;
 Mon, 21 Mar 2022 14:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D4EC340E8;
 Mon, 21 Mar 2022 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647873595;
 bh=DvATwoHTxnArnbHtADD5Mg71Fi3pHjfQ9J9ORoxi+UI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NYmgDU7FL+wbRjIgi+f4VRnRmFWuAVTkl7g3kOamPyLk64U7Ax14VO3SKbCcdbC0W
 Bu9cW7deMtVw3T9rWU9seP7toK06zScpQrc2iTe/0KTcA24G/CBgcGsaI2DXLcBtSS
 ofo0rT/LwpSJdn0mJVwpa2dzNYgcP03+DZc32HeKsxMcy4TvJk7IWLgPLjvLaDUWBQ
 bAUN+fbbDqXv/lYRyuXk/5NpPINOtFu8yiE1SLqeC5w3HqTeDdltRxgES82G62Oo0R
 qpOpLHCTH3K/Egvs2irmRYrKOdTEosWJmRJXwzhj0xH6E7NYv0RvaKXlvX642pbZ0x
 jNQ9DhNE8HAsQ==
Date: Mon, 21 Mar 2022 14:39:44 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <20220321143944.GD11145@willie-the-truck>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com>
 <YjIr9f9qaz4xITVd@arm.com>
 <20220321143802.GC11145@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321143802.GC11145@willie-the-truck>
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
 David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Paul Mackerras <paulus@samba.org>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Jann Horn <jannh@google.com>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>, Pedro Gomes <pedrodemargomes@gmail.com>,
 Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>,
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

On Mon, Mar 21, 2022 at 02:38:02PM +0000, Will Deacon wrote:
> On Wed, Mar 16, 2022 at 06:27:01PM +0000, Catalin Marinas wrote:
> > On Tue, Mar 15, 2022 at 03:18:34PM +0100, David Hildenbrand wrote:
> > > diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> > > index b1e1b74d993c..62e0ebeed720 100644
> > > --- a/arch/arm64/include/asm/pgtable-prot.h
> > > +++ b/arch/arm64/include/asm/pgtable-prot.h
> > > @@ -14,6 +14,7 @@
> > >   * Software defined PTE bits definition.
> > >   */
> > >  #define PTE_WRITE		(PTE_DBM)		 /* same as DBM (51) */
> > > +#define PTE_SWP_EXCLUSIVE	(_AT(pteval_t, 1) << 2)	 /* only for swp ptes */
> > 
> > I think we can use bit 1 here.
> > 
> > > @@ -909,12 +925,13 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
> > >  /*
> > >   * Encode and decode a swap entry:
> > >   *	bits 0-1:	present (must be zero)
> > > - *	bits 2-7:	swap type
> > > + *	bits 2:		remember PG_anon_exclusive
> > > + *	bits 3-7:	swap type
> > >   *	bits 8-57:	swap offset
> > >   *	bit  58:	PTE_PROT_NONE (must be zero)
> > 
> > I don't remember exactly why we reserved bits 0 and 1 when, from the
> > hardware perspective, it's sufficient for bit 0 to be 0 and the whole
> > pte becomes invalid. We use bit 1 as the 'table' bit (when 0 at pmd
> > level, it's a huge page) but we shouldn't check for this on a swap
> > entry.
> 
> I'm a little worried that when we're dealing with huge mappings at the
> PMD level we might lose the ability to distinguish them from a pte-level
> mapping with this new flag set if we use bit 1. A similar issue to this
> was fixed a long time ago by 59911ca4325d ("ARM64: mm: Move PTE_PROT_NONE
> bit") when we used to use bit 1 for PTE_PROT_NONE.
> 
> Is something like:
> 
> 	pmd_to_swp_entry(swp_entry_to_pmd(pmd));
> 
> supposed to preserve the original pmd? I'm not sure that's guaranteed
> after this change if bit 1 can be cleared in the process -- we could end
> up with a pte, which the hardware would interpret as a table entry and
> end up with really bad things happening.

(I got this back to front: having the bit set rather than cleared would
be an issue, but the overall point remains).

Will
