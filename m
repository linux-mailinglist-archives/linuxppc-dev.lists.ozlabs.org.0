Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7DF5A1E06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 03:15:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDMMV6vCcz3bNj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 11:15:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLTcdeuu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=ying.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLTcdeuu;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDMLt6zBYz2xGJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 11:14:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661476487; x=1693012487;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=5ROJ2MWnCYa+EFmKpijhLOvfObO3r2DirT5yuRlt2dk=;
  b=nLTcdeuuagcvst4qRJVX+A6FtTu8iyeBlrePV7oSJlY2NRVUIIiEePZq
   63vfdBTcElWcw5LNYbTEiC/q67vQLUhwDoNEKMvnojS6Nwzf616kfEomQ
   9ZACr8DkHgzo4wJ2PCd5WMH8er73o6XtfgD5KoT1iQeRZsLzcUV+bxTxZ
   /jb7F8eS7s1sTlI7G8BhDUCGtiWeMwgNol4ZRiFCPss89D1u51s3GKIfl
   dDxcttXVMHeSidNx5CHLci4m8n0iao/ABIUCLwwjGuqp8xz+flv/cf3BY
   TNtsVinQ21IQQIlQ+1Nylxsuiq753pzzTBo/N8ys45zF4XjosANMj3sCp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="356112122"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="356112122"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 18:14:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="587113278"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 18:14:33 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 2/3] mm/migrate_device.c: Copy pte dirty bit to page
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
	<ffbc824af5daa2c44b91c66834a341894fba4ce6.1661309831.git-series.apopple@nvidia.com>
	<YwZGHyYJiJ+CGLn2@xz-m1.local> <8735dkeyyg.fsf@nvdebian.thelocal>
	<YwgFRLn43+U/hxwt@xz-m1.local> <8735dj7qwb.fsf@nvdebian.thelocal>
Date: Fri, 26 Aug 2022 09:14:31 +0800
In-Reply-To: <8735dj7qwb.fsf@nvdebian.thelocal> (Alistair Popple's message of
	"Fri, 26 Aug 2022 11:02:58 +1000")
Message-ID: <87bks73ix4.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple <apopple@nvidia.com> writes:

> Peter Xu <peterx@redhat.com> writes:
>
>> On Fri, Aug 26, 2022 at 08:21:44AM +1000, Alistair Popple wrote:
>>>
>>> Peter Xu <peterx@redhat.com> writes:
>>>
>>> > On Wed, Aug 24, 2022 at 01:03:38PM +1000, Alistair Popple wrote:
>>> >> migrate_vma_setup() has a fast path in migrate_vma_collect_pmd() that
>>> >> installs migration entries directly if it can lock the migrating page.
>>> >> When removing a dirty pte the dirty bit is supposed to be carried over
>>> >> to the underlying page to prevent it being lost.
>>> >>
>>> >> Currently migrate_vma_*() can only be used for private anonymous
>>> >> mappings. That means loss of the dirty bit usually doesn't result in
>>> >> data loss because these pages are typically not file-backed. However
>>> >> pages may be backed by swap storage which can result in data loss if an
>>> >> attempt is made to migrate a dirty page that doesn't yet have the
>>> >> PageDirty flag set.
>>> >>
>>> >> In this case migration will fail due to unexpected references but the
>>> >> dirty pte bit will be lost. If the page is subsequently reclaimed data
>>> >> won't be written back to swap storage as it is considered uptodate,
>>> >> resulting in data loss if the page is subsequently accessed.
>>> >>
>>> >> Prevent this by copying the dirty bit to the page when removing the pte
>>> >> to match what try_to_migrate_one() does.
>>> >>
>>> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>> >> Acked-by: Peter Xu <peterx@redhat.com>
>>> >> Reported-by: Huang Ying <ying.huang@intel.com>
>>> >> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
>>> >> Cc: stable@vger.kernel.org
>>> >>
>>> >> ---
>>> >>
>>> >> Changes for v3:
>>> >>
>>> >>  - Defer TLB flushing
>>> >>  - Split a TLB flushing fix into a separate change.
>>> >>
>>> >> Changes for v2:
>>> >>
>>> >>  - Fixed up Reported-by tag.
>>> >>  - Added Peter's Acked-by.
>>> >>  - Atomically read and clear the pte to prevent the dirty bit getting
>>> >>    set after reading it.
>>> >>  - Added fixes tag
>>> >> ---
>>> >>  mm/migrate_device.c |  9 +++++++--
>>> >>  1 file changed, 7 insertions(+), 2 deletions(-)
>>> >>
>>> >> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> >> index 6a5ef9f..51d9afa 100644
>>> >> --- a/mm/migrate_device.c
>>> >> +++ b/mm/migrate_device.c
>>> >> @@ -7,6 +7,7 @@
>>> >>  #include <linux/export.h>
>>> >>  #include <linux/memremap.h>
>>> >>  #include <linux/migrate.h>
>>> >> +#include <linux/mm.h>
>>> >>  #include <linux/mm_inline.h>
>>> >>  #include <linux/mmu_notifier.h>
>>> >>  #include <linux/oom.h>
>>> >> @@ -196,7 +197,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>> >>  			anon_exclusive = PageAnon(page) && PageAnonExclusive(page);
>>> >>  			if (anon_exclusive) {
>>> >>  				flush_cache_page(vma, addr, pte_pfn(*ptep));
>>> >> -				ptep_clear_flush(vma, addr, ptep);
>>> >> +				pte = ptep_clear_flush(vma, addr, ptep);
>>> >>
>>> >>  				if (page_try_share_anon_rmap(page)) {
>>> >>  					set_pte_at(mm, addr, ptep, pte);
>>> >> @@ -206,11 +207,15 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>> >>  					goto next;
>>> >>  				}
>>> >>  			} else {
>>> >> -				ptep_get_and_clear(mm, addr, ptep);
>>> >> +				pte = ptep_get_and_clear(mm, addr, ptep);
>>> >>  			}
>>> >
>>> > I remember that in v2 both flush_cache_page() and ptep_get_and_clear() are
>>> > moved above the condition check so they're called unconditionally.  Could
>>> > you explain the rational on why it's changed back (since I think v2 was the
>>> > correct approach)?
>>>
>>> Mainly because I agree with your original comments, that it would be
>>> better to keep the batching of TLB flushing if possible. After the
>>> discussion I don't think there is any issues with HW pte dirty bits
>>> here. There are already other cases where HW needs to get that right
>>> anyway (eg. zap_pte_range).
>>
>> Yes tlb batching was kept, thanks for doing that way.  Though if only apply
>> patch 1 we'll have both ptep_clear_flush() and batched flush which seems to
>> be redundant.
>>
>>>
>>> > The other question is if we want to split the patch, would it be better to
>>> > move the tlb changes to patch 1, and leave the dirty bit fix in patch 2?
>>>
>>> Isn't that already the case? Patch 1 moves the TLB flush before the PTL
>>> as suggested, patch 2 atomically copies the dirty bit without changing
>>> any TLB flushing.
>>
>> IMHO it's cleaner to have patch 1 fix batch flush, replace
>> ptep_clear_flush() with ptep_get_and_clear() and update pte properly.
>
> Which ptep_clear_flush() are you referring to? This one?
>
> 			if (anon_exclusive) {
> 				flush_cache_page(vma, addr, pte_pfn(*ptep));
> 				ptep_clear_flush(vma, addr, ptep);
>
> My understanding is that we need to do a flush for anon_exclusive.
>
>> No strong opinions on the layout, but I still think we should drop the
>> redundant ptep_clear_flush() above, meanwhile add the flush_cache_page()
>> properly for !exclusive case too.
>
> Good point, we need flush_cache_page() for !exclusive. Will add.

That can be in another patch.  For the patch itself, it looks good to
me.  Feel free to add,

Reviewed-by: "Huang, Ying" <ying.huang@intel.com>

Best Regards,
Huang, Ying
