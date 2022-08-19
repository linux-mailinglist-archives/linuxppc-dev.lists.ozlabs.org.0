Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA86599333
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 04:52:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M85rf4NZRz3dvv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 12:52:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fc0uLYov;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ying.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fc0uLYov;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M85r25jS4z3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 12:51:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660877507; x=1692413507;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=4EIcg7RWk2yRi+CSvUOFGKBdAdmQg2lkeFcyyl4c1Jg=;
  b=Fc0uLYovJCdngy9h5HljZgUHFGLA1n844ZFsZkDw1aprkvbix3PXJyxg
   /KpRFXSoVP1oGROo05byS220VI/PCbZB3e8i9lcyIw3JFmmCo1mezkIWG
   PVxKrnbFudLuyqc2NC/a0MTOKCtgxs13l+bV0rrmiPpKPcljfkD0A61DB
   O/+nZCwtcaK6YhwIBMU47rkzkSD7sO0CYkonVc+yhorj/pFAHSjIJynTh
   O2SXmP8d7ZeTepTLGmTFn3yLv6XOnuUUsKTi2IRbdvyQCFaNfzeMk+mF7
   Q+RgDZ1+eAK2II5WOF2FVBKCmkPpii/R+/uX0HQGPnhLNWmbes7orgje9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="379214546"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="379214546"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 19:51:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="936054349"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 19:51:29 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
References: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
	<CAC=cRTPGiXWjk=CYnCrhJnLx3mdkGDXZpvApo6yTbeW7+ZGajA@mail.gmail.com>
	<Yvv/eGfi3LW8WxPZ@xz-m1.local> <871qtfvdlw.fsf@nvdebian.thelocal>
	<YvxWUY9eafFJ27ef@xz-m1.local> <87o7wjtn2g.fsf@nvdebian.thelocal>
	<87tu6bbaq7.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<1D2FB37E-831B-445E-ADDC-C1D3FF0425C1@gmail.com>
	<Yv1BJKb5he3dOHdC@xz-m1.local>
	<87czcyawl6.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<Yv5QXkS4Bm9pTBeG@xz-m1.local>
Date: Fri, 19 Aug 2022 10:51:27 +0800
In-Reply-To: <Yv5QXkS4Bm9pTBeG@xz-m1.local> (Peter Xu's message of "Thu, 18
	Aug 2022 10:44:46 -0400")
Message-ID: <874jy9aqts.fsf@yhuang6-desk2.ccr.corp.intel.com>
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Linux MM <linux-mm@kvack.org>, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Xu <peterx@redhat.com> writes:

> On Thu, Aug 18, 2022 at 02:34:45PM +0800, Huang, Ying wrote:
>> > In this specific case, the only way to do safe tlb batching in my mind is:
>> >
>> > 	pte_offset_map_lock();
>> > 	arch_enter_lazy_mmu_mode();
>> >         // If any pending tlb, do it now
>> >         if (mm_tlb_flush_pending())
>> > 		flush_tlb_range(vma, start, end);
>> >         else
>> >                 flush_tlb_batched_pending();
>> 
>> I don't think we need the above 4 lines.  Because we will flush TLB
>> before we access the pages.
>
> Could you elaborate?

As you have said below, we don't use non-present PTEs and flush present
PTEs before we access the pages.

>> Can you find any issue if we don't use the above 4 lines?
>
> It seems okay to me to leave stall tlb at least within the scope of this
> function. It only collects present ptes and flush propoerly for them.  I
> don't quickly see any other implications to other not touched ptes - unlike
> e.g. mprotect(), there's a strong barrier of not allowing further write
> after mprotect() returns.

Yes.  I think so too.

> Still I don't know whether there'll be any side effect of having stall tlbs
> in !present ptes because I'm not familiar enough with the private dev swap
> migration code.  But I think having them will be safe, even if redundant.

I don't think it's a good idea to be redundant.  That may hide the real
issue.

Best Regards,
Huang, Ying
