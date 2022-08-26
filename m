Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFB15A1DDC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 02:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDLyW24QCz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 10:57:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwkIUgsu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=ying.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwkIUgsu;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDLxn1Zlqz2xGt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 10:56:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661475389; x=1693011389;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=eHgZdT1se+5eBqgsr/sRIR9P3jAvQggbXOvU+BKI2EI=;
  b=JwkIUgsuQUqoXYv2vLlOltpJx1/TppkUcZtyfubqxknJClyb2UEXEctq
   nY2ZLy/p+Xzg8+hRXRPF7LY9uziiR4dcNhQJ4A3jiZK1V+LJ3Sk/ZpV1O
   sjhQ/cm74lqMR6/r7zaHrZc9gPsZ1ilhRgUP190nJDOqIG7r8Zu/aWTbD
   cYAMnWo0c2z2htqjWhcV2ApgUOfCP8FHf+0gVyuIciYtMByCx6ArBYQLf
   pf9tY+Fq2fgJOTqVG4jw9kPiqpZPMvsYvnMfOVKCcwwKUgudi686xm5a0
   qGvTXI4vQBGtpNV1jQEqfzKvP5JQ+kd4QmMMjaffcuxWi3YJyX4mVzbdb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="320484257"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="320484257"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 17:56:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="587107455"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 17:56:06 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/3] mm/migrate_device.c: Flush TLB while holding PTL
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
	<87sfll2jfc.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<87y1vcdjzs.fsf@nvdebian.thelocal>
Date: Fri, 26 Aug 2022 08:56:04 +0800
In-Reply-To: <87y1vcdjzs.fsf@nvdebian.thelocal> (Alistair Popple's message of
	"Fri, 26 Aug 2022 08:35:17 +1000")
Message-ID: <87fshj3jrv.fsf@yhuang6-desk2.ccr.corp.intel.com>
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

> "Huang, Ying" <ying.huang@intel.com> writes:
>
>> Alistair Popple <apopple@nvidia.com> writes:
>>
>>> When clearing a PTE the TLB should be flushed whilst still holding the
>>> PTL to avoid a potential race with madvise/munmap/etc. For example
>>> consider the following sequence:
>>>
>>>   CPU0                          CPU1
>>>   ----                          ----
>>>
>>>   migrate_vma_collect_pmd()
>>>   pte_unmap_unlock()
>>>                                 madvise(MADV_DONTNEED)
>>>                                 -> zap_pte_range()
>>>                                 pte_offset_map_lock()
>>>                                 [ PTE not present, TLB not flushed ]
>>>                                 pte_unmap_unlock()
>>>                                 [ page is still accessible via stale TLB ]
>>>   flush_tlb_range()
>>>
>>> In this case the page may still be accessed via the stale TLB entry
>>> after madvise returns. Fix this by flushing the TLB while holding the
>>> PTL.
>>>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>> Reported-by: Nadav Amit <nadav.amit@gmail.com>
>>> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
>>> Cc: stable@vger.kernel.org
>>>
>>> ---
>>>
>>> Changes for v3:
>>>
>>>  - New for v3
>>> ---
>>>  mm/migrate_device.c | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index 27fb37d..6a5ef9f 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -254,13 +254,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>  		migrate->dst[migrate->npages] = 0;
>>>  		migrate->src[migrate->npages++] = mpfn;
>>>  	}
>>> -	arch_leave_lazy_mmu_mode();
>>> -	pte_unmap_unlock(ptep - 1, ptl);
>>>
>>>  	/* Only flush the TLB if we actually modified any entries */
>>>  	if (unmapped)
>>>  		flush_tlb_range(walk->vma, start, end);
>>
>> It appears that we can increase "unmapped" only if ptep_get_and_clear()
>> is used?
>
> In other words you mean we only need to increase unmapped if pte_present
> && !anon_exclusive?
>
> Agree, that's a good optimisation to make. However I'm just trying to
> solve a data corruption issue (not dirtying the page) here, so will post
> that as a separate optimisation patch. Thanks.

OK.  Then the patch looks good to me.  Feel free to add my,

Reviewed-by: "Huang, Ying" <ying.huang@intel.com>

Best Regards,
Huang, Ying

>>
>>> +	arch_leave_lazy_mmu_mode();
>>> +	pte_unmap_unlock(ptep - 1, ptl);
>>> +
>>>  	return 0;
>>>  }
>>>
>>>
>>> base-commit: ffcf9c5700e49c0aee42dcba9a12ba21338e8136
