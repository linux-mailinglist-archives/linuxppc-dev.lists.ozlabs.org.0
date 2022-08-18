Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F342597EB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 08:35:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7Zrs1MlBz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 16:35:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cNY3YZHs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=ying.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cNY3YZHs;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7ZrF2fmFz2yMK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 16:35:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660804509; x=1692340509;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version:content-transfer-encoding;
  bh=+do2uA89fmz0CDWVL3JlfrwCb7Glq9Xqu12lfvGSbEI=;
  b=cNY3YZHs1+stnbUyT1o5gQUL/olP7W7PWzrxctS2N7euEJPfxdz98At+
   pYlXjsvf5Y1den+9F0uoJ50qaySevRnDdpB7mG5qz9Pc7S3tHYmUbFd4j
   3JFsNltKy0c3IKCFjAplyfdL4WhZojJMMf85iDpVm3whbwSA+qKWUJBJM
   u/0sKkFkNC9zXbqTzQFV2Ae0PLheeqZ3Kks6ga5xW4lYByEj9QhvZeJSG
   tMY9uVt3rzJF5nhhbJcuYWUfI3zOETSUtJqjQRFYS8rlEbJgZCqPvPrxQ
   vT8OZf6jJq7hwStTE05v8TLx2t6neBVChJ5gp+EnzBd5t+MlAhH6OeWdd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="356671000"
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="356671000"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 23:34:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="935680965"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 23:34:48 -0700
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
Date: Thu, 18 Aug 2022 14:34:45 +0800
In-Reply-To: <Yv1BJKb5he3dOHdC@xz-m1.local> (Peter Xu's message of "Wed, 17
	Aug 2022 15:27:32 -0400")
Message-ID: <87czcyawl6.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

> On Wed, Aug 17, 2022 at 02:41:19AM -0700, Nadav Amit wrote:
>> 4. Having multiple TLB flushing infrastructures makes all of these
>> discussions very complicated and unmaintainable. I need to convince myse=
lf
>> in every occasion (including this one) whether calls to
>> flush_tlb_batched_pending() and tlb_flush_pending() are needed or not.
>>=20
>> What I would like to have [3] is a single infrastructure that gets a
>> =E2=80=9Cticket=E2=80=9D (generation when the batching started), the old=
 PTE and the new PTE
>> and checks whether a TLB flush is needed based on the arch behavior and =
the
>> current TLB generation. If needed, it would update the =E2=80=9Cticket=
=E2=80=9D to the new
>> generation. Andy wanted a ring for pending TLB flushes, but I think it i=
s an
>> overkill with more overhead and complexity than needed.
>>=20
>> But the current situation in which every TLB flush is a basis for long
>> discussions and prone to bugs is impossible.
>>=20
>> I hope it helps. Let me know if you want me to revive the patch-set or o=
ther
>> feedback.
>>=20
>> [1] https://lore.kernel.org/all/20220711034615.482895-5-21cnbao@gmail.co=
m/
>> [2] https://lore.kernel.org/all/20220718120212.3180-13-namit@vmware.com/
>> [3] https://lore.kernel.org/all/20210131001132.3368247-16-namit@vmware.c=
om/
>
> I need more reading on tlb code and also [3] which looks useful to me.
> It's definitely sad to make tlb flushing so complicated.  It'll be great =
if
> things can be sorted out someday.
>
> In this specific case, the only way to do safe tlb batching in my mind is:
>
> 	pte_offset_map_lock();
> 	arch_enter_lazy_mmu_mode();
>         // If any pending tlb, do it now
>         if (mm_tlb_flush_pending())
> 		flush_tlb_range(vma, start, end);
>         else
>                 flush_tlb_batched_pending();

I don't think we need the above 4 lines.  Because we will flush TLB
before we access the pages.  Can you find any issue if we don't use the
above 4 lines?

Best Regards,
Huang, Ying

>         loop {
>                 ...
>                 pte =3D ptep_get_and_clear();
>                 ...
>                 if (pte_present())
>                         unmapped++;
>                 ...
>         }
> 	if (unmapped)
> 		flush_tlb_range(walk->vma, start, end);
> 	arch_leave_lazy_mmu_mode();
> 	pte_unmap_unlock();
>
> I may miss something, but even if not it already doesn't look pretty.
>
> Thanks,
