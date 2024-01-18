Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9698F831C4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 16:23:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG62k423bz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 02:23:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 401 seconds by postgrey-1.37 at boromir; Fri, 19 Jan 2024 02:22:59 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG62C22fwz3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 02:22:57 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E4711042;
	Thu, 18 Jan 2024 07:16:27 -0800 (PST)
Received: from [10.57.77.97] (unknown [10.57.77.97])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE12B3F73F;
	Thu, 18 Jan 2024 07:15:37 -0800 (PST)
Message-ID: <9e60b948-0044-4826-8551-0a3888650657@arm.com>
Date: Thu, 18 Jan 2024 15:15:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-7-peterx@redhat.com>
 <20240115183748.GR734935@nvidia.com>
 <c60c9d88-33aa-4312-a23c-20206e503b6e@csgroup.eu>
 <20240116123138.GZ734935@nvidia.com>
 <44e450cb-5d3f-407e-97a3-024eb936f74b@csgroup.eu>
 <20240117132243.GG734935@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240117132243.GG734935@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, "peterx@redhat.com" <peterx@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapop
 ort <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/01/2024 13:22, Jason Gunthorpe wrote:
> On Tue, Jan 16, 2024 at 06:32:32PM +0000, Christophe Leroy wrote:
>>>> hugepd is a page directory dedicated to huge pages, where you have huge
>>>> pages listed instead of regular pages. For instance, on powerpc 32 with
>>>> each PGD entries covering 4Mbytes, a regular page table has 1024 PTEs. A
>>>> hugepd for 512k is a page table with 8 entries.
>>>>
>>>> And for 8Mbytes entries, the hugepd is a page table with only one entry.
>>>> And 2 consecutive PGS entries will point to the same hugepd to cover the
>>>> entire 8Mbytes.
>>>
>>> That still sounds alot like the ARM thing - except ARM replicates the
>>> entry, you also said PPC relicates the entry like ARM to get to the
>>> 8M?
>>
>> Is it like ARM ? Not sure. The PTE is not in the PGD it must be in a L2 
>> directory, even for 8M.
> 
> Your diagram looks almost exactly like ARM to me.
> 
> The key thing is that the address for the L2 Table is *always* formed as:
> 
>    L2 Table Base << 12 + L2 Index << 2 + 00
> 
> Then the L2 Descriptor must contains bits indicating the page
> size. The L2 Descriptor is replicated to every 4k entry that the page
> size covers.
> 
> The only difference I see is the 8M case which has a page size greater
> than a single L1 entry.
> 
>> Yes that's how it works on powerpc. For 8xx we used to do that for both 
>> 8M and 512k pages. Now for 512k pages we do kind of like ARM (which 
>> means replicating the entry 128 times) as that's needed to allow mixing 
>> different page sizes for a given PGD entry.
> 
> Right, you want to have granular page sizes or it becomes unusable in
> the general case
>  
>> But for 8M pages that would mean replicating the entry 2048 times. 
>> That's a bit too much isn't it ?
> 
> Indeed, de-duplicating the L2 Table is a neat optimization.
> 
>>> So if you imagine a pmd_leaf(), pmd_leaf_size() and a pte_leaf_size()
>>> that would return enough information for both.
>>
>> pmd_leaf() ? Unless I'm missing something I can't do leaf at PMD (PGD) 
>> level. It must be a two-level process even for pages bigger than a PMD 
>> entry.
> 
> Right, this is the normal THP/hugetlb situation on x86/etc. It
> wouldn't apply here since it seems the HW doesn't have a bit in the L1
> descriptor to indicate leaf.
> 
> Instead for PPC this hugepd stuff should start to follow Ryan's
> generic work for ARM contig:
> 
> https://lore.kernel.org/all/20231218105100.172635-1-ryan.roberts@arm.com/
> 
> Specifically the arch implementation:
> 
> https://lore.kernel.org/linux-mm/20231218105100.172635-15-ryan.roberts@arm.com/
> 
> Ie the arch should ultimately wire up the replication and variable
> page size bits within its implementation of set_ptes(). set_ptes()s
> gets a contiguous run of address and should install it with maximum
> use of the variable page sizes. The core code will start to call
> set_ptes() in more cases as Ryan gets along his project.

Note that it's not just set_ptes() that you want to batch; there are other calls
that can benefit too. See patches 2 and 3 in the series you linked. (although
I'm working with DavidH on this and the details are going to change a little).

> 
> For the purposes of GUP, where are are today and where we are going,
> it would be much better to not have a special PPC specific "hugepd"
> parser. Just process each of the 4k replicates one by one like ARM is
> starting with.
> 
> The arch would still have to return the correct page address from
> pte_phys() which I think Ryan is doing by having the replicates encode
> the full 4k based address in each entry.

Yes; although its actually also a requirement of the arm architecture. Since the
contig bit is just a hint that the HW may or may not take any notice of, the
page tables have to be correct for the case where the HW just reads them in base
pages. Fixing up the bottom bits should be trivial using the PTE pointer, if
needed for ppc.

> The HW will ignore those low
> bits and pte_phys() then works properly. This would work for PPC as
> well, excluding the 8M optimization.
> 
> Going forward I'd expect to see some pte_page_size() that returns the
> size bits and GUP can have logic to skip reading replicates.

Yes; pte_batch_remaining() in patch 2 is an attempt at this. But as I said the
details will likely change a little.

> 
> The advantage of all this is that it stops making the feature special
> and the work Ryan is doing to generically push larger folios into
> set_ptes will become usable on these PPC platforms as well. And we can
> kill the PPC specific hugepd.
> 
> Jason

