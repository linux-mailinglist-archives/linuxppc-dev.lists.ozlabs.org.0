Return-Path: <linuxppc-dev+bounces-9840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7ECAEA59D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 20:45:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSngF424dz30PF;
	Fri, 27 Jun 2025 04:45:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750963513;
	cv=none; b=TMEEdIdS4XSJskyx+PmrIPUVf3aJeKXqOdpRebvBxilnaqCmJ8Is/j6S/2SHbAbUXuRpLCRsPItKqIMBjSurgtgMMmTQ5MPWclAumiMaVfQpKzTxU4PSbdAiYkMGvopTyVatS+dimCK36Mt1wlWw7REmF4tZhxtgEPcBPamgALNF9jie8g72rjByRW+RIhmrXgy/ERjofEeiAvBVbjqRRAi7lQjI//26Oc7Qp8vSy6p2d1y/2RwbQIyG5CAtn4GcPOY0sb9FWq/iDIvh0O9Gc9AhlgRp3ByEX1rJvYk4fLstI2a12DT7OoBepgQk68oBhZHAsPBGzqzdzXy3C401ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750963513; c=relaxed/relaxed;
	bh=zqOZ0nvJoY2kvs0ans1k/jor+XKnKoBEFfFm8tFXKgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQt2ck55Nx5P0qtRJSGb5lO1T4W3CRRghlZsS8p0zUrXE0FqghlhdaHH/dEpmavFVctEmaDe5sYV+yVOrs3zjiRB/MqwviuNdVgBSlsnMZhLGWdi8hvCgw1K84mbKRCz9PmgXdK/F0QdLrX/bgn4IOo21MhTt0ZDqITMgFlM9NovUx6MYfL0NkaUQaqezZsFq7kfwqZ2MOKwhvMgv89BWu9DqM8HpBikxsqS6ncpgLhezr+tyDvW+NY2xILZNbPYRKTVfb2H6jZ08qkJAXrcHHOEkH6PwALLYKWZX39afqt873tlj4gwxCaESfRbZDdTeLUANtB8W05nWI+bw4kDoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hLP472CC; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hLP472CC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSngD3pHQz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 04:45:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3BCB4375D;
	Thu, 26 Jun 2025 18:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC281C4CEEB;
	Thu, 26 Jun 2025 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750963509;
	bh=qpuwIbsfFlx+vQqZ7u2g19cFy4P5mUElZNbXy5mDaBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLP472CCTg+PhX1yKdunFpJsdMOjYvhGyAgWrimK7DWPKkMd17pKMc1fIfwaPlCPA
	 JIJRXr+shFAtyLcZe8XBwbY11mrvGDzVdJ3RsltqtREBwQkFGd8GfGcQGFurfXwhRi
	 Gh6t0AupUp/xt8ImCbK8nrHJ6hmurZkalNqu+4nWd0M/d9ZfOF4iAVk+oNuFVT055z
	 IXMV0SFHieGPFmST8cP/2Lrg5B0eeTJyP2e7jxgpdTCHDGUFGS4ovBwL7ynEjAeKFJ
	 dwGKMZLnO96ObPriGbwvv4YKtLXuQsSnKwE/DIyBvIi2T6xOA6FnnFe1RuVAtw0cbK
	 QWmFFBkB6n4+g==
Date: Thu, 26 Jun 2025 21:45:04 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Alexander Potapenko <glider@google.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 5/8] kmsan: convert kmsan_handle_dma to use physical
 addresses
Message-ID: <20250626184504.GK17401@unreal>
References: <cover.1750854543.git.leon@kernel.org>
 <cabe5b75fe1201baa6ecd209546c1f0913fc02ef.1750854543.git.leon@kernel.org>
 <CAG_fn=XWP-rpV-D2nV-a3wMbzqLn2T-43tyGnoS2AhVGU8oZMw@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG_fn=XWP-rpV-D2nV-a3wMbzqLn2T-43tyGnoS2AhVGU8oZMw@mail.gmail.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 07:43:06PM +0200, Alexander Potapenko wrote:
> On Wed, Jun 25, 2025 at 3:19 PM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > From: Leon Romanovsky <leonro@nvidia.com>
> 
> Hi Leon,
> 
> >
> > Convert the KMSAN DMA handling function from page-based to physical
> > address-based interface.
> >
> > The refactoring renames kmsan_handle_dma() parameters from accepting
> > (struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
> > size_t size).
> 
> Could you please elaborate a bit why this is needed? Are you fixing
> some particular issue?

It is soft of the fix and improvement at the same time.
Improvement: 
It allows direct call to kmsan_handle_dma() without need
to convert from phys_addr_t to struct page for newly introduced
dma_map_phys() routine.

Fix:
It prevents us from executing kmsan for addresses that don't have struct page
(for example PCI_P2PDMA_MAP_THRU_HOST_BRIDGE pages), which we are doing
with original code.

dma_map_sg_attrs()
 -> __dma_map_sg_attrs()
  -> dma_direct_map_sg()
   -> PCI_P2PDMA_MAP_THRU_HOST_BRIDGE and nents > 0
    -> kmsan_handle_dma_sg();
     -> kmsan_handle_dma(g_page(item) <---- this is "fake" page.

We are trying to build DMA API that doesn't require struct pages.

> 
> > A PFN_VALID check is added to prevent KMSAN operations
> > on non-page memory, preventing from non struct page backed address,
> >
> > As part of this change, support for highmem addresses is implemented
> > using kmap_local_page() to handle both lowmem and highmem regions
> > properly. All callers throughout the codebase are updated to use the
> > new phys_addr_t based interface.
> 
> KMSAN only works on 64-bit systems, do we actually have highmem on any of these?

I don't know, but the original code had this check:
  344         if (PageHighMem(page)) 
  345                 return;

Thanks

