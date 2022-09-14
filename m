Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C7D5B8F6A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 21:57:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSWMN4Dyfz3c1S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 05:57:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AiojQUMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AiojQUMq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSWLg4ntDz2xh0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:56:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB98161EA6;
	Wed, 14 Sep 2022 19:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E71C433C1;
	Wed, 14 Sep 2022 19:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663185398;
	bh=1DrhO9J6QoptsuptEgf0uLTwWzccKrsoDC0CgVBHBFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiojQUMqkHashxOR7ml2VpTipnwdPjbJUI6LJ9f3ZiTFndPx8DXl3z5j1RyHpM6aM
	 nuifkRvWDngygC3NWYkI5VGWjJbNVUdzTozwQQj+28BPQqxuYVmCEPaQVVLcZSfSN7
	 0ahzYcssRxvhLfEG3ZSogs+zYegUAomVRXSsRLxd8k7Mn1IVVfDPm7mdzTtImNF0p0
	 WcW7DwdSe/ozHTtAG12YS375kFDQXEv5DjL5nKa6NVLO6pDIFbSePqnQr6FI1yQ8qT
	 xKjBG8SKv5KgUCtp0lVMD3lrceb7jdoESdOMo92qSE4m0RYBI51WQgcIJBnVe0l61Z
	 ++gDpht0Ek8ag==
Received: by pali.im (Postfix)
	id F03A47B8; Wed, 14 Sep 2022 21:56:34 +0200 (CEST)
Date: Wed, 14 Sep 2022 21:56:34 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: Fragmented physical memory on powerpc/32
Message-ID: <20220914195634.fumjtflzetvy52fl@pali>
References: <20220908153511.57ceunyusziqfcav@pali>
 <20220908201701.sd3zqn5hfixmjvhh@pali>
 <9fbc5338-5e10-032a-8f55-e080bd93f74b@csgroup.eu>
 <Yx9GpV1XT8r2a++R@kernel.org>
 <20220912211623.djb7fckgknyfmof7@pali>
 <1c95875c-29f8-68b7-e480-fed8614f3037@csgroup.eu>
 <4f540391-37dc-8e22-be0a-74543082504d@csgroup.eu>
 <YyGfkDKgeW7/nNlr@kernel.org>
 <ed8ff681-4182-3f9f-a65f-21cf5012fff0@csgroup.eu>
 <9779CA34-E40D-4035-A319-A92D2F6E4DDF@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9779CA34-E40D-4035-A319-A92D2F6E4DDF@kernel.org>
User-Agent: NeoMutt/20180716
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "paulus@samba.org" <paulus@samba.org>, Ash Logan <ash@heyquark.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "j.ne@posteo.net" <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday 14 September 2022 16:55:04 Mike Rapoport wrote:
> On September 14, 2022 10:43:52 AM GMT+01:00, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> >
> >
> >Le 14/09/2022 à 11:32, Mike Rapoport a écrit :
> >> On Tue, Sep 13, 2022 at 02:36:13PM +0200, Christophe Leroy wrote:
> >>>
> >>>
> >>> Le 13/09/2022 à 08:11, Christophe Leroy a écrit :
> >>>>
> >>>>
> >>>> Le 12/09/2022 à 23:16, Pali Rohár a écrit :
> >>>>>>
> >>>>>> My guess would be that something went wrong in the linear map
> >>>>>> setup, but it
> >>>>>> won't hurt running with "memblock=debug" added to the kernel
> >>>>>> command line
> >>>>>> to see if there is anything suspicious there.
> >>>>>
> >>>>> Here is boot log on serial console with memblock=debug command line:
> >>>>>
> >>>> ...
> >>>>>
> >>>>> Do you need something more for debug?
> >>>>
> >>>> Can you send me the 'vmlinux' used to generate the above Oops so that I
> >>>> can see exactly where we are in function mem_init().
> >>>>
> >>>> And could you also try without CONFIG_HIGHMEM just in case.

Hello! I disabled CONFIG_HIGHMEM and there is no crash anymore. But
kernel see only 761160 kB of RAM, which is less than 3GB. I guess this
is expected.

> >>>>
> >>>
> >>> I looked at the vmlinux you sent me, the problem is in the loop for highmem
> >>> in mem_init(). It crashes in the call to free_highmem_page()
> >>>
> >>> #ifdef CONFIG_HIGHMEM
> >>> 	{
> >>> 		unsigned long pfn, highmem_mapnr;
> >>>
> >>> 		highmem_mapnr = lowmem_end_addr >> PAGE_SHIFT;
> >>> 		for (pfn = highmem_mapnr; pfn < max_mapnr; ++pfn) {
> >>> 			phys_addr_t paddr = (phys_addr_t)pfn << PAGE_SHIFT;
> >>> 			struct page *page = pfn_to_page(pfn);
> >>> 			if (!memblock_is_reserved(paddr))
> >>> 				free_highmem_page(page);
> >>> 		}
> >>> 	}
> >>> #endif /* CONFIG_HIGHMEM */
> >>>
> >>>
> >>> As far as I can see in the memblock debug lines, the holes don't seem to be
> >>> marked as reserved by memblock. So it is above valid ? Other architectures
> >>> seem to do differently.
> >>>
> >>> Can you try by replacing !memblock_is_reserved(paddr) by
> >>> memblock_is_memory(paddr) ?

I enabled CONFIG_HIGHMEM again, applied this change and kernel does not
crash too anymore. And it sees 3062896 kB of memory (in 'free' output).

So seems that this change fixed it.

I tried simple C program for allocating memory via malloc() and it
successfully allocated 2800 MB. If it tried to request/allocate more
then kernel started OOM killer which killed that program gracefully.
No kernel or HW crash.

Here is bootlog:

[    0.000000] memblock_alloc_try_nid: 8 bytes align=0x4 nid=-1 from=0x00000000 max_addr=0x00000000 smp_setup_cpu_maps+0x40/0x2b4
[    0.000000] memblock_reserve: [0x2fff5d74-0x2fff5d7b] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000]  (thread shift is 0)
[    0.000000] memblock_phys_free: [0x2fff5d74-0x2fff5d7b] setup_arch+0x1bc/0x318
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0xbe500000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x0000000010010108
[    0.000000]   possible        = 0x0000000010010108
[    0.000000]   always          = 0x0000000010010108
[    0.000000] cpu_user_features = 0x84e08000 0x08000000
[    0.000000] mmu_features      = 0x00020010
[    0.000000] -----------------------------------------------------
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2fff2000-0x2fff3fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2fff0000-0x2fff1fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffee000-0x2ffeffff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffec000-0x2ffedfff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffea000-0x2ffebfff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe8000-0x2ffe9fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe6000-0x2ffe7fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe4000-0x2ffe5fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe2000-0x2ffe3fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe0000-0x2ffe1fff] memblock_alloc_range_nid+0xe8/0x1b0
mpc85xx_rdb_setup_arch()
[    0.000000] ioremap() called early from of_iomap+0x48/0x80. Use early_ioremap() instead
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x00000000 max_addr=0x00000000 early_pte_alloc_kernel+0x3c/0x90
[    0.000000] memblock_reserve: [0x2fff4000-0x2fff4fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] MPC85xx RDB board from Freescale Semiconductor
[    0.000000] barrier-nospec: using isync; sync as speculation barrier
[    0.000000] barrier-nospec: patched 182 locations
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x00000000 max_addr=0x00000000 early_pte_alloc_kernel+0x3c/0x90
[    0.000000] memblock_reserve: [0x2ffdf000-0x2ffdffff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] Top of RAM: 0xff700000, Total RAM: 0xbe500000
[    0.000000] Memory hole size: 1042MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   HighMem  [mem 0x0000000030000000-0x00000000ff6fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000]   node   0: [mem 0x00000000c0200000-0x00000000eeffffff]
[    0.000000]   node   0: [mem 0x00000000f0000000-0x00000000ff6fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000ff6fffff]
[    0.000000] memblock_alloc_try_nid_raw: 37675008 bytes align=0x20 nid=0 from=0x00000000 max_addr=0x00000000 free_area_init+0x890/0xc94
[    0.000000] memblock_reserve: [0x2dbf1000-0x2ffdefff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=0 from=0x00000000 max_addr=0x00000000 setup_usemap+0x60/0xa0
[    0.000000] memblock_reserve: [0x2fff5d00-0x2fff5d5f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 416 bytes align=0x20 nid=0 from=0x00000000 max_addr=0x00000000 setup_usemap+0x60/0xa0
[    0.000000] memblock_reserve: [0x2fff5b60-0x2fff5cff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 32 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 mmu_context_init+0x38/0x154
[    0.000000] memblock_reserve: [0x2fff5b40-0x2fff5b5f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 1024 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 mmu_context_init+0x7c/0x154
[    0.000000] memblock_reserve: [0x2fff5740-0x2fff5b3f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 32 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 mmu_context_init+0xc4/0x154
[    0.000000] memblock_reserve: [0x2fff5720-0x2fff573f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] MMU: Allocated 1088 bytes of context maps for 255 contexts
[    0.000000] memblock_alloc_try_nid: 111 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 start_kernel+0x194/0x6d0
[    0.000000] memblock_reserve: [0x2fff56a0-0x2fff570e] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 111 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 start_kernel+0x1c0/0x6d0
[    0.000000] memblock_reserve: [0x2fff5620-0x2fff568e] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_embed_first_chunk+0x314/0x7b4
[    0.000000] memblock_reserve: [0x2dbf0000-0x2dbf0fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_embed_first_chunk+0x4d4/0x7b4
[    0.000000] memblock_reserve: [0x2dbef000-0x2dbeffff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 90112 bytes align=0x1000 nid=-1 from=0x3fffffff max_addr=0x00000000 pcpu_embed_first_chunk+0x564/0x7b4
[    0.000000] memblock_reserve: [0x2dbd9000-0x2dbeefff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_phys_free: [0x2dbe4000-0x2dbe3fff] pcpu_embed_first_chunk+0x680/0x7b4
[    0.000000] memblock_phys_free: [0x2dbef000-0x2dbeefff] pcpu_embed_first_chunk+0x680/0x7b4
[    0.000000] percpu: Embedded 11 pages/cpu s14196 r8192 d22668 u45056
[    0.000000] memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x37c/0x924
[    0.000000] memblock_reserve: [0x2fff5d60-0x2fff5d63] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x3a4/0x924
[    0.000000] memblock_reserve: [0x2fff5600-0x2fff5603] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x3cc/0x924
[    0.000000] memblock_reserve: [0x2fff55e0-0x2fff55e7] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x3f4/0x924
[    0.000000] memblock_reserve: [0x2fff55c0-0x2fff55c7] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] pcpu-alloc: s14196 r8192 d22668 u45056 alloc=11*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] memblock_alloc_try_nid: 136 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x7fc/0x924
[    0.000000] memblock_reserve: [0x2fff5520-0x2fff55a7] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x64/0x2e0
[    0.000000] memblock_reserve: [0x2fff54c0-0x2fff551f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 384 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xc4/0x2e0
[    0.000000] memblock_reserve: [0x2fff5340-0x2fff54bf] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 388 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xf0/0x2e0
[    0.000000] memblock_reserve: [0x2fff51a0-0x2fff5323] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x11c/0x2e0
[    0.000000] memblock_reserve: [0x2fff5140-0x2fff519f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x64/0x2e0
[    0.000000] memblock_reserve: [0x2fff50e0-0x2fff513f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 768 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xc4/0x2e0
[    0.000000] memblock_reserve: [0x2dbd8d00-0x2dbd8fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 772 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xf0/0x2e0
[    0.000000] memblock_reserve: [0x2dbd89e0-0x2dbd8ce3] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 192 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x11c/0x2e0
[    0.000000] memblock_reserve: [0x2fff5020-0x2fff50df] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_phys_free: [0x2dbf0000-0x2dbf0fff] pcpu_embed_first_chunk+0x744/0x7b4
[    0.000000] memblock_phys_free: [0x2dbef000-0x2dbeffff] pcpu_embed_first_chunk+0x754/0x7b4
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 777792
[    0.000000] Kernel command line: root=ubi0:rootfs rootfstype=ubifs ubi.mtd=rootfs rootflags=chk_data_crc rw console=ttyS0,115200 memblock=debug
[    0.000000] memblock_alloc_try_nid: 524288 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_large_system_hash+0x1a4/0x2ec
[    0.000000] memblock_reserve: [0x2db589e0-0x2dbd89df] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] memblock_alloc_try_nid: 262144 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_large_system_hash+0x1a4/0x2ec
[    0.000000] memblock_reserve: [0x2db189e0-0x2db589df] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xffbbf000..0xfffff000  : fixmap
[    0.000000]   * 0xff400000..0xff800000  : highmem PTEs
[    0.000000]   * 0xff3fe000..0xff400000  : early ioremap
[    0.000000]   * 0xf1000000..0xff3fe000  : vmalloc & ioremap
[    0.000000] Memory: 3062620K/3118080K available (10732K kernel code, 712K rwdata, 2044K rodata, 276K init, 287K bss, 55460K reserved, 0K cma-reserved, 2331648K highmem)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=2, Nodes=1

> >> 
> >> The holes should not be marked as reserved, we just need to loop over the
> >> memory ranges rather than over pfns. Then the holes will be taken into
> >> account.
> >> 
> >> I believe arm and xtensa got this right:
> >> 
> >> (from arch/arm/mm/init.c)
> >> 
> >> static void __init free_highpages(void)
> >> {
> >> #ifdef CONFIG_HIGHMEM
> >> 	unsigned long max_low = max_low_pfn;
> >> 	phys_addr_t range_start, range_end;
> >> 	u64 i;
> >> 
> >> 	/* set highmem page free */
> >> 	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE,
> >> 				&range_start, &range_end, NULL) {
> >> 		unsigned long start = PFN_UP(range_start);
> >> 		unsigned long end = PFN_DOWN(range_end);
> >> 
> >> 		/* Ignore complete lowmem entries */
> >> 		if (end <= max_low)
> >> 			continue;
> >> 
> >> 		/* Truncate partial highmem entries */
> >> 		if (start < max_low)
> >> 			start = max_low;
> >> 
> >> 		for (; start < end; start++)
> >> 			free_highmem_page(pfn_to_page(start));
> >> 	}
> >> #endif
> >> }
> >> 
> >
> >
> >And what about the way MIPS does it ?
> >
> >static inline void __init mem_init_free_highmem(void)
> >{
> >#ifdef CONFIG_HIGHMEM
> >	unsigned long tmp;
> >
> >	if (cpu_has_dc_aliases)
> >		return;
> >
> >	for (tmp = highstart_pfn; tmp < highend_pfn; tmp++) {
> >		struct page *page = pfn_to_page(tmp);
> >
> >		if (!memblock_is_memory(PFN_PHYS(tmp)))
> >			SetPageReserved(page);
> >		else
> >			free_highmem_page(page);
> >	}
> >#endif
> >}
> 
> This iterates over all PFNs in the highmem range and skips those in holes.
> for_each_free_mem_range() skips the holes altogether.
> 
> Largely, I think we need to move, say, arm's version to mm/ and use it everywhere, except, perhaps, x86.

I tried to replace quoted powerpc CONFIG_HIGHMEM code by above arm code
and it worked fine too! No kernel crash anymore. But 'free' see only
3062888 kB of total memory. Which is less then with the first
workaround.

Here is bootlog:

[    0.000000] memblock_alloc_try_nid: 8 bytes align=0x4 nid=-1 from=0x00000000 max_addr=0x00000000 smp_setup_cpu_maps+0x40/0x2b4
[    0.000000] memblock_reserve: [0x2fff5d74-0x2fff5d7b] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000]  (thread shift is 0)
[    0.000000] memblock_phys_free: [0x2fff5d74-0x2fff5d7b] setup_arch+0x1bc/0x318
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0xbe500000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x0000000010010108
[    0.000000]   possible        = 0x0000000010010108
[    0.000000]   always          = 0x0000000010010108
[    0.000000] cpu_user_features = 0x84e08000 0x08000000
[    0.000000] mmu_features      = 0x00020010
[    0.000000] -----------------------------------------------------
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2fff2000-0x2fff3fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2fff0000-0x2fff1fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffee000-0x2ffeffff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffec000-0x2ffedfff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffea000-0x2ffebfff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe8000-0x2ffe9fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe6000-0x2ffe7fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe4000-0x2ffe5fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe2000-0x2ffe3fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe0000-0x2ffe1fff] memblock_alloc_range_nid+0xe8/0x1b0
mpc85xx_rdb_setup_arch()
[    0.000000] ioremap() called early from of_iomap+0x48/0x80. Use early_ioremap() instead
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x00000000 max_addr=0x00000000 early_pte_alloc_kernel+0x3c/0x90
[    0.000000] memblock_reserve: [0x2fff4000-0x2fff4fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] MPC85xx RDB board from Freescale Semiconductor
[    0.000000] barrier-nospec: using isync; sync as speculation barrier
[    0.000000] barrier-nospec: patched 182 locations
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x00000000 max_addr=0x00000000 early_pte_alloc_kernel+0x3c/0x90
[    0.000000] memblock_reserve: [0x2ffdf000-0x2ffdffff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] Top of RAM: 0xff700000, Total RAM: 0xbe500000
[    0.000000] Memory hole size: 1042MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   HighMem  [mem 0x0000000030000000-0x00000000ff6fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000]   node   0: [mem 0x00000000c0200000-0x00000000eeffffff]
[    0.000000]   node   0: [mem 0x00000000f0000000-0x00000000ff6fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000ff6fffff]
[    0.000000] memblock_alloc_try_nid_raw: 37675008 bytes align=0x20 nid=0 from=0x00000000 max_addr=0x00000000 free_area_init+0x890/0xc94
[    0.000000] memblock_reserve: [0x2dbf1000-0x2ffdefff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=0 from=0x00000000 max_addr=0x00000000 setup_usemap+0x60/0xa0
[    0.000000] memblock_reserve: [0x2fff5d00-0x2fff5d5f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 416 bytes align=0x20 nid=0 from=0x00000000 max_addr=0x00000000 setup_usemap+0x60/0xa0
[    0.000000] memblock_reserve: [0x2fff5b60-0x2fff5cff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 32 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 mmu_context_init+0x38/0x154
[    0.000000] memblock_reserve: [0x2fff5b40-0x2fff5b5f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 1024 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 mmu_context_init+0x7c/0x154
[    0.000000] memblock_reserve: [0x2fff5740-0x2fff5b3f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 32 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 mmu_context_init+0xc4/0x154
[    0.000000] memblock_reserve: [0x2fff5720-0x2fff573f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] MMU: Allocated 1088 bytes of context maps for 255 contexts
[    0.000000] memblock_alloc_try_nid: 111 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 start_kernel+0x194/0x6d0
[    0.000000] memblock_reserve: [0x2fff56a0-0x2fff570e] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 111 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 start_kernel+0x1c0/0x6d0
[    0.000000] memblock_reserve: [0x2fff5620-0x2fff568e] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_embed_first_chunk+0x314/0x7b4
[    0.000000] memblock_reserve: [0x2dbf0000-0x2dbf0fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_embed_first_chunk+0x4d4/0x7b4
[    0.000000] memblock_reserve: [0x2dbef000-0x2dbeffff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 90112 bytes align=0x1000 nid=-1 from=0x3fffffff max_addr=0x00000000 pcpu_embed_first_chunk+0x564/0x7b4
[    0.000000] memblock_reserve: [0x2dbd9000-0x2dbeefff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_phys_free: [0x2dbe4000-0x2dbe3fff] pcpu_embed_first_chunk+0x680/0x7b4
[    0.000000] memblock_phys_free: [0x2dbef000-0x2dbeefff] pcpu_embed_first_chunk+0x680/0x7b4
[    0.000000] percpu: Embedded 11 pages/cpu s14196 r8192 d22668 u45056
[    0.000000] memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x37c/0x924
[    0.000000] memblock_reserve: [0x2fff5d60-0x2fff5d63] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x3a4/0x924
[    0.000000] memblock_reserve: [0x2fff5600-0x2fff5603] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x3cc/0x924
[    0.000000] memblock_reserve: [0x2fff55e0-0x2fff55e7] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x3f4/0x924
[    0.000000] memblock_reserve: [0x2fff55c0-0x2fff55c7] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] pcpu-alloc: s14196 r8192 d22668 u45056 alloc=11*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] memblock_alloc_try_nid: 136 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x7fc/0x924
[    0.000000] memblock_reserve: [0x2fff5520-0x2fff55a7] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x64/0x2e0
[    0.000000] memblock_reserve: [0x2fff54c0-0x2fff551f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 384 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xc4/0x2e0
[    0.000000] memblock_reserve: [0x2fff5340-0x2fff54bf] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 388 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xf0/0x2e0
[    0.000000] memblock_reserve: [0x2fff51a0-0x2fff5323] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x11c/0x2e0
[    0.000000] memblock_reserve: [0x2fff5140-0x2fff519f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x64/0x2e0
[    0.000000] memblock_reserve: [0x2fff50e0-0x2fff513f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 768 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xc4/0x2e0
[    0.000000] memblock_reserve: [0x2dbd8d00-0x2dbd8fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 772 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xf0/0x2e0
[    0.000000] memblock_reserve: [0x2dbd89e0-0x2dbd8ce3] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 192 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x11c/0x2e0
[    0.000000] memblock_reserve: [0x2fff5020-0x2fff50df] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_phys_free: [0x2dbf0000-0x2dbf0fff] pcpu_embed_first_chunk+0x744/0x7b4
[    0.000000] memblock_phys_free: [0x2dbef000-0x2dbeffff] pcpu_embed_first_chunk+0x754/0x7b4
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 777792
[    0.000000] Kernel command line: root=ubi0:rootfs rootfstype=ubifs ubi.mtd=rootfs rootflags=chk_data_crc rw console=ttyS0,115200 memblock=debug
[    0.000000] memblock_alloc_try_nid: 524288 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_large_system_hash+0x1a4/0x2ec
[    0.000000] memblock_reserve: [0x2db589e0-0x2dbd89df] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] memblock_alloc_try_nid: 262144 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_large_system_hash+0x1a4/0x2ec
[    0.000000] memblock_reserve: [0x2db189e0-0x2db589df] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xffbbf000..0xfffff000  : fixmap
[    0.000000]   * 0xff400000..0xff800000  : highmem PTEs
[    0.000000]   * 0xff3fe000..0xff400000  : early ioremap
[    0.000000]   * 0xf1000000..0xff3fe000  : vmalloc & ioremap
[    0.000000] Memory: 3062612K/3118080K available (10732K kernel code, 712K rwdata, 2044K rodata, 276K init, 287K bss, 55468K reserved, 0K cma-reserved, 2331640K highmem)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=2, Nodes=1

> >Christophe
> -- 
> Sincerely yours,
> Mike
