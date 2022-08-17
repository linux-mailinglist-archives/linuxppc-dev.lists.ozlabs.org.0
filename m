Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36414596A39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 09:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6zrq07rxz3dsP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 17:18:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JAm/EgBf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ying.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JAm/EgBf;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6zqS0B7Jz3cKB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 17:17:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660720644; x=1692256644;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=ZS9/pnsjWMHpVVY5COIkT1/+PC3cjs3sNi1oR7AcMOA=;
  b=JAm/EgBf/8+1X2x/EDEhSSbv8f6LQxpBRNC9a0Ocma+D+FL5iy5r4YyU
   Z2CpxG/SrSRJuu07gelLeKSxEGF2B5FNQfL19c87+vGtHuyF0c50ca9Pe
   XBKMiGuOTKKv+9EnuDV02x3NteZ0IriopzXMTQ6pnBBS1AK6NtfMP+edh
   zUZ5q4gCJpJTuSRcGaMM8DqTFR7Xq7y6URthdfFobYpztfAdL332kvP5y
   hbaYc3IWZnvfBwwVj1O+1QtUdaTwiK5GNWc6p8o5gt3mmyYgRf/L9CI27
   WB7jGxbDD6dQbXHHwj2K7HNDowVb9w88wEmPfeJuCc2nCUVqU8xx5HIfA
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="378715613"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="378715613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 00:17:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="749605160"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 00:17:16 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Alistair Popple <apopple@nvidia.com>, Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
References: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
	<CAC=cRTPGiXWjk=CYnCrhJnLx3mdkGDXZpvApo6yTbeW7+ZGajA@mail.gmail.com>
	<Yvv/eGfi3LW8WxPZ@xz-m1.local> <871qtfvdlw.fsf@nvdebian.thelocal>
	<YvxWUY9eafFJ27ef@xz-m1.local> <87o7wjtn2g.fsf@nvdebian.thelocal>
Date: Wed, 17 Aug 2022 15:17:04 +0800
In-Reply-To: <87o7wjtn2g.fsf@nvdebian.thelocal> (Alistair Popple's message of
	"Wed, 17 Aug 2022 15:41:16 +1000")
Message-ID: <87tu6bbaq7.fsf@yhuang6-desk2.ccr.corp.intel.com>
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
Cc: "Sierra
 Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple <apopple@nvidia.com> writes:

> Peter Xu <peterx@redhat.com> writes:
>
>> On Wed, Aug 17, 2022 at 11:49:03AM +1000, Alistair Popple wrote:
>>>
>>> Peter Xu <peterx@redhat.com> writes:
>>>
>>> > On Tue, Aug 16, 2022 at 04:10:29PM +0800, huang ying wrote:
>>> >> > @@ -193,11 +194,10 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>> >> >                         bool anon_exclusive;
>>> >> >                         pte_t swp_pte;
>>> >> >
>>> >> > +                       flush_cache_page(vma, addr, pte_pfn(*ptep));
>>> >> > +                       pte = ptep_clear_flush(vma, addr, ptep);
>>> >>
>>> >> Although I think it's possible to batch the TLB flushing just before
>>> >> unlocking PTL.  The current code looks correct.
>>> >
>>> > If we're with unconditionally ptep_clear_flush(), does it mean we should
>>> > probably drop the "unmapped" and the last flush_tlb_range() already since
>>> > they'll be redundant?
>>>
>>> This patch does that, unless I missed something?
>>
>> Yes it does.  Somehow I didn't read into the real v2 patch, sorry!
>>
>>>
>>> > If that'll need to be dropped, it looks indeed better to still keep the
>>> > batch to me but just move it earlier (before unlock iiuc then it'll be
>>> > safe), then we can keep using ptep_get_and_clear() afaiu but keep "pte"
>>> > updated.
>>>
>>> I think we would also need to check should_defer_flush(). Looking at
>>> try_to_unmap_one() there is this comment:
>>>
>>> 			if (should_defer_flush(mm, flags) && !anon_exclusive) {
>>> 				/*
>>> 				 * We clear the PTE but do not flush so potentially
>>> 				 * a remote CPU could still be writing to the folio.
>>> 				 * If the entry was previously clean then the
>>> 				 * architecture must guarantee that a clear->dirty
>>> 				 * transition on a cached TLB entry is written through
>>> 				 * and traps if the PTE is unmapped.
>>> 				 */
>>>
>>> And as I understand it we'd need the same guarantee here. Given
>>> try_to_migrate_one() doesn't do batched TLB flushes either I'd rather
>>> keep the code as consistent as possible between
>>> migrate_vma_collect_pmd() and try_to_migrate_one(). I could look at
>>> introducing TLB flushing for both in some future patch series.
>>
>> should_defer_flush() is TTU-specific code?
>
> I'm not sure, but I think we need the same guarantee here as mentioned
> in the comment otherwise we wouldn't see a subsequent CPU write that
> could dirty the PTE after we have cleared it but before the TLB flush.
>
> My assumption was should_defer_flush() would ensure we have that
> guarantee from the architecture, but maybe there are alternate/better
> ways of enforcing that?
>> IIUC the caller sets TTU_BATCH_FLUSH showing that tlb can be omitted since
>> the caller will be responsible for doing it.  In migrate_vma_collect_pmd()
>> iiuc we don't need that hint because it'll be flushed within the same
>> function but just only after the loop of modifying the ptes.  Also it'll be
>> with the pgtable lock held.
>
> Right, but the pgtable lock doesn't protect against HW PTE changes such
> as setting the dirty bit so we need to ensure the HW does the right
> thing here and I don't know if all HW does.

This sounds sensible.  But I take a look at zap_pte_range(), and find
that it appears that the implementation requires the PTE dirty bit to be
write-through.  Do I miss something?

Hi, Nadav, Can you help?

Best Regards,
Huang, Ying

[snip]
