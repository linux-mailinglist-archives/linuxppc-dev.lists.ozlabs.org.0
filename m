Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB45B8505
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 11:32:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSFVh6TbVz3c6f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 19:32:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P4VT86Vo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P4VT86Vo;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSFV56p03z2y6N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 19:32:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EA351B818C8;
	Wed, 14 Sep 2022 09:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81BCC433C1;
	Wed, 14 Sep 2022 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663147929;
	bh=JxlkMJhrFSFFd6GtkvF2gyR+Kxu6WhW64tS/6rm9TXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4VT86VowfQcbzvjW0VcEym36mb1+PciD6o1k2Ls4HXI16wpqJUhc88Y9UO21msye
	 iK2VrEdALff3PJtBFLmKtHOT21Rv+nhUeksgnAh5WK4MUB6zpAa5LIIpZ8wJfIxzYv
	 s87uj3ntbf0XzWLqV0srU0WXMN7HxEQlvfNmkdzaGwXdrs5kUej1MrPlcGuWjJvW+B
	 SwZ9yXZSbP8xhbJ+MahdrMxL7/gzksicAScx6D0kVcSDIwEWDTRXkOq5OzgUj6kyOb
	 Y1NEyatobrXNErnt13KtwctAj/yJNvJYoXFJyKvXnBxWLhMH4Cm+44cUDa0/9x+kop
	 eGqJPEhGG6tkg==
Date: Wed, 14 Sep 2022 10:32:00 +0100
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Fragmented physical memory on powerpc/32
Message-ID: <YyGfkDKgeW7/nNlr@kernel.org>
References: <20220609222420.ponpoodiqmaqtwht@pali>
 <20220808184034.lskqrk6z3gb5q76r@pali>
 <219cda7b-da4b-7a5a-9809-0878e0fc02ba@csgroup.eu>
 <20220908153511.57ceunyusziqfcav@pali>
 <20220908201701.sd3zqn5hfixmjvhh@pali>
 <9fbc5338-5e10-032a-8f55-e080bd93f74b@csgroup.eu>
 <Yx9GpV1XT8r2a++R@kernel.org>
 <20220912211623.djb7fckgknyfmof7@pali>
 <1c95875c-29f8-68b7-e480-fed8614f3037@csgroup.eu>
 <4f540391-37dc-8e22-be0a-74543082504d@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f540391-37dc-8e22-be0a-74543082504d@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "paulus@samba.org" <paulus@samba.org>, Ash Logan <ash@heyquark.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "j.ne@posteo.net" <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 13, 2022 at 02:36:13PM +0200, Christophe Leroy wrote:
> 
> 
> Le 13/09/2022 à 08:11, Christophe Leroy a écrit :
> > 
> > 
> > Le 12/09/2022 à 23:16, Pali Rohár a écrit :
> > > > 
> > > > My guess would be that something went wrong in the linear map
> > > > setup, but it
> > > > won't hurt running with "memblock=debug" added to the kernel
> > > > command line
> > > > to see if there is anything suspicious there.
> > > 
> > > Here is boot log on serial console with memblock=debug command line:
> > > 
> > ...
> > > 
> > > Do you need something more for debug?
> > 
> > Can you send me the 'vmlinux' used to generate the above Oops so that I
> > can see exactly where we are in function mem_init().
> > 
> > And could you also try without CONFIG_HIGHMEM just in case.
> > 
> 
> I looked at the vmlinux you sent me, the problem is in the loop for highmem
> in mem_init(). It crashes in the call to free_highmem_page()
> 
> #ifdef CONFIG_HIGHMEM
> 	{
> 		unsigned long pfn, highmem_mapnr;
> 
> 		highmem_mapnr = lowmem_end_addr >> PAGE_SHIFT;
> 		for (pfn = highmem_mapnr; pfn < max_mapnr; ++pfn) {
> 			phys_addr_t paddr = (phys_addr_t)pfn << PAGE_SHIFT;
> 			struct page *page = pfn_to_page(pfn);
> 			if (!memblock_is_reserved(paddr))
> 				free_highmem_page(page);
> 		}
> 	}
> #endif /* CONFIG_HIGHMEM */
> 
> 
> As far as I can see in the memblock debug lines, the holes don't seem to be
> marked as reserved by memblock. So it is above valid ? Other architectures
> seem to do differently.
> 
> Can you try by replacing !memblock_is_reserved(paddr) by
> memblock_is_memory(paddr) ?

The holes should not be marked as reserved, we just need to loop over the
memory ranges rather than over pfns. Then the holes will be taken into
account.

I believe arm and xtensa got this right:

(from arch/arm/mm/init.c)

static void __init free_highpages(void)
{
#ifdef CONFIG_HIGHMEM
	unsigned long max_low = max_low_pfn;
	phys_addr_t range_start, range_end;
	u64 i;

	/* set highmem page free */
	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE,
				&range_start, &range_end, NULL) {
		unsigned long start = PFN_UP(range_start);
		unsigned long end = PFN_DOWN(range_end);

		/* Ignore complete lowmem entries */
		if (end <= max_low)
			continue;

		/* Truncate partial highmem entries */
		if (start < max_low)
			start = max_low;

		for (; start < end; start++)
			free_highmem_page(pfn_to_page(start));
	}
#endif
}

 
> Thanks
> Christophe
> 

-- 
Sincerely yours,
Mike.
