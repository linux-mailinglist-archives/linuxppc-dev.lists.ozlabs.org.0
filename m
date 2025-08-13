Return-Path: <linuxppc-dev+bounces-10935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F562B24D95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 17:37:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2CDd1G88z30T8;
	Thu, 14 Aug 2025 01:37:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755099457;
	cv=none; b=ZIFb7ZWPTrO+6pT2tIl+awt2BSYnFnLfTjAFhJOnl0gAB0YQbQ6SRHhPDvvNvTk+wLGmYbDA20ylNNTR+WcGLgEmD8WcDQLKc4XMHvIA1g+Z3E0GOlDaqeaD7fL+UrASrlKXzt9yXG9xmPLvx+PP/0Vpjn2ZcPrtnfg0CkzDjTsYOHjKsT+tDzD1WvVMtkw32a0pK+qWjO53Wl8tPIn2BpqQOR9obGN4+M3WexVeOS7JUd135DjQ5W+OLmnxKywPOu8K5yLUrWjMvSZlx7c2kucIm1bCnfhnHzAAXmnRVV3yjx5dCY41JuHWMHwOjBueF5+gsS8QOjBCfgnxZVMLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755099457; c=relaxed/relaxed;
	bh=Zm/dCvvK+iI7j714RjSP/vwEDHJVwvkiYDPPSLpMKNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrC2J04CkI+ya7LzqrfrhmnX/Tk4/ACyhYzUmQ+K5nmOHCjSLOBbsq5AFGm46XUhnHVuu13P1Rzgk5Ph2oxDtdmOfAjaLKc9hUKx2jUVZmkCf3GWJt0Z0nXMu2fGNNtHp+qYFZPlp9XyvEBaMK7EEalLzqZfhIk8T6uqNIb7rh6f24YicxMWdTlFS7wV8qOGSvV5uS7QGaHgfragg/q6cF+HqtLHshyMd1l0ydlqnQD27MVISvHEyzs9lOZydKGLvqi33dS9ohMgp2Ybv5z6q2jR3BFD1f5eXcauOs/FXuZWbfNKa/SbSrqS8ue9Q2fxRL9JMxb2eRUghcwODn/KKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kkqdIE/H; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kkqdIE/H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2CDc1yDGz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 01:37:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B00E35C1360;
	Wed, 13 Aug 2025 15:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A911EC4CEEB;
	Wed, 13 Aug 2025 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755099452;
	bh=PQhq5rWxBSi6wo5Tnnh0V92zapg7M+UyVJSAH0kCd/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kkqdIE/HRQ5cedE1zyuMfMRaAZJeqzpFBH0/fLyOJbOpD7Q9Y6fUKKVCUSYg6Iu9+
	 +0lhPpaogX+zo7DE625PlBBN7tO+nQtx0LA2aKRv5GqYQcf/TD8I++3mIddUS1oGuS
	 2Xu0FGRyeN7MRl5kxApDBRYf8dHZhW8fLMu9BCMo8fTZeDkfiJH03TaTo8MCeUS3wk
	 Q3N2kSeVd08IYz9d3sNubS0p0XfPjY2fnOy5IU5HLL6nAdg88Wdvo9IzmX54CnrqWQ
	 dCVsQbDhz8GqQ+nB2+l0260S3CZs7QJe8H773Ex1NmDTheYUl2t1VYx6TqiJOtited
	 Jw1XTt4Q0BCbw==
Date: Wed, 13 Aug 2025 18:37:28 +0300
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
Subject: Re: [PATCH v1 16/16] nvme-pci: unmap MMIO pages with appropriate
 interface
Message-ID: <20250813153728.GC310013@unreal>
References: <cover.1754292567.git.leon@kernel.org>
 <5b0131f82a3d14acaa85f0d1dd608d2913af84e2.1754292567.git.leon@kernel.org>
 <20250807134533.GM184255@nvidia.com>
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
In-Reply-To: <20250807134533.GM184255@nvidia.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 07, 2025 at 10:45:33AM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 04, 2025 at 03:42:50PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Block layer maps MMIO memory through dma_map_phys() interface
> > with help of DMA_ATTR_MMIO attribute. There is a need to unmap
> > that memory with the appropriate unmap function.
> 
> Be specific, AFIACT the issue is that on dma_ops platforms the map
> will call ops->map_resource for ATTR_MMIO so we must have the unmap
> call ops->unmap_resournce
> 
> Maybe these patches should be swapped then, as adding ATTR_MMIO seems
> like it created this issue?

The best variant will be to squash previous patch "block-dma: properly
take MMIO path", but I don't want to mix them as they for different
kernel areas.

Thanks

> 
> Jason
> 

