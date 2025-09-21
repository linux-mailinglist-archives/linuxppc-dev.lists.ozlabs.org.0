Return-Path: <linuxppc-dev+bounces-12487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F43B8D2BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Sep 2025 02:47:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTndh2tzZz2ywv;
	Sun, 21 Sep 2025 10:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758415656;
	cv=none; b=odQehJ22JBQ1Jy8/pHqjWq/YM/zUojgbl+0aOFS4SnmsyQpFyDNJuLakRs+eUlHrocf2AwrBjjCJiU/SOPclKYjlhRp88CIYvmVc0v5GN4F4NmxFPF3S45jiVelPxxZX7uJZBex/pFkHMrDp3dpITfiznHDriu3Tcoq6cZw+w++2tVWgNWaKPQRz9ZQfKs1b7QwSuOnucv5jkylDGrwnGrMWDdG5YRJV4WB1tgKcHqzKkvLrZyMcdf6fJfQBZ7jCvrICx5ZmBlu35qoyRarfrz9ItR4LGwPHsz2WKpjBcqeW6cKyqTFSmYOqo1uEGNSL7vML+ZMh4eeNTXbur4IUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758415656; c=relaxed/relaxed;
	bh=xtIvv4lw44pUlJuaLKbzEHjJi6xJvnBBYTGn1zOuzT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOUBIfl7HEYnAVDhuq8GbGMG6qKIAQfqNdItXciBJK7szMzFenHXxsPFUu6CGsRKTmXb6MlaGC3WuRw9St2aUiDYcHNTsNMhRskfQnNznO3d9rMelJu7un9HGs5aR/Nkt4N8U30pModeM1QPkzoHhKyOY3ri4LOeTTopzjIehlkfhv0paXE1DxaprbaixKf7ga33QTKpQfw9oKhAkfmio4NV4eKLZX8FS4ZvzghlLQgqS8NsyoGZgHbFC9TZ23vBzmK99WkCUhW9pKjgUE4LwOjFZidmhCO3a2/uo7DhVe+91fR2DxUK/B+fNklPCt+3nKePLVfnA0BpwEGVLtWpNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fLUxwzDv; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fLUxwzDv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTndg3P4mz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 10:47:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 70099600AC;
	Sun, 21 Sep 2025 00:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F266C4CEEB;
	Sun, 21 Sep 2025 00:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758415652;
	bh=aFgKZNQUQCaJ2vrroedLHD+DNPOlwj6GGUlnWjzhG5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLUxwzDvBQpVLTwxkVcEMGkM0isY6OG/nLB20SsNVXIRKxxZrAbNIPP/lH+JLvuUn
	 Kib9NA0Qx8ucaR4Lud4LpP66fHzAfy4YMg/WGXGCNSBD/snmzPLJ/GJr5uZM4GRPA4
	 FmPuCrywKU63yNMwT+i1LUerAAz4LYMUpnupPis0tcH13QBvBt9TCQlrhzdIw9AGje
	 8PZjHxaN7jKNeL5CBfGmMNjS4nLwafvguDKC8M88c1TuvUDa7uTmWsQUU6EjD9ZRCh
	 q7PhsUzYYnzKkPRC+D+A2gtlVl3c6gXMUqXDS+5w81SLBHHJjwyUZmv9q7TG8Bge2K
	 OMtCSqZskSdHw==
Date: Sat, 20 Sep 2025 18:47:27 -0600
From: Keith Busch <kbusch@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
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
Subject: Re: [PATCH v6 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <aM9LH6WSeOPGeleY@kbusch-mbp>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
 <aM1_9cS_LGl4GFC5@kbusch-mbp>
 <20250920155352.GH10800@unreal>
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
In-Reply-To: <20250920155352.GH10800@unreal>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 20, 2025 at 06:53:52PM +0300, Leon Romanovsky wrote:
> On Fri, Sep 19, 2025 at 10:08:21AM -0600, Keith Busch wrote:
> > On Fri, Sep 12, 2025 at 12:03:27PM +0300, Leon Romanovsky wrote:
> > > On Fri, Sep 12, 2025 at 12:25:38AM +0200, Marek Szyprowski wrote:
> > > > >
> > > > > This series does the core code and modern flows. A followup series
> > > > > will give the same treatment to the legacy dma_ops implementation.
> > > > 
> > > > Applied patches 1-13 into dma-mapping-for-next branch. Let's check if it 
> > > > works fine in linux-next.
> > > 
> > > Thanks a lot.
> > 
> > Just fyi, when dma debug is enabled, we're seeing this new warning
> > below. I have not had a chance to look into it yet, so I'm just
> > reporting the observation.
> 
> Did you apply all patches or only Marek's branch?
> I don't get this warning when I run my NVMe tests on current dmabuf-vfio branch.

This was the snapshot of linux-next from the 20250918 tag. It doesn't
have the full patchset applied.

One other thing to note, this was runing on arm64 platform using smmu
configured with 64k pages. If your iommu granule is 4k instead, we
wouldn't use the blk_dma_map_direct path.

