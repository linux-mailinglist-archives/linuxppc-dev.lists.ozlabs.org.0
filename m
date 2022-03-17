Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9922A4DCD14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 18:58:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKFJ13jydz3bcb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 04:58:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org;
 receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKFHb060Qz2yyn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 04:58:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4247A61527;
 Thu, 17 Mar 2022 17:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A284C340E9;
 Thu, 17 Mar 2022 17:58:06 +0000 (UTC)
Date: Thu, 17 Mar 2022 17:58:02 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <YjN2qsXkmlEUTg4u@arm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com>
 <YjIr9f9qaz4xITVd@arm.com>
 <c3d39666-52ae-42ba-eaa2-7a0ca489f766@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3d39666-52ae-42ba-eaa2-7a0ca489f766@redhat.com>
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Oded Gabbay <oded.gabbay@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 11:04:18AM +0100, David Hildenbrand wrote:
> On 16.03.22 19:27, Catalin Marinas wrote:
> > On Tue, Mar 15, 2022 at 03:18:34PM +0100, David Hildenbrand wrote:
> >> @@ -909,12 +925,13 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
> >>  /*
> >>   * Encode and decode a swap entry:
> >>   *	bits 0-1:	present (must be zero)
> >> - *	bits 2-7:	swap type
> >> + *	bits 2:		remember PG_anon_exclusive
> >> + *	bits 3-7:	swap type
> >>   *	bits 8-57:	swap offset
> >>   *	bit  58:	PTE_PROT_NONE (must be zero)
> > 
> > I don't remember exactly why we reserved bits 0 and 1 when, from the
> > hardware perspective, it's sufficient for bit 0 to be 0 and the whole
> > pte becomes invalid. We use bit 1 as the 'table' bit (when 0 at pmd
> > level, it's a huge page) but we shouldn't check for this on a swap
> > entry.
> 
> You mean
> 
> arch/arm64/include/asm/pgtable-hwdef.h:#define PTE_TABLE_BIT            (_AT(pteval_t, 1) << 1)
> 
> right?

Yes.

> I wonder why it even exists, for arm64 I only spot:
> 
> arch/arm64/include/asm/pgtable.h:#define pte_mkhuge(pte)                (__pte(pte_val(pte) & ~PTE_TABLE_BIT))
> 
> I don't really see code that sets PTE_TABLE_BIT.
> 
> Similarly, I don't see code that sets PMD_TABLE_BIT/PUD_TABLE_BIT/P4D_TABLE_BIT.
> Most probably setting code is not using the defines,  that's why I'm not finding it.

It gets set as part of P*D_TYPE_TABLE via p*d_populate(). We use the
P*D_TABLE_BIT mostly for checking whether it's a huge page or not (the
arm64 hugetlbpage.c code).

-- 
Catalin
