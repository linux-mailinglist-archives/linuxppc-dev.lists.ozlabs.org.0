Return-Path: <linuxppc-dev+bounces-10934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5BB24CD4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 17:07:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2BYq0Tqkz30Qk;
	Thu, 14 Aug 2025 01:07:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755097647;
	cv=none; b=S1tTP5LIzCM5GoXwIcOktUBvu+odNsCdNWk+MTWSG3Fdaqsy16E2z4bc27O9ov85FrXj2Q1MCWsdNROYzWRFE5172tSo1vZ+t/sxiUVd6apmhx8rbMZLjlAlxcu8pJRqKBGgDS10HfdhJ0QdOtcse9U8Ugup+LvmHWxhmWcmWKAILxat68luvl/lfMLiimnA2mz7A/qyzYIo55AELvZLMfhir7VEPZENysOIGvCSNaU51oMgWGWhN7py8JSxMdvCuv4gYTy7H+IK+/ZJgPSzf8D3PyrQ1vQANlR1gBWmHcqlxBuYp33bQbN3uKdSo/2tUUx76HXhuK0HLfsnn5VIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755097647; c=relaxed/relaxed;
	bh=ySXGLynnR++p6RuXca+nTN6nGsk03DV3QSK1ER01nvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lj7sY53F914jVmvMqyuusUYg/Yj9UE2ztooVQ3My/XaAeUyWEYmWzWG6CuPbCDpMEA5oLeLtQnzV2MX5NxNb+d44DgwMQTkhWN1k2Lk5pmWt9BtYT7m3fo6KIJ1PLuXPt0/tCsDy7gC0rutfRItID1McuOEOM5yEsw5+UqU9Av3lM3MY38JQuQ51c/Y2/ggh4gjluHcr0DJIEpfYoZ9HB+9MeO60sesQrYVXrlJP783QgY4J+4Fi0Qvzpr0CYj4l8Y5l28qjYtBJ0o1kl/9bTwnQZHjlSdfNbLjgGtvOzdTCD15/Eq3nXZN4CCzLNd/YlgCXtbOctlqL8DJCXYrlbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YENt6LTm; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YENt6LTm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2BYp0x8Hz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 01:07:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F0C06112D;
	Wed, 13 Aug 2025 15:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B711C4CEF1;
	Wed, 13 Aug 2025 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755097642;
	bh=AgCFVr8B6NzxkSuzvPEJMB9AhjM0iYqJptnGya/8rdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YENt6LTmzTF5MtD2CCE/V13VNj4PuphZirCcbsVboFbdWpo5pbDoM+O1RwGND9hHA
	 WetmjCRKzL7pVzJCuB6ANhgpmI5NnCbOUKiA98JWJtIXOH8N50EVLmuQyuay6zm6ky
	 Onvhe46hQosw9HCamdkdEFdjBFc8sAKkHOvcvhEwHpJ12ST8cc+74GQ77yCDPQN8yP
	 6Wv7nBFsNIocmJw6FI3A2Sw+oIhMT6YNdwdLIq5MhleD6VLBx07CKPNCPkvEmssek+
	 ZjeG2ZowZ0nIKyT2jMky93WoiZsWFLORbU579a0ityJsLq0oaeKqLOOi+Bq4oEc02a
	 vNc66YhlSs8qQ==
Date: Wed, 13 Aug 2025 18:07:18 +0300
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
Message-ID: <20250813150718.GB310013@unreal>
References: <cover.1754292567.git.leon@kernel.org>
 <5b40377b621e49ff4107fa10646c828ccc94e53e.1754292567.git.leon@kernel.org>
 <20250807122115.GH184255@nvidia.com>
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
In-Reply-To: <20250807122115.GH184255@nvidia.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 07, 2025 at 09:21:15AM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 04, 2025 at 03:42:42PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Convert the KMSAN DMA handling function from page-based to physical
> > address-based interface.
> > 
> > The refactoring renames kmsan_handle_dma() parameters from accepting
> > (struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
> > size_t size). A PFN_VALID check is added to prevent KMSAN operations
> > on non-page memory, preventing from non struct page backed address,
> > 
> > As part of this change, support for highmem addresses is implemented
> > using kmap_local_page() to handle both lowmem and highmem regions
> > properly. All callers throughout the codebase are updated to use the
> > new phys_addr_t based interface.
> 
> Use the function Matthew pointed at kmap_local_pfn()
> 
> Maybe introduce the kmap_local_phys() he suggested too.

At this point it gives nothing.

> 
> >  /* Helper function to handle DMA data transfers. */
> > -void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
> > +void kmsan_handle_dma(phys_addr_t phys, size_t size,
> >  		      enum dma_data_direction dir)
> >  {
> >  	u64 page_offset, to_go, addr;
> > +	struct page *page;
> > +	void *kaddr;
> >  
> > -	if (PageHighMem(page))
> > +	if (!pfn_valid(PHYS_PFN(phys)))
> >  		return;
> 
> Not needed, the caller must pass in a phys that is kmap
> compatible. Maybe just leave a comment. FWIW today this is also not
> checking for P2P or DEVICE non-kmap struct pages either, so it should
> be fine without checks.

It is not true as we will call to kmsan_handle_dma() unconditionally in
dma_map_phys(). The reason to it is that kmsan_handle_dma() is guarded
with debug kconfig options and cost of pfn_valid() can be accommodated
in that case. It gives more clean DMA code.

   155 dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
   156                 enum dma_data_direction dir, unsigned long attrs)
   157 {
   <...>
   187
   188         kmsan_handle_dma(phys, size, dir);
   189         trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
   190         debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
   191
   192         return addr;
   193 }
   194 EXPORT_SYMBOL_GPL(dma_map_phys);

So let's keep this patch as is.

Thanks

