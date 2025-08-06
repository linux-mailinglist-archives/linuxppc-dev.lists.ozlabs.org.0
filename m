Return-Path: <linuxppc-dev+bounces-10698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF5B1CC05
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 20:38:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxzZm2d9qz3bpS;
	Thu,  7 Aug 2025 04:38:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754505520;
	cv=none; b=bmI0o3GFwdQcpjQ/urw73u/1sgLH4tkR0nGzgw6swOFOFJQyiCdpbaGCJ8JbkWeFNC1tFff3UFzMm706PJvjx2iWNyH+iLiMkwKMI/O61G54zxDuESLfQw06HH20FnInPkY2Zw2I/8hDFCNzPAizBeyb5Izex4VVoPcNZC9NRWwlrL9a2ejYid4BJQ76dH7NeMlX/7APP/YYQ7sOGRjbp9ve8imlGYSPJYmoeq11yeAf7vpDcZLboVpx3qm/byEScsqblFhSxxkQ/78k9GEW36Fo77zRVHZ+K/rkqPbGjJCYoMWAWLAruPnSNcO/LqBX0g/WLpyD3ryH3vZqrhZk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754505520; c=relaxed/relaxed;
	bh=1x3Q7Y/VrhoNVJRSqy0Fcj4XeiXf5SuLbr9bYLsjRI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7Zg0n9QddX4JmhKU52WbXdhgdN8CVb2t838XyTsIHC1zwkzaTv3Xrl0O8tTSBPu6iQyymWEHIj+UFzWPffkzWT7h0npAVZ1FtDLkUz4vYomBM7EyYYCHut4WyGlCtIY8cp/06SfRcxq7bHq1nifhKNoc4WoIfr0qsv2sbA94P4/cGGEnBjUJFFQ2khrRPFdQBAtV14bk8iu8TvZkfmJNQZ8A6HWhJsVX2Ied513Kr4b4ADRxbEhYkskE3dHYw/V8ldF3xw/Sq/7BmzuURbDdZJq9b9uKpYWO3JpKCCC10NRwl5elTGtJ24AGENr80I7r0obJDYBiiyjpCCvjmjR3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ge50qjue; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ge50qjue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxzZk67h7z3bpP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 04:38:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 534C15C5889;
	Wed,  6 Aug 2025 18:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410C2C4CEE7;
	Wed,  6 Aug 2025 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754505514;
	bh=3VsSAjLVcmccxCZ3hnnn1RvFFPeP1KXfNR/kPK523tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ge50qjueu3yzrmSLvI7mO9n8KQkiFiYfr4PhBvbyi9xJtwRH+3VLE26OL160ezEfS
	 l7n3yTGZYML7usXiAxesUibX5X3uv+Y7zSbVhAbamikh3Xal+W4d9sOmoNJufjNKOd
	 mltqBVBcA3J9CQVjxxN7y8g/410e0ODnTntjvgOrjJZ0GcQu7FKKjy5hCvF14lL7EB
	 GCHlgBFQUU1u6mCSnNeVtRb+60F9YWCMntqEV5h3kpkOIbolMnee/QD5F6iZ+TELym
	 IpJ05UFpUZfqx3imORqYTmOC8S0Z30OtwN23sPhn2SppRACGNtVevxAEaRFm6toCBl
	 Pc8wnVLkh3LNQ==
Date: Wed, 6 Aug 2025 21:38:31 +0300
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
Subject: Re: [PATCH v1 03/16] dma-debug: refactor to use physical addresses
 for page mapping
Message-ID: <20250806183831.GW402218@unreal>
References: <cover.1754292567.git.leon@kernel.org>
 <9ba84c387ce67389cd80f374408eebb58326c448.1754292567.git.leon@kernel.org>
 <20250806182630.GC184255@nvidia.com>
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
In-Reply-To: <20250806182630.GC184255@nvidia.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 06, 2025 at 03:26:30PM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 04, 2025 at 03:42:37PM +0300, Leon Romanovsky wrote:
> > +void debug_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
> > +		int direction, dma_addr_t dma_addr, unsigned long attrs)
> >  {
> >  	struct dma_debug_entry *entry;
> 
> Should this patch should also absorb debug_dma_map_resource() into
> here as well and we can have the caller of dma_dma_map_resource() call
> debug_dma_map_page with ATTR_MMIO?

It is done in "[PATCH v1 11/16] dma-mapping: export new dma_*map_phys() interface".

Thanks

> 
> If not, this looks OK
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason
> 

