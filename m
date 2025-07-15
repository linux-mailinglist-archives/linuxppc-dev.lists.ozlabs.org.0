Return-Path: <linuxppc-dev+bounces-10254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918DB05EF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 15:58:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhLPm3Kc6z30Tf;
	Tue, 15 Jul 2025 23:58:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752587916;
	cv=none; b=Xd9dVsEUU99lAtGqi5rdtFVddDrjkkptfuzzwuzTmu7nhEeqhUcwnbBKX6H3V+xpVXMdy4LuDxuq5IfHrIPq0/UAy0bVaIcaSSI04nThzsn49UtnIQQndBqBRm3mQ8zwmjoo+2FuKvWdPPzkeUUXGmKcZS0MRFb4kDYMo4kdtPY8bh5MZ2+Qpz3Ztrgzh9FDYmfMXuIxAnO4qJ4MuqEEXjnJNDU1EavX4CMET3RQAQfs28rZt91+FsuEGZO6paeIbNgMISIkLf+fUyQ+KmzQ5G5U8c/YQcxkTsI4CezQP3N5fbPFyC5StMdmj8jHCm2LzB0N15n6F9XxATsenTftHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752587916; c=relaxed/relaxed;
	bh=6nnCBwHTAKrHqcmaMGyNrB/ejXN9Xrce25gHVuAIWJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxDWxHBGEWh9deq9/UyKbRRfQCzvCDKjooFXbXeT6V3pIZhVV0O1+g4B0NrFYP6FwZEDdHYX4C1E2NWvqcc/NHGRI3i2IM2QaDx72Qr/OwfsYqIA1Bh/7ddiuDP3Ry+A43yLgSlE4cNyGIC+gDhbnbMsq14EztRrjt3IkHwNkVm1MiTgo/NLPYo5ohgC2jmMMI3WL3bnh+GPJpEiHomwQEMaxCTGbBLOXp3vct4zMNUTKeJjj2T0jhKabcmZdF8+QAGKJKqLfFsoRVSL3qrVE3HFJJCW33khrK1iDDIZYSs0UrVEXHwBJX4nQeLeUgLv2aokG7Y29uEmjXaNUKUl0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l4Vizggn; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l4Vizggn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhLPl4Lrtz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 23:58:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9366FA5710B;
	Tue, 15 Jul 2025 13:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E39CC4CEE3;
	Tue, 15 Jul 2025 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752587913;
	bh=fxS+g8tNbMk1/UdhRU/HlLfSUskJDrVIrYOCQQhuqIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4VizggnWo1DpwbZuWP/wgm3VApTeTCEOnymfwBXT+GilXimDEQE0iPIBqdfv6kCi
	 kvrSMjoaH00P8jMdB4VBav7nnidtnHwAto4lOKuhIXdRUv9zLac0k9qGP1dt9vU+Kx
	 besMzcLyEY6CL3CXJ/iulu2Ux2wmI6rIlbokZUIfssTq+7xCt4aR4/gUg5F8zwheNy
	 38Z2YuBFkCPHKo42aC2RxBV7YCSsmJFp5Nn2VHoOI+x4EAhgotJS6lFClihLkokNmk
	 clpPZozDwuZYTrNm/DjfETz/I7kal1xj7ibFiF39RZ8jyeg3fbnaBQWAnL0Q+x4geu
	 jTleqek0Z+P7g==
Date: Tue, 15 Jul 2025 16:58:28 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 8/8] mm/hmm: migrate to physical address-based DMA
 mapping API
Message-ID: <20250715135828.GE5882@unreal>
References: <cover.1750854543.git.leon@kernel.org>
 <8a85f4450905fcb6b17d146cc86c11410d522de4.1750854543.git.leon@kernel.org>
 <aHZWlu7Td9ijFhhh@willie-the-truck>
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
In-Reply-To: <aHZWlu7Td9ijFhhh@willie-the-truck>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 02:24:38PM +0100, Will Deacon wrote:
> Hi Leon,
> 
> On Wed, Jun 25, 2025 at 04:19:05PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Convert HMM DMA operations from the legacy page-based API to the new
> > physical address-based dma_map_phys() and dma_unmap_phys() functions.
> > This demonstrates the preferred approach for new code that should use
> > physical addresses directly rather than page+offset parameters.
> > 
> > The change replaces dma_map_page() and dma_unmap_page() calls with
> > dma_map_phys() and dma_unmap_phys() respectively, using the physical
> > address that was already available in the code. This eliminates the
> > redundant page-to-physical address conversion and aligns with the
> > DMA subsystem's move toward physical address-centric interfaces.
> > 
> > This serves as an example of how new code should be written to leverage
> > the more efficient physical address API, which provides cleaner interfaces
> > for drivers that already have access to physical addresses.
> 
> I'm struggling a little to see how this is cleaner or more efficient
> than the old code.

It is not, the main reason for hmm conversion is to show how the API is
used. HMM is built around struct page.

> 
> From what I can tell, dma_map_page_attrs() takes a 'struct page *' and
> converts it to a physical address using page_to_phys() whilst your new
> dma_map_phys() interface takes a physical address and converts it to
> a 'struct page *' using phys_to_page(). In both cases, hmm_dma_map_pfn()
> still needs the page for other reasons. If anything, existing users of
> dma_map_page_attrs() now end up with a redundant page-to-phys-to-page
> conversion which hopefully the compiler folds away.
> 
> I'm assuming there's future work which builds on top of the new API
> and removes the reliance on 'struct page' entirely, is that right? If
> so, it would've been nicer to be clearer about that as, on its own, I'm
> not really sure this patch series achieves an awful lot and the
> efficiency argument looks quite weak to me.

Yes, there is ongoing work, which is built on top of dma_map_phys() API
and can't be built without DMA phys.

My WIP branch, where I'm using it can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-vfio

In that branch, we save one phys_to_page conversion in block datapath:
block-dma: migrate to dma_map_phys instead of map_page

and implement DMABUF exporter for MMIO pages:
vfio/pci: Allow MMIO regions to be exported through dma-buf
see vfio_pci_dma_buf_map() function.

Thanks

> 
> Cheers,
> 
> Will
> 

