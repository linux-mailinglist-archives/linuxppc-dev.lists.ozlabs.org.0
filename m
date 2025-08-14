Return-Path: <linuxppc-dev+bounces-11009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D56B26758
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 15:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2mNN3wKWz30Sy;
	Thu, 14 Aug 2025 23:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755178276;
	cv=none; b=BUpsuI+7TqMeniwnQsBIdckthLrhJQ+L45p2iQyS6bscO5KJ8as5H6d45S2DaTIY8RC+DQ+8mvab7ptZ9G6fiQctWwEheauzsPj4BVob1B7NfXeTtITN8u2kSUq8GY2JHmdIeWfQ6A6csMgp5/yYMstyR0IbNl/oBnv9g9s5IU7iJ1GtssHayspZPxyFKPq1x8SFftSYCk17ejarCinSFJA4857r68aiE3DRltw52L1GL41jBRr3MnMCJ5SrxLtxk9kqGYnIZg0ZwtC8C16OJRMk/FjSI/DANVeWekkzT7xYcLOsXUYutj67LI5uFmSQ2JXGB6KHhVo/UlCG5TDUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755178276; c=relaxed/relaxed;
	bh=/aVLEAIiIUq96sEpteKq4xn0CYp2Pr/HhvYRjdNe/U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3AzfR/eGfg3g+CViK6F85eGQD1BNksxDM1ZwOHIiM16k0gtHSeVvtgsRDtu3VpjR0+P463TRs2/y6rBnQhYho6e+Zovniyl8xU96unZ5AN8UTU3wa/rpj8aYdO/bcw4WimXf3WW+w29VO5y73RrI9EjK1VOdw1FnvAezChYU4E+meZS56Zr+qnbBoyZHiMrYAJWu1L2jc9x25HEQjpDlQ2G99lmoL9BvXj+ssJQupikiChO91cAlpuUchNEtVw6avY2cia5T7njvxUFO+AmQwcjRr5tCp9EtVJpaEssuqcqev3HP61+3c0MxGsO4Wtpn6qZkB5YfbVQpk5R0Eu4Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XqHxW8YW; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XqHxW8YW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2mNM0TbZz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 23:31:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 766E96111F;
	Thu, 14 Aug 2025 13:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E81C4CEF1;
	Thu, 14 Aug 2025 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755178272;
	bh=WW0xB1u8XI1L1gGsXl6wpt3WDXrr4yCiJlHi7BUNlCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqHxW8YW58Ln/tIjnGi73wY9qD5/Iqkzwyv6qop3T0s5v319Ftg/c1ujK3/+Pmp3O
	 3SJY9d+x4hq26C9R4ldz3ap27JZ3CK6dbddTXlBk+z2z09uVrOYjtUFTpeGlFvgNjV
	 L1huyBWZL3RmFzTXcCZe8HHfxLc3AApxz5Ss7QLL+ussS/TR5qi1rfohz3kzvuYQXA
	 z9fOR+m/fazEworlcK45UcqDrJLI+rHyeuLbz0YS0ZizqgTQFWAKE1JSOTRnlpXZlF
	 3y7wTMxm2dgJYYjVCyrbQbIxiWn20GP+y7nUAEOT4RU14M4Kgk2W8/qCK/ckcjXpyq
	 NVGeZpIDI1XVQ==
Date: Thu, 14 Aug 2025 16:31:06 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 08/16] kmsan: convert kmsan_handle_dma to use physical
 addresses
Message-ID: <20250814133106.GE310013@unreal>
References: <cover.1754292567.git.leon@kernel.org>
 <5b40377b621e49ff4107fa10646c828ccc94e53e.1754292567.git.leon@kernel.org>
 <20250807122115.GH184255@nvidia.com>
 <20250813150718.GB310013@unreal>
 <20250814121316.GC699432@nvidia.com>
 <20250814123506.GD310013@unreal>
 <20250814124448.GE699432@nvidia.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814124448.GE699432@nvidia.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 09:44:48AM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 14, 2025 at 03:35:06PM +0300, Leon Romanovsky wrote:
> > > Then check attrs here, not pfn_valid.
> > 
> > attrs are not available in kmsan_handle_dma(). I can add it if you prefer.
> 
> That makes more sense to the overall design. The comments I gave
> before were driving at a promise to never try to touch a struct page
> for ATTR_MMIO and think this should be comphrensive to never touching
> a struct page even if pfnvalid.
> 
> > > > So let's keep this patch as is.
> > > 
> > > Still need to fix the remarks you clipped, do not check PageHighMem
> > > just call kmap_local_pfn(). All thie PageHighMem stuff is new to this
> > > patch and should not be here, it is the wrong way to use highmem.
> > 
> > Sure, thanks
> 
> I am wondering if there is some reason it was written like this in the
> first place. Maybe we can't even do kmap here.. So perhaps if there is
> not a strong reason to change it just continue to check pagehighmem
> and fail.
> 
> if (!(attrs & ATTR_MMIO) && PageHighMem(phys_to_page(phys)))
>    return;

Does this version good enough? There is no need to call to
kmap_local_pfn() if we prevent PageHighMem pages.

diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index eab7912a3bf0..d9cf70f4159c 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -337,13 +337,13 @@ static void kmsan_handle_dma_page(const void *addr, size_t size,

 /* Helper function to handle DMA data transfers. */
 void kmsan_handle_dma(phys_addr_t phys, size_t size,
-                     enum dma_data_direction dir)
+                     enum dma_data_direction dir, unsigned long attrs)
 {
        u64 page_offset, to_go, addr;
        struct page *page;
        void *kaddr;

-       if (!pfn_valid(PHYS_PFN(phys)))
+       if ((attrs & ATTR_MMIO) || PageHighMem(phys_to_page(phys)))
                return;

        page = phys_to_page(phys);
@@ -357,19 +357,12 @@ void kmsan_handle_dma(phys_addr_t phys, size_t size,
        while (size > 0) {
                to_go = min(PAGE_SIZE - page_offset, (u64)size);

-               if (PageHighMem(page))
-                       /* Handle highmem pages using kmap */
-                       kaddr = kmap_local_page(page);
-               else
-                       /* Lowmem pages can be accessed directly */
-                       kaddr = page_address(page);
+               /* Lowmem pages can be accessed directly */
+               kaddr = page_address(page);

                addr = (u64)kaddr + page_offset;
                kmsan_handle_dma_page((void *)addr, to_go, dir);

-               if (PageHighMem(page))
-                       kunmap_local(page);
-
                phys += to_go;
                size -= to_go;

(END)


> 
> Jason
> 

