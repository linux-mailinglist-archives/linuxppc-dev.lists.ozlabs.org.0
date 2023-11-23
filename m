Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C307F66F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 20:12:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbnmt5HrCz3vg8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 06:12:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbnmP0Z7tz3cgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 06:12:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C64A1042;
	Thu, 23 Nov 2023 11:12:14 -0800 (PST)
Received: from [10.57.70.238] (unknown [10.57.70.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 746AA3F7A6;
	Thu, 23 Nov 2023 11:11:25 -0800 (PST)
Message-ID: <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
Date: Thu, 23 Nov 2023 19:11:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Content-Language: en-GB
To: Peter Xu <peterx@redhat.com>, Matthew Wilcox <willy@infradead.org>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com> <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n> <ZV21GCbG48nTLDzn@infradead.org>
 <ZV90JcnQ1RGud/0R@casper.infradead.org> <ZV-KQ0e0y9BTsHGv@x1n>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZV-KQ0e0y9BTsHGv@x1n>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/11/2023 17:22, Peter Xu wrote:
> On Thu, Nov 23, 2023 at 03:47:49PM +0000, Matthew Wilcox wrote:
>> It looks like ARM (in the person of Ryan) are going to add support for
>> something equivalent to hugepd.
> 
> If it's about arm's cont_pte, then it looks ideal because this series
> didn't yet touch cont_pte, assuming it'll just work.  From that aspect, his
> work may help mine, and no immediately collapsing either.

Hi,

I'm not sure I've 100% understood the crossover between this series and my work
to support arm64's contpte mappings generally for anonymous and file-backed memory.

My approach is to transparently use contpte mappings when core-mm request pte
mappings that meet the requirements; and its all based around intercepting the
normal (non-hugetlb) helpers (e.g. set_ptes(), ptep_get() and friends). There is
no semantic change to the core-mm. See [1]. It relies on 1) the page cache using
large folios and 2) my "small-sized THP" series which starts using arbitrary
sized large folios for anonymous memory [2].

If I've understood this conversation correctly there is an object called hugepd,
which today is only supported by powerpc, but which could allow the core-mm to
control the mapping granularity? I can see some value in exposing that control
to core-mm in the (very) long term.

[1] https://lore.kernel.org/all/20231115163018.1303287-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/linux-mm/20231115132734.931023-1-ryan.roberts@arm.com/

Thanks,
Ryan


> 
> There can be a slight performance difference which I need to measure for
> arm's cont_pte already for hugetlb, but I didn't worry much on that;
> quotting my commit message in the last patch:
> 
>     There may be a slight difference of how the loops run when processing
>     GUP over a large hugetlb range on either ARM64 (e.g. CONT_PMD) or RISCV
>     (mostly its Svnapot extension on 64K huge pages): each loop of
>     __get_user_pages() will resolve one pgtable entry with the patch
>     applied, rather than relying on the size of hugetlb hstate, the latter
>     may cover multiple entries in one loop.
>     
>     However, the performance difference should hopefully not be a major
>     concern, considering that GUP just yet got 57edfcfd3419 ("mm/gup:
>     accelerate thp gup even for "pages != NULL""), and that's not part of a
>     performance analysis but a side dish.  If the performance will be a
>     concern, we can consider handle CONT_PTE in follow_page(), for example.
> 
> So IMHO it can be slightly different comparing to e.g. page fault, because
> each fault is still pretty slow as a whole if one fault for each small pte
> (of a large folio / cont_pte), while the loop in GUP is still relatively
> tight and short, comparing to a fault.  I'd boldly guess more low hanging
> fruits out there for large folio outside GUP areas.
> 
> In all cases, it'll be interesting to know if Ryan has worked on cont_pte
> support for gup on large folios, and whether there's any performance number
> to share.  It's definitely good news to me because it means Ryan's work can
> also then benefit hugetlb if this series will be merged, I just don't know
> how much difference there will be.
> 
> Thanks,
> 

