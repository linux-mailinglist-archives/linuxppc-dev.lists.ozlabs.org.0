Return-Path: <linuxppc-dev+bounces-11437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C6B3A777
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 19:15:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCShb3GTBz2ym0;
	Fri, 29 Aug 2025 03:15:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756401327;
	cv=none; b=EZVPGSuOiGDhv8WJrOITd+yNjXkKYR/ukTwBUUayF/B/gw6YOzW+dopfTQAk9wkkravonwNfR0yMf4jFvcHYSVQ+eh0DvH915vRCeP5LyBKYXq32bguW1AwsYC8H/QO5eUyJdCoA89Xaowx6IvCkdiIGU0MZSSaGgMmsIFki8Wf0BlRw6nvF13BMJ6YkOurXoHlH4LlkqNd6p5PLfVHb9o1AVzs0Wob4O/NTcRQSu261zrmLfDB4UV3uLIrAhMryBT9tkO5N2b1C1nY9kBylus8I9I6+4br4K7QZ0fajMX4i3OW9WDBuzcHZLusIZDoekzt5U8w9gzk706+cEvkfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756401327; c=relaxed/relaxed;
	bh=KCRt+XDfxBj5z23z/FYOBSKOJE6UKgt5OADwYjTTtQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPIvZDEhkHgiXJnoCxg6iuB5EhgGc29ANPWA0xtUY+6FQQ827yn0qCdA9EN0LTIbqczmlADn4RHQdNSIQANPTyfOcXlgrWzeNKxUHXnZeHhM7w6JSHg0nbVhN4Hd3Oa+Uh8b46VY2iziaR0/uxEQf/CvL871fEXSBlq9V8JFoqHWSpQYnVeL6uAcyrYdIgKvKPyqUA7l4WuW6DohoISFGlBPeqtPESkAkI8wLciXkf9n+4/pa+BzuPlfXMRYHRA7URRdslrODSJO6qwwJ4rBBiDfcinZpSTIBtID5jbHs8eS1uTL4/q9ebd08dOmMN75zdndZjL+6lnKcOT754X7Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fnmNyIm6; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fnmNyIm6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCShZ5Mczz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 03:15:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECDE644C27;
	Thu, 28 Aug 2025 17:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A72BC4CEF4;
	Thu, 28 Aug 2025 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756401324;
	bh=ou3iD8shgadPVxQRtF41FaHPfXiCub7fMhAggBLVXMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnmNyIm6kveacQ6zFjHwSr/ld+cbNXoqmfCrawHp1gvsXVCDDljqqxTV+b1zApRgH
	 5lcwKbYEv5XvzJ74pZRRlHz4xMMdbU2hypSAtpXWfDMqRVbb/qc2SqQSSCNqbZ1peQ
	 BdR01HGV590kQ600i1NoQpXCyGOYKnHeIsk3mGhcH3PGq+tQybbYkfchgS5mr5H49F
	 IvJGdW2sSi79scStsbkC/ihQucpNHR67O3EvTjBCfBwOnwU2YHvQc3Mh/Yo09lKjUz
	 oioVDuGo8iH8GapTPxpdVPh2h5wOe61XtWreqwSjOT2z6hU8npwTgtY7JSO24epBr/
	 2W6Y4P8WQ/UJw==
Date: Thu, 28 Aug 2025 11:15:20 -0600
From: Keith Busch <kbusch@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
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
Message-ID: <aLCOqIaoaKUEOdeh@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
 <20250828165427.GB10073@unreal>
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
In-Reply-To: <20250828165427.GB10073@unreal>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 07:54:27PM +0300, Leon Romanovsky wrote:
> On Thu, Aug 28, 2025 at 09:19:20AM -0600, Keith Busch wrote:
> > On Tue, Aug 19, 2025 at 08:36:59PM +0300, Leon Romanovsky wrote:
> > > diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> > > index 09b99d52fd36..283058bcb5b1 100644
> > > --- a/include/linux/blk_types.h
> > > +++ b/include/linux/blk_types.h
> > > @@ -387,6 +387,7 @@ enum req_flag_bits {
> > >  	__REQ_FS_PRIVATE,	/* for file system (submitter) use */
> > >  	__REQ_ATOMIC,		/* for atomic write operations */
> > >  	__REQ_P2PDMA,		/* contains P2P DMA pages */
> > > +	__REQ_MMIO,		/* contains MMIO memory */
> > >  	/*
> > >  	 * Command specific flags, keep last:
> > >  	 */
> > > @@ -420,6 +421,7 @@ enum req_flag_bits {
> > >  #define REQ_FS_PRIVATE	(__force blk_opf_t)(1ULL << __REQ_FS_PRIVATE)
> > >  #define REQ_ATOMIC	(__force blk_opf_t)(1ULL << __REQ_ATOMIC)
> > >  #define REQ_P2PDMA	(__force blk_opf_t)(1ULL << __REQ_P2PDMA)
> > > +#define REQ_MMIO	(__force blk_opf_t)(1ULL << __REQ_MMIO)
> > 
> > Now that my integrity metadata DMA series is staged, I don't think we
> > can use REQ flags like this because data and metadata may have different
> > mapping types. I think we should add a flags field to the dma_iova_state
> > instead.
> 
> Before integrity metadata code was merged, the assumption was that request is
> only one type or p2p or host. Is it still holding now?

I don't think that was ever the case. Metadata is allocated
independently of the data payload, usually by the kernel in
bio_integrity_prep() just before dispatching the request. The bio may
have a p2p data payload, but the integrity metadata is just a kmalloc
buf in that path.

> And we can't store in dma_iova_state() as HMM/RDMA code works in page-based
> granularity and one dma_iova_state() can mix different types.

I see.

