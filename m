Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E4895984
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 18:19:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8Ckz0dYdz3vYr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 03:19:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8CkW1CxPz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 03:19:12 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA6C61007;
	Tue,  2 Apr 2024 09:19:11 -0700 (PDT)
Received: from [10.1.38.163] (XHFQ2J9959.cambridge.arm.com [10.1.38.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D35D3F64C;
	Tue,  2 Apr 2024 09:18:37 -0700 (PDT)
Message-ID: <3f670f03-ee97-4368-94ca-e8d18a1b1a69@arm.com>
Date: Tue, 2 Apr 2024 17:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Content-Language: en-GB
To: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-14-peterx@redhat.com>
 <adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com>
 <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
 <ZgwrhKuypBtSpKdI@casper.infradead.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZgwrhKuypBtSpKdI@casper.infradead.org>
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
Cc: James Houghton <jthoughton@google.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/04/2024 17:00, Matthew Wilcox wrote:
> On Tue, Apr 02, 2024 at 05:26:28PM +0200, David Hildenbrand wrote:
>>> The oops trigger is at mm/gup.c:778:
>>> VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
>>>
>>> So 2M passed ok, and its failing for 32M, which is cont-pmd. I'm guessing you're trying to iterate 2M into a cont-pmd folio and ending up with an unexpected tail page?
>>
>> I assume we find the expected tail page, it's just that the check
>>
>> VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
>>
>> Doesn't make sense with hugetlb folios. We might have a tail page mapped in
>> a cont-pmd entry. As soon as we call follow_huge_pmd() on "not the first
>> cont-pmd entry", we trigger this check.
>>
>> Likely this sanity check must also allow for hugetlb folios. Or we should
>> just remove it completely.
>>
>> In the past, we wanted to make sure that we never get tail pages of THP from
>> PMD entries, because something would currently be broken (we don't support
>> THP > PMD).
> 
> That was a practical limitation on my part.  We have various parts of
> the MM which assume that pmd_page() returns a head page and until we
> get all of those fixed, adding support for folios larger than PMD_SIZE
> was only going to cause trouble for no significant wins.
> 
> I agree with you we should get rid of this assertion entirely.  We should
> fix all the places which assume that pmd_page() returns a head page,
> but that may take some time.
> 
> As an example, filemap_map_pmd() has:
> 
>        if (pmd_none(*vmf->pmd) && folio_test_pmd_mappable(folio)) {
>                 struct page *page = folio_file_page(folio, start);
>                 vm_fault_t ret = do_set_pmd(vmf, page);
> 
> and then do_set_pmd() has:
> 
>         if (page != &folio->page || folio_order(folio) != HPAGE_PMD_ORDER)
>                 return ret;
> 
> so we'd simply refuse to use a PMD to map a folio larger than PMD_SIZE.
> There's a lot of work to be done to make this work generally (not to
> mention figuring out how to handle mapcount for such folios ;-).
> 
> This particular case seems straightforward though.  Just remove the
> assertion.

Removing the assertion gets me further, but then I end up with this:

[    9.748422] kernel BUG at include/linux/page-flags.h:1098!
[    9.748897] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
[    9.749590] Modules linked in:
[    9.749867] CPU: 2 PID: 1155 Comm: gup_longterm Not tainted 6.9.0-rc2-00210-g910ff1a347e4-dirty #12
[    9.750682] Hardware name: linux,dummy-virt (DT)
[    9.751095] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    9.751729] pc : follow_page_mask+0x730/0x850
[    9.752152] lr : follow_page_mask+0x730/0x850
[    9.752573] sp : ffff8000898f3aa0
[    9.752882] x29: ffff8000898f3aa0 x28: fffffdffc52b91a8 x27: 0000000000000001
[    9.753543] x26: ffff00014ae46d08 x25: 00003c0005d88000 x24: fffffdffc5d88000
[    9.754221] x23: ffffc1ffc0000000 x22: 0000000000080101 x21: ffff8000898f3ba8
[    9.754875] x20: 0000fffff4200000 x19: ffff0001a3d64450 x18: 0000000000000010
[    9.755567] x17: 2864616548656761 x16: 5021202626202965 x15: 6761702865677548
[    9.756254] x14: 6567615028454741 x13: 2929656761702864 x12: 6165486567615021
[    9.756953] x11: 2026262029656761 x10: ffffaaac08f1d6e0 x9 : ffffaaac0612f090
[    9.757671] x8 : 00000000ffffefff x7 : ffffaaac08f1d6e0 x6 : 0000000000000000
[    9.758356] x5 : ffff00017ffb9cc8 x4 : 0000000000000fff x3 : 0000000000000000
[    9.758983] x2 : 0000000000000000 x1 : ffff000189ecb480 x0 : 0000000000000046
[    9.759663] Call trace:
[    9.759901]  follow_page_mask+0x730/0x850
[    9.760293]  __get_user_pages+0xf4/0x3e8
[    9.760683]  __gup_longterm_locked+0x204/0xa70
[    9.761110]  pin_user_pages+0x88/0xc0
[    9.761486]  gup_test_ioctl+0x860/0xc40
[    9.761866]  __arm64_sys_ioctl+0xb0/0x100
[    9.762254]  invoke_syscall+0x50/0x128
[    9.762630]  el0_svc_common.constprop.0+0x48/0xf8
[    9.763104]  do_el0_svc+0x28/0x40
[    9.763413]  el0_svc+0x34/0xe0
[    9.763699]  el0t_64_sync_handler+0x13c/0x158
[    9.764139]  el0t_64_sync+0x190/0x198
[    9.764465] Code: aa1803e0 d000d8e1 911d6021 97fff4c9 (d4210000) 
[    9.765053] ---[ end trace 0000000000000000 ]---
[    9.765520] note: gup_longterm[1155] exited with irqs disabled
[    9.766146] note: gup_longterm[1155] exited with preempt_count 2
[    9.767366] ------------[ cut here ]------------
[    9.768062] WARNING: CPU: 2 PID: 0 at kernel/context_tracking.c:128 ct_kernel_exit.constprop.0+0x108/0x120
[    9.769146] Modules linked in:
[    9.769429] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G      D            6.9.0-rc2-00210-g910ff1a347e4-dirty #12
[    9.770338] Hardware name: linux,dummy-virt (DT)
[    9.770837] pstate: 204003c5 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    9.771615] pc : ct_kernel_exit.constprop.0+0x108/0x120
[    9.772150] lr : ct_idle_enter+0x10/0x20
[    9.772539] sp : ffff8000801b3dc0
[    9.772913] x29: ffff8000801b3dc0 x28: 0000000000000000 x27: 0000000000000000
[    9.773769] x26: 0000000000000000 x25: ffff00014149e900 x24: 0000000000000000
[    9.774526] x23: 0000000000000000 x22: ffffaaac08e99d48 x21: ffffaaac08385730
[    9.775255] x20: ffffaaac08e99c28 x19: ffff00017ffc8da0 x18: 0000fffff5ffffff
[    9.775924] x17: 0000000000000000 x16: 1fffe0002a57c9e1 x15: 0000000000000001
[    9.776619] x14: ffffffffffffffff x13: 0000000000000000 x12: ffffaaac07a06968
[    9.777246] x11: 000000ae44c42eec x10: 0000000000000ad0 x9 : ffffaaac06189230
[    9.777942] x8 : ffff00014149f430 x7 : 02c9acb509db422c x6 : 000000001015a9f0
[    9.778635] x5 : 4000000000000002 x4 : ffff555577c46000 x3 : ffff8000801b3dc0
[    9.779671] x2 : ffffaaac08382da0 x1 : 4000000000000000 x0 : ffffaaac08382da0
[    9.780703] Call trace:
[    9.781150]  ct_kernel_exit.constprop.0+0x108/0x120
[    9.781949]  ct_idle_enter+0x10/0x20
[    9.782246]  default_idle_call+0x3c/0x160
[    9.782624]  do_idle+0x21c/0x280
[    9.782945]  cpu_startup_entry+0x3c/0x50
[    9.783268]  secondary_start_kernel+0x140/0x168
[    9.783818]  __secondary_switched+0xb8/0xc0
[    9.784163] ---[ end trace 0000000000000000 ]---


Which is caused by this:

static __always_inline int PageAnonExclusive(const struct page *page)
{
	VM_BUG_ON_PGFLAGS(!PageAnon(page), page);
	VM_BUG_ON_PGFLAGS(PageHuge(page) && !PageHead(page), page); <<<<
	return test_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
}

Which is called from can_follow_write_pmd(), called just after the assert I just commented out.


It's triggered by this test:

# [RUN] R/W longterm GUP pin in MAP_PRIVATE file mapping ... with memfd hugetlb (32768 kB)

Which is the first MAP_PRIVATE test for cont-pmd mapped hugetlb. (All MAP_SHARED tests are passing).


Looks like can_follow_write_pmd() returns early for VM_SHARED mappings.

I don't think we only keep the PAE flag in the head page for hugetlb pages? So we can't just remove this assert?

I tried just commenting it out and get assert further down follow_huge_pmd():

VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
			!PageAnonExclusive(page), page);

Thanks,
Ryan

