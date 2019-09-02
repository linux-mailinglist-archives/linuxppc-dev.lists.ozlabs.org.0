Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972BA59F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 16:57:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MY913FjTzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 00:57:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46MY5y1jHGzDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 00:54:59 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66DF344;
 Mon,  2 Sep 2019 07:54:55 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BC303F59C;
 Mon,  2 Sep 2019 07:54:54 -0700 (PDT)
Date: Mon, 2 Sep 2019 15:54:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v6 1/5] kasan: support backing vmalloc space with real
 shadow memory
Message-ID: <20190902145445.GA12400@lakrids.cambridge.arm.com>
References: <20190902112028.23773-1-dja@axtens.net>
 <20190902112028.23773-2-dja@axtens.net>
 <20190902132220.GA9922@lakrids.cambridge.arm.com>
 <87pnkiu5ta.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnkiu5ta.fsf@dja-thinkpad.axtens.net>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
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
Cc: gor@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com,
 luto@kernel.org, aryabinin@virtuozzo.com, linuxppc-dev@lists.ozlabs.org,
 dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2019 at 12:32:49AM +1000, Daniel Axtens wrote:
> Hi Mark,
> 
> >> +static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
> >> +					void *unused)
> >> +{
> >> +	unsigned long page;
> >> +
> >> +	page = (unsigned long)__va(pte_pfn(*ptep) << PAGE_SHIFT);
> >> +
> >> +	spin_lock(&init_mm.page_table_lock);
> >> +
> >> +	if (likely(!pte_none(*ptep))) {
> >> +		pte_clear(&init_mm, addr, ptep);
> >> +		free_page(page);
> >> +	}
> >> +	spin_unlock(&init_mm.page_table_lock);
> >> +
> >> +	return 0;
> >> +}
> >
> > There needs to be TLB maintenance after unmapping the page, but I don't
> > see that happening below.
> >
> > We need that to ensure that errant accesses don't hit the page we're
> > freeing and that new mappings at the same VA don't cause a TLB conflict
> > or TLB amalgamation issue.
> 
> Darn it, I knew there was something I forgot to do! I thought of that
> over the weekend, didn't write it down, and then forgot it when I went
> to respin the patches. You're totally right.
> 
> >
> >> +/*
> >> + * Release the backing for the vmalloc region [start, end), which
> >> + * lies within the free region [free_region_start, free_region_end).
> >> + *
> >> + * This can be run lazily, long after the region was freed. It runs
> >> + * under vmap_area_lock, so it's not safe to interact with the vmalloc/vmap
> >> + * infrastructure.
> >> + */
> >
> > IIUC we aim to only free non-shared shadow by aligning the start
> > upwards, and aligning the end downwards. I think it would be worth
> > mentioning that explicitly in the comment since otherwise it's not
> > obvious how we handle races between alloc/free.
> >
> 
> Oh, I will need to think through that more carefully.
> 
> I think the vmap_area_lock protects us against alloc/free races.

AFAICT, on the alloc side we only hold the vmap_area_lock while
allocating the area in __get_vm_area_node(), but we don't holding the
vmap_area_lock while we populate the page tables for the shadow in
kasan_populate_vmalloc().

So I believe that kasan_populate_vmalloc() can race with
kasan_release_vmalloc().

> I think alignment operates at least somewhat as you've described, and
> while it is important for correctness, I'm not sure I'd say it
> prevented races? I will double check my understanding of
> vmap_area_lock, and I agree the comment needs to be much clearer.

I had assumed that you were trying to only free pages which were
definitely not shared (for which there couldn't possibly be a race to
allocate), by looking at the sibling areas to see if they potentially
overlapped.

Was that not the case?

Thanks,
Mark.
