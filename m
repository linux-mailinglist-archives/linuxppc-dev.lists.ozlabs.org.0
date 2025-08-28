Return-Path: <linuxppc-dev+bounces-11435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CCFB3A6FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 18:54:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCSDX3V6gz2yg0;
	Fri, 29 Aug 2025 02:54:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756400076;
	cv=none; b=MLkwdlUydFxuaqpkZ7qrWwjI/VcV6UWAYcskFSrHvuv7r9exx6Shq+oLcA9bpkhS2L9r5VxwvuuH2DhbAbf916cCpKyLxwKofrYmvd+jzuCgW49IIkDCepQoz1JPjepdSwTyN3OYSlu/Gzj8nA1QOIRSTV9Yk7jZJHawwEd0zCQipMRRL/yIcbBRXmqnnE2TjnbAE6+eBl0vtqTNmftTV9Spg1CuzdrH/HDL4LPouy+wsLRUPvufGmekJk1VgiYk8TaD3268oAGcAmZ2kzhMWCTlToHXKNUKYBY4LtBAIaaeDgSqFN8yeEO6AyLa6Xog8ydCk0EIFMdr5d/v11fTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756400076; c=relaxed/relaxed;
	bh=nk21NoeFbSZuqbZYbv31DbqcJk0/VzI2uLLcHSo6RQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYeK7E+NM7Mlgcz6xUe5AbAoosNUKCzLL9QOCmCpPA956YD8NtX+BDgsG7jvJNFQ2xq7e8lqlHVwcjeJooYSDAdBOyX3axeopT0YKXCvhR6xKoyw9ejZuVokwMnCQReB2aOHBZML/dq6UOKkhXb4m8/mUWBKxRZMjgANYRsrzIF3w8lAmzUVoEv5knm9YLnxtGAdYBA3nLz2mECyTs4T5iulPOxI3xASZ+DDOVGKdGlaX+OajoDD6gepDNQof7GumEAPW+yDTtE56DtBuZgzY4gdlUCG84jywVwpdzfNlmyEzI9J8x/hNbLRZ8W2yUcMqdbInZ6D4s0nOr76nZdADQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Utug3C4q; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Utug3C4q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCSDW4H0Mz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 02:54:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F66D45196;
	Thu, 28 Aug 2025 16:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C34C4CEED;
	Thu, 28 Aug 2025 16:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756400072;
	bh=3QSqWFwhLXFpgIQB1AhDzeFYEFSsyOykW/t8YMcdvDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Utug3C4qHAngGkUPRUqPcVpMv2skHSOiyTR1dzioCxiyV/N0D3D3xwLMN4kKVhjRg
	 R1e3GaQ66/QDlvAbclIdn1b0xrBO+DODu7rLesJ54dZQOJ+qr4UwXmhZorK6X6L1pe
	 /mKnN3THYo/PX+SSQI5FBBXcz4a8pvxXQG8iBycA9jlkdj9zJMMNMWOCxqVVHcRMG0
	 jrJGkyKqRduB/ujzl45UowCIqtVEnLBTqm/vLH4mWU4+vwRxIYccg9OHedq9aiILZs
	 hmuixBFk7xqznER0ERf4UjMVjXknV66U4Y9wYKKHbgLQRBDuheIDJSUa9AzDEN/7Pr
	 p4K8MwEWQi7/w==
Date: Thu, 28 Aug 2025 19:54:27 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Keith Busch <kbusch@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v4 15/16] block-dma: properly take MMIO path
Message-ID: <20250828165427.GB10073@unreal>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
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
In-Reply-To: <aLBzeMNT3WOrjprC@kbusch-mbp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 09:19:20AM -0600, Keith Busch wrote:
> On Tue, Aug 19, 2025 at 08:36:59PM +0300, Leon Romanovsky wrote:
> > diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> > index 09b99d52fd36..283058bcb5b1 100644
> > --- a/include/linux/blk_types.h
> > +++ b/include/linux/blk_types.h
> > @@ -387,6 +387,7 @@ enum req_flag_bits {
> >  	__REQ_FS_PRIVATE,	/* for file system (submitter) use */
> >  	__REQ_ATOMIC,		/* for atomic write operations */
> >  	__REQ_P2PDMA,		/* contains P2P DMA pages */
> > +	__REQ_MMIO,		/* contains MMIO memory */
> >  	/*
> >  	 * Command specific flags, keep last:
> >  	 */
> > @@ -420,6 +421,7 @@ enum req_flag_bits {
> >  #define REQ_FS_PRIVATE	(__force blk_opf_t)(1ULL << __REQ_FS_PRIVATE)
> >  #define REQ_ATOMIC	(__force blk_opf_t)(1ULL << __REQ_ATOMIC)
> >  #define REQ_P2PDMA	(__force blk_opf_t)(1ULL << __REQ_P2PDMA)
> > +#define REQ_MMIO	(__force blk_opf_t)(1ULL << __REQ_MMIO)
> 
> Now that my integrity metadata DMA series is staged, I don't think we
> can use REQ flags like this because data and metadata may have different
> mapping types. I think we should add a flags field to the dma_iova_state
> instead.

Before integrity metadata code was merged, the assumption was that request is
only one type or p2p or host. Is it still holding now?

And we can't store in dma_iova_state() as HMM/RDMA code works in page-based
granularity and one dma_iova_state() can mix different types.

Thanks

> 

